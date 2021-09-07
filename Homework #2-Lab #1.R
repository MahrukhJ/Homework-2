Homework #2 - Lab #1

"Possible Protocol #1":

After rolling the die once, the result was a 3, thus allowing us to conclude that the die is fair.
Following this result, the probability for the die to be judged as unfair is 1/6. 
#This is because the probability of rolling any number is 1/6th on a fair die and rolling a 6, would presume this die unfair. 
Oppositely, if the die was unfair, the probability that it would be judged as fair is 5/6. 

"Possible Protocol #2":

#Specify a decision rule to judge if a die is fair or unfair.
For a dice to be considered fair, out of "n" rolls, the frequency of a 6 should amount to around "n/6", give or take a certain number of rolls depending on 'n'. 
"Taking the example from HW#1, out of 20 rolls, a die will be regarded as fair if it lands on a 6, 3-7 times. 
For a die to be judged as unfair, out of 20 rolls, a die should land on a 6, 8 or more times. The number 8 was chosen because two of our groupmates rolled a 6 on the control die, 7 times and we concluded that 1 more would be unusual for a fair die." 
 
#If a fair die is rolled 20 times, what is the likely number of a 6 resulting?
Following our decision rule, 20/6 is 3.3 repeating, therefore, the likely number of times for a 6 to result, out of 20 rolls, is 3-5. 
#How unusual is it to get 1 more or 1 less than that?
To determine if it is unusual to roll 1 more or 1 less than the likely number of a 6 resulting, depends on the number of rolls. Out of 20, it is not unusual to roll 1 more or 1 less than the likely. 
#How unusual is it to get 2 more or 2 less than that?
Given the previous reasoning, it is not unusual to get 2 more or 2 less than the likely number of a certan number rolling, out of 20 rolls. 
#How unusual is it to get 3 more or 3 less than that?
Out of 20 rolls, it is not unusual to get 3 more or 3 less than the likely number of times of rolling a 6 (although it is borderline!).

"Analyze PP2":
If the dice were fair, what is the chance that it could be judged as unfair?

P(6) = P(Unfair) = 1/6
P(1-5) = P(Fair) = 5/6

If the dice is fair, the probability of rolling any number is 1/6 therefore, out of 20 rolls, for a dice to be judged unfair, the frequency of a 6 needs to be 8 or greater, i.e. greater than or equal to 40% (#based on line 15).
 
"Possible Protocol #3":
 
#specify decision rules after rolling the die 100 times. 
The decision rules stay relevantly similar to PP2, "For a dice to be considered fair, out of "n" rolls, the frequency of a 6 should amount to around "n/6", give or take a certain number of rolls depending on 'n'."
In this case, for a dice to be considered fair, out of 100 rolls, the frequency of a 6 should amount to around 15-20, since 100/6 is 16.6 repeating. 

#Is it fair to say that every conclusion has some level of confidence attached? Where do you set boundaries for decisions?
Confidence comes from the math! The decision rules are based on the formula "n/6", where "n" represents the number of rolls and 6 portrays the number of faces of the die. Dividing the number of rolls by the number of faces gives us the average number of rolls per face. 
Although we receive the average number of rolls per face, that does not mean that out of 100 rolls, eace number will appear 16-17 times. Deviations are normal, so 5 more or less than the likely is not unusual. 
 
"Analyze PP3":
#What is the chance that fair dice could be judged to be unfair?
 
P(6) = P(Unfair) = 100/6 = 16.66667 
P(1-5) = P(Fair) = 5(100/6) = 83.33334
 
For a fair die to be judged as unfair, out of 100 rolls, the frequency of a 6 needs to be an unusual amount greater than 16. Given the rationale in PP2, the unsusual amount is greater than or equal to 40%, i.e. the frequency of a 6 should be greater than or equal to 40 rolls, in order for the die to be considered unfair. 
However, given the increased number of rolls, rolling twice the likely amount, i.e. 28 rolls, is basis for consideration as an unfair die.  


"Experiment Protocol #1":
(Without looking at data)
#What is a reasonable number of times to roll your experiment dice?
A reasonable number of times to roll the experiment die is 20 and the experiment can be repeated 2-3 times, amounting to a total of 40 or 60 rolls. 
#If you roll the experiment dice a certain number of times and see a particular outcome, then you would conclude it is fair or not. How confident would you be, in any of those conclusions?
Confidence from conclusions is a result of trust in the math and personal judgement. If we roll the dice a certain number of times and witness a particular outcome, judgement of fairness or unfairness becomes relatively indubious. 
#Note that while previous Possible Protocols emphasized counting just the number of times a 6 came up, you might consider other outcomes such as the average value of the dice when rolled or the distribution of other outcomes (what number is on opposite face from 6? Do you suppose that number might be disproportionately represented if dice were not fair?).
It certainly is a point of interest to record and analyze all values of the rolls and specifically observe the mode and the frequency of 1 (giving importance to 1 since it is the opposite face from 6 and if the rolls generate an unusual number of 1s, an explanation can be constructed). 

Time to use R! 
                                                                                                                                            
Now we will have the computer roll dice. We can use the following command:
                                                                                                                                            
how_many_rolls <- 20
sim_rolls <- sample(1:6, how_many_rolls, replace = TRUE)

This command will take 20 draws from integers 1-6 and the "replace = TRUE" command repalces the integers (the metaphor is not quite rolling dice, but as if there were 6 balls in a jar, labeled with a number, and it picks a ball from the jar 20 times), the replace command, returns the integers. 
Alongside, creating the 'sim_rolls' variable makes it easy to go back and change something and have that propagate throughout the rest of the program. 
how_many_rolls <- 20
sim_rolls <- sample(1:6, how_many_rolls, replace = TRUE)

This will give us 1 version of "Experiment Protocol #2". However, one way to draw a better sense of the range of outcomes is to use a loop. For instance: 

# for first time
lots_of_sim_rolls <- sample(1:6,how_many_rolls, replace = TRUE)

# do 49 more simulations
for (indx in 1:49) {
  sim_rolls <- sample(1:6,how_many_rolls, replace = TRUE)
  lots_of_sim_rolls <- data.frame(lots_of_sim_rolls,sim_rolls)
  }

This command will create a data frame of 50 variables, one for each simulation where each simulation incorporates 20 rolls.

Instead of using a loop (which can slow down your program!), we can also create one big vector!

how_many_sims <- 50
sim_rolls_vec <- sample(1:6,(how_many_rolls*how_many_sims), replace = TRUE) # vectorized version

With this command, you just have to keep track that the first 20 observations are for the first simulation, the next 20 for the second, etc. 
We can also observe how many times a 6 came up:

if_come_up_6 <- as.numeric(lots_of_sim_rolls == 6)
mean(if_come_up_6)
[1] 0.173

if_come_up_6_vec <- as.numeric(sim_rolls_vec == 6)
mean(if_come_up_6_vec)
[1] 0.153

