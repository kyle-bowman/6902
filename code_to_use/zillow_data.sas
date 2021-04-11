
/*
https://www.zillow.com/research/data/
*/

libname sasdata "&sasdata.";

/****************************************************************
 ****************************************************************
 ----------------------------------------------------------------
 County Level Read in... 
 ----------------------------------------------------------------
 ****************************************************************
 ****************************************************************/

proc import file="&data_path.County_Zhvi_SingleFamilyResidence.csv"
            out=zhvi_singlefamily
            dbms=csv
            replace
            ;
    guessingrows=max;
run;

proc import file="&data_path.County_MedianValuePerSqft_AllHomes.csv"
            out=zhvi_median_ppsft
            dbms=csv
            replace
            ;
    guessingrows=max;
run;

data zhvi_singlefamily_long;
    set zhvi_singlefamily (drop=regionid regionname state metro sizerank);

    array n{*} _numeric_;

    length state_code $ 2 county_code $ 3 month 4;
    format month mmddyy10.;
    state_code=strip(put(statecodefips,4.));
    if length(state_code) lt 2 then state_code=cats('0',state_code);
    county_code=strip(put(municipalcodefips,4.));
    if length(county_code) lt 2 then county_code=cats('00',county_code);
    else if length(county_code) lt 3 then county_code=cats('0',county_code);

    do i=3 to dim(n);
        month=intnx('month',input(compress(vname(n{i}),,'kd'),yymmn6.),0,'B');
        zhvi_sfh=n{i};
        output;
    end;

    keep state_code county_code month zhvi_sfh;
run;

data zhvi_median_ppsft_long;
    set zhvi_median_ppsft (drop=regionid regionname state metro sizerank);

    array n{*} _numeric_;

    length state_code $ 2 county_code $ 3 month 4;
    format month mmddyy10.;
    state_code=strip(put(statecodefips,4.));
    if length(state_code) lt 2 then state_code=cats('0',state_code);
    county_code=strip(put(municipalcodefips,4.));
    if length(county_code) lt 2 then county_code=cats('00',county_code);
    else if length(county_code) lt 3 then county_code=cats('0',county_code);

    do i=3 to dim(n);
        month=intnx('month',input(compress(vname(n{i}),,'kd'),yymmn6.),0,'B');
        median_ppsft=n{i};
        output;
    end;

    keep state_code county_code month median_ppsft;
run;

proc sort data=zhvi_singlefamily_long;by month state_code county_code;run;
proc sort data=zhvi_median_ppsft_long;by month state_code county_code;run;

data county_data;
    merge zhvi_singlefamily_long zhvi_median_ppsft_long;
    by month state_code county_code;
	length asofdate 3;
	asofdate=year(month);
run;

/****************************************************************
 ****************************************************************
 ----------------------------------------------------------------
 State Level Read in... 
 ----------------------------------------------------------------
 ****************************************************************
 ****************************************************************/

/* regionid, not sure what this is in the zillow data... does not align correctly. */
proc sql;
	create table state_fips as
		select distinct
			state
		,	statename as regionname
	from sashelp.zipcode
	order by
		regionname
;quit;

proc import file="&data_path.State_MedianValuePerSqft_AllHomes.csv"
            out=state_median_ppsft
            dbms=csv
            replace
            ;
    guessingrows=max;
run;

proc sort data=state_median_ppsft;by regionname;run;
data state_median_ppsft;
	merge state_fips (in=f)
		  state_median_ppsft (in=z)
	;
	by regionname;
	if z;
run;

proc import file="&data_path.State_Zhvi_SingleFamilyResidence.csv"
            out=state_zhvi_singlefamily
            dbms=csv
            replace
            ;
    guessingrows=max;
run;
proc sort data=state_zhvi_singlefamily;by regionname;run;
data state_zhvi_singlefamily;
	merge state_fips (in=f)
		  state_zhvi_singlefamily (in=z)
	;
	by regionname;
	if z;
run;

data state_zhvi_median_ppsft_long;
    set state_median_ppsft (drop=regionid regionname sizerank);

    array n{*} _numeric_;

    length state_code $ 2 month 4;
    format month mmddyy10.;
    state_code=strip(put(state,4.));
    if length(state_code) lt 2 then state_code=cats('0',state_code);

    do i=2 to dim(n);
        month=intnx('month',input(compress(vname(n{i}),,'kd'),yymmn6.),0,'B');
        st_median_ppsft=n{i};
        output;
    end;

    keep state_code month st_median_ppsft;
run;

data state_zhvi_singlefamily_long;
    set state_zhvi_singlefamily (drop=regionid regionname sizerank);

    array n{*} _numeric_;

    length state_code $ 2 month 4;
    format month mmddyy10.;
    state_code=strip(put(state,4.));
    if length(state_code) lt 2 then state_code=cats('0',state_code);

    do i=2 to dim(n);
        month=intnx('month',input(compress(vname(n{i}),,'kd'),yymmn6.),0,'B');
        st_zhvi_sfh=n{i};
        output;
    end;

    keep state_code month st_zhvi_sfh;
run;

proc sort data=state_zhvi_singlefamily_long;by month state_code;run;
proc sort data=state_zhvi_median_ppsft_long;by month state_code;run;

data state_data;
    merge state_zhvi_singlefamily_long state_zhvi_median_ppsft_long;
    by month state_code;
	length asofdate 3;
	asofdate=year(month);
run;

/****************************************************************
 ****************************************************************
 ----------------------------------------------------------------
 National Read in... 
 ----------------------------------------------------------------
 ****************************************************************
 ****************************************************************/

