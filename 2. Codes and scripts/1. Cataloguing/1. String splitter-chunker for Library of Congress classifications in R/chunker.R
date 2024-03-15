#This code takes in an Excel file (csv) with one column full of Library of Congress
#classifications for the books in the Newman Centre Library. We want to split
#each cell's content into several cells with only 3 characters each. This is to
#make it easier to print the labels to fit on the spine of our book.

#We will use this split-up version of the CSV to import the data into Dymo
#LabelMaker machine to print.


#Step 1: define a function for splitting into several cells with 3 chars each

read_and_chunk <- function(filename, output_file) {
  chunks_list <- list()
  
  data <- read.csv(filename, header = TRUE)
  
  for (i in 1:nrow(data)) {
    string <- as.character(data[i, 1])  # Assuming the string column is the first column (index 1)
    string <- gsub(" ", "", string)  # Remove spaces within the string because some of our
    #LCCs in the original CSV have random spaces in them. E.g. "BX102. 32" becomes "BX102.32".
    
    #Split each string into 3-character chunks
    chunks <- character()
    for (j in seq(1, nchar(string), 3)) {
      chunk <- substr(string, j, j + 2)
      chunks <- c(chunks, chunk)
    }
    
    chunks_list[[i]] <- chunks
  }
  
  #Convert the list of chunks to a data frame so we can change it to
  #CSV that's useful
  chunks_data <- as.data.frame(do.call(rbind, chunks_list))
  
  #Put the chunks to CSV file as an output so we can actually use it in Dymo 
  #software.
  write.csv(chunks_data, file = output_file, row.names = FALSE)
  
  print("Woot.")
}

#Step 2: apply the function to our CSV.

filename <- "C:/Users/chris/Downloads/lcc-to-chunk-3chars-as-csv.csv"  #Put the input file into variable called filename
output_file <- "C:/Users/chris/Downloads/fourthtry.csv"  #Put the output file into the variable called output_file
read_and_chunk(filename, output_file) #Apply the read_and_chunk function that we previously defined

#Output file is now in downloads folder
