##### This script outputs "2017-SOCAL-PM25Emissions.png", which charts pm2.5 emissions in Socal counties##### 
##### 2017-SOCAL-PM25Emissions.R ##### 

#####  Assign NEIFolder to data folder ##### 
NEIFolder = 'National_Emissions_Inventory_Data'
RegionFolder = 'Region9'
if(dir.exists(NEIFolder)) {
        NEI_California <- read.csv(paste(NEIFolder,RegionFolder,"2017-NEI-California.csv", sep = "/"))
        
} else {
        stop('------------> Cannot output .png:
       NEIFolder (data) is missing at [working directory]/National_Emissions _Inventory_Data/')
}

##### Assign SANDIEGO to San Diego's data ##### 

NEI_CA_SoCal <- NEI_California[NEI_California$COUNTY_FIPS==73 | NEI_California$COUNTY_FIPS==25 | NEI_California$COUNTY_FIPS==65 | NEI_California$COUNTY_FIPS==71 | NEI_California$COUNTY_FIPS==59 | NEI_California$COUNTY_FIPS==37 | NEI_California$COUNTY_FIPS==111 | NEI_California$COUNTY_FIPS==83 | NEI_California$COUNTY_FIPS==29 | NEI_California$COUNTY_FIPS==79,]

PM25_CA_SoCal <- NEI_CA_SoCal[NEI_CA_SoCal$POLLUTANT=="PM2.5 Primary (Filt + Cond)",]

##### Build total for 2017 from SoCal data ##### 
Total_CA_SoCal_PM25 <- aggregate(EMISSIONS~COUNTY, data=PM25_CA_SoCal, sum)


##### .png device on/set output file #####
png(filename = "PNG/NeighCountiesBarPlots/2017-CA-SoCal-PM25Emissions.png", width=1024, height=768, bg = "white")
##### plot in .png device ##### 
barplot(Total_CA_SoCal_PM25$EMISSIONS, space = 0.5, col=rgb(1.0,0.7,0.0,1.0),
        main = 'Total PM2.5 Emissions by County in Southern California, 2017',
        names.arg = Total_CA_SoCal_PM25$COUNTY,
        ylab = 'TOTAL PM2.5 EMISSIONS (TONS)',
        xlab = 'COUNTY',
        cex.names=0.9,
        horiz = FALSE)

dev.off() ##### .png device off ##### 

