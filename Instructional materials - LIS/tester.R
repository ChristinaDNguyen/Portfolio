#DEFINING THE FUNCTION WE WANT TO DO TO OUR EXCEL

#read_and_chunk is the function we want to do to filename. Please chunk it up 
#by characters of any amount that we will define later

read_and_chunk <- function(filename) {
  chunks <- c() #chunk this text up by characters (letters or numbers)
  
#We will tell you what CSV to read in and we want you to keep the header. 
  data <- read.csv(filename, header = TRUE)
  
  #Start in the first row, chunk, and then move down to the next row and chunk
  #Do this using the strsplit function.
  for (i in 1:nrow(data)) {
    string <- as.character(data[i, 1])  # Assuming the string column is the first column (index 1)
    string <- gsub(" ", "", string)  # Remove spaces within the string, for example "AS12. 9" becomes "AS12.9"
    chunks <- c(chunks, strsplit(string, ""))
  }
  
  chunks <- unlist(chunks)
  
  # Remove empty strings
  chunks <- chunks[nchar(chunks) > 0]
  
  return(chunks)
}

#APPLYING FUNCTION TO OUR EXCEL TEXT
filename <- ("C:/Users/chris/Downloads/lcc-to-chunk-3chars.xlsx") #reading in the Excel file using local path
chunks <- read_and_chunk(filename)

# Print the resulting chunks
for (chunk in chunks) {
  print(chunk)
}