# Load necessary libraries
library(ggplot2)
library(RColorBrewer)

# Reading the PM2.5 emissions data from the RDS file
NEI <- readRDS("summarySCC_PM25.rds")

# Extracting data for Baltimore, Maryland (fips code 24510)
baltimore_data <- subset(NEI, fips == "24510")

# Aggregating emissions by year and type
emissions_by_type <- aggregate(Emissions ~ year + type, baltimore_data, sum)

# Create a plot using ggplot2
ggplot(emissions_by_type, aes(x = year, y = Emissions, color = type, group = type)) +
  geom_line() +
  geom_point() +
  scale_color_brewer(palette = "Set1") +
  labs(x = "Year", y = "Total Emissions",
       title = "Emissions by Source Type in Baltimore City (1999-2008)") +
  theme(legend.title = element_blank())

# Save the plot to a file
ggsave("plot3.png", width = 10, height = 6)
