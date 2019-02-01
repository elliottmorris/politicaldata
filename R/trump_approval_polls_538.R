#' Download FiveThirtyEight's dataset of Donald Trump's job approval polling
#'
#' Returns a data.frame of individual polls aggregated by FiveThirtyEight
#'
#' @param subgroup Filters the dataset to the polled population, either 'Adults', 'All polls', or 'Voters'. Defaults to 'All polls'
#'
#' @return a data.frame of individual polls aggregated by FiveThirtyEight
#'
#' @seealso Their dataset at https://projects.fivethirtyeight.com/trump-approval-data/approval_polllist.csv and interactive at https://projects.fivethirtyeight.com/trump-approval-ratings/
#'
#' @examples
#'
#' \dontrun{
#'
#'  # get all polls
#'  polls <- trump_approval_polls_538(subgroup='Adults')
#'
#'  # returned as a data.frame
#'  polls
#'
#' }
#'
#' @importFrom utils read.csv
#'
#' @export
trump_approval_polls_538 <- function(subgroup='All polls'){
  # Input validation
  if (!subgroup %in% c("Adults","All polls","Voters"))
    stop("Subgroup must be one of 'Adults', 'All polls', 'Voters'")

  # get the data
  polls <- read.csv(url("https://projects.fivethirtyeight.com/trump-approval-data/approval_polllist.csv"),stringsAsFactors = F)

  # filter to only House members (the president gets roped in)
  polls <- polls[polls$subgroup == subgroup,]

  # return object
  return(polls)

}
