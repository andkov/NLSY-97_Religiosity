options nocenter validvarname=any;

*---Read in space-delimited ascii file;

data new_data;


infile 'NLSY97_Religion_08032013.dat' lrecl=232 missover DSD DLM=' ' print;
input
  R0000100
  R0323900
  R0536300
  R0536401
  R0536402
  R0552200
  R0552300
  R0555700
  R0555800
  R1193900
  R1194100
  R1235800
  R1482600
  R2165200
  R2553400
  R2553500
  R3483100
  R3876200
  R3876300
  R4881300
  R4893400
  R5453600
  R5453700
  R6520100
  R7215900
  R7216000
  S0919300
  S0919400
  S0919500
  S0919600
  S0919700
  S0919800
  S1531300
  S1531400
  S2000900
  S2001000
  S2987800
  S3801000
  S3801100
  S4681700
  S5400900
  S5401000
  S5532800
  S6316700
  S6316800
  S6316900
  S6317000
  S6317100
  S6317200
  S7501100
  S7501200
  S8331500
  T0008400
  T0008500
  T0739400
  T2011000
  T2011100
  T2111400
  T2781700
  T2781900
  T2782000
  T2782100
  T2782200
  T2782300
  T3601400
  T3601500
  T4495000
  T5201300
  T5201400
  T6143400
;
array nvarlist _numeric_;


*---Recode missing values to SAS custom system missing. See SAS
      documentation for use of MISSING option in procedures, e.g. PROC FREQ;

do over nvarlist;
  if nvarlist = -1 then nvarlist = .R;  /* Refused */
  if nvarlist = -2 then nvarlist = .D;  /* Dont know */
  if nvarlist = -3 then nvarlist = .I;  /* Invalid missing */
  if nvarlist = -4 then nvarlist = .V;  /* Valid missing */
  if nvarlist = -5 then nvarlist = .N;  /* Non-interview */
end;

  label R0000100 = "PUBID - YTH ID CODE 1997";
  label R0323900 = "# DAYS/WK TYP FAM RELIGIOUS 1997";
  label R0536300 = "KEY!SEX (SYMBOL) 1997";
  label R0536401 = "KEY!BDATE M/Y (SYMBOL) 1997";
  label R0536402 = "KEY!BDATE M/Y (SYMBOL) 1997";
  label R0552200 = "WHAT RELIG PR RAISED IN? 1997";
  label R0552300 = "WHAT IS PR CURR RELIG PREF? 1997";
  label R0555700 = "WHAT RELIG PR SP/PART RAISED IN? 1997";
  label R0555800 = "PR SP/PART CURR RELIG PREF? 1997";
  label R1193900 = "CV_AGE(MONTHS)_INT_DATE 1997";
  label R1194100 = "CV_AGE_INT_DATE 1997";
  label R1235800 = "CV_SAMPLE_TYPE 1997";
  label R1482600 = "KEY!RACE_ETHNICITY (SYMBOL) 1997";
  label R2165200 = "# DAYS/WK TYP FAM RELIGIOUS 1998";
  label R2553400 = "CV_AGE(MONTHS)_INT_DATE 1998";
  label R2553500 = "CV_AGE_INT_DATE 1998";
  label R3483100 = "# DAYS/WK TYP FAM RELIGIOUS 1999";
  label R3876200 = "CV_AGE(MONTHS)_INT_DATE 1999";
  label R3876300 = "CV_AGE_INT_DATE 1999";
  label R4881300 = "# DAYS/WK TYP FAM RELIGIOUS 2000";
  label R4893400 = "HOW OFTEN R ATTEND WORSHIP SERV 2000";
  label R5453600 = "CV_AGE(MONTHS)_INT_DATE 2000";
  label R5453700 = "CV_AGE_INT_DATE 2000";
  label R6520100 = "HOW OFTEN R ATTEND WORSHIP SERV 2001";
  label R7215900 = "CV_AGE(MONTHS)_INT_DATE 2001";
  label R7216000 = "CV_AGE_INT_DATE 2001";
  label S0919300 = "HOW OFTEN R ATTEND WORSHIP SERV 2002";
  label S0919400 = "R NOT NEED RELIGION TO HAVE VALUES 2002";
  label S0919500 = "R BELIEVE RELIG TEACHINGS OBEYED 2002";
  label S0919600 = "R ASKS GOD HELP MAKE DECISIONS 2002";
  label S0919700 = "GOD NOTHING TO DO HAPPENS TO R 2002";
  label S0919800 = "R PRAYS MORE THAN ONCE A DAY 2002";
  label S1531300 = "CV_AGE(MONTHS)_INT_DATE 2002";
  label S1531400 = "CV_AGE_INT_DATE 2002";
  label S2000900 = "CV_AGE(MONTHS)_INT_DATE 2003";
  label S2001000 = "CV_AGE_INT_DATE 2003";
  label S2987800 = "HOW OFTEN R ATTEND WORSHIP SERV 2003";
  label S3801000 = "CV_AGE(MONTHS)_INT_DATE 2004";
  label S3801100 = "CV_AGE_INT_DATE 2004";
  label S4681700 = "HOW OFTEN R ATTEND WORSHIP SERV 2004";
  label S5400900 = "CV_AGE(MONTHS)_INT_DATE 2005";
  label S5401000 = "CV_AGE_INT_DATE 2005";
  label S5532800 = "R CURR REL PREF 2005";
  label S6316700 = "HOW OFTEN R ATTEND WORSHIP SERV 2005";
  label S6316800 = "R NOT NEED RELIGION TO HAVE VALUES 2005";
  label S6316900 = "R BELIEVE RELIG TEACHINGS OBEYED 2005";
  label S6317000 = "R ASKS GOD HELP MAKE DECISIONS 2005";
  label S6317100 = "GOD NOTHING TO DO HAPPENS TO R 2005";
  label S6317200 = "R PRAYS MORE THAN ONCE A DAY 2005";
  label S7501100 = "CV_AGE(MONTHS)_INT_DATE 2006";
  label S7501200 = "CV_AGE_INT_DATE 2006";
  label S8331500 = "HOW OFTEN R ATTEND WORSHIP SERV 2006";
  label T0008400 = "CV_AGE(MONTHS)_INT_DATE 2007";
  label T0008500 = "CV_AGE_INT_DATE 2007";
  label T0739400 = "HOW OFTEN R ATTEND WORSHIP SERV 2007";
  label T2011000 = "CV_AGE(MONTHS)_INT_DATE 2008";
  label T2011100 = "CV_AGE_INT_DATE 2008";
  label T2111400 = "R CURR REL PREF 2008";
  label T2781700 = "HOW OFTEN R ATTEND WORSHIP SERV 2008";
  label T2781900 = "R NOT NEED RELIGION TO HAVE VALUES 2008";
  label T2782000 = "R BELIEVE RELIG TEACHINGS OBEYED 2008";
  label T2782100 = "R ASKS GOD HELP MAKE DECISIONS 2008";
  label T2782200 = "GOD NOTHING TO DO HAPPENS TO R 2008";
  label T2782300 = "R PRAYS MORE THAN ONCE A DAY 2008";
  label T3601400 = "CV_AGE(MONTHS)_INT_DATE 2009";
  label T3601500 = "CV_AGE_INT_DATE 2009";
  label T4495000 = "HOW OFTEN R ATTEND WORSHIP SERV 2009";
  label T5201300 = "CV_AGE(MONTHS)_INT_DATE 2010";
  label T5201400 = "CV_AGE_INT_DATE 2010";
  label T6143400 = "HOW OFTEN R ATTEND WORSHIP SERV 2010";

