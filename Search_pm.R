##Download these packges by running these commands 
install.packages("rvest")
install.packages("googleVis")
install.packages("dplyr")
install.packages("tidyr")
#Call these packages by running these commands 
library(rvest)
library(googleVis)
library(dplyr)
library(tidyr)


# to run a pubmed search and return results do the following 
# 1. execute all the code below 
search_pm <- function (name){
  assign( "url" ,paste("https://www.ncbi.nlm.nih.gov/pubmed/?term=",name, sep = "") , env = .GlobalEnv )
  Pscrape()
} 
Pscrape <- function() {
  webpage <- read_html(url)
  search_results <- html_nodes(webpage,'.rprt')
  title_data <- html_text(search_results)
  head(title_data)
  x <- as.data.frame(title_data)
  x1<- x%>% separate(title_data, into = c("trash", "pmid"), sep = 12) 
  scrape <- x1 %>% separate(pmid, into =c ("uid","rest"), sep = 9)
  gvt = gvisTable(scrape)
  plot(gvt)
}
# 2. type search_pm("With the keywords of your query here") DO NOT REMOVE THE QUOTATION MARKS
# 3. IMPORTANT if your search term is longer than one word use + between each word as opposed to spaces example: to search for cancer genetics type search_pm("cancer+genetics")



#Todo
## Add in advanced search as a single function
## Multipage results
## Use the entrez_fetch API call to bulk dowload papers based on PMID column to a local directory 
## Fulltext package may be a workarround if the API is annoying 

#Open Ideas 
## Naming convention for paper downloads 






