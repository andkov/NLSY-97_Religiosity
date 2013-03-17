file handle pcdat/name='NLSY97_Religion_08032013.dat' /lrecl=232.
data list file pcdat free /
  R0000100 (F4)
  R0323900 (F2)
  R0536300 (F1)
  R0536401 (F2)
  R0536402 (F4)
  R0552200 (F2)
  R0552300 (F2)
  R0555700 (F2)
  R0555800 (F2)
  R1193900 (F3)
  R1194100 (F2)
  R1235800 (F1)
  R1482600 (F1)
  R2165200 (F2)
  R2553400 (F3)
  R2553500 (F2)
  R3483100 (F2)
  R3876200 (F3)
  R3876300 (F2)
  R4881300 (F2)
  R4893400 (F2)
  R5453600 (F3)
  R5453700 (F2)
  R6520100 (F2)
  R7215900 (F3)
  R7216000 (F2)
  S0919300 (F2)
  S0919400 (F2)
  S0919500 (F2)
  S0919600 (F2)
  S0919700 (F2)
  S0919800 (F2)
  S1531300 (F3)
  S1531400 (F2)
  S2000900 (F3)
  S2001000 (F2)
  S2987800 (F2)
  S3801000 (F3)
  S3801100 (F2)
  S4681700 (F2)
  S5400900 (F3)
  S5401000 (F2)
  S5532800 (F3)
  S6316700 (F2)
  S6316800 (F2)
  S6316900 (F2)
  S6317000 (F2)
  S6317100 (F2)
  S6317200 (F2)
  S7501100 (F3)
  S7501200 (F2)
  S8331500 (F2)
  T0008400 (F3)
  T0008500 (F2)
  T0739400 (F2)
  T2011000 (F3)
  T2011100 (F2)
  T2111400 (F3)
  T2781700 (F2)
  T2781900 (F2)
  T2782000 (F2)
  T2782100 (F2)
  T2782200 (F2)
  T2782300 (F2)
  T3601400 (F3)
  T3601500 (F2)
  T4495000 (F2)
  T5201300 (F3)
  T5201400 (F2)
  T6143400 (F2)
