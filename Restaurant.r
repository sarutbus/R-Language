## Create Variable
pizza_menu <- c("Hawaiian", "Seafood", "Pepperoni", "Ham", "Vegetable")
pizza_price <- c(350,450,400,300,200)
toppings_menu <- c("Cheese", "Bacon", "Saucesage", "Mushroom")
toppings_price <- c(100,150,80,50)
total_price_pizza <- 0
total_price_toppings <- 0

pizza_order <- function() {

#Start
  while (TRUE){ 
  print("Welcome to the Bus Pizza, What pizza do you want?")  
  print("Please Choose the pizza menu: Hawaiian(350THB), Seafood(450), Pepperoni(400)
        Ham(300), Vegetable(200)")
  order_pizza <- readLines("stdin", n=1)

  #OrderPizza
  if(order_pizza == "Hawaiian") {
    print("Ok, you choose Hawaiian!.")
    total_price_pizza <- total_price_pizza + pizza_price[pizza_menu =="Hawaiian"]}
  else if (order_pizza == "Seafood"){
    print("Great choice for you!")
    total_price_pizza <- total_price_pizza + pizza_price[pizza_menu == "Seafood"]}
  else if (order_pizza == "Pepperoni"){
    print("You made a right choice!")
    total_price_pizza <- total_price_pizza + pizza_price[pizza_menu == "Pepperoni"]}
  else if (order_pizza == "Ham"){
    print("You are cool!")
    total_price_pizza <- total_price_pizza + pizza_price[pizza_menu == "Ham"]}
  else if (order_pizza == "Vegetable"){
    print("Wow!")
    total_price_pizza <- total_price_pizza + pizza_price[pizza_menu == "Vegetable"]}
    else {
    print("Your order is not availabe, please try again.")
  }
    
#Ordertopping
  print(paste("OK, you choose",order_pizza, "and the price is",total_price_pizza))
  print("What toppings do you want? Cheese(100), Bacon(150), Saucesage(80) Mushroom(50)")
  
  order_topping <- readLines("stdin", n=1)
    if(order_topping == "Cheese"){
      print("Great choice!")
      total_price_toppings <- total_price_toppings + toppings_price[toppings_menu == "Cheese"]}
    else if (order_topping == "Bacon"){
      print("You are supeeeer cool!")
      total_price_toppings <- total_price_toppings + toppings_price[toppings_menu == "Bacon"]}
    else if (order_topping == "Saucesage"){
      print("You made a right decision!")
      total_price_toppings <- total_price_toppings + toppings_price[toppings_menu == "Saucesage"]}
    else if (order_topping == "Mushroom"){
      print("Oh good choice !")
      total_price_toppings <- total_price_toppings + toppings_price[toppings_menu == "Mushroom"]} 
  else {
      print("This topping is not available, please choose another one")}
  
#Summary
    print(paste("Your order is completed!, Your order is",order_pizza, "with", order_topping))
    print("Is is correct? (Yes/No)")
    customer_confirm <- readLines("stdin", n=1)
    if (customer_confirm == "Yes"){
      print(paste("Your total bill is", total_price_pizza + total_price_toppings))
      print("Thank you!")
      break } 
    else if (customer_confirm == "No"){
      print("OH we're really sorry, We will not charge you for our mistake")}
    else {
      print("Please confirm again") }
}
}
 

pizza_order()
