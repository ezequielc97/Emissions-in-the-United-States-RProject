##### This script outputs "FIPS-CHARLESTON_99-08_PM25Emissions.png" ##### 
##### FIPS-CHARLESTON_99-08_PM25Emissions.R ##### 

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

##### Assign CHARLESTON to CHARLESTON's data ##### 
CHARLESTON <- NEI[NEI$fips == "45019",]

##### Build total per year from CHARLESTON data ##### 
CHARLESTON_YRTOTALS <- aggregate(Emissions~year, data=CHARLESTON, sum)

##### .png device on/set output file #####
png(filename = "FIPS-CHARLESTON_99-08_PM25Emissions.png", width=768, height=512, bg = "white")
##### plot in .png device ##### 
plot(CHARLESTON_YRTOTALS$year, CHARLESTON_YRTOTALS$Emissions, type = "b",
     main = 'Total PM2.5 Emissions, Charleston, SC, United States, 1999-2008',
     ylab = 'Total PM2.5 Emissions (tons)',
     xlab = 'Year')
dev.off() ##### .png device off ##### 
