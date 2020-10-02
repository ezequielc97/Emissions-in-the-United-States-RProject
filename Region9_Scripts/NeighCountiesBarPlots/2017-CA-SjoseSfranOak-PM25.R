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

NEI_CA_SJoseSFranOak <- NEI_California[NEI_California$COUNTY_FIPS==1 | NEI_California$COUNTY_FIPS==13 | NEI_California$COUNTY_FIPS==75 | NEI_California$COUNTY_FIPS==81 | NEI_California$COUNTY_FIPS==41 | NEI_California$COUNTY_FIPS==85 | NEI_California$COUNTY_FIPS==69 | NEI_California$COUNTY_FIPS==77 | NEI_California$COUNTY_FIPS==99 | NEI_California$COUNTY_FIPS==97 | NEI_California$COUNTY_FIPS==95 | NEI_California$COUNTY_FIPS==87 | NEI_California$COUNTY_FIPS==47 | NEI_California$COUNTY_FIPS==55,]

PM25_CA_SJoseSFranOak <- NEI_CA_SJoseSFranOak[NEI_CA_SJoseSFranOak$POLLUTANT=="PM2.5 Primary (Filt + Cond)",]

##### Build total for 2017 from SoCal data ##### 
Total_CA_SJoseSFranOak_PM25 <- aggregate(EMISSIONS~COUNTY, data=PM25_CA_SJoseSFranOak, sum)


##### .png device on/set output file #####
png(filename = "PNG/NeighCountiesBarPlots/2017-CA-SJoseSFranOak-PM25Emissions.png", width=1200, height=768, bg = "white")
##### plot in .png device ##### 
barplot(Total_CA_SJoseSFranOak_PM25$EMISSIONS, space = 0.5, col=rgb(1.0,0.7,0.0,1.0),
        main = 'Total PM2.5 Emissions by County in San Jose/San Francisco/Oakland Area, 2017',
        names.arg = Total_CA_SJoseSFranOak_PM25$COUNTY,
        ylab = 'TOTAL PM2.5 EMISSIONS (TONS)',
        xlab = 'COUNTY',
        cex.names=0.9,
        horiz = FALSE)

dev.off() ##### .png device off ##### 

