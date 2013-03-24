## This project mananges getting data from NLSY97
Please read these links to help you get started.  If you have questions, please contact Andrey

### Naming convention

Database_FocalVariable_DateOfDownload
NLSY97_Religion_08032013

#01_reading and cleading
Takes the raw download folder from NLS Web Investigator, renames variables, clean and recode values.

#02_melting and casting
Takes the main clean data template (dsSource), the result of "01_reading and cleaning.R", and creates smaller datasets organized by focal timeseries variables. 