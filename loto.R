
#The minimum Powerball bet is $2. In each game, players select five numbers from a set of 69 white balls and one number from 26 red Powerballs; the red ball number can be the same as one of the white balls. The drawing order of the five white balls is irrelevant; all tickets show the white ball numbers in ascending order.
white_5_red_1 <- c(5,1)
grand_prize <- "Prize of $900,000,000"
white_5_red_0 <- c(5,0)
second_prize <- "Prize of $1,000,000"
white_4_red_1 <- c(4,1)
third_prize <- "Prize of $50,000"
white_4_red_0 <- c(4,0)
fourth_prize <- "Prize of $100"
white_3_red_1 <- c(3,1)	
fifth_prize <- "Prize of $100"
white_3_red_0 <- c(3,0)
sixth_prize <- "Prize of $7"	
white_2_red_0 <- c(2,0)
seventh_prize <- "Prize of $17"
white_1_red_1 <- c(1,1)
eighth_prize <- "Prize of $4"
white_0_red_1 <- c(0,1)
ninth_prize <- "Prize of $4"
white_0_red_0 <- c(0,0)
no_prize <- "No prize"

powerball_numbers <- function(x) {if(identical(x,white_5_red_1)){grand_prize} 
  else if(identical(x,white_5_red_0)){second_prize}
  else if(identical(x,white_4_red_1)){third_prize}
  else if(identical(x,white_4_red_0)){fourth_prize}
  else if(identical(x,white_3_red_1)){fifth_prize}
  else if(identical(x,white_3_red_0)){sixth_prize}
  else if(identical(x,white_2_red_0)){seventh_prize}
  else if(identical(x,white_1_red_1)){eighth_prize}
  else if(identical(x,white_0_red_1)){ninth_prize}
  else if(identical(x,white_0_red_0)){no_prize}
}
#To win the Powerball second prize, we would need to match the 5 white numbers that will be drawn. There are exactly 5 * 4 * 3 * 2 * 1 different orders.
choose(69,5)*26
#Which is a 1 in 292201338 chance.
