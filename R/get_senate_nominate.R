#' Get DW-nominate Scores for members of the U.S. Senate
#'
#' Returns a datset of nominate scores for Senate members of the the specified congress,
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
#' \dontrun{
#'
#'  ## get the scores for the 116th (2019-2021) congress
#'  senate <- get_senate_nominate(congress=116)
#'
#'  ## returned as a data frame
#'  senate
#'
#' }
#'
#' @importFrom utils read.csv
#'
#' @export
get_senate_nominate <- function(congress="ALL"){
  # Input validation
  if (!is.numeric(congress) & congress!="ALL")
    stop("congress must be an object of type numeric unless downloading all data")

  # get the data
  if(congress=="ALL"){
    # if the user wants every congress, simply read and return
    senate_data <- read.csv("https://voteview.com/static/data/out/members/Sall_members.csv",stringsAsFactors = F,encoding = 'UTF-8')
  }else{
    # else, get only data from relevant congress
    link <- sprintf("https://voteview.com/static/data/out/members/S%s_members.csv",congress)

    senate_data <- as.data.frame(read.csv(link,stringsAsFactors = F,encoding = 'UTF-8'))

  }

  # filter to only Senate members (the president gets roped in)
  senate_data[senate_data$chamber == "Senate",]

  # return object
  return(senate_data)

}
