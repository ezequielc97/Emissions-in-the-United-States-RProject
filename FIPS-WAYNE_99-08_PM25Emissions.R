##### This script outputs "FIPS-WAYNE_99-08_PM25Emissions.png" ##### 
##### FIPS-WAYNE_99-08_PM25Emissions.R ##### 

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

##### Assign WAYNE to WAYNE's data ##### 
WAYNE <- NEI[NEI$fips == "26163",]

##### Build total per year from WAYNE data ##### 
WAYNE_YRTOTALS <- aggregate(Emissions~year, data=WAYNE, sum)

##### .png device on/set output file #####
png(filename = "FIPS-WAYNE_99-08_PM25Emissions.png", width=768, height=512, bg = "white")
##### plot in .png device ##### 
plot(WAYNE_YRTOTALS$year, WAYNE_YRTOTALS$Emissions, type = "b",
     main = 'Total PM2.5 Emissions, Wayne County, MI, United States, 1999-2008',
     ylab = 'Total PM2.5 Emissions (tons)',
     xlab = 'Year')
dev.off() ##### .png device off ##### 
