library(RPostgreSQL)

#open connection

pizza_shop <- dbConnect(PostgreSQL(),
                 host = "arjuna.db.elephantsql.com",
                 port = 5432,
                 user = "waoyomls",
                 password = "WRM34AGuXD-U71VNHmQVJ34-C1GWKvXE",
                 dbname = "waoyomls")

#create table

pizza_menu <- data.frame(menu_id = 1:5,
                         menu_name = c("Hawaiian","Pepperoni","Bacon and Ham","Cheese","Seafood"),
                         menu_price = c(350,200,450,300,500))

customers <- data.frame (customer_id = 1:5,
                         customer_name = c("Bus","Sabu","Oat","Chub","Gene"),
                         city = c("BKK","LON","Newyork","BKK","Osaka"),
                         gender = c("Male", "Female","Male","Female","Male"))

employees <- data.frame (emp_id = 1:3,
                        emp_name = c("Mary","John","Lisa"),
                        Position = c("Manager","Cashier","Cashier"))

invoice <- data.frame (invoice_id = 1:4,
                       customer_id = c(1,2,1,3),
                       invoice_amount = c(550, 450, 800, 650))
                       
                       
                       

#Insert table to Database

dbWriteTable(pizza_shop, "menu", pizza_menu)
dbWriteTable(pizza_shop, "customers", customers)
dbWriteTable(pizza_shop, "employees", employees)
dbWriteTable(pizza_shop, "invoice", invoice)
                       
#Get Data

dbGetQuery(pizza_shop, "select * from menu")
dbGetQuery(pizza_shop, "select * from customers where gender = 'Male' ")
dbGetQuery(pizza_shop, "select * from employees")
dbGetQuery(pizza_shop, "select * from invoice")

#Remove Table

dbRemoveTable(pizza_shop,"menu")
dbRemoveTable(pizza_shop,"customers")
dbRemoveTable(pizza_shop,"employees")
dbRemoveTable(pizza_shop,"invoice")

#Disconnect

dbDisconnect(pizza_shop)
