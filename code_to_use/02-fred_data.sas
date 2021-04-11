
proc import file="&data_path.national_values.csv"
            out=fred_national
            dbms=csv
            replace
            ;
    guessingrows=max;
run;

/* string=search from the ID variable
   out=output dataset
   label=variable label
*/
%macro national_format(string=,out=,label=);
data &out.;
	length asofdate 3;
	set fred_national;
	where id=&string. and status_code=200;

	asofdate=year(date);

	/* if not in yearly, we need to aggregate */
	lag_date=lag(date);
	if _n_=2 then do;
		if intck('year',lag_date,date) ne 1 then call symputx('aggregate','YES');
		else call symputx('aggregate','NO');
	end;

	drop id;
run;

proc means data=&out. noprint nway missing;
	class asofdate;
	var value;
	output out=&out. (drop=_type_ _freq_) mean=;
run;

proc sort data=&out.;by asofdate;run;

data &out.;
	set &out.;
	by asofdate;

	retain jan2001_value;

	if asofdate=2001 then jan2001_value=value;

	if asofdate ge 2001 then do;
		&out._nat_200101_chg=value-jan2001_value;
		/* used to force everything to 2001 dollar. */
		&out._nat_200101_pct=divide(value,jan2001_value);
	end;

	&out=value;

	label &out.="&label."
	      &out._nat_200101_chg="Change from 2001, &label."
		  &out._nat_200101_pct="Ratio from 2001, &label."
	;

	keep asofdate &out. &out._nat_200101_chg &out._nat_200101_pct;
run;

%mend national_format;

/* CPIHOSSL, Consumer Price Index for All Urban Consumers:Housing */
%national_format(string='CPIHOSSL',out=cpihossl,label=%str(Consumer Price Index for All Urban Consumers:Housing));
/* CUUR0000SEHA, Consumer Price Index for All Urban Consumers: Rent of primary residence */
%national_format(string='CUUR0000SEHA',out=cuur0000seha,label=%str(Consumer Price Index for All Urban Consumers: Rent of primary residence));
/* CPIAUCSL, Consumer Price Index for All Urban Consumers: All Items */
%national_format(string='CPIAUCSL',out=cpiaucsl,label=%str(Consumer Price Index for All Urban Consumers: All Items));
/* A792RC0A052NBEA, Consumer Price Index for All Urban Consumers: All Items */
%national_format(string='A792RC0A052NBEA',out=a792rc0a052nbea,label=%str(United States: Personal Income Per Capita));
/* USSTHPI, All-Transactions House Price Index for the United States */
%national_format(string='USSTHPI',out=ussthpi,label=%str(All-Transactions House Price Index for the United States));
/* USRVAC, Rental Vacancy Rate for the United States */
%national_format(string='USRVAC',out=usrvac,label=%str(Rental Vacancy Rate for the United States));
/* USHOWN, Homeownership Rate for the United States */
%national_format(string='USHOWN',out=ushown,label=%str(Homeownership Rate for the United States));
/* PEAAUS00000A647NCEN, Estimate of People of All Ages in Poverty in the United States */
%national_format(string='PEAAUS00000A647NCEN',out=peaaus,label=%str(Estimate of People of All Ages in Poverty in the United States));
/* PUAAUS00000A647NCEN, Poverty Universe, All Ages for United States */
%national_format(string='PUAAUS00000A647NCEN',out=puaaus,label=%str(Poverty Universe, All Ages for United States));
/* UNRATENSA, Civilian Unemployment Rate for United States */
%national_format(string='UNRATENSA',out=unratensa,label=%str(Civilian Unemployment Rate for United States));
/* MEHOINUSA646N, Median Household Income in the United States */
%national_format(string='MEHOINUSA646N',out=mehoinusa646n,label=%str(Median Household Income in the United States));

data fred_national_values;
	merge cpihossl
		  cuur0000seha
		  cpiaucsl
		  a792rc0a052nbea
		  ussthpi
		  usrvac
		  ushown
		  peaaus
		  puaaus
		  unratensa
		  mehoinusa646n
	;
	by asofdate;