/*---------------------------------------------------------------------*
 *  Crosswalk for Reference number & Question name                     *
 *---------------------------------------------------------------------*
 * Uncomment and edit this RENAME statement to rename variables
 * for ease of use.  You may need to use  name literal strings
 * e.g.  'variable-name'n   to create valid SAS variable names, or 
 * alter variables similarly named across years.
 * This command does not guarentee uniqueness

 * See SAS documentation for use of name literals and use of the
 * VALIDVARNAME=ANY option.     
 *---------------------------------------------------------------------*/
  /* *start* */

* RENAME
  R0000100 = 'PUBID_1997'n
  R0323900 = 'YSAQ-010_1997'n
  R0536300 = 'KEY!SEX_1997'n
  R0536401 = 'KEY!BDATE_M_1997'n
  R0536402 = 'KEY!BDATE_Y_1997'n
  R0552200 = 'P2-013_1997'n
  R0552300 = 'P2-014_1997'n
  R0555700 = 'P2-049_1997'n
  R0555800 = 'P2-050_1997'n
  R1193900 = 'CV_AGE(MONTHS)_INT_DATE_1997'n
  R1194100 = 'CV_AGE_INT_DATE_1997'n
  R1235800 = 'CV_SAMPLE_TYPE_1997'n
  R1482600 = 'KEY!RACE_ETHNICITY_1997'n
  R2165200 = 'YSAQ-010_1998'n
  R2553400 = 'CV_AGE(MONTHS)_INT_DATE_1998'n
  R2553500 = 'CV_AGE_INT_DATE_1998'n
  R3483100 = 'YSAQ-010_1999'n
  R3876200 = 'CV_AGE(MONTHS)_INT_DATE_1999'n
  R3876300 = 'CV_AGE_INT_DATE_1999'n
  R4881300 = 'YSAQ-010_2000'n
  R4893400 = 'YSAQ-282A_2000'n
  R5453600 = 'CV_AGE(MONTHS)_INT_DATE_2000'n
  R5453700 = 'CV_AGE_INT_DATE_2000'n
  R6520100 = 'YSAQ-282A_2001'n
  R7215900 = 'CV_AGE(MONTHS)_INT_DATE_2001'n
  R7216000 = 'CV_AGE_INT_DATE_2001'n
  S0919300 = 'YSAQ-282A_2002'n
  S0919400 = 'YSAQ-282A2_2002'n
  S0919500 = 'YSAQ-282A3_2002'n
  S0919600 = 'YSAQ-282A4_2002'n
  S0919700 = 'YSAQ-282A5_2002'n
  S0919800 = 'YSAQ-282A6_2002'n
  S1531300 = 'CV_AGE(MONTHS)_INT_DATE_2002'n
  S1531400 = 'CV_AGE_INT_DATE_2002'n
  S2000900 = 'CV_AGE(MONTHS)_INT_DATE_2003'n
  S2001000 = 'CV_AGE_INT_DATE_2003'n
  S2987800 = 'YSAQ-282A_2003'n
  S3801000 = 'CV_AGE_MONTHS_INT_DATE_2004'n
  S3801100 = 'CV_AGE_INT_DATE_2004'n
  S4681700 = 'YSAQ-282A_2004'n
  S5400900 = 'CV_AGE_MONTHS_INT_DATE_2005'n
  S5401000 = 'CV_AGE_INT_DATE_2005'n
  S5532800 = 'YHHI-55709_2005'n
  S6316700 = 'YSAQ-282A_2005'n
  S6316800 = 'YSAQ-282A2_2005'n
  S6316900 = 'YSAQ-282A3_2005'n
  S6317000 = 'YSAQ-282A4_2005'n
  S6317100 = 'YSAQ-282A5_2005'n
  S6317200 = 'YSAQ-282A6_2005'n
  S7501100 = 'CV_AGE_MONTHS_INT_DATE_2006'n
  S7501200 = 'CV_AGE_INT_DATE_2006'n
  S8331500 = 'YSAQ-282A_2006'n
  T0008400 = 'CV_AGE_MONTHS_INT_DATE_2007'n
  T0008500 = 'CV_AGE_INT_DATE_2007'n
  T0739400 = 'YSAQ-282A_2007'n
  T2011000 = 'CV_AGE_MONTHS_INT_DATE_2008'n
  T2011100 = 'CV_AGE_INT_DATE_2008'n
  T2111400 = 'YHHI-55709_2008'n
  T2781700 = 'YSAQ-282A_2008'n
  T2781900 = 'YSAQ-282A2_2008'n
  T2782000 = 'YSAQ-282A3_2008'n
  T2782100 = 'YSAQ-282A4_2008'n
  T2782200 = 'YSAQ-282A5_2008'n
  T2782300 = 'YSAQ-282A6_2008'n
  T3601400 = 'CV_AGE_MONTHS_INT_DATE_2009'n
  T3601500 = 'CV_AGE_INT_DATE_2009'n
  T4495000 = 'YSAQ-282A_2009'n
  T5201300 = 'CV_AGE_MONTHS_INT_DATE_2010'n
  T5201400 = 'CV_AGE_INT_DATE_2010'n
  T6143400 = 'YSAQ-282A_2010'n
