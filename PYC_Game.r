## create variable
win <- 0
lose <- 0
draw <-0
choices <- c("Paper","Rock","Scissors")
round <- 0

game_start <- function () {
    print("Game Start or you want to quit just type exit.")
      while(TRUE){
        print("Pick your choices: Rock, Scissor, Paper or exit")
        player_pick <- readLines("stdin", n=1)
        bot_pick <- sample(choices,1)
           
    if(player_pick != "exit")
    {
    if(player_pick == "Rock" & bot_pick == "Rock"){
      print(paste("You choose: ",player_pick,"and","Bot choose: ",bot_pick))
      draw <- draw+1
      print("draw!")
      round <- round +1
      }
    else if(player_pick == "Rock" & bot_pick== "Scissors"){
      print(paste("You choose: ",player_pick,"and","Bot choose: ",bot_pick))
      win <- win+1
      print("You win!")
      round <- round+1
    }
    else if(player_pick == "Rock" & bot_pick == "Paper"){
      print(paste("You choose: ",player_pick,"and","Bot choose: ",bot_pick))
      lose <- lose+1
      print("You Lose :(")
      round <- round+1
    }
    else if(player_pick == "Scissors" & bot_pick == "Rock"){
      print(paste("You choose: ",player_pick,"and","Bot choose: ",bot_pick))
      lose <- lose+1
      print("You lose :(")
      round <- round +1
    }
    else if(player_pick == "Scissors" & bot_pick == "Scissors"){
      print(paste("You choose: ",player_pick,"and","Bot choose: ",bot_pick))
      draw <- draw+1
      print("draw!")
      round <- round+1
    }
    else if(player_pick == "Scissors" & bot_pick == "Paper"){
      print(paste("You choose: ",player_pick,"and","Bot choose: ",bot_pick))
      win <- win+1
      print("You win!")
      round <- round+1
    }
    else if(player_pick =="Paper" & bot_pick == "Rock"){
      print(paste("You choose: ",player_pick,"and","Bot choose: ",bot_pick))
      win <- win+1
      print("You win!")
      round <- round+1
    }
    else if(player_pick == "Paper" & bot_pick == "Scissors"){
      print(paste("You choose: ",player_pick,"and","Bot choose: ",bot_pick))
      lose <- lose+1
      print("You lose :(")
      round <- round +1
    }
    else if(player_pick == "Paper" & bot_pick == "Paper"){
      print(paste("You choose: ",player_pick,"and","Bot choose: ",bot_pick))
      draw <- draw +1
      print("draw!")
      round <- round +1
    }
    else {
      print("N/A input, Can you try again?")
    } 
    }
    else if(player_pick =="exit"){
      print(paste("Total round: ", round))
      print(paste("Total win: ", win))
      print(paste("Total draw: ", draw))
      print(paste("Total lose: ",lose))
    #Summary
    if (win > lose) {
      printpaste("Congrat! You win!")
    }
    else if (win==draw){
      print("Draw, Good luck next time :)")
    } 
    else if (win<lose){
      print("You lose, Try again next time")
    }   
    break 
}
}
}
game_start()
