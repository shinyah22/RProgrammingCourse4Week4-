# Load the PM2.5 emissions data from the RDS file
NEI <- readRDS("summarySCC_PM25.rds")

# Load the source classification code data from the RDS file
SCC <- readRDS("Source_Classification_Code.rds")

# Filter the NEI data for Baltimore City (fips code 24510) and motor vehicle sources (type "ON-ROAD")
baltimore_motor_vehicles <- subset(NEI, fips == "24510" & type == "ON-ROAD")

# Aggregate the total emissions for each year for motor vehicle sources in Baltimore City
total_motor_emissions <- aggregate(Emissions ~ year, baltimore_motor_vehicles, sum)

# Open a PNG device to save the plot
png("plot5.png")

#Create a plot using base R plotting system
plot(total_motor_emissions$year, total_motor_emissions$Emissions, type="b",
     xlab="Year", ylab="Total Emissions from Motor Vehicles",
     main="Motor Vehicle Emissions in Baltimore City (1999-2008)")

#Close the device to save the plot to the file
dev.off()