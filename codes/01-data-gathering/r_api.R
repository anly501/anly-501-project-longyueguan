library(rjson)
require(httr)
require(jsonlite)
require(dplyr)
library(purrr)
require(httr)

bearer_token <- 'AAAAAAAAAAAAAAAAAAAAAFMrgwEAAAAA6kMcMjJBEgulOmwWbzZ91DL%2Bf24%3DObVtipbbwikniWocGC4CtdCsDo4VPUuPi8kBcKoUERsAIGSMA2'


headers <- c(`Authorization` = sprintf('Bearer %s', bearer_token))

params = list(
  `query` = 'CLIMATECHANGE',
  `max_results` = '100',
  `tweet.fields` = 'created_at,lang,conversation_id'
)


response <- httr::GET(url = 'https://api.twitter.com/2/tweets/search/recent', httr::add_headers(.headers=headers), query = params)
print(response)


obj <- httr::content(response, as = "text")
print(obj)

df <- as.data.frame(fromJSON(obj))
head(df)

write.csv(df, "/Users/ritaguan/Desktop/r_api.csv", row.names = FALSE)
