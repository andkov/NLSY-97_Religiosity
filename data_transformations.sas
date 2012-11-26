*/;

Gender Format
  1='Male'
  2='Female'
  0='No Information';

Attendance Format
  1='Never'
  2='Once or twice'
  3='Less than once a month'
  4='About once a month'
  5='About twice a month'
  6='About once a week'
  7='Several times a week'
  8='Everyday'
*/;
*/ VARIABLE USED */

famrel
attend
pray
obey
decide
values
todo
relpref

*/;

/* Select the variables you want for closer examination, add more later by linking by "id" */;
data small;
	set Data_nlsy_97_religion_24102012;
keep 
id bmonth byear race sex attend_2000-attend_2010
decide_2002 decide_2005 decide_2008 
obey_2002 obey_2005 obey_2008 
values_2002 values_2005 values_2008 
pray_2002 pray_2005 pray_2008 
todo_2002 todo_2005 todo_2008
relpref_2005 relpref_2008
agemon_1997-agemon_2010
;run;

/* Excluding the missing data in the attendance variable */;
data nonmiss;
	set small;
where
attend_2000 in(1,2,3,4,5,6,7,8) and
attend_2001 in(1,2,3,4,5,6,7,8)and
attend_2002 in(1,2,3,4,5,6,7,8)and
attend_2003 in(1,2,3,4,5,6,7,8)and
attend_2004 in(1,2,3,4,5,6,7,8)and
attend_2005 in(1,2,3,4,5,6,7,8)and
attend_2006 in(1,2,3,4,5,6,7,8)and
attend_2007 in(1,2,3,4,5,6,7,8)and
attend_2008 in(1,2,3,4,5,6,7,8)and
attend_2009 in(1,2,3,4,5,6,7,8)and
attend_2010 in(1,2,3,4,5,6,7,8);
run;

/* Recoding negatively worded items so that ones (1s) indicate greater religiosity

values (N)	I don't need religion to have good values.
obey		The Bible/Koran/Torah/religious teachings should be obeyed exactly as written in every situation.
decide		I often ask God to help me make decisions.
todo   (N)	God has nothing to do with what happens to me personally.
pray		I pray more than once a day.

prefect "r" in fron of the new variable indicated "recoded" */;

data recoded; set nonmiss; */ alternatively " set "small" OR "nonmiss" to save the cases with missing time points */;
if values_2002=1 then rvalues_2002=0; else
if values_2002=0 then rvalues_2002=1;
if values_2005=1 then rvalues_2005=0; else
if values_2005=0 then rvalues_2005=1;
if values_2008=1 then rvalues_2008=0; else
if values_2008=0 then rvalues_2008=1;
if todo_2002=1 then rtodo_2002=0; else
if todo_2002=0 then rtodo_2002=1;
if todo_2005=1 then rtodo_2005=0; else
if todo_2005=0 then rtodo_2005=1;
if todo_2008=1 then rtodo_2008=0; else
if todo_2008=0 then rtodo_2008=1;
run;

/* reducing the 1-8 scale of the original question into three categories*/;

data categorized;
	set recoded;
%macro typology;
%do year=2000 %to 2010;

if attend_&year. in(1,2) 		then cat&year.=1 /* Absentee */	; else
if attend_&year. in(3,4,5) 	    then cat&year.=2 /* Irregular */; else
if attend_&year. in(6,7,8)		then cat&year.=3 /* Goer*/	;
%end;
run;
%mend;
%typology;

PROC EXPORT DATA= WORK.categorized 
            OUTFILE= "C:\Dropbox\data\NLSY97_Religion_24102012\
NLSY97_Religion_10242012.csv" 
            DBMS=CSV REPLACE;
RUN;
