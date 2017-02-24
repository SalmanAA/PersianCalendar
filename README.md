# PersianCalendar

convert gregorian dates to shamsi dates simply!

get current shamsi date in {year, month, day} format
```elixir
    PersianCalendar.local_date
```

convert any gregorian date to shamsi
```elixir
    PersianCalendar.from_milady {2017,2,24}
```

or shamsi to gregorian
```elixir
    PersianCalendar.from_shamsi {1395,12,6}
```