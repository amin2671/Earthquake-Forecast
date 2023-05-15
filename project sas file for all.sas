proc import out=aday
    datafile="Z:/data/allday.csv"
    dbms=csv
    replace;
    getnames=YES;
run;

proc import out=amonth
    datafile="Z:/data/allmonth.csv"
    dbms=csv
    replace;
    getnames=YES;
run;


ods html file="output.html" path="Z:/output-all data/" gpath="Z:/output-all data/";

proc ucm data=aday;
id time interval = day;
model total;
irregular;
level;
slope;
cycle;
estimate;
forecast lead = 60 plot=decomp;
run;

proc ucm data=amonth;
id time interval = month;
model total;
/*irregular;*/
level variance=0 noest;
slope;
cycle;
estimate;
forecast lead = 6 plot=decomp;
run;
