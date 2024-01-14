# Reading the PM2.5 emissions data
NEI <- readRDS("summarySCC_PM25.rds")

# Reading the source classification code data
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregating the total PM2.5 emissions for each year
total_emissions <- aggregate(Emissions ~ year, NEI, sum)

# Creating a PNG file for the plot
png("plot1.png")

# Plotting the total PM2.5 emissions by year
plot(total_emissions$year, total_emissions$Emissions, type="b", 
     xlab="Year", ylab="Total PM2.5 Emissions", 
     main="Total PM2.5 Emissions from 1999 to 2008 in the US")

# Closing the device, so the plot is actually saved to the file
dev.off()