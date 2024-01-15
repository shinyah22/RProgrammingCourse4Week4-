# Load the PM2.5 emissions data from the RDS file
NEI <- readRDS("summarySCC_PM25.rds")

# Filter the NEI data for Baltimore City (fips code 24510) and motor vehicle sources (type "ON-ROAD")
baltimore_motor_vehicles <- subset(NEI, fips == "24510" & type == "ON-ROAD")

# Filter the NEI data for Los Angeles County (fips code 06037) and motor vehicle sources (type "ON-ROAD")
la_motor_vehicles <- subset(NEI, fips == "06037" & type == "ON-ROAD")

# Aggregate the total emissions for each year for motor vehicle sources in Baltimore City
total_motor_emissions_baltimore <- aggregate(Emissions ~ year, baltimore_motor_vehicles, sum)

# Aggregate the total emissions for each year for motor vehicle sources in Los Angeles County
total_motor_emissions_la <- aggregate(Emissions ~ year, la_motor_vehicles, sum)

# Open a PNG device to save the plot
png("plot6.png")

# Set the plotting area to a 2-row, 1-column layout
par(mfrow=c(2,1))

# Create a plot for Baltimore City motor vehicle emissions from 1999 to 2008
plot(total_motor_emissions_baltimore$year, total_motor_emissions_baltimore$Emissions, type="b",
     xlab="Year", ylab="Total Emissions in Baltimore",
     main="Motor Vehicle Emissions in Baltimore City (1999-2008)")

# Create a plot for Los Angeles County motor vehicle emissions from 1999 to 2008
plot(total_motor_emissions_la$year, total_motor_emissions_la$Emissions, type="b",
     xlab="Year", ylab="Total Emissions in Los Angeles",
     main="Motor Vehicle Emissions in Los Angeles County (1999-2008)")

# Close the device to save the plot to the file
dev.off()