.
* The following code works with current versions of SPSS.
missing values all (-5 thru -1).
* older versions of SPSS may require this:
* recode all (-5,-3,-2,-1=-4).
* missing values all (-4).
variable labels
  R0000100  "PUBID - YTH ID CODE 1997"
  R0323900  "# DAYS/WK TYP FAM RELIGIOUS 1997"
  R0536300  "KEY!SEX (SYMBOL) 1997"
  R0536401  "KEY!BDATE M/Y (SYMBOL) 1997"
  R0536402  "KEY!BDATE M/Y (SYMBOL) 1997"
  R0552200  "WHAT RELIG PR RAISED IN? 1997"
  R0552300  "WHAT IS PR CURR RELIG PREF? 1997"
  R0555700  "WHAT RELIG PR SP/PART RAISED IN? 1997"
  R0555800  "PR SP/PART CURR RELIG PREF? 1997"
  R1193900  "CV_AGE(MONTHS)_INT_DATE 1997"
  R1194100  "CV_AGE_INT_DATE 1997"
  R1235800  "CV_SAMPLE_TYPE 1997"
  R1482600  "KEY!RACE_ETHNICITY (SYMBOL) 1997"
  R2165200  "# DAYS/WK TYP FAM RELIGIOUS 1998"
  R2553400  "CV_AGE(MONTHS)_INT_DATE 1998"
  R2553500  "CV_AGE_INT_DATE 1998"
  R3483100  "# DAYS/WK TYP FAM RELIGIOUS 1999"
  R3876200  "CV_AGE(MONTHS)_INT_DATE 1999"
  R3876300  "CV_AGE_INT_DATE 1999"
  R4881300  "# DAYS/WK TYP FAM RELIGIOUS 2000"
  R4893400  "HOW OFTEN R ATTEND WORSHIP SERV 2000"
  R5453600  "CV_AGE(MONTHS)_INT_DATE 2000"
  R5453700  "CV_AGE_INT_DATE 2000"
  R6520100  "HOW OFTEN R ATTEND WORSHIP SERV 2001"
  R7215900  "CV_AGE(MONTHS)_INT_DATE 2001"
  R7216000  "CV_AGE_INT_DATE 2001"
  S0919300  "HOW OFTEN R ATTEND WORSHIP SERV 2002"
  S0919400  "R NOT NEED RELIGION TO HAVE VALUES 2002"
  S0919500  "R BELIEVE RELIG TEACHINGS OBEYED 2002"
  S0919600  "R ASKS GOD HELP MAKE DECISIONS 2002"
  S0919700  "GOD NOTHING TO DO HAPPENS TO R 2002"
  S0919800  "R PRAYS MORE THAN ONCE A DAY 2002"
  S1531300  "CV_AGE(MONTHS)_INT_DATE 2002"
  S1531400  "CV_AGE_INT_DATE 2002"
  S2000900  "CV_AGE(MONTHS)_INT_DATE 2003"
  S2001000  "CV_AGE_INT_DATE 2003"
  S2987800  "HOW OFTEN R ATTEND WORSHIP SERV 2003"
  S3801000  "CV_AGE(MONTHS)_INT_DATE 2004"
  S3801100  "CV_AGE_INT_DATE 2004"
  S4681700  "HOW OFTEN R ATTEND WORSHIP SERV 2004"
  S5400900  "CV_AGE(MONTHS)_INT_DATE 2005"
  S5401000  "CV_AGE_INT_DATE 2005"
  S5532800  "R CURR REL PREF 2005"
  S6316700  "HOW OFTEN R ATTEND WORSHIP SERV 2005"
  S6316800  "R NOT NEED RELIGION TO HAVE VALUES 2005"
  S6316900  "R BELIEVE RELIG TEACHINGS OBEYED 2005"
  S6317000  "R ASKS GOD HELP MAKE DECISIONS 2005"
  S6317100  "GOD NOTHING TO DO HAPPENS TO R 2005"
  S6317200  "R PRAYS MORE THAN ONCE A DAY 2005"
  S7501100  "CV_AGE(MONTHS)_INT_DATE 2006"
  S7501200  "CV_AGE_INT_DATE 2006"
  S8331500  "HOW OFTEN R ATTEND WORSHIP SERV 2006"
  T0008400  "CV_AGE(MONTHS)_INT_DATE 2007"
  T0008500  "CV_AGE_INT_DATE 2007"
  T0739400  "HOW OFTEN R ATTEND WORSHIP SERV 2007"
  T2011000  "CV_AGE(MONTHS)_INT_DATE 2008"
  T2011100  "CV_AGE_INT_DATE 2008"
  T2111400  "R CURR REL PREF 2008"
  T2781700  "HOW OFTEN R ATTEND WORSHIP SERV 2008"
  T2781900  "R NOT NEED RELIGION TO HAVE VALUES 2008"
  T2782000  "R BELIEVE RELIG TEACHINGS OBEYED 2008"
  T2782100  "R ASKS GOD HELP MAKE DECISIONS 2008"
  T2782200  "GOD NOTHING TO DO HAPPENS TO R 2008"
  T2782300  "R PRAYS MORE THAN ONCE A DAY 2008"
  T3601400  "CV_AGE(MONTHS)_INT_DATE 2009"
  T3601500  "CV_AGE_INT_DATE 2009"
  T4495000  "HOW OFTEN R ATTEND WORSHIP SERV 2009"
  T5201300  "CV_AGE(MONTHS)_INT_DATE 2010"
  T5201400  "CV_AGE_INT_DATE 2010"
  T6143400  "HOW OFTEN R ATTEND WORSHIP SERV 2010"