;
  /* *finish* */

run;

proc means data=new_data n mean min max;
run;


/*---------------------------------------------------------------------*
 *  FORMATTED TABULATIONS                                              *
 *---------------------------------------------------------------------*
 * You can uncomment and edit the PROC FORMAT and PROC FREQ statements 
 * provided below to obtain formatted tabulations. The tabulations 
 * should reflect codebook values.
 * 
 * Please edit the formats below reflect any renaming of the variables
 * you may have done in the first data step. 
 *---------------------------------------------------------------------*/

/*
proc format; 
value vx0f
  0='0'
  1-999='1 TO 999'
  1000-1999='1000 TO 1999'
  2000-2999='2000 TO 2999'
  3000-3999='3000 TO 3999'
  4000-4999='4000 TO 4999'
  5000-5999='5000 TO 5999'
  6000-6999='6000 TO 6999'
  7000-7999='7000 TO 7999'
  8000-8999='8000 TO 8999'
  9000-9999='9000 TO 9999'
;
value vx1f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
;
value vx2f
  1='Male'
  2='Female'
  0='No Information'
;
value vx3f
  1='1: January'
  2='2: February'
  3='3: March'
  4='4: April'
  5='5: May'
  6='6: June'
  7='7: July'
  8='8: August'
  9='9: September'
  10='10: October'
  11='11: November'
  12='12: December'
;
value vx5f
  1='1.  Roman Catholic'
  2='2.  Baptist'
  3='3.  Methodist'
  4='4.  Lutheran'
  5='5.  Presbyterian'
  6='6.  Episcopal/Anglican'
  7='7.  United Church of Christ (or Congregationalist or Evangelical Reformed)'
  8='8.  Disciples of Christ (or the Christian Church)'
  9='9.  Reform (or Reformed Church in America or Christian Reformed Church)'
  10='10.  Holiness (Nazarene, Wesleyan, Free Methodist)'
  11='11.  Pentecostal (Assembly of God, Pentecostal Holiness)'
  12='12.  Nondemonimational Christian (Bible Church)'
  13='13.  Other Protestant'
  14='14.  Jewish  -  Orthodox'
  15='15.  Jewish  -  Conservative'
  16='16.  Jewish  -  Reform'
  17='17.  Jewish  -  Other Jewish'
  18='18.  Mormon (all types of Latter Day Saints)'
  19='19.  Eastern Orthodox'
  20='20.  Unitarian'
  21='21.  Muslim (or Moslem or Islam)'
  22='22.  Hindu/Buddhist'
  23='23.  Native American Tribal Religion'
  25='24.  None, no religion - Agnostic (doesn''t know if there is a God)'
  26='25.  None, no religion - Atheist (confident there is no God)'
  27='26.  None, no religion - Personal philosophy'
  28='27.  Bah''ai'
  30='28.  Greek, Roman, Norse, Etc. Mythology'
  31='29.  Satanic'
  32='30.  Wicca/Witchcraft/Magic/Pagan'
  34='31.  Scientology'
  35='32.  Other Eastern (Sikh)'
  24='33.  Other (SPECIFY)'
;
value vx6f
  1='1.  Roman Catholic'
  2='2.  Baptist'
  3='3.  Methodist'
  4='4.  Lutheran'
  5='5.  Presbyterian'
  6='6.  Episcopal/Anglican'
  7='7.  United Church of Christ (or Congregationalist or Evangelical Reformed)'
  8='8.  Disciples of Christ (or the Christian Church)'
  9='9.  Reform (or Reformed Church in America or Christian Reformed Church)'
  10='10.  Holiness (Nazarene, Wesleyan, Free Methodist)'
  11='11.  Pentecostal (Assembly of God, Pentecostal Holiness)'
  12='12.  Nondemonimational Christian (Bible Church)'
  13='13.  Other Protestant'
  14='14.  Jewish  -  Orthodox'
  15='15.  Jewish  -  Conservative'
  16='16.  Jewish  -  Reform'
  17='17.  Jewish  -  Other Jewish'
  18='18.  Mormon (all types of Latter Day Saints)'
  19='19.  Eastern Orthodox'
  20='20.  Unitarian'
  21='21.  Muslim (or Moslem or Islam)'
  22='22.  Hindu/Buddhist'
  23='23.  Native American Tribal Religion'
  25='24.  None, no religion - Agnostic (doesn''t know if there is a God)'
  26='25.  None, no religion - Atheist (confident there is no God)'
  27='26.  None, no religion - Personal philosophy'
  28='27.  Bah''ai'
  30='28.  Greek, Roman, Norse, Etc. Mythology'
  31='29.  Satanic'
  32='30.  Wicca/Witchcraft/Magic/Pagan'
  34='31.  Scientology'
  35='32.  Other Eastern (Sikh)'
  24='33.  Other (SPECIFY)'
;
value vx7f
  1='1.  Roman Catholic'
  2='2.  Baptist'
  3='3.  Methodist'
  4='4.  Lutheran'
  5='5.  Presbyterian'
  6='6.  Episcopal/Anglican'
  7='7.  United Church of Christ (or Congregationalist or Evangelical Reformed)'
  8='8.  Disciples of Christ (or the Christian Church)'
  9='9.  Reform (or Reformed Church in America or Christian Reformed Church)'
  10='10.  Holiness (Nazarene, Wesleyan, Free Methodist)'
  11='11.  Pentecostal (Assembly of God, Pentecostal Holiness)'
  12='12.  Nondemonimational Christian (Bible Church)'
  13='13.  Other Protestant'
  14='14.  Jewish  -  Orthodox'
  15='15.  Jewish  -  Conservative'
  16='16.  Jewish  -  Reform'
  17='17.  Jewish  -  Other Jewish'
  18='18.  Mormon (all types of Latter Day Saints)'
  19='19.  Eastern Orthodox'
  20='20.  Unitarian'
  21='21.  Muslim (or Moslem or Islam)'
  22='22.  Hindu/Buddhist'
  23='23.  Native American Tribal Religion'
  25='24.  None, no religion - Agnostic (doesn''t know if there is a God)'
  26='25.  None, no religion - Atheist (confident there is no God)'
  27='26.  None, no religion - Personal philosophy'
  28='27.  Bah''ai'
  30='28.  Greek, Roman, Norse, Etc. Mythology'
  31='29.  Satanic'
  32='30.  Wicca/Witchcraft/Magic/Pagan'
  34='31.  Scientology'
  35='32.  Other Eastern (Sikh)'
  24='33.  Other (SPECIFY)'
;
value vx8f
  1='1.  Roman Catholic'
  2='2.  Baptist'
  3='3.  Methodist'
  4='4.  Lutheran'
  5='5.  Presbyterian'
  6='6.  Episcopal/Anglican'
  7='7.  United Church of Christ (or Congregationalist or Evangelical Reformed)'
  8='8.  Disciples of Christ (or the Christian Church)'
  9='9.  Reform (or Reformed Church in America or Christian Reformed Church)'
  10='10.  Holiness (Nazarene, Wesleyan, Free Methodist)'
  11='11.  Pentecostal (Assembly of God, Pentecostal Holiness)'
  12='12.  Nondemonimational Christian (Bible Church)'
  13='13.  Other Protestant'
  14='14.  Jewish  -  Orthodox'
  15='15.  Jewish  -  Conservative'
  16='16.  Jewish  -  Reform'
  17='17.  Jewish  -  Other Jewish'
  18='18.  Mormon (all types of Latter Day Saints)'
  19='19.  Eastern Orthodox'
  20='20.  Unitarian'
  21='21.  Muslim (or Moslem or Islam)'
  22='22.  Hindu/Buddhist'
  23='23.  Native American Tribal Religion'
  25='24.  None, no religion - Agnostic (doesn''t know if there is a God)'
  26='25.  None, no religion - Atheist (confident there is no God)'
  27='26.  None, no religion - Personal philosophy'
  28='27.  Bah''ai'
  30='28.  Greek, Roman, Norse, Etc. Mythology'
  31='29.  Satanic'
  32='30.  Wicca/Witchcraft/Magic/Pagan'
  34='31.  Scientology'
  35='32.  Other Eastern (Sikh)'
  24='33.  Other (SPECIFY)'
;
value vx9f
  0-139='0 TO 139: <140'
  140-150='140 TO 150'
  151-160='151 TO 160'
  161-170='161 TO 170'
  171-180='171 TO 180'
  181-190='181 TO 190'
  191-200='191 TO 200'
  201-210='201 TO 210'
  211-220='211 TO 220'
  221-230='221 TO 230'
;
value vx10f
  0-11='0 TO 11: LESS THAN 12'
  12='12'
  13='13'
  14='14'
  15='15'
  16='16'
  17='17'
  18='18'
  19-999='19 TO 999: GREATER THAN 18'
;
value vx11f
  1='Cross-sectional'
  0='Oversample'
;
value vx12f
  1='Black'
  2='Hispanic'
  3='Mixed Race (Non-Hispanic)'
  4='Non-Black / Non-Hispanic'
;
value vx13f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
;
value vx14f
  0-139='0 TO 139: <140'
  140-150='140 TO 150'
  151-160='151 TO 160'
  161-170='161 TO 170'
  171-180='171 TO 180'
  181-190='181 TO 190'
  191-200='191 TO 200'
  201-210='201 TO 210'
  211-220='211 TO 220'
  221-230='221 TO 230'
  231-240='231 TO 240'
;
value vx15f
  0-11='0 TO 11: LESS THAN 12'
  12='12'
  13='13'
  14='14'
  15='15'
  16='16'
  17='17'
  18='18'
  19-999='19 TO 999: GREATER THAN 18'
;
value vx16f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
;
value vx17f
  0-139='0 TO 139: <140'
  140-150='140 TO 150'
  151-160='151 TO 160'
  161-170='161 TO 170'
  171-180='171 TO 180'
  181-190='181 TO 190'
  191-200='191 TO 200'
  201-210='201 TO 210'
  211-220='211 TO 220'
  221-230='221 TO 230'
  231-240='231 TO 240'
  241-250='241 TO 250'
;
value vx18f
  0-11='0 TO 11: LESS THAN 12'
  12='12'
  13='13'
  14='14'
  15='15'
  16='16'
  17='17'
  18='18'
  19-999='19 TO 999: GREATER THAN 18'
;
value vx19f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
;
value vx20f
  1='Never'
  2='Once or twice'
  3='Less than once a month / 3-12 times'
  4='About once a month / 12 times'
  5='About twice a month / 24 times'
  6='About once a week'
  7='Several times a week'
  8='Everyday'
;
value vx21f
  0-139='0 TO 139: <140'
  140-150='140 TO 150'
  151-160='151 TO 160'
  161-170='161 TO 170'
  171-180='171 TO 180'
  181-190='181 TO 190'
  191-200='191 TO 200'
  201-210='201 TO 210'
  211-220='211 TO 220'
  221-230='221 TO 230'
  231-240='231 TO 240'
  241-250='241 TO 250'
  251-260='251 TO 260'
;
value vx22f
  14='14'
  15='15'
  16='16'
  17='17'
  18='18'
  19-20='19 TO 20: 19'
  20='20'
  21-100='21 TO 100: Age 21 and older'
;
value vx23f
  1='Never'
  2='Once or twice'
  3='Less than once a month / 3-12 times'
  4='About once a month / 12 times'
  5='About twice a month / 24 times'
  6='About once a week'
  7='Several times a week'
  8='Everyday'
;
value vx24f
  0-139='0 TO 139: <140'
  140-150='140 TO 150'
  151-160='151 TO 160'
  161-170='161 TO 170'
  171-180='171 TO 180'
  181-190='181 TO 190'
  191-200='191 TO 200'
  201-210='201 TO 210'
  211-220='211 TO 220'
  221-230='221 TO 230'
  231-240='231 TO 240'
  241-250='241 TO 250'
  251-260='251 TO 260'
  261-270='261 TO 270'
;
value vx25f
  14='14'
  15='15'
  16='16'
  17='17'
  18='18'
  19='19'
  20='20'
  21='21'
  22-100='22 TO 100: Age 22 or greater'
;
value vx26f
  1='Never'
  2='Once or twice'
  3='Less than once a month / 3-12 times'
  4='About once a month / 12 times'
  5='About twice a month / 24 times'
  6='About once a week'
  7='Several times a week'
  8='Everyday'
;
value vx27f
  1='TRUE'
  0='FALSE'
;
value vx28f
  1='TRUE'
  0='FALSE'
;
value vx29f
  1='TRUE'
  0='FALSE'
;
value vx30f
  1='TRUE'
  0='FALSE'
;
value vx31f
  1='TRUE'
  0='FALSE'
;
value vx32f
  0-139='0 TO 139: <140'
  140-150='140 TO 150'
  151-160='151 TO 160'
  161-170='161 TO 170'
  171-180='171 TO 180'
  181-190='181 TO 190'
  191-200='191 TO 200'
  201-210='201 TO 210'
  211-220='211 TO 220'
  221-230='221 TO 230'
  231-240='231 TO 240'
  241-250='241 TO 250'
  251-260='251 TO 260'
  261-270='261 TO 270'
  271-280='271 TO 280'
  281-290='281 TO 290'
  291-300='291 TO 300'
;
value vx33f
  14='14'
  15='15'
  16='16'
  17='17'
  18='18'
  19='19'
  20='20'
  21='21'
  22-100='22 TO 100: Age 22 or greater'
;
value vx34f
  0-200='0 TO 200'
  201-210='201 TO 210'
  211-220='211 TO 220'
  221-230='221 TO 230'
  231-240='231 TO 240'
  241-250='241 TO 250'
  251-260='251 TO 260'
  261-270='261 TO 270'
  271-280='271 TO 280'
  281-290='281 TO 290'
  291-300='291 TO 300'
;
value vx35f
  18='18'
  19='19'
  20='20'
  21='21'
  22='22'
  23='23'
  24-100='24 TO 100: Age 24 or greater'
;
value vx36f
  1='Never'
  2='Once or twice'
  3='Less than once a month'
  4='About once a month'
  5='About twice a month'
  6='About once a week'
  7='Several times a week'
  8='Everyday'
;
value vx37f
  0-200='0 TO 200: <200'
  201-220='201 TO 220'
  221-240='221 TO 240'
  241-260='241 TO 260'
  261-280='261 TO 280'
  281-300='281 TO 300'
  301-320='301 TO 320'
  321-340='321 TO 340'
;
value vx38f
  18='18'
  19='19'
  20='20'
  21='21'
  22='22'
  23='23'
  24-100='24 TO 100: Age 24 or greater'
;
value vx39f
  1='Never'
  2='Once or twice'
  3='Less than once a month'
  4='About once a month'
  5='About twice a month'
  6='About once a week'
  7='Several times a week'
  8='Everyday'
;
value vx40f
  0-200='0 TO 200: <200'
  201-220='201 TO 220'
  221-240='221 TO 240'
  241-260='241 TO 260'
  261-280='261 TO 280'
  281-300='281 TO 300'
  301-320='301 TO 320'
  321-340='321 TO 340'
;
value vx41f
  20='20'
  21='21'
  22='22'
  23='23'
  24='24'
  25='25'
  26='26'
  27-99='27 TO 99: Age 27 or greater'
;
value vx42f
  1='1. Roman Catholic'
  2='2. Baptist'
  3='3. Methodist'
  4='4. Lutheran'
  5='5. Presbyterian'
  6='6. Episcopal/Anglican'
  7='7. United Church of Christ (or Congregationalist or Evangelical Reformed)'
  8='8. Disciples of Christ (or the Christian Church)'
  9='9. Reform (or Reformed Church in America or Christian Reformed Church)'
  10='10. Holiness (Nazarene, Wesleyan, Free Methodist)'
  11='11. Pentecostal (Assembly of God, Pentecostal Holiness)'
  12='12. Nondenominational Christian (Including Bible Church)'
  31='28. Jehovah''s Witness'
  32='29. Seventh Day Adventist'
  13='13. Other Protestant'
  14='14. Jewish - Orthodox'
  15='15. Jewish - Conservative'
  16='16. Jewish - Reform'
  17='17. Jewish - Other Jewish'
  18='18. Mormon (all types of Latter Day Saints)'
  19='19. Eastern Orthodox'
  20='20. Unitarian'
  21='21. Muslim (or Moslem or Islam)'
  22='22. Hindu/Buddhist'
  23='23. Native American Tribal Religion'
  24='24. Other organized religion (SPECIFY)'
  25='25. None, no religion - Agnostic (doesn''t know if there is a God)'
  26='26. None, no religion - Atheist (confident there is no God)'
  27='27. None, no religion - personal philosophy'
  28='Other - Recoded to Bah''ai'
  30='Other - Recoded to Greek, Roman, Norse Mythology'
  34='Other - Recoded to Scientology'
  35='Other - Recoded to Other Eastern (Sikh)'
  36='Other - Recoded to Satanic'
  37='Other - Recoded to Wicca/Witchcraft/Magic/Pagan'
  995='Supervisor Review'
  999='UNCODABLE'
;
value vx43f
  1='Never'
  2='Once or twice'
  3='Less than once a month'
  4='About once a month'
  5='About twice a month'
  6='About once a week'
  7='Several times a week'
  8='Everyday'
;
value vx44f
  1='TRUE'
  0='FALSE'
;
value vx45f
  1='TRUE'
  0='FALSE'
;
value vx46f
  1='TRUE'
  0='FALSE'
;
value vx47f
  1='TRUE'
  0='FALSE'
;
value vx48f
  1='TRUE'
  0='FALSE'
;
value vx49f
  0-200='0 TO 200: <200'
  201-220='201 TO 220'
  221-240='221 TO 240'
  241-260='241 TO 260'
  261-280='261 TO 280'
  281-300='281 TO 300'
  301-320='301 TO 320'
  321-340='321 TO 340'
;
value vx50f
  20='20'
  21='21'
  22='22'
  23='23'
  24='24'
  25='25'
  26='26'
  27-99='27 TO 99: Age 27 or greater'
;
value vx51f
  1='Never'
  2='Once or twice'
  3='Less than once a month'
  4='About once a month'
  5='About twice a month'
  6='About once a week'
  7='Several times a week'
  8='Everyday'
;
value vx52f
  0-200='0 TO 200: <200'
  201-220='201 TO 220'
  221-240='221 TO 240'
  241-260='241 TO 260'
  261-280='261 TO 280'
  281-300='281 TO 300'
  301-320='301 TO 320'
  321-340='321 TO 340'
  341-360='341 TO 360'
;
value vx53f
  20='20'
  21='21'
  22='22'
  23='23'
  24='24'
  25='25'
  26='26'
  27-99='27 TO 99: Age 27 or greater'
;
value vx54f
  1='Never'
  2='Once or twice'
  3='Less than once a month'
  4='About once a month'
  5='About twice a month'
  6='About once a week'
  7='Several times a week'
  8='Everyday'
;
value vx55f
  0-200='0 TO 200: <200'
  201-220='201 TO 220'
  221-240='221 TO 240'
  241-260='241 TO 260'
  261-280='261 TO 280'
  281-300='281 TO 300'
  301-320='301 TO 320'
  321-340='321 TO 340'
  341-360='341 TO 360'
;
value vx56f
  23='23'
  24='24'
  25='25'
  26='26'
  27='27'
  28='28'
  29='29: Age 29 or greater'
;
value vx57f
  1='1. Roman Catholic'
  2='2. Baptist'
  3='3. Methodist'
  4='4. Lutheran'
  5='5. Presbyterian'
  6='6. Episcopal/Anglican'
  7='7. United Church of Christ (or Congregationalist or Evangelical Reformed)'
  8='8. Disciples of Christ (or the Christian Church)'
  9='9. Reform (or Reformed Church in America or Christian Reformed Church)'
  10='10. Holiness (Nazarene, Wesleyan, Free Methodist)'
  11='11. Pentecostal (Assembly of God, Pentecostal Holiness)'
  12='12. Nondenominational Christian (Including Bible Church)'
  31='28. Jehovah''s Witness'
  32='29. Seventh Day Adventist'
  13='13. Other Protestant'
  14='14. Jewish - Orthodox'
  15='15. Jewish - Conservative'
  16='16. Jewish - Reform'
  17='17. Jewish - Other Jewish'
  18='18. Mormon (all types of Latter Day Saints)'
  19='19. Eastern Orthodox'
  20='20. Unitarian'
  21='21. Muslim (or Moslem or Islam)'
  22='22. Hindu/Buddhist'
  23='23. Native American Tribal Religion'
  24='24. Other organized religion (SPECIFY)'
  25='25. None, no religion - Agnostic (doesn''t know if there is a God)'
  26='26. None, no religion - Atheist (confident there is no God)'
  27='27. None, no religion - personal philosophy'
  34='OTHER - RECODED TO SCIENTOLOGY'
  35='OTHER - RECODED TO OTHER EASTERN (SIKH)'
  36='OTHER - RECODED TO SATANIC'
  37='OTHER - RECODED TO WICCA/WITCHCRAFT/MAGIC/PAGAN'
  995='SUPERVISOR REVIEW'
  999='UNCODABLE'
;
value vx58f
  1='Never'
  2='Once or twice'
  3='Less than once a month'
  4='About once a month'
  5='About twice a month'
  6='About once a week'
  7='Several times a week'
  8='Everyday'
;
value vx59f
  1='TRUE'
  0='FALSE'
;
value vx60f
  1='TRUE'
  0='FALSE'
;
value vx61f
  1='TRUE'
  0='FALSE'
;
value vx62f
  1='TRUE'
  0='FALSE'
;
value vx63f
  1='TRUE'
  0='FALSE'
;
value vx64f
  0-200='0 TO 200: <200'
  201-220='201 TO 220'
  221-240='221 TO 240'
  241-260='241 TO 260'
  261-280='261 TO 280'
  281-300='281 TO 300'
  301-320='301 TO 320'
  321-340='321 TO 340'
  341-360='341 TO 360'
  361-380='361 TO 380'
;
value vx65f
  24='24'
  25='25'
  26='26'
  27='27'
  28='28'
  29='29'
  30-31='30 TO 31: Age 30 or greater'
;
value vx66f
  1='Never'
  2='Once or twice'
  3='Less than once a month'
  4='About once a month'
  5='About twice a month'
  6='About once a week'
  7='Several times a week'
  8='Everyday'
;
value vx67f
  0-300='0 TO 300'
  301-320='301 TO 320'
  321-340='321 TO 340'
  341-360='341 TO 360'
  361-380='361 TO 380'
;
value vx68f
  25='25'
  26='26'
  27='27'
  28='28'
  29='29'
  30='30'
  31='31'
;
value vx69f
  1='Never'
  2='Once or twice'
  3='Less than once a month'
  4='About once a month'
  5='About twice a month'
  6='About once a week'
  7='Several times a week'
  8='Everyday'
;
*/

