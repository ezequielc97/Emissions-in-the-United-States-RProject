##### This script loads National Emissions Inventory data
##### LOADDATA.R

# Assign NEIFOLDER to data folder
NEIFOLDER = 'National_Emissions_Inventory_Data'


if(dir.exists(NEIFOLDER)) {
        if(!exists("NEI")) {
                NEI <- readRDS(paste(NEIFOLDER, "summarySCC_PM25.rds", sep = "/"))
        }
        if(!exists("SCC")) {
                SCC <- readRDS(paste(NEIFOLDER, "Source_Classification_Code.rds", sep = "/"))
        }
} else {
        stop('------------> NEI Data is missing at [wdirectory]/National_Emissions _Inventory_Data/')
}
