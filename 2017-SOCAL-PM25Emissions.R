##### This script outputs "2017-SOCAL-PM25Emissions.png", which charts pm2.5 emissions in Socal counties##### 
##### 2017-SOCAL-PM25Emissions.R ##### 

#####  Assign NEIFOLDER to data folder ##### 
NEIFOLDER = 'National_Emissions_Inventory_Data'

if(dir.exists(NEIFOLDER)) {
        NEICALIFORNIA <- read.csv(paste(NEIFOLDER, "2017NEICALIFORNIA-PM25.csv", sep = "/"))
        
        
        #if(!exists("NEICAL")) {
         #       NEICAL <- read.csv(paste(NEIFOLDER, "2017NEICALIFORNIA-PM25.csv", sep = ","))
        #}
        #if(!exists("SCC")) {
         #       SCC <- readRDS(paste(NEIFOLDER, "Source_Classification_Code.rds", sep = "/"))
        #}
} else {
        stop('------------> Cannot output .png:
       NEICALIFORNIA Data is missing at [wdirectory]/National_Emissions _Inventory_Data/')
}

#SOCALFIPS <- c(73 & 25 & 65 & 71 & 59 & 37 & 111 & 83 & 29 & 79)
##### Assign SANDIEGO to San Diego's data ##### 
#SANDIEGO <- NEI[NEI$COUNTY_FIPS == "73",]

#CALIFORNIA <- NEI[NEI$COUNTY_FIPS == 73,]

SOCAL <- NEICALIFORNIA[NEICALIFORNIA$COUNTY_FIPS==73 | NEICALIFORNIA$COUNTY_FIPS==25 | NEICALIFORNIA$COUNTY_FIPS==65 | NEICALIFORNIA$COUNTY_FIPS==71 | NEICALIFORNIA$COUNTY_FIPS==59 | NEICALIFORNIA$COUNTY_FIPS==37 | NEICALIFORNIA$COUNTY_FIPS==111 | NEICALIFORNIA$COUNTY_FIPS==83 | NEICALIFORNIA$COUNTY_FIPS==29 | NEICALIFORNIA$COUNTY_FIPS==79,]

#SOCAL <- NEI[NEI$COUNTY_FIPS %in% c(73 & 25 & 65 & 71 & 59 & 37 & 111 & 83 & 29 & 79),]
#SOCAL <- subset(NEI, (COUNTY_FIPS %in% c(73 & 25 & 65 & 71 & 59 & 37 & 111 & 83 & 29 & 79)))

##### Build total for 2017 from SoCal data ##### 
SOCAL_2017 <- aggregate(EMISSIONS~COUNTY, data=SOCAL, sum)


##### .png device on/set output file #####
png(filename = "2017-SOCAL-PM25Emissions.png", width=1024, height=768, bg = "white")
##### plot in .png device ##### 
barplot(SOCAL_2017$EMISSIONS, space = 0.5, col=rgb(1.0,0.7,0.0,1.0),
        main = 'TOTAL PM2.5 EMISSION, CALIFORNIA , UNITED STATES IN 2017 BY COUNTY',
        names.arg = SOCAL_2017$COUNTY,
        ylab = 'TOTAL PM2.5 EMISSIONS (TONS)',
        xlab = 'COUNTY',
        cex.names=0.9,
        horiz = FALSE)

dev.off() ##### .png device off ##### 

#counts <- table(mtcars$gear)
#barplot(counts, main="Car Distribution",
 #       xlab="Number of Gears")

