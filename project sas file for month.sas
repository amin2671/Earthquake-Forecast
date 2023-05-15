proc import out=na
    datafile="Z:/data/monthly-na.csv"
    dbms=csv
    replace;
    getnames=YES;
run;

proc import out=sa
    datafile="Z:/data/monthly-sa.csv"
    dbms=csv
    replace;
    getnames=YES;
run;

proc import out=eua
    datafile="Z:/data/monthly-eua.csv"
    dbms=csv
    replace;
    getnames=YES;
run;

proc import out=ind
    datafile="Z:/data/monthly-ind.csv"
    dbms=csv
    replace;
    getnames=YES;
run;

proc import out=sea
    datafile="Z:/data/monthly-sea.csv"
    dbms=csv
    replace;
    getnames=YES;
run;

proc import out=eap
    datafile="Z:/data/monthly-eap.csv"
    dbms=csv
    replace;
    getnames=YES;
run;

proc import out=pa
    datafile="Z:/data/monthly-pa.csv"
    dbms=csv
    replace;
    getnames=YES;
run;

proc import out=oth
    datafile="Z:/data/monthly-oth.csv"
    dbms=csv
    replace;
    getnames=YES;
run;


ods html file="output.html" path="Z:/output for monthly/" gpath="Z:/output for monthly/";

proc ucm data=na;
id time interval = month;
model total;
/*irregular;*/
level variance=0 noest;
slope;
cycle;
estimate;
forecast lead = 6 plot=decomp;
run;

proc ucm data=sa;
id time interval = month;
model total;
/*irregular;*/
level variance=0 noest;
slope;
cycle;
estimate;
forecast lead = 6 plot=decomp;
run;

proc ucm data=eua;
id time interval = month;
model total;
/*irregular;*/
level;
slope;
cycle;
estimate;
forecast lead = 6 plot=decomp;
run;

proc ucm data=ind;
id time interval = month;
model total;
irregular;
level variance=0 noest;
slope;
cycle;
estimate;
forecast lead = 6 plot=decomp;
run;

proc ucm data=sea;
id time interval = month;
model total;
irregular;
level variance=0 noest;
slope;
cycle;
estimate;
forecast lead = 6 plot=decomp;
run;

proc ucm data=eap;
id time interval = month;
model total;
irregular;
level variance=0 noest;
slope;
cycle;
estimate;
forecast lead = 6 plot=decomp;
run;

proc ucm data=pa;
id time interval = month;
model total;
/*irregular;*/
level variance=0 noest;
slope variance=0 noest;
cycle;
estimate;
forecast lead = 6 plot=decomp;
run;

/*  REMOVED BECAUSE r-square of .12
proc ucm data=oth;
id time interval = month;
model total;
irregular;
level;
slope;
cycle;
outlier maxnum=0;
estimate;
forecast lead = 6 plot=decomp;
run;
*/
