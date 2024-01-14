# URL for downloading the data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"

# Filename for the downloaded file
destfile <- "NEI_data.zip"

# Executing the download
download.file(url, destfile)

# Unzipping the downloaded file
unzip(destfile)

# Checking the files after unzipping
list.files()