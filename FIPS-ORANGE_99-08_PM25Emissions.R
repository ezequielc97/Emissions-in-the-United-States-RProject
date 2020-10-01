##### This script outputs "FIPS-ORANGE_99-08_PM25Emissions.png" ##### 
##### FIPS-ORANGE_99-08_PM25Emissions.R ##### 

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

##### Assign ORANGE to ORANGE's data ##### 
ORANGE <- NEI[NEI$fips == "06059",]

##### Build total per year from ORANGE data ##### 
ORANGE_YRTOTALS <- aggregate(Emissions~year, data=ORANGE, sum)

##### .png device on/set output file #####
png(filename = "FIPS-ORANGE_99-08_PM25Emissions.png", width=768, height=512, bg = "white")
##### plot in .png device ##### 
plot(ORANGE_YRTOTALS$year, ORANGE_YRTOTALS$Emissions, type = "b",
     main = 'Total PM2.5 Emissions, Orange County, CA, United States, 1999-2008',
     ylab = 'Total PM2.5 Emissions (tons)',
     xlab = 'Year')
dev.off() ##### .png device off ##### 
