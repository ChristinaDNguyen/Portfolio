rm(list = ls())
library(syuzhet)
leafbyniggle <- get_text_as_string(path_to_file = "C:\\Users\\chris\\Downloads\\Sentiment_Analysis\\leafbyniggle.txt")
farmergiles <- get_text_as_string(path_to_file = "C:\\Users\\chris\\Downloads\\Sentiment_Analysis\\farmergiles.txt")
get_sentiment(farmergiles)
get_sentiment(leafbyniggle)
get_sentiment(leafbyniggle); get_sentiment(farmergiles)

# as seen in previous three lines, sentiment for leafbyniggle is 14.5 and sentiment for farmergiles is -51.9. 
# therefore there is much more negative than positive language in farmergiles, and there is much more positive 
# than negative language in leafbyniggle. Furthermore, farmergiles is overwhelmingly negative while leafbyniggle
#is overwhelmingly positive

#now we move on to section 14.4, making two sentence vectors called 'leafbyniggle_sentences_v' (meaning vector)
#and 'farmergiles_sentences_v' 

leafbyniggle_sentences_v <- get_sentences(leafbyniggle)
farmergiles_sentences_v <- get_sentences(farmergiles)

#now each index position in the two vectors now contains a single sentence of leafbyniggle and farmergiles

leafbyniggle_sentences_v[1:3]

#that line above just showed us the first three tokens, i.e. the first three sentences in the sentence vector for leafbyniggle

#now we define a new variable called leafbyniggle_sentiments_v which uses the sentiments from vector called leafbyniggle_sentences_v

leafbyniggle_sentiments_v <- get_sentiment(leafbyniggle_sentences_v)
farmergiles_sentiments_v <- get_sentiment(farmergiles_sentences_v)

#now we want to see the numbers actually printed

str(leafbyniggle_sentiments_v)
str(farmergiles_sentiments_v)

#let's compare the sentiment of the first sentence of leafbyniggle with the sentiment of the first sentence of 
#farmergiles

head(leafbyniggle_sentiments_v)

#according to above line, most positive sentence of the first six sentences in leafbyniggle is the sixth line

head(farmergiles_sentiments_v)

#according to above line, most positive sentence of first six sentences in farmergiles is the sixth line also

#let's look at the mean sentiment for the all sentences in each text

mean(leafbyniggle_sentiments_v); mean(farmergiles_sentiments_v)


#now we plot

plot(leafbyniggle_sentiments_v, type = "1", xlab = "Novel time", ylab = "sentiment", main = "raw sentiment values in leafbyniggle")

simple_plot(leafbyniggle_sentiments_v, title = "Leaf by Niggle Simple Plot")
simple_plot(farmergiles_sentiments_v, title = "Farmer Giles Simple Plot")



