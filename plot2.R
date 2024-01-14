# Reading the PM2.5 emissions data from the RDS file
NEI <- readRDS("summarySCC_PM25.rds")

# Extracting data for Baltimore, Maryland (fips code 24510)
baltimore_data <- subset(NEI, fips == "24510")

# Aggregating the total PM2.5 emissions for each year in Baltimore
total_emissions_baltimore <- aggregate(Emissions ~ year, baltimore_data, sum)

# Creating a PNG file for the plot
# The plot will be saved as 'plot2.png'
png("plot2.png")

# Plotting the total PM2.5 emissions by year for Baltimore
plot(total_emissions_baltimore$year, total_emissions_baltimore$Emissions, type="b", 
     xlab="Year", ylab="Total PM2.5 Emissions in Baltimore", 
     main="Total PM2.5 Emissions from 1999 to 2008 in Baltimore, MD")

# Closing the device, so the plot is actually saved to the file
dev.off()