run;

proc import file="&data_path.fred_state.csv"
            out=fred_state
            dbms=csv
            replace
            ;
    guessingrows=max;
run;

/* so we can associate state to abbreviation */
proc sql;
	create table state_abrev as
		select distinct
			put(state,z2.) as state
		,	statecode
	from sashelp.zipcode
	order by
		statecode
;quit;

/* string=search from the ID variable
   start=start position of string
   stop=stop position of string
   out=output dataset
   start_st=start of state abreviation
   label=variable label
   cpi_adj=adjust for national level cpi on the dollars
*/
%macro state_format(string=,start=,stop=,out=,start_st=,label=,cpi_adj=N);
data &out.;
	length state state_code statecode $ 2 asofdate 3;
	if _n_=1 then do;
		declare hash st_abrev(dataset:'state_abrev');
			st_abrev.definekey('statecode');
			st_abrev.definedata('state');
			st_abrev.definedone();
		call missing(statecode,state);
	end;
	set fred_state;
	where substr(id,&start.,&stop.)=&string. and status_code=200;
	rc=st_abrev.find(key:substr(id,&start_st.,2));
	state_code=state;

	asofdate=year(date);

	/* if not in yearly, we need to aggregate */
	lag_date=lag(date);
	if _n_=2 then do;
		if intck('year',lag_date,date) ne 1 then call symputx('aggregate','YES');
		else call symputx('aggregate','NO');
	end;

	drop state statecode rc status_code id;
run;

%if &aggregate.=YES %then %do;
	proc means data=&out. noprint nway missing;
		class state_code asofdate;
		var value;
		output out=&out. (drop=_type_ _freq_) mean=;
	run;
%end;

%if &cpi_adj.=Y %then %do;
	proc sort data=&out.;by asofdate state_code;run;
	data &out.;
		merge &out. (in=o)
			  fred_national_values (keep=asofdate cpiaucsl_nat_200101_pct)
		;
		by asofdate;
		if o;
	run;
%end;	

proc sort data=&out.;by state_code asofdate;run;

data &out.;
	set &out.;
	by state_code asofdate;

	retain jan2001_value jan2001_value_adj;
	if first.state_code then call missing(jan2001_value,jan2001_value_adj);

	if asofdate=2001 then jan2001_value=value;

	if asofdate ge 2001 then do;
		&out._200101_chg=value-jan2001_value;
		&out._200101_pct=divide(value,jan2001_value);
	end;

	&out=value;

%if &cpi_adj.=Y %then %do;
	&out._adj=value*cpiaucsl_nat_200101_pct;
	if asofdate=2001 then jan2001_value_adj=&out._adj;

	if asofdate ge 2001 then &out._200101_cpi=&out._adj-jan2001_value_adj;

	label &out.="&label."
		  &out._adj="CPI Adjusted for 2001, &label."
	      &out._200101_chg="Change from 2001, &label."
		  &out._200101_pct="Ratio from 2001, &label."
		  &out._200101_cpi="Change from 2001 CPI Adjusted, &label."
	;

	keep state_code asofdate &out. &out._200101_chg &out._200101_pct &out._adj &out._200101_cpi;

%end;
%else %if &out.=st_hpi %then %do;
	state_hpi_growth=divide(value,jan2001_value);
	label &out.="&label."
	      &out._200101_chg="Change from 2001, &label."
		  &out._200101_pct="Ratio from 2001, &label."
		  state_hpi_growth="Change from 2001 HPI Adjusted, &label."
	;
	keep state_code asofdate &out. &out._200101_chg &out._200101_pct state_hpi_growth;
%end;
%else %do;
	label &out.="&label."
	      &out._200101_chg="Change from 2001, &label."
		  &out._200101_pct="Ratio from 2001, &label."
	;

	keep state_code asofdate &out. &out._200101_chg &out._200101_pct;
%end;
run;

%mend state_format;

