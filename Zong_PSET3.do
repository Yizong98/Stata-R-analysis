* Zong PID A14553253

clear all 
log using Zong_PSET3.log, replace

*Question One
* (a)
* i
import delimited worldbank_data.csv
* iii
rename ãcountryname countryname
* iv
count if countryname != ""
drop if countryname == ""
* v
list countryname  if missing(laborforcetotal)
count if missing(laborforcetotal)
* (b)
count if inflationconsumerpricesannual > gdpgrowthannual & !missing(inflationconsumerpricesannual,gdpgrowthannual)
* (c)
count if lifeexpectancyatbirthmaleyears > lifeexpectancyatbirthfemaleyears & !missing(lifeexpectancyatbirthmaleyears,lifeexpectancyatbirthfemaleyears)
* (d)
count if lifeexpectancyatbirthmaleyears-lifeexpectancyatbirthfemaleyears < -5 & !missing(lifeexpectancyatbirthmaleyears,lifeexpectancyatbirthfemaleyears)
* (e)
. scatter gdpconstant2010us laborforcetotal, xtitle("Labor Force") ytitle("GDP") title("ScatterPlot") subtitle("labor force vs GDP")
* (f)
regress gdpconstant2010us laborforcetotal
* (g)
. scatter gdpconstant2010us laborforcetotal, xtitle("Labor Force") ytitle("GDP") title("ScatterPlot") subtitle("labor force vs GDP") || lfit gdpconstant2010us laborforcetotal
* (i)
generate log_GDP = log(gdpconstant2010us)
generate log_labor = log(laborforcetotal)
. scatter log_GDP log_labor

log close
