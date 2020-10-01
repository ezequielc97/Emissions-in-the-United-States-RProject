Regional Emissions in the United States \[Plotting National Emissions
Inventory\]
================
Ezequiel Contreras

# Emissions-in-the-United-States-RProject

Plotting pollutant emissions in the.United States using EPA’s National
Emissions Inventory Data (1999-2008)

##### Introduction

This work in progress plots fine particulate matter (PM2.5) emissions,
and other pollutant emissions in the United States

##### Data Source

The data used for this project comes from the EPA’s National Emissions
Inventory, 1999-2008 The data used for this project can be found here:

  - [National Emissions Inventory Data]()

##### File Table

  - “LOADDATA.R” Loads National Emissions Inventory data
  - “PLOTALL.R” Runs all other scripts, generates all available plots  
  - “USA\_99-08\_PM25Emissions.R” Generates an emissions plot for the
    United States
  - “FIPS-XXX\_99-08\_PM25Emissions.R” Generates an emissions plot for
    the respective county

##### To Do

  - replace data set with most extensive and updated data from EPA

  - build plot code for other pollutants

  - create data tags descriptions

  - include most recent data

  - 
##### Code

``` r
source("LOADDATA.R")
source("PLOTALL.R")
```

##### Plots

United States of America ![USA Emissions](USA_99-08_PM25Emissions.png)

North East United States ![BALTIMORE
Emissions](FIPS-BALTIMORE_99-08_PM25Emissions.png)

![NEWYORK Emissions](FIPS-NEWYORK_99-08_PM25Emissions.png)

MidWest United States ![WAYNE
Emissions](FIPS-WAYNE_99-08_PM25Emissions.png)

South West United States ![IMPERIAL
Emissions](FIPS-IMPERIAL_99-08_PM25Emissions.png)

![LOSANGELES Emissions](FIPS-LOSANGELES_99-08_PM25Emissions.png)

![ORANGE Emissions](FIPS-ORANGE_99-08_PM25Emissions.png)

![RIVERSIDE Emissions](FIPS-RIVERSIDE_99-08_PM25Emissions.png)

![SANDIEGO Emissions](FIPS-SANDIEGO_99-08_PM25Emissions.png)

![SANBERNARDINO Emissions](FIPS-SBERNARDINO_99-08_PM25Emissions.png)

Southern United States ![CHARLESTON
Emissions](FIPS-CHARLESTON_99-08_PM25Emissions.png)