/*AL+'OTOT', Total Personal Income for State*/
%state_format(string='OTOT',start=3,stop=4,out=st_otot,start_st=1,label=%str(Total Personal Income for State),cpi_adj=Y);
/*'AL'+STHPI, HPI Index for State*/
%state_format(string='STHPI',start=3,stop=5,out=st_hpi,start_st=1,label=%str(HPI Index for State));
/* BR+'01'+'000'+'AL'+A647NCEN, Snap Benefits for State */
%state_format(string='BR',start=1,stop=2,out=st_snap,start_st=8,label=%str(Snap Benefits for State));
/* 'AL'+RVAC, Rental Vacancy Rate for State */
%state_format(string='RVAC',start=3,stop=4,out=st_rent_vac,start_st=1,label=%str(Rental Vacancy Rate for State));
/* 'AL'+HOWN, Home Ownership Rates for State */
%state_format(string='HOWN',start=3,stop=4,out=st_own_rate,start_st=1,label=%str(Home Ownership Rates for State));
/* PEAA+'AL'+'01'+000A647NCEN, Poverty All Ages for State */
%state_format(string='PEAA',start=1,stop=4,out=st_pov_all,start_st=5,label=%str(Poverty All Ages for State));
/* PUAA+'AL'+'01'+000A647NCEN, Total People Used for Poverty Universe All Ages for State */
%state_format(string='PUAA',start=1,stop=4,out=st_pov_pp,start_st=5,label=%str(Total People Used for Poverty Universe All Ages for State));
/* 'AL'+URN, Unemployment for State */
%state_format(string='URN',start=3,stop=3,out=st_ruc,start_st=1,label=%str(Unemployment for State));
/* MHI+'AL'+'01'+000A052NCEN, Median Household Income for State */
%state_format(string='MHI',start=1,stop=3,out=st_mhhi,start_st=4,label=%str(Median Household Income for State),cpi_adj=Y);
/* PUA0T17+'AL'+'01'+000A647NCEN, Poverty Age 0-17 for State */
%state_format(string='PUA0T17',start=1,stop=7,out=st_pov_0_17,start_st=8,label=%str(Poverty Age 0-17 for State));
/* PE5T17+'01'+'AL'+000A647NCEN, Poverty Age 5-17 for State */
%state_format(string='PE5T17',start=1,stop=6,out=st_pov_5_17,start_st=7,label=%str(Poverty Age 5-17 for State));

data fred_state_values;
	merge st_otot
		  st_hpi
		  st_snap
		  st_rent_vac
		  st_own_rate
		  st_pov_all
		  st_pov_pp
		  st_ruc
		  st_mhhi
		  st_pov_0_17
		  st_pov_5_17
	;
	by state_code asofdate;
run;

%macro county_format(csv=,out=,start_st=,start_county=,label=,cpi_adj=N);

proc import file="&data_path.&csv..csv"
            out=&out.
            dbms=csv
            replace
            ;
    guessingrows=max;
run;

data &out.;
    length asofdate 3 state_code $ 2 county_code $ 3;
	set &out.;
	where status_code=200;

	state_code=substr(id,&start_st.,2);
	county_code=substr(id,&start_county.,3);
	asofdate=year(date);

	/* if not in yearly, we need to aggregate */
	lag_date=lag(date);
	if _n_=2 then do;
		if intck('year',lag_date,date) ne 1 then call symputx('aggregate','YES');
		else call symputx('aggregate','NO');
	end;
run;

%if &aggregate.=YES %then %do;
	proc means data=&out. noprint nway missing;
		class state_code county_code asofdate;
		var value;
		output out=&out. (drop=_type_ _freq_) mean=;
	run;
%end;

%if &cpi_adj.=Y %then %do;
	proc sort data=&out.;by asofdate state_code county_code;run;
	data &out.;
		merge &out. (in=o)
			  fred_national_values (keep=asofdate cpiaucsl_nat_200101_pct)
		;
		by asofdate;
		if o;
	run;
