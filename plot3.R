# Reading the PM2.5 emissions data from the RDS file
NEI <- readRDS("summarySCC_PM25.rds")

# Extracting data for Baltimore, Maryland (fips code 24510)
baltimore_data <- subset(NEI, fips == "24510")

# Aggregating emissions by year and type
emissions_by_type <- aggregate(Emissions ~ year + type, baltimore_data, sum)

# Opening a PNG device to save the plot
png("plot3.png")

# Creating a plot using base R plotting system
plot(emissions_by_type$year, emissions_by_type$Emissions, 
     type="n", xlab="Year", ylab="Total Emissions",
     main="Emissions by Source Type in Baltimore City (1999-2008)")

# Differentiating each type with colors
colors <- rainbow(length(unique(emissions_by_type$type)))
types <- unique(emissions_by_type$type)

for (i in 1:length(types)) {
  type_data <- subset(emissions_by_type, type == types[i])
  points(type_data$year, type_data$Emissions, 
         type="b", col=colors[i], pch=19)
}

# Adding a legend
legend("topright", legend=types, col=colors, pch=19, cex=0.8)

# Closing the device to save the plot to the file
dev.off()
