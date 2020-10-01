##### This script outputs "CITYSANDIE99-08_PM25Emissions.png" ##### 
##### FIPS-SANDIEGO_99-08_PM25Emissions.R ##### 

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

##### Assign SANDIEGO to San Diego's data ##### 
SANDIEGO <- NEI[NEI$fips == "06073",]

##### Build total per year from San Diego data ##### 
SANDIEGO_YRTOTALS <- aggregate(Emissions~year, data=SANDIEGO, sum)

##### .png device on/set output file #####
png(filename = "FIPS-SANDIEGO_99-08_PM25Emissions.png", width=768, height=512, bg = "white")
##### plot in .png device ##### 
plot(SANDIEGO_YRTOTALS$year, SANDIEGO_YRTOTALS$Emissions, type = "b",
     main = 'Total PM2.5 Emissions, San Diego County, CA, United States, 1999-2008',
     ylab = 'Total PM2.5 Emissions (tons)',
     xlab = 'Year')
dev.off() ##### .png device off ##### 
