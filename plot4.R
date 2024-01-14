# Load the PM2.5 emissions data from the RDS file
NEI <- readRDS("summarySCC_PM25.rds")

# Load the source classification code data from the RDS file
SCC <- readRDS("Source_Classification_Code.rds")

# Filter the SCC data to identify codes related to coal combustion
coal_combustion_scc <- SCC[grep("Coal", SCC$Short.Name, ignore.case = TRUE), ]

# Merge the emissions data with the filtered SCC data
coal_emissions <- merge(NEI, coal_combustion_scc, by = "SCC")

# Aggregate the total emissions for each year
total_coal_emissions <- aggregate(Emissions ~ year, coal_emissions, sum)

# Open a PNG device to save the plot
png("plot4.png")

# Create a plot using base R plotting system
plot(total_coal_emissions$year, total_coal_emissions$Emissions, type="b",
     xlab="Year", ylab="Total Emissions from Coal Combustion",
     main="Emissions from Coal Combustion-Related Sources (1999-2008)")

# Close the device to save the plot to the file
dev.off()
