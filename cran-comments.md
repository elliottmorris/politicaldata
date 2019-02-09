## Test environments
* local OS X install, R 3.2.5
* ubuntu 12.04 (on travis-ci), R 3.2.5

## R CMD check results
There were no ERRORs or WARNINGs. 

There was 1 NOTE:

* checking CRAN incoming feasibility ... NOTE
  Maintainer: ‘G. Elliott Morris <elliott@thecrosstab.com>’
  
  New submission
  
## 2019-09-10:  Responses to requests:

I've made the following changes to the package in response to feedback and rejection from Uwe Ligges on 2019-02-08:



> "Thanks, but this seems far less general than the title suggests. Looks  like only oine country is covered."

- I have specified in the description that the data from the Comparative Agendas Project is indeed a worldwide dataset.


> "Keep in mind: 'Where copyrights are held by an entity other than the package authors,  this should preferably be indicated via ‘cph’ roles in the ‘Authors@R’  field, or using a ‘Copyright’ field (if necessary referring to an  inst/COPYRIGHTS file). Trademarks must be respected.' (https://cran.r-project.org/web/packages/policies.html). In your code I see lines which indicate other sources as well e.g  "FiveThirtyEight" and websites."

- I've added the three primary data sources --- FiveThirtyEight, the Comparative Agendas Project, and MIT --- as copyright holders in the Authors field.


> Again, the coverage is less general, please be more specific. Please exemplify "common sources". According to your files sources are  from the US only. If there are references describing the methods in your package, please  add these in the Description field of your DESCRIPTION file [...] with no space after 'doi:', 'arXiv:' and angle brackets for auto-linking.  Fix and resubmit.

- I have elaborated on the sources of data used in the DESCRIPTION field.


> "Finally, please add examples to all relevant Rd files and replace  \dontrun{} by \donttest{} or unwrap the examples if they can be executed  in less than 5 sec per Rd-file."


- I've added examples to all .Rd files and wrapped with \donttest{}. To be sure, I've also written separate custom tests with `testthat`.


...


I have made other corresponding checks and believe the package is now ready to be reevaluated. Thanks, CRAN!
