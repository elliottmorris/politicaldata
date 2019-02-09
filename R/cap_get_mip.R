#' Download the Comparative Agenda Project's dataset of responses to Gallup's Most Important Problem question, coded by CAP major topic
#'
#' From CAP:
#' > This dataset contains responses to Gallup's Most Important Problem question aggregated at the annual level and coded by major topic. Years with missing observations (1953/1955) are those in which there were no corresponding MIP data available. Contact us for quarterly MIP data if needed.
#'
#'
#' @param min_year Returns data starting at this year
#' @param max_year Returns data up to this year
#'
#' @return a data.frame of CAP's most important problem data
#'
#' @seealso The master codebook and datasets at https://www.comparativeagendas.net/datasets_codebooks
#'
#'
#' @importFrom utils read.csv data
#' @importFrom dplyr group_by mutate
#' @importFrom magrittr %>%
#'
#' @examples
#'
#'
#' # pull the Most Important Problem data for every year since 1980
#' mip <- cap_get_mip(min_year = 1980)
#'
#' # pull the MIP data for every year between 1950 and 1970
#' mip <- cap_get_mip(min_year = 1950, max_year = 1970)
#'
#' # pull the MIP Data for every year until 2010
#' mip <- cap_get_mip(max_year = 2010)
#'
#'
#' @export
cap_get_mip <- function(min_year = NULL, max_year = NULL){
  # read in the cap MIP data
  mip <- read.csv(url('https://comparativeagendas.s3.amazonaws.com/datasetfiles/US-Public-Gallups_Most_Important_Problem-19.1.csv'))

  # get the cap major topic codes to transform from numeric to character
  #data('cap_major_topics',envir=environment())

  # get label for topics from saved dataset
  mip$title_text <- cap_major_topics$title[match(mip$majortopic,cap_major_topics$major_topic)]

  # NA codes are actually statements without policy content. Indicate that
  mip$title_text <- ifelse(is.na(mip$title_text),"Valenced/No Policy Contentt",mip$title_text)

  # rescale percent because it sometimes goes > 100 when taken cumulatively
  # mip <- mip %>%
  #   dplyr::group_by(year) %>%
  #   dplyr::mutate(percent = percent/sum(percent))

  # convert to data frame
  mip <- as.data.frame(mip)

  # if min/max are set, filter
  if(!is.null(min_year)){mip <- mip[mip$year>=min_year,]}
  if(!is.null(max_year)){mip <- mip[mip$year<=max_year,]}

  # return
  return(mip)
}