.
* value labels
 R0000100
    0 "0"
    /
 R0323900
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    /
 R0536300
    1 "Male"
    2 "Female"
    0 "No Information"
    /
 R0536401
    1 "1: January"
    2 "2: February"
    3 "3: March"
    4 "4: April"
    5 "5: May"
    6 "6: June"
    7 "7: July"
    8 "8: August"
    9 "9: September"
    10 "10: October"
    11 "11: November"
    12 "12: December"
    /
 R0552200
    1 "1.  Roman Catholic"
    2 "2.  Baptist"
    3 "3.  Methodist"
    4 "4.  Lutheran"
    5 "5.  Presbyterian"
    6 "6.  Episcopal/Anglican"
    7 "7.  United Church of Christ (or Congregationalist or Evangelical Reformed)"
    8 "8.  Disciples of Christ (or the Christian Church)"
    9 "9.  Reform (or Reformed Church in America or Christian Reformed Church)"
    10 "10.  Holiness (Nazarene, Wesleyan, Free Methodist)"
    11 "11.  Pentecostal (Assembly of God, Pentecostal Holiness)"
    12 "12.  Nondemonimational Christian (Bible Church)"
    13 "13.  Other Protestant"
    14 "14.  Jewish  -  Orthodox"
    15 "15.  Jewish  -  Conservative"
    16 "16.  Jewish  -  Reform"
    17 "17.  Jewish  -  Other Jewish"
    18 "18.  Mormon (all types of Latter Day Saints)"
    19 "19.  Eastern Orthodox"
    20 "20.  Unitarian"
    21 "21.  Muslim (or Moslem or Islam)"
    22 "22.  Hindu/Buddhist"
    23 "23.  Native American Tribal Religion"
    25 "24.  None, no religion - Agnostic (doesn't know if there is a God)"
    26 "25.  None, no religion - Atheist (confident there is no God)"
    27 "26.  None, no religion - Personal philosophy"
    28 "27.  Bah'ai"
    30 "28.  Greek, Roman, Norse, Etc. Mythology"
    31 "29.  Satanic"
    32 "30.  Wicca/Witchcraft/Magic/Pagan"
    34 "31.  Scientology"
    35 "32.  Other Eastern (Sikh)"
    24 "33.  Other (SPECIFY)"
    /
 R0552300
    1 "1.  Roman Catholic"
    2 "2.  Baptist"
    3 "3.  Methodist"
    4 "4.  Lutheran"
    5 "5.  Presbyterian"
    6 "6.  Episcopal/Anglican"
    7 "7.  United Church of Christ (or Congregationalist or Evangelical Reformed)"
    8 "8.  Disciples of Christ (or the Christian Church)"
    9 "9.  Reform (or Reformed Church in America or Christian Reformed Church)"
    10 "10.  Holiness (Nazarene, Wesleyan, Free Methodist)"
    11 "11.  Pentecostal (Assembly of God, Pentecostal Holiness)"
    12 "12.  Nondemonimational Christian (Bible Church)"
    13 "13.  Other Protestant"
    14 "14.  Jewish  -  Orthodox"
    15 "15.  Jewish  -  Conservative"
    16 "16.  Jewish  -  Reform"
    17 "17.  Jewish  -  Other Jewish"
    18 "18.  Mormon (all types of Latter Day Saints)"
    19 "19.  Eastern Orthodox"
    20 "20.  Unitarian"
    21 "21.  Muslim (or Moslem or Islam)"
    22 "22.  Hindu/Buddhist"
    23 "23.  Native American Tribal Religion"
    25 "24.  None, no religion - Agnostic (doesn't know if there is a God)"
    26 "25.  None, no religion - Atheist (confident there is no God)"
    27 "26.  None, no religion - Personal philosophy"
    28 "27.  Bah'ai"
    30 "28.  Greek, Roman, Norse, Etc. Mythology"
    31 "29.  Satanic"
    32 "30.  Wicca/Witchcraft/Magic/Pagan"
    34 "31.  Scientology"
    35 "32.  Other Eastern (Sikh)"
    24 "33.  Other (SPECIFY)"
    /
 R0555700
    1 "1.  Roman Catholic"
    2 "2.  Baptist"
    3 "3.  Methodist"
    4 "4.  Lutheran"
    5 "5.  Presbyterian"
    6 "6.  Episcopal/Anglican"
    7 "7.  United Church of Christ (or Congregationalist or Evangelical Reformed)"
    8 "8.  Disciples of Christ (or the Christian Church)"
    9 "9.  Reform (or Reformed Church in America or Christian Reformed Church)"
    10 "10.  Holiness (Nazarene, Wesleyan, Free Methodist)"
    11 "11.  Pentecostal (Assembly of God, Pentecostal Holiness)"
    12 "12.  Nondemonimational Christian (Bible Church)"
    13 "13.  Other Protestant"
    14 "14.  Jewish  -  Orthodox"
    15 "15.  Jewish  -  Conservative"
    16 "16.  Jewish  -  Reform"
    17 "17.  Jewish  -  Other Jewish"
    18 "18.  Mormon (all types of Latter Day Saints)"
    19 "19.  Eastern Orthodox"
    20 "20.  Unitarian"
    21 "21.  Muslim (or Moslem or Islam)"
    22 "22.  Hindu/Buddhist"
    23 "23.  Native American Tribal Religion"
    25 "24.  None, no religion - Agnostic (doesn't know if there is a God)"
    26 "25.  None, no religion - Atheist (confident there is no God)"
    27 "26.  None, no religion - Personal philosophy"
    28 "27.  Bah'ai"
    30 "28.  Greek, Roman, Norse, Etc. Mythology"
    31 "29.  Satanic"
    32 "30.  Wicca/Witchcraft/Magic/Pagan"
    34 "31.  Scientology"
    35 "32.  Other Eastern (Sikh)"
    24 "33.  Other (SPECIFY)"
    /
 R0555800
    1 "1.  Roman Catholic"
    2 "2.  Baptist"
    3 "3.  Methodist"
    4 "4.  Lutheran"
    5 "5.  Presbyterian"
    6 "6.  Episcopal/Anglican"
    7 "7.  United Church of Christ (or Congregationalist or Evangelical Reformed)"
    8 "8.  Disciples of Christ (or the Christian Church)"
    9 "9.  Reform (or Reformed Church in America or Christian Reformed Church)"
    10 "10.  Holiness (Nazarene, Wesleyan, Free Methodist)"
    11 "11.  Pentecostal (Assembly of God, Pentecostal Holiness)"
    12 "12.  Nondemonimational Christian (Bible Church)"
    13 "13.  Other Protestant"
    14 "14.  Jewish  -  Orthodox"
    15 "15.  Jewish  -  Conservative"
    16 "16.  Jewish  -  Reform"
    17 "17.  Jewish  -  Other Jewish"
    18 "18.  Mormon (all types of Latter Day Saints)"
    19 "19.  Eastern Orthodox"
    20 "20.  Unitarian"
    21 "21.  Muslim (or Moslem or Islam)"
    22 "22.  Hindu/Buddhist"
    23 "23.  Native American Tribal Religion"
    25 "24.  None, no religion - Agnostic (doesn't know if there is a God)"
    26 "25.  None, no religion - Atheist (confident there is no God)"
    27 "26.  None, no religion - Personal philosophy"
    28 "27.  Bah'ai"
    30 "28.  Greek, Roman, Norse, Etc. Mythology"
    31 "29.  Satanic"
    32 "30.  Wicca/Witchcraft/Magic/Pagan"
    34 "31.  Scientology"
    35 "32.  Other Eastern (Sikh)"
    24 "33.  Other (SPECIFY)"
    /
    /
 R1194100
    12 "12"
    13 "13"
    14 "14"
    15 "15"
    16 "16"
    17 "17"
    18 "18"
    /
 R1235800
    1 "Cross-sectional"
    0 "Oversample"
    /
 R1482600
    1 "Black"
    2 "Hispanic"
    3 "Mixed Race (Non-Hispanic)"
    4 "Non-Black / Non-Hispanic"
    /
 R2165200
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    /
    /
 R2553500
    12 "12"
    13 "13"
    14 "14"
    15 "15"
    16 "16"
    17 "17"
    18 "18"
    /
 R3483100
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    /
    /
 R3876300
    12 "12"
    13 "13"
    14 "14"
    15 "15"
    16 "16"
    17 "17"
    18 "18"
    /
 R4881300
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    /
 R4893400
    1 "Never"
    2 "Once or twice"
    3 "Less than once a month / 3-12 times"
    4 "About once a month / 12 times"
    5 "About twice a month / 24 times"
    6 "About once a week"
    7 "Several times a week"
    8 "Everyday"
    /
    /
 R5453700
    14 "14"
    15 "15"
    16 "16"
    17 "17"
    18 "18"
    20 "20"
    /
 R6520100
    1 "Never"
    2 "Once or twice"
    3 "Less than once a month / 3-12 times"
    4 "About once a month / 12 times"
    5 "About twice a month / 24 times"
    6 "About once a week"
    7 "Several times a week"
    8 "Everyday"
    /
    /
 R7216000
    14 "14"
    15 "15"
    16 "16"
    17 "17"
    18 "18"
    19 "19"
    20 "20"
    21 "21"
    /
 S0919300
    1 "Never"
    2 "Once or twice"
    3 "Less than once a month / 3-12 times"
    4 "About once a month / 12 times"
    5 "About twice a month / 24 times"
    6 "About once a week"
    7 "Several times a week"
    8 "Everyday"
    /
 S0919400
    1 "TRUE"
    0 "FALSE"
    /
 S0919500
    1 "TRUE"
    0 "FALSE"
    /
 S0919600
    1 "TRUE"
    0 "FALSE"
    /
 S0919700
    1 "TRUE"
    0 "FALSE"
    /
 S0919800
    1 "TRUE"
    0 "FALSE"
    /
    /
 S1531400
    14 "14"
    15 "15"
    16 "16"
    17 "17"
    18 "18"
    19 "19"
    20 "20"
    21 "21"
    /
    /
 S2001000
    18 "18"
    19 "19"
    20 "20"
    21 "21"
    22 "22"
    23 "23"
    /
 S2987800
    1 "Never"
    2 "Once or twice"
    3 "Less than once a month"
    4 "About once a month"
    5 "About twice a month"
    6 "About once a week"
    7 "Several times a week"
    8 "Everyday"
    /
    /
 S3801100
    18 "18"
    19 "19"
    20 "20"
    21 "21"
    22 "22"
    23 "23"
    /
 S4681700
    1 "Never"
    2 "Once or twice"
    3 "Less than once a month"
    4 "About once a month"
    5 "About twice a month"
    6 "About once a week"
    7 "Several times a week"
    8 "Everyday"
    /
    /
 S5401000
    20 "20"
    21 "21"
    22 "22"
    23 "23"
    24 "24"
    25 "25"
    26 "26"
    /
 S5532800
    1 "1. Roman Catholic"
    2 "2. Baptist"
    3 "3. Methodist"
    4 "4. Lutheran"
    5 "5. Presbyterian"
    6 "6. Episcopal/Anglican"
    7 "7. United Church of Christ (or Congregationalist or Evangelical Reformed)"
    8 "8. Disciples of Christ (or the Christian Church)"
    9 "9. Reform (or Reformed Church in America or Christian Reformed Church)"
    10 "10. Holiness (Nazarene, Wesleyan, Free Methodist)"
    11 "11. Pentecostal (Assembly of God, Pentecostal Holiness)"
    12 "12. Nondenominational Christian (Including Bible Church)"
    31 "28. Jehovah's Witness"
    32 "29. Seventh Day Adventist"
    13 "13. Other Protestant"
    14 "14. Jewish - Orthodox"
    15 "15. Jewish - Conservative"
    16 "16. Jewish - Reform"
    17 "17. Jewish - Other Jewish"
    18 "18. Mormon (all types of Latter Day Saints)"
    19 "19. Eastern Orthodox"
    20 "20. Unitarian"
    21 "21. Muslim (or Moslem or Islam)"
    22 "22. Hindu/Buddhist"
    23 "23. Native American Tribal Religion"
    24 "24. Other organized religion (SPECIFY)"
    25 "25. None, no religion - Agnostic (doesn't know if there is a God)"
    26 "26. None, no religion - Atheist (confident there is no God)"
    27 "27. None, no religion - personal philosophy"
    28 "Other - Recoded to Bah'ai"
    30 "Other - Recoded to Greek, Roman, Norse Mythology"
    34 "Other - Recoded to Scientology"
    35 "Other - Recoded to Other Eastern (Sikh)"
    36 "Other - Recoded to Satanic"
    37 "Other - Recoded to Wicca/Witchcraft/Magic/Pagan"
    995 "Supervisor Review"
    999 "UNCODABLE"
    /
 S6316700
    1 "Never"
    2 "Once or twice"
    3 "Less than once a month"
    4 "About once a month"
    5 "About twice a month"
    6 "About once a week"
    7 "Several times a week"
    8 "Everyday"
    /
 S6316800
    1 "TRUE"
    0 "FALSE"
    /
 S6316900
    1 "TRUE"
    0 "FALSE"
    /
 S6317000
    1 "TRUE"
    0 "FALSE"
    /
 S6317100
    1 "TRUE"
    0 "FALSE"
    /
 S6317200
    1 "TRUE"
    0 "FALSE"
    /
    /
 S7501200
    20 "20"
    21 "21"
    22 "22"
    23 "23"
    24 "24"
    25 "25"
    26 "26"
    /
 S8331500
    1 "Never"
    2 "Once or twice"
    3 "Less than once a month"
    4 "About once a month"
    5 "About twice a month"
    6 "About once a week"
    7 "Several times a week"
    8 "Everyday"
    /
    /
 T0008500
    20 "20"
    21 "21"
    22 "22"
    23 "23"
    24 "24"
    25 "25"
    26 "26"
    /
 T0739400
    1 "Never"
    2 "Once or twice"
    3 "Less than once a month"
    4 "About once a month"
    5 "About twice a month"
    6 "About once a week"
    7 "Several times a week"
    8 "Everyday"
    /
    /
 T2011100
    23 "23"
    24 "24"
    25 "25"
    26 "26"
    27 "27"
    28 "28"
    29 "29: Age 29 or greater"
    /
 T2111400
    1 "1. Roman Catholic"
    2 "2. Baptist"
    3 "3. Methodist"
    4 "4. Lutheran"
    5 "5. Presbyterian"
    6 "6. Episcopal/Anglican"
    7 "7. United Church of Christ (or Congregationalist or Evangelical Reformed)"
    8 "8. Disciples of Christ (or the Christian Church)"
    9 "9. Reform (or Reformed Church in America or Christian Reformed Church)"
    10 "10. Holiness (Nazarene, Wesleyan, Free Methodist)"
    11 "11. Pentecostal (Assembly of God, Pentecostal Holiness)"
    12 "12. Nondenominational Christian (Including Bible Church)"
    31 "28. Jehovah's Witness"
    32 "29. Seventh Day Adventist"
    13 "13. Other Protestant"
    14 "14. Jewish - Orthodox"
    15 "15. Jewish - Conservative"
    16 "16. Jewish - Reform"
    17 "17. Jewish - Other Jewish"
    18 "18. Mormon (all types of Latter Day Saints)"
    19 "19. Eastern Orthodox"
    20 "20. Unitarian"
    21 "21. Muslim (or Moslem or Islam)"
    22 "22. Hindu/Buddhist"
    23 "23. Native American Tribal Religion"
    24 "24. Other organized religion (SPECIFY)"
    25 "25. None, no religion - Agnostic (doesn't know if there is a God)"
    26 "26. None, no religion - Atheist (confident there is no God)"
    27 "27. None, no religion - personal philosophy"
    34 "OTHER - RECODED TO SCIENTOLOGY"
    35 "OTHER - RECODED TO OTHER EASTERN (SIKH)"
    36 "OTHER - RECODED TO SATANIC"
    37 "OTHER - RECODED TO WICCA/WITCHCRAFT/MAGIC/PAGAN"
    995 "SUPERVISOR REVIEW"
    999 "UNCODABLE"
    /
 T2781700
    1 "Never"
    2 "Once or twice"
    3 "Less than once a month"
    4 "About once a month"
    5 "About twice a month"
    6 "About once a week"
    7 "Several times a week"
    8 "Everyday"
    /
 T2781900
    1 "TRUE"
    0 "FALSE"
    /
 T2782000
    1 "TRUE"
    0 "FALSE"
    /
 T2782100
    1 "TRUE"
    0 "FALSE"
    /
 T2782200
    1 "TRUE"
    0 "FALSE"
    /
 T2782300
    1 "TRUE"
    0 "FALSE"
    /
    /
 T3601500
    24 "24"
    25 "25"
    26 "26"
    27 "27"
    28 "28"
    29 "29"
    /
 T4495000
    1 "Never"
    2 "Once or twice"
    3 "Less than once a month"
    4 "About once a month"
    5 "About twice a month"
    6 "About once a week"
    7 "Several times a week"
    8 "Everyday"
    /
    /
 T5201400
    25 "25"
    26 "26"
    27 "27"
    28 "28"
    29 "29"
    30 "30"
    31 "31"
    /
 T6143400
    1 "Never"
    2 "Once or twice"
    3 "Less than once a month"
    4 "About once a month"
    5 "About twice a month"
    6 "About once a week"
    7 "Several times a week"
    8 "Everyday"
    /
