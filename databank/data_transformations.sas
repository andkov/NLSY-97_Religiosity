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
pubid bmonth byear race sex attend_100-attend_110
decide_102 decide_105 decide_108 
obey_102 obey_105 obey_108 
values_102 values_105 values_108 
pray_102 pray_105 pray_108 
todo_102 todo_105 todo_108
relpref_105 relpref_108
;run;

/* Excluding the missing data in the attendance variable */;
data nonmiss;
	set small;
where
attend_100 in(1,2,3,4,5,6,7,8) and
attend_101 in(1,2,3,4,5,6,7,8)and
attend_102 in(1,2,3,4,5,6,7,8)and
attend_103 in(1,2,3,4,5,6,7,8)and
attend_104 in(1,2,3,4,5,6,7,8)and
attend_105 in(1,2,3,4,5,6,7,8)and
attend_106 in(1,2,3,4,5,6,7,8)and
attend_107 in(1,2,3,4,5,6,7,8)and
attend_108 in(1,2,3,4,5,6,7,8)and
attend_109 in(1,2,3,4,5,6,7,8)and
attend_110 in(1,2,3,4,5,6,7,8);
run;

/* Recoding negatively worded items so that ones (1s) indicate greater religiosity

values (N)	I don't need religion to have good values.
obey		The Bible/Koran/Torah/religious teachings should be obeyed exactly as written in every situation.
decide		I often ask God to help me make decisions.
todo   (N)	God has nothing to do with what happens to me personally.
pray		I pray more than once a day.

prefect "r" in fron of the new variable indicated "recoded" */;

data recoded; set nonmiss;
if values_102=1 then rvalues_102=0; else
if values_102=0 then rvalues_102=1;
if values_105=1 then rvalues_105=0; else
if values_105=0 then rvalues_105=1;
if values_108=1 then rvalues_108=0; else
if values_108=0 then rvalues_108=1;
if todo_102=1 then rtodo_102=0; else
if todo_102=0 then rtodo_102=1;
if todo_105=1 then rtodo_105=0; else
if todo_105=0 then rtodo_105=1;
if todo_108=1 then rtodo_108=0; else
if todo_108=0 then rtodo_108=1;
run;

/* reducing the 1-8 scale of the original question into three categories*/;

data categorized;
	set recoded;
%macro typology;
%do year=100 %to 110;

if attend_&year. in(1,2) 		then cat&year.=1 /* Absentee */	; else
if attend_&year. in(3,4,5) 	    then cat&year.=2 /* Irregular */; else
if attend_&year. in(6,7,8)		then cat&year.=3 /* Goer*/	;
%end;
run;
%mend;
%typology;