/* 
 *--- Tabulations using reference number variables;
proc freq data=new_data;
tables _ALL_ /MISSING;
  format R0000100 vx0f.;
  format R0323900 vx1f.;
  format R0536300 vx2f.;
  format R0536401 vx3f.;
  format R0552200 vx5f.;
  format R0552300 vx6f.;
  format R0555700 vx7f.;
  format R0555800 vx8f.;
  format R1193900 vx9f.;
  format R1194100 vx10f.;
  format R1235800 vx11f.;
  format R1482600 vx12f.;
  format R2165200 vx13f.;
  format R2553400 vx14f.;
  format R2553500 vx15f.;
  format R3483100 vx16f.;
  format R3876200 vx17f.;
  format R3876300 vx18f.;
  format R4881300 vx19f.;
  format R4893400 vx20f.;
  format R5453600 vx21f.;
  format R5453700 vx22f.;
  format R6520100 vx23f.;
  format R7215900 vx24f.;
  format R7216000 vx25f.;
  format S0919300 vx26f.;
  format S0919400 vx27f.;
  format S0919500 vx28f.;
  format S0919600 vx29f.;
  format S0919700 vx30f.;
  format S0919800 vx31f.;
  format S1531300 vx32f.;
  format S1531400 vx33f.;
  format S2000900 vx34f.;
  format S2001000 vx35f.;
  format S2987800 vx36f.;
  format S3801000 vx37f.;
  format S3801100 vx38f.;
  format S4681700 vx39f.;
  format S5400900 vx40f.;
  format S5401000 vx41f.;
  format S5532800 vx42f.;
  format S6316700 vx43f.;
  format S6316800 vx44f.;
  format S6316900 vx45f.;
  format S6317000 vx46f.;
  format S6317100 vx47f.;
  format S6317200 vx48f.;
  format S7501100 vx49f.;
  format S7501200 vx50f.;
  format S8331500 vx51f.;
  format T0008400 vx52f.;
  format T0008500 vx53f.;
  format T0739400 vx54f.;
  format T2011000 vx55f.;
  format T2011100 vx56f.;
  format T2111400 vx57f.;
  format T2781700 vx58f.;
  format T2781900 vx59f.;
  format T2782000 vx60f.;
  format T2782100 vx61f.;
  format T2782200 vx62f.;
  format T2782300 vx63f.;
  format T3601400 vx64f.;
  format T3601500 vx65f.;
  format T4495000 vx66f.;
  format T5201300 vx67f.;
  format T5201400 vx68f.;
  format T6143400 vx69f.;
run;
*/