%end;	

proc sort data=&out.;by state_code county_code asofdate;run;	

data &out.;
	set &out.;
	by state_code county_code asofdate;

	retain jan2001_value jan2001_value_adj;
	if first.county_code then call missing(jan2001_value,jan2001_value_adj);

	if asofdate=2001 then jan2001_value=value;

	if asofdate ge 2001 then &out._county_200101_chg=value-jan2001_value;

	&out=value;

%if &cpi_adj.=Y %then %do;
	&out._adj=value*cpiaucsl_nat_200101_pct;
	if asofdate=2001 then jan2001_value_adj=&out._adj;

	if asofdate ge 2001 then &out._county_200101_cpi=&out._adj-jan2001_value_adj;

	label &out.="&label."
		  &out._adj="CPI Adjusted for 2001, &label."
	      &out._county_200101_chg="Change from 2001, &label."
		  &out._county_200101_cpi="Change from 2001 CPI Adjusted, &label."
	;

	keep state_code county_code asofdate &out. &out._county_200101_chg &out._adj &out._county_200101_cpi;

%end;
%else %if &out.=hpi %then %do;
	county_hpi_growth=divide(value,jan2001_value);
	label &out.="&label."
	      &out._county_200101_chg="Change from 2001, &label."
		  county_hpi_growth="Change from 2001 HPI Adjusted, &label."
	;
	keep state_code county_code asofdate &out. &out._county_200101_chg county_hpi_growth;
%end;
%else %do;
	label &out.="&label."
	      &out._county_200101_chg="Change from 2001, &label."
	;

	keep state_code county_code asofdate &out. &out._county_200101_chg;
%end;
run;

%mend county_format;

/*PCPI+'01001', Per Capita Personal Income for County */
%county_format(csv=pcpi_county_values,out=pcpi,start_st=5,start_county=7,label=%str(Per Capita Personal Income for County),cpi_adj=Y);
/*PI+'01001', Personal Income for County */
%county_format(csv=pi_county_values,out=pi,start_st=3,start_county=5,label=%str(Personal Income for County),cpi_adj=Y);
/*EQFXSUBPRIME0+'01001', Equifax Subprime Credit */
%county_format(csv=equifax_county_values,out=equifax,start_st=14,start_county=16,label=%str(Equifax Subprime Credit));
/* ATNHPIUS+'01001'+A, HPI Index */
%county_format(csv=hpi_county_values,out=hpi,start_st=9,start_county=11,label=%str(HPI for County));
/* PEAA+'AL'+'01001'+A647NCEN, Povery All Ages for County */
%county_format(csv=peaa_county_values,out=peaa,start_st=7,start_county=9,label=%str(Povery All Ages for County));
/* PUAA+'AL'+'01001'+A647NCEN, Total People Used for Poverty Universe All Ages for County */
%county_format(csv=puaa_county_values,out=puaa,start_st=7,start_county=9,label=%str(Total People Used for Poverty Universe All Ages for County));
/* MHI+'AL'+'01001'+A052NCEN, Median Household Income for County */
%county_format(csv=mhi_county_values,out=mhi,start_st=6,start_county=8,label=%str(Median Household Income for County),cpi_adj=Y);
/* LAUCN+'01001'+0000000003A, Unemployment for County */
%county_format(csv=ruc_county_values,out=ruc,start_st=6,start_county=8,label=%str(Unemployment for County));
/* PUA0T17+'AL'+'01001'+A647NCEN, Poverty Age 0-17 for County */
%county_format(csv=pua0t17_county_values,out=pua0t17,start_st=10,start_county=12,label=%str(Poverty Age 0-17 for County));
/* PUA5T17R+'AL'+'01001'+A647NCEN, Poverty Age 5-17 for County */
%county_format(csv=pua5t17_county_values,out=pua5t17,start_st=11,start_county=13,label=%str(Poverty Age 5-17 for County));
/* CBR+'01001'+'AL'+A647NCEN, Snap Benefits for County */
%county_format(csv=snap_county_values,out=snap,start_st=4,start_county=6,label=%str(Snap Benefits for County));

