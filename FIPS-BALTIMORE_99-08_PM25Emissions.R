##### This script outputs "CITYBALT99-08_PM25Emissions.png" ##### 
##### FIPS-BALTIMORE-99-08_PM25Emissions.R ##### 

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

##### Assign BALTIMORE to Baltimore's data ##### 
BALTIMORE <- NEI[NEI$fips == "24510",]

##### Build total per year from Baltimore data ##### 
BALT_YRTOTALS <- aggregate(Emissions~year, data=BALTIMORE, sum)

##### .png device on/set output file #####
png(filename = "FIPS-BALTIMORE_99-08_PM25Emissions.png", width=768, height=512, bg = "white")
##### plot in .png device ##### 
plot(BALT_YRTOTALS$year, BALT_YRTOTALS$Emissions, type = "b",
     main = 'Total PM2.5 Emissions, Baltimore,MD, United States, 1999-2008',
     ylab = 'Total PM2.5 Emissions (tons)',
     xlab = 'Year')
dev.off() ##### .png device off ##### 
