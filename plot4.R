# Load necessary libraries
library(ggplot2)

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

# Create a plot using ggplot2 with a white background
ggplot(total_coal_emissions, aes(x = year, y = Emissions)) +
  geom_line(color = "blue", linewidth = 1) + # Blue line with increased size
  geom_point(color = "red", size = 3) + # Red points with increased size
  labs(x = "Year", y = "Total Emissions from Coal Combustion",
       title = "Emissions from Coal Combustion-Related Sources (1999-2008)")

# Save the plot to a file
ggsave("plot4.png", width = 10, height = 6)