data fred_county_values;
	merge pcpi
		  pi
		  equifax
		  hpi
		  peaa
		  puaa
		  mhi
		  ruc
		  pua0t17
		  pua5t17
		  snap
		  ;
	by state_code county_code asofdate;

	equifax_population=divide(equifax,100)*puaa;


	retain jan2001_value;
	if first.county_code then call missing(jan2001_value);
	if asofdate=2001 then jan2001_value=equifax_population;
	if asofdate ge 2001 then equifax_county_change=equifax_population-jan2001_value;

	label equifax_population='Equifax Subprime Credit % muliplied by PUAA County Population'
		  equifax_county_change='Change from 2001, Equifax Subprime Population'
	;
	drop jan2001_value;
run;

proc sort data=fred_county_values;by state_code asofdate county_code;run;

data fred_data;
	merge fred_county_values
		  fred_state_values
	;
	by state_code asofdate;

	spread_equifax_population=divide(equifax_county_change,st_pov_pp_200101_chg);
	label spread_equifax_population='Equifax Subprime Population Change for County divided by Change for Total Population of State, 2001=0';

run;

proc sort data=fred_data;by state_code county_code asofdate;run;

proc sort data=fred_data;by asofdate state_code county_code;run;
data fred_data;
	merge fred_data (in=a) 
		  fred_national_values
	;
	by asofdate;
	if a;

	/* Rental Vacancy Spread between State and National */
	spread_st_rent_vac=st_rent_vac-usrvac;
	spread_st_own_rate=st_own_rate-ushown;

	/* Poverty Rates, Change from County / Change from State */
	spread_peaa=peaa_county_200101_chg-st_pov_all_200101_chg;
	spread_pua0t17=pua0t17_county_200101_chg-st_pov_0_17_200101_chg;
	spread_pua5t17=pua5t17_county_200101_chg-st_pov_5_17_200101_chg;
	spread_snap_benefits=snap_county_200101_chg-st_snap_200101_chg;

/*	divide_peaa=divide(peaa_county_200101_chg,st_pov_all_200101_chg);*/
/*	divide_pua0t17=divide(pua0t17_county_200101_chg,st_pov_0_17_200101_chg);*/
/*	divide_pua5t17=divide(pua5t17_county_200101_chg,st_pov_5_17_200101_chg);*/
/*	divide_snap_benefits=divide(snap_county_200101_chg,st_snap_200101_chg);*/

	/* Spread for CPI adjusted Median House Hold Income from County to State */
	spread_mhhi=mhi_county_200101_cpi-st_mhhi_200101_cpi;

	/* Spread for RUC Change in County to RUC Change in State */
	spread_ruc=ruc_county_200101_chg-st_ruc_200101_chg;
	/* Spread for Population */
	spread_population=puaa_county_200101_chg-st_pov_pp_200101_chg;

	label spread_st_rent_vac='Rental Vacancy Rate Spread between State and Nation, 2001=0'
		  spread_st_own_rate='Home Ownership Rate Spread between State and Nation, 2001=0'
		  spread_peaa='All Poverty Ratio Spread between Change in County and Change in State, 2001=0'
		  spread_pua0t17='Poverty 0 to 17 Ratio Spread between Change in County and Change in State, 2001=0'
		  spread_pua5t17='Poverty 5 to 17 Ratio Spread between Change in County and Change in State, 2001=0'
		  spread_snap_benefits='Snap Benefits Ratio Spread between Change in County and Change in State, 2001=0'
		  spread_mhhi='Median House Hold Income (CPI Adjusted) Spread between Change in County and Change in State, 2001=0'
		  spread_ruc='RUC Spread between Change in County and Change in State, 2001=0'
		  spread_population='PUAA (Population) Spread between Change in County and Change in State, 2001=0'
	;

run;

proc sort data=fred_data out=sasdata.fred_data;by state_code county_code asofdate;run;

