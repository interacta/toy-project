# load packages
library(dplyr)
library(tidyr)

# import table
toys <- data.frame(read.csv("refine_original.csv", header = TRUE, stringsAsFactors = FALSE))

#rename Product code / number to code
colnames(toys)[2] <- "code"

str(toys) # check data

#setup data table as local dataframe? Done on import?
#toys <- tbl_df(refine_original)

#get number of rows
rowcount <- nrow(toys)

# make everything lowercase
#toys <- apply(x,2,tolower(toys))
#toys
#data_frame(toysupper,rowcount)
#print(toysupper)
# not working only produces a vector - can't unlist ?????

#view dataset to see how many different names used in company column
#str()
# can't remember the  command ?????

#substitute correct company names for misspelled names (make this a function?)
#toys[, 1] <- apply(toys[ ,1], 2, function(x) as.character(gsub("fillips", "PHILLIPS", x)))
toys
#sub("@.*\\.edu$","@datacamp.edu",emails) #what does .*\\ mean?
#sub("Fillips","Phillips",toysupper) ... etc

#check to be sure all companies are correct - 4 companies
#length(unique(toys[ ,1]))
#stopifnot(length(unique(toys[ ,1])) == 4)
#stopifnot(toys %>% group_by(company) %>% n_groups() == 4)

#separate product code into two columns
#mutate(toys,code_letter = unlist(strsplit(toys$code, "[-]")))
#code_parts <- (strsplit(toys$code, "[-]"))
#str(code_parts)
  toys <- toys %>% mutate(code_ltr = unlist(strsplit(toys$code, "[-]"))[1])
  toys <- toys %>% mutate(code_num = unlist(strsplit(toys$code, "[-]"))[2])
  toys
  
#toys %>% mutate(code_ltr = code_parts[ ,1] , code_num = code_parts[ ,2])

# create product catagory list
catagory_ltr <- c("p","v","x","q")
catagory_name <- c("Smartphone","TV","Laptop","Tablet")
catagory <- data.frame(catagory_ltr,catagory_name)
catagory


#add product catagory name column
toys <- toys %>% mutate(code_name = catagory_name[2])
toys
#create full_address column for geocoding

#create dummy binary variables for each company_

#create dummy binary variables for each product_ by catagory

#export refined data as refine_original.csv file