proc import file="&data_path.Metro_Zhvi_SingleFamilyResidence.csv"
            out=national_zhvi_singlefamily
            dbms=csv
            replace
            ;
    guessingrows=max;
run;

proc import file="&data_path.Metro_MedianValuePerSqft_AllHomes.csv"
            out=national_median_ppsft
            dbms=csv
            replace
            ;
    guessingrows=max;
run;

data nat_zhvi_singlefamily_long;
    set national_zhvi_singlefamily (drop=regionid sizerank);
	where regionname='United States';

    array n{*} _numeric_;

    length month 4;
    format month mmddyy10.;

    do i=1 to dim(n);
        month=intnx('month',input(compress(vname(n{i}),,'kd'),yymmn6.),0,'B');
        nat_zhvi_sfh=n{i};
        output;
    end;

    keep month nat_zhvi_sfh;
run;

data nat_zhvi_median_ppsft_long;
    set national_median_ppsft (drop=regionid sizerank);
	where regionname='United States';

    array n{*} _numeric_;

    length month 4;
    format month mmddyy10.;

    do i=1 to dim(n);
        month=intnx('month',input(compress(vname(n{i}),,'kd'),yymmn6.),0,'B');
        nat_median_ppsft=n{i};
        output;
    end;

    keep month nat_median_ppsft;
run;

data national_data;
    merge nat_zhvi_singlefamily_long nat_zhvi_median_ppsft_long;
    by month;
	length asofdate 3;
	asofdate=year(month);
run;

/****************************************************************
 ****************************************************************
 ----------------------------------------------------------------
 Normalize... 
 ----------------------------------------------------------------
 ****************************************************************
 ****************************************************************/

proc means data=county_data noprint nway missing;
	class state_code county_code asofdate;
	var zhvi_sfh median_ppsft;
	output out=county_data_yearly (drop=_type_ _freq_) mean=;
run;

proc means data=state_data noprint nway missing;
	class state_code asofdate;
	var st_zhvi_sfh st_median_ppsft;
	output out=state_data_yearly (drop=_type_ _freq_) mean=;
run;

proc means data=national_data noprint nway missing;
	class asofdate;
	var nat_zhvi_sfh nat_median_ppsft;
	output out=nat_data_yearly (drop=_type_ _freq_) mean=;
run;

data county_data_yearly;
	set county_data_yearly;
	by state_code county_code asofdate;

	retain jan2001_sfh jan2001_ppsft;
	if first.county_code then call missing(jan2001_sfh,jan2001_ppsft);

	if asofdate=2001 then do;
		jan2001_sfh=zhvi_sfh;
		jan2001_ppsft=median_ppsft;
	end;

	if asofdate ge 2001 then do;
		change_zhvi_sfh=zhvi_sfh-jan2001_sfh;
		change_median_ppsft=median_ppsft-jan2001_ppsft;
	end;

	label change_zhvi_sfh='Change from 2001, Zillow Single Family Home Value for County'
		  change_median_ppsft='Change from 2001, Zillow Median Price Per Sqare Foot for County'
		  zhvi_sfh='Zillow Single Family Home Value for County'
		  median_ppsft='Zillow Median Price Per Sqare Foot for County'
	;
	drop jan2001_sfh jan2001_ppsft;
run;

data state_data_yearly;
	set state_data_yearly;
	by state_code asofdate;

	retain jan2001_sfh jan2001_ppsft;
	if first.state_code then call missing(jan2001_sfh,jan2001_ppsft);

	if asofdate=2001 then do;
		jan2001_sfh=st_zhvi_sfh;
		jan2001_ppsft=st_median_ppsft;
	end;

	if asofdate ge 2001 then do;
		change_st_zhvi_sfh=st_zhvi_sfh-jan2001_sfh;
		change_st_median_ppsft=st_median_ppsft-jan2001_ppsft;
	end;

	label change_st_zhvi_sfh='Change from 2001, Zillow Single Family Home Value for State'
		  change_st_median_ppsft='Change from 2001, Zillow Median Price Per Sqare Foot for State'
		  st_zhvi_sfh='Zillow Single Family Home Value for State'
		  st_median_ppsft='Zillow Median Price Per Sqare Foot for State'
	;
	drop jan2001_sfh jan2001_ppsft;
run;

data nat_data_yearly;
	set nat_data_yearly;
	by asofdate;

	retain jan2001_sfh jan2001_ppsft;

	if asofdate=2001 then do;
		jan2001_sfh=nat_zhvi_sfh;
		jan2001_ppsft=nat_median_ppsft;
	end;

	if asofdate ge 2001 then do;
		change_nat_zhvi_sfh=nat_zhvi_sfh-jan2001_sfh;
		change_nat_median_ppsft=nat_median_ppsft-jan2001_ppsft;
	end;

	label change_nat_zhvi_sfh='Change from 2001, Zillow Single Family Home Value for National'
		  change_nat_median_ppsft='Change from 2001, Zillow Median Price Per Sqare Foot for National'
		  nat_zhvi_sfh='Zillow Single Family Home Value for National'
		  nat_median_ppsft='Zillow Median Price Per Sqare Foot for National'
	;
	drop jan2001_sfh jan2001_ppsft;
run;

proc sort data=county_data_yearly;by state_code asofdate;
proc sort data=state_data_yearly;by state_code asofdate;

data zillow_data;
	merge county_data_yearly state_data_yearly;
	by state_code asofdate;
run;

proc sort data=zillow_data;by asofdate;run;
proc sort data=nat_data_yearly;by asofdate;run;

data zillow_data;
	merge zillow_data nat_data_yearly;
	by asofdate;
run;

proc sort data=zillow_data out=sasdata.zillow_data;by state_code county_code asofdate;run;
	