.
/* Crosswalk for Reference number & Question name
 * Uncomment and edit this RENAME VARIABLES statement to rename variables for ease of use.
 * This command does not guarentee uniqueness
 */  /* *start* */

COMMENT RENAME VARIABLES
    (R0000100 = PUBID_1997)
    (R0323900 = YSAQ-010_1997)
    (R0536300 = KEY!SEX_1997)
    (R0536401 = KEY!BDATE_M_1997)
    (R0536402 = KEY!BDATE_Y_1997)
    (R0552200 = P2-013_1997)
    (R0552300 = P2-014_1997)
    (R0555700 = P2-049_1997)
    (R0555800 = P2-050_1997)
    (R1193900 = CV_AGE(MONTHS)_INT_DATE_1997)
    (R1194100 = CV_AGE_INT_DATE_1997)
    (R1235800 = CV_SAMPLE_TYPE_1997)
    (R1482600 = KEY!RACE_ETHNICITY_1997)
    (R2165200 = YSAQ-010_1998)
    (R2553400 = CV_AGE(MONTHS)_INT_DATE_1998)
    (R2553500 = CV_AGE_INT_DATE_1998)
    (R3483100 = YSAQ-010_1999)
    (R3876200 = CV_AGE(MONTHS)_INT_DATE_1999)
    (R3876300 = CV_AGE_INT_DATE_1999)
    (R4881300 = YSAQ-010_2000)
    (R4893400 = YSAQ-282A_2000)
    (R5453600 = CV_AGE(MONTHS)_INT_DATE_2000)
    (R5453700 = CV_AGE_INT_DATE_2000)
    (R6520100 = YSAQ-282A_2001)
    (R7215900 = CV_AGE(MONTHS)_INT_DATE_2001)
    (R7216000 = CV_AGE_INT_DATE_2001)
    (S0919300 = YSAQ-282A_2002)
    (S0919400 = YSAQ-282A2_2002)
    (S0919500 = YSAQ-282A3_2002)
    (S0919600 = YSAQ-282A4_2002)
    (S0919700 = YSAQ-282A5_2002)
    (S0919800 = YSAQ-282A6_2002)
    (S1531300 = CV_AGE(MONTHS)_INT_DATE_2002)
    (S1531400 = CV_AGE_INT_DATE_2002)
    (S2000900 = CV_AGE(MONTHS)_INT_DATE_2003)
    (S2001000 = CV_AGE_INT_DATE_2003)
    (S2987800 = YSAQ-282A_2003)
    (S3801000 = CV_AGE_MONTHS_INT_DATE_2004)
    (S3801100 = CV_AGE_INT_DATE_2004)
    (S4681700 = YSAQ-282A_2004)
    (S5400900 = CV_AGE_MONTHS_INT_DATE_2005)
    (S5401000 = CV_AGE_INT_DATE_2005)
    (S5532800 = YHHI-55709_2005)
    (S6316700 = YSAQ-282A_2005)
    (S6316800 = YSAQ-282A2_2005)
    (S6316900 = YSAQ-282A3_2005)
    (S6317000 = YSAQ-282A4_2005)
    (S6317100 = YSAQ-282A5_2005)
    (S6317200 = YSAQ-282A6_2005)
    (S7501100 = CV_AGE_MONTHS_INT_DATE_2006)
    (S7501200 = CV_AGE_INT_DATE_2006)
    (S8331500 = YSAQ-282A_2006)
    (T0008400 = CV_AGE_MONTHS_INT_DATE_2007)
    (T0008500 = CV_AGE_INT_DATE_2007)
    (T0739400 = YSAQ-282A_2007)
    (T2011000 = CV_AGE_MONTHS_INT_DATE_2008)
    (T2011100 = CV_AGE_INT_DATE_2008)
    (T2111400 = YHHI-55709_2008)
    (T2781700 = YSAQ-282A_2008)
    (T2781900 = YSAQ-282A2_2008)
    (T2782000 = YSAQ-282A3_2008)
    (T2782100 = YSAQ-282A4_2008)
    (T2782200 = YSAQ-282A5_2008)
    (T2782300 = YSAQ-282A6_2008)
    (T3601400 = CV_AGE_MONTHS_INT_DATE_2009)
    (T3601500 = CV_AGE_INT_DATE_2009)
    (T4495000 = YSAQ-282A_2009)
    (T5201300 = CV_AGE_MONTHS_INT_DATE_2010)
    (T5201400 = CV_AGE_INT_DATE_2010)
    (T6143400 = YSAQ-282A_2010)
.
  /* *end* */

descriptives all.