import excel "C:\Users\dell\Desktop\342 Proj\data.xlsx", sheet("Sheet1") firstrow
destring Year, replace
egen id = group(Country )
xtset id Year , yearly
xtreg gini_index invest__gdp , fe
xtreg gini_index edu_invest__gdp , fe
xtreg gini_index invest__gdp , re
xtreg gini_index edu_invest__gdp , re
xtreg gini_index invest__gdp edu_invest__gdp  , fe
estimate store fixed
xtreg gini_index invest__gdp edu_invest__gdp  , re
estimate store random
hausman fixed random
xtunitroot fisher gini_index, dfuller lags(0)
xtunitroot fisher invest__gdp, dfuller lags(0)
xtunitroot fisher edu_invest__gdp, dfuller lags(0)
xtreg gini_index invest__gdp edu_invest__gdp  if(IncomeGroup =="Low income")
xtreg gini_index invest__gdp edu_invest__gdp  if(IncomeGroup =="Lower middle income")
xtreg gini_index invest__gdp edu_invest__gdp  if(IncomeGroup =="Upper middle income")
xtreg gini_index invest__gdp edu_invest__gdp  if(IncomeGroup =="High income")