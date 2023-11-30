library(nycflights13)

View(flights)

#1. Which are top 5 airlines with longest distance flight ?
  flights %>%
    group_by(distance) %>%
    count(flight,carrier) %>%
    arrange(desc(distance)) %>%
    select(flight,carrier) %>%
    inner_join(airlines, by ="carrier") %>%
    head(5)  

#2. Which does airline have the most departure delay?
  flights %>%
    mutate(dep_delay = replace_na(dep_delay,0)) %>%
    group_by(carrier) %>%
    summarise(departure_delaytime = sum(dep_delay)) %>%
    arrange(-departure_delaytime) %>%
    left_join(airlines,by = "carrier")

#3. Which are top 5 popular destination in September 23?
  flights %>%
    filter(month == 9) %>%
    group_by(dest) %>%
    count(dest) %>%
    arrange(-n) %>%
    head (5)

#4.Which is the month with the most flight in 2013?
  flights %>%
    group_by(month) %>%
    summarise(total_flight = n()) %>%
    arrange(-total_flight) %>%
    head(1)

#5.What are top 5 airlines with most flights? 
  flights %>%
    group_by(carrier) %>%
    summarise(total_flight = n()) %>%
    arrange(-total_flight) %>%
    inner_join(airlines, by = "carrier") %>%
    select(carrier,name,total_flight) %>%
    head(5)
