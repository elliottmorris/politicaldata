#' Get DW-nominate Scores for members of the U.S. House
#'
#' Returns a dataset of nominate scores for House members of the the specified congress,
#' available otherwise at VoteView.com.
#'
#' @param congress Number for the congress you're interested in. Defaults to "ALL" to get the most recent scores for every congress.
#'
#' @return a data frame containing the relevant legislator names and DW-nominate scores, as well as otherinformation made available by VoteView
#'
#' @seealso https://voteview.com/data
#'
#' @examples
#'
#'
#'  # get the scores for the 116th (2019-2021) congress
#'  house <- get_house_nominate(congress=116)
#'
#'  # returned as a data frame
#'  house
#'
#'
#' @importFrom utils read.csv
#'
#' @export
get_house_nominate <- function(congress="ALL"){
  # Input validation
  if (!is.numeric(congress) & congress!="ALL")
    stop("congress must be an object of type numeric unless downloading all data")

  # get the data
  if(congress=="ALL"){
    # if the user wants every congress, simply read and return
    house_data <- read.csv(url("https://voteview.com/static/data/out/members/Hall_members.csv"),stringsAsFactors = F,encoding = 'UTF-8')
  }else{
    # else, get only data from relevant congress
    link <- sprintf("https://voteview.com/static/data/out/members/H%s_members.csv",congress)

    house_data <- as.data.frame(read.csv(url(link),stringsAsFactors = F,encoding = 'UTF-8'))

  }

  # filter to only House members (the president gets roped in)
  house_data[house_data$chamber == "House",]

  # return object
  return(house_data)

}
