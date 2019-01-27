#' Get DW-NOMINATE Scores for members of the U.S. House
#'
#' Returns a datset of NOMINATE scores for House members of the the specified congress,
#' available otherwise at VoteView.com.
#'
#' @param congress Number for the congress you're interested in. Defaults to "ALL" to get the most recent scores for every congress.
#'
#' @return a data frame containing the relevant legislator names and DW-NOMINATE scores, as well as otherinformation made available by VoteView
#'
#' @seealso https://voteview.com/data
#'
#' @examples
#'
#' \dontrun{
#'
#'  ## get the scores for the 116th (2019-2021) congress
#'  house <- get_house_NOMINATE(congress=116)
#'
#'  ## returned as a data frame
#'  house
#'
#' }
#'
#' @export
get_house_NOMINATE <- function(congress="ALL"){
  # Input validation
  if (!is.numeric(congress))
    stop("congress must be an object of type numeric")

  # get the data
  if(congress=="ALL"){
    # if the user wants every congress, simply read and return
    return(read.csv("https://voteview.com/static/data/out/members/Hall_members.csv",stringsAsFactors = F))
  }else{
    # else, get only data from relevant congress
    link <- sprintf("https://voteview.com/static/data/out/members/H%s_members.csv",congress)

    return(as.data.frame(read.csv(link,stringsAsFactors = F)))

  }
}