/*
*--- Tabulations using default named variables;
proc freq data=new_data;
tables _ALL_ /MISSING;
  format PUBID_1997 vx0f.;
  format YSAQ-010_1997 vx1f.;
  format KEY!SEX_1997 vx2f.;
  format KEY!BDATE_M_1997 vx3f.;
  format P2-013_1997 vx5f.;
  format P2-014_1997 vx6f.;
  format P2-049_1997 vx7f.;
  format P2-050_1997 vx8f.;
  format CV_AGE(MONTHS)_INT_DATE_1997 vx9f.;
  format CV_AGE_INT_DATE_1997 vx10f.;
  format CV_SAMPLE_TYPE_1997 vx11f.;
  format KEY!RACE_ETHNICITY_1997 vx12f.;
  format YSAQ-010_1998 vx13f.;
  format CV_AGE(MONTHS)_INT_DATE_1998 vx14f.;
  format CV_AGE_INT_DATE_1998 vx15f.;
  format YSAQ-010_1999 vx16f.;
  format CV_AGE(MONTHS)_INT_DATE_1999 vx17f.;
  format CV_AGE_INT_DATE_1999 vx18f.;
  format YSAQ-010_2000 vx19f.;
  format YSAQ-282A_2000 vx20f.;
  format CV_AGE(MONTHS)_INT_DATE_2000 vx21f.;
  format CV_AGE_INT_DATE_2000 vx22f.;
  format YSAQ-282A_2001 vx23f.;
  format CV_AGE(MONTHS)_INT_DATE_2001 vx24f.;
  format CV_AGE_INT_DATE_2001 vx25f.;
  format YSAQ-282A_2002 vx26f.;
  format YSAQ-282A2_2002 vx27f.;
  format YSAQ-282A3_2002 vx28f.;
  format YSAQ-282A4_2002 vx29f.;
  format YSAQ-282A5_2002 vx30f.;
  format YSAQ-282A6_2002 vx31f.;
  format CV_AGE(MONTHS)_INT_DATE_2002 vx32f.;
  format CV_AGE_INT_DATE_2002 vx33f.;
  format CV_AGE(MONTHS)_INT_DATE_2003 vx34f.;
  format CV_AGE_INT_DATE_2003 vx35f.;
  format YSAQ-282A_2003 vx36f.;
  format CV_AGE_MONTHS_INT_DATE_2004 vx37f.;
  format CV_AGE_INT_DATE_2004 vx38f.;
  format YSAQ-282A_2004 vx39f.;
  format CV_AGE_MONTHS_INT_DATE_2005 vx40f.;
  format CV_AGE_INT_DATE_2005 vx41f.;
  format YHHI-55709_2005 vx42f.;
  format YSAQ-282A_2005 vx43f.;
  format YSAQ-282A2_2005 vx44f.;
  format YSAQ-282A3_2005 vx45f.;
  format YSAQ-282A4_2005 vx46f.;
  format YSAQ-282A5_2005 vx47f.;
  format YSAQ-282A6_2005 vx48f.;
  format CV_AGE_MONTHS_INT_DATE_2006 vx49f.;
  format CV_AGE_INT_DATE_2006 vx50f.;
  format YSAQ-282A_2006 vx51f.;
  format CV_AGE_MONTHS_INT_DATE_2007 vx52f.;
  format CV_AGE_INT_DATE_2007 vx53f.;
  format YSAQ-282A_2007 vx54f.;
  format CV_AGE_MONTHS_INT_DATE_2008 vx55f.;
  format CV_AGE_INT_DATE_2008 vx56f.;
  format YHHI-55709_2008 vx57f.;
  format YSAQ-282A_2008 vx58f.;
  format YSAQ-282A2_2008 vx59f.;
  format YSAQ-282A3_2008 vx60f.;
  format YSAQ-282A4_2008 vx61f.;
  format YSAQ-282A5_2008 vx62f.;
  format YSAQ-282A6_2008 vx63f.;
  format CV_AGE_MONTHS_INT_DATE_2009 vx64f.;
  format CV_AGE_INT_DATE_2009 vx65f.;
  format YSAQ-282A_2009 vx66f.;
  format CV_AGE_MONTHS_INT_DATE_2010 vx67f.;
  format CV_AGE_INT_DATE_2010 vx68f.;
  format YSAQ-282A_2010 vx69f.;
run;
*/