defmodule PersianCalendar do
@moduledoc """
    convert shamsi/milady dates
"""

    @doc """
        returns shamsi date from given milady date in format {year, month, day}
    """
    @spec from_milady({number, number, number}) :: {number, number, number}
    def from_milady({year, month, day}) do
        is_leap_year? = rem(year, 4) == 0
        second_month_days = if is_leap_year?, do: 29, else: 28 # on leap years it has 29 days
        milady_month_days = [31,second_month_days,31,30,31,30,31,31,30,31,30,31]
        shamsi_month_days = [31,31,31,31,31,31,30,30,30,30,30,29]
        days_year = (year - 1) * 365
        days_from_year_start = day + Enum.reduce( Enum.take(milady_month_days,month - 1), 0, fn acc,sum -> acc+sum end)
        leap_years_day = trunc((year-1) / 4)
        total_milady_days = days_year + leap_years_day + days_from_year_start
        shamsi_days = total_milady_days - 226899 # differnce in shamsi and milady days on calendar
        leap_years_day = trunc(shamsi_days / (365 * 4)) # calculate total shamsi leap years (and 1 day for each leap year)
        shamsi_days = shamsi_days - leap_years_day
        year = trunc(shamsi_days / 365) + 1
        remaining_days = rem shamsi_days, 365
        month = trunc(remaining_days / 30) + 1
        shamsi_days_from_year_start = Enum.reduce( Enum.take(shamsi_month_days,month - 1), 0, fn acc,sum -> acc+sum end)
        remaining_days = remaining_days - shamsi_days_from_year_start
        day = rem remaining_days, 30
        {year, month, day}
    end

    @doc """
        returns milady date from given shamsi date in format {year, month, day}
    """
    @spec from_shamsi({number, number, number}) :: {number, number, number}
    def from_shamsi({year, month, day}) do
        shamsi_month_days = [31,31,31,31,31,31,30,30,30,30,30,29]
        days_year = (year - 1) * 365
        days_from_year_start = day + Enum.reduce( Enum.take(shamsi_month_days,month - 1), 0, fn acc,sum -> acc+sum end)
        leap_years_day = trunc((year-1) / 4)
        total_shamsi_days = days_year + leap_years_day + days_from_year_start
        milady_days = total_shamsi_days + 226899 # differnce in shamsi and milady days on calendar
        leap_years_day = trunc(milady_days / (365 * 4)) # calculate total milady leap years (and 1 day for each leap year)
        milady_days = milady_days - leap_years_day
        year = trunc(milady_days / 365) + 1
        is_leap_year? = rem(year, 4) == 0
        second_month_days = if is_leap_year?, do: 29, else: 28 # on leap years it has 29 days
        milady_month_days = [31,second_month_days,31,30,31,30,31,31,30,31,30,31]
        
        remaining_days = rem milady_days, 365
        month = trunc(remaining_days / 30) + 1
        milady_days_from_year_start = Enum.reduce( Enum.take(milady_month_days,month - 1), 0, fn acc,sum -> acc+sum end)
        remaining_days = remaining_days - milady_days_from_year_start
        day = rem remaining_days, 30
        {year, month, day}
    end

    @doc """
        returns local shamsi date in format {year, month, day}
    """
    @spec local_date :: {number, number, number}
    def local_date do
        {{year,month,day},{_,_,_}} = :calendar.local_time
        from_milady {year,month,day}
    end

end