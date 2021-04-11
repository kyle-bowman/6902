
options msglevel=i cpucount=16 nofmterr;
%let data_path=F:\6901\data_files\;
%let log_path=F:\6901\logs\;
%let sasdata=F:\6901\sasdata;
%let modwork=F:\6901\sasdata\modwork;
%let code_path=F:\6901\code\;

/* run these when setting up in a new environment... */

/*
proc printto log="&log_path.hud_subprime_investor.log" new;run;
%include "&code_path.hud_subprime_investor.sas";
proc printto log=log;run;

proc printto log="&log_path.permits_all_counties.log" new;run;
%include "&code_path.permits_all_counties.sas";
proc printto log=log;run;

proc printto log="&log_path.geocode_zcat_2014.log" new;run;
%include "&code_path.geocode_zcat_2014.sas"; * <-- has to be ran before fred_data.sas... ;
proc printto log=log;run;

proc printto log="&log_path.fred_data.log" new;run;
%include "&code_path.fred_data.sas"; *** 20 ish minutes, depends on PC power... ;
proc printto log=log;run;

proc printto log="&log_path.investor_list.log" new;run;
%include "&code_path.investor_list.sas";
proc printto log=log;run;

proc printto log="&log_path.zillow_data.log" new;run;
%include "&code_path.zillow_data.sas";
proc printto log=log;run;

proc printto log="&log_path.subprime_institution.log" new;run;
%include "&code_path.subprime_institution.sas";
proc printto log=log;run;

*/

%include "&code_path.formats.sas";
libname sasdata "&sasdata.";
libname modwork "&modwork.";

/* the below prepares the data, census and lars files.
   depending on computing power, this might fail.  during build, i noted that the memory
   requirements can jump to 20 gig per lar files.  depending on your SAS install.  
   this might get wrote to disk during the read in. */
/*
proc printto log="&log_path.01-data_build.log" new;run;
%include "&code_path.01-data_build.sas"; *** likely 2+ hours.;
proc printto log=log;run;
*/

