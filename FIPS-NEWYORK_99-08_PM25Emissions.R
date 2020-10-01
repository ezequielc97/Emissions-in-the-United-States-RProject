##### This script outputs "FIPS-NEWYORK_99-08_PM25Emissions.png" ##### 
##### FIPS-NEWYORK_99-08_PM25Emissions.R ##### 

#####  Assign NEIFOLDER to data folder ##### 
NEIFOLDER = 'National_Emissions_Inventory_Data'

if(dir.exists(NEIFOLDER)) {
  if(!exists("NEI")) {
    NEI <- readRDS(paste(NEIFOLDER, "summarySCC_PM25.rds", sep = "/"))
  }
  if(!exists("SCC")) {
    SCC <- readRDS(paste(NEIFOLDER, "Source_Classification_Code.rds", sep = "/"))
  }
} else {
  stop('------------> Cannot output .png:
       NEI Data is missing at [wdirectory]/National_Emissions _Inventory_Data/')
}

##### Assign NEWYORK to NEW YORK's data ##### 
NEWYORK <- NEI[NEI$fips == "36061",]

##### Build total per year from NEWYORK data ##### 
NEWYORK_YRTOTALS <- aggregate(Emissions~year, data=NEWYORK, sum)

##### .png device on/set output file #####
png(filename = "FIPS-NEWYORK_99-08_PM25Emissions.png", width=768, height=512, bg = "white")
##### plot in .png device ##### 
plot(NEWYORK_YRTOTALS$year, NEWYORK_YRTOTALS$Emissions, type = "b",
     main = 'Total PM2.5 Emissions, New York County, NY, United States, 1999-2008',
     ylab = 'Total PM2.5 Emissions (tons)',
     xlab = 'Year')
dev.off() ##### .png device off ##### 
