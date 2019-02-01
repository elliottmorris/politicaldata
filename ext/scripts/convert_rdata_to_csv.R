# this file converts all the .Rdata files located in the /data folder of the package to .csv files and stores them in ./ext/data, a directory that doesn't ship with the package for technical reasons

# grab the file names
rdata_files <- dir('data')

# the objects are named the same thing as the files. let's get those too using regex
object_names <- gsub('\\..*','',rdata_files)


# loop through the object names. save each one to the corresponding folder with the same name
invisible(
  lapply(object_names,
         function(x){
           # load the data
           data_in <- load(sprintf('data/%s.RData',x))

           # get the object with the string var
           data_in <- get(data_in)

           # save it
           write.csv(data_in,sprintf('ext/data/%s.csv',x),row.names = F)
           }
         )
)
