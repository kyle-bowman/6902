
libname sasdata "&sasdata.";

/* location:
https://www2.census.gov/econ/bps/County/
Files - c02001a.txt - co2017a.txt 
*/
data sasdata.county_permits;
	infile "&data_path.all_county_permits.txt" firstobs=1 dlm=',' dsd linesize=5000 missover;
	length date 6 state_code $ 2 county_code $ 3 code code2 $ 1 county_name $ 200
		   unit_1_bldgs unit_1_units unit_1_value unit_2_bldgs unit_2_units unit_2_value unit_34_bldgs unit_34_units unit_34_value unit_5_bldgs 
		   unit_5_units unit_5_value
		   r_unit_1_bldgs r_unit_1_units r_unit_1_value r_unit_2_bldgs r_unit_2_units r_unit_2_value r_unit_34_bldgs r_unit_34_units 
		   r_unit_34_value r_unit_5_bldgs r_unit_5_units r_unit_5_value 8
	;
	input date state_code county_code code code2 county_name unit_1_bldgs unit_1_units unit_1_value 
		  unit_2_bldgs unit_2_units unit_2_value unit_34_bldgs unit_34_units unit_34_value unit_5_bldgs unit_5_units 
		  unit_5_value r_unit_1_bldgs r_unit_1_units r_unit_1_value r_unit_2_bldgs r_unit_2_units r_unit_2_value 
		  r_unit_34_bldgs r_unit_34_units r_unit_34_value 
		  r_unit_5_bldgs r_unit_5_units r_unit_5_value 
	;
run;

/* location:
https://www2.census.gov/econ/bps/State/
st2000a.txt - st2017a.txt

Survey,FIPS,Region,Division,State,,1-unit,,,2-units,,,3-4 units,,,5+ units,,,1-unit rep,,,2-units rep,,,3-4 units rep       ,,,5+ units rep
Date,State,Code,Code,Name,Bldgs,Units,Value,Bldgs,Units,Value,Bldgs,Units,Value,      Bldgs,Units,Value,Bldgs,Units,Value,Bldgs,Units,Value,      Bldgs,Units,Value,Bldgs,Units,Value
*/

data sasdata.state_permits;
	infile "&data_path.all_state_permits.txt" firstobs=1 dlm=',' dsd linesize=5000 missover;
	length date 6 state_code $ 2 region $ 1 division $ 1 state_name $ 20 
		   unit_1_bldgs unit_1_units unit_1_value unit_2_bldgs unit_2_units unit_2_value unit_34_bldgs unit_34_units unit_34_value unit_5_bldgs 
		   unit_5_units unit_5_value
		   r_unit_1_bldgs r_unit_1_units r_unit_1_value r_unit_2_bldgs r_unit_2_units r_unit_2_value r_unit_34_bldgs r_unit_34_units 
		   r_unit_34_value r_unit_5_bldgs r_unit_5_units r_unit_5_value 8
	;
	input date state_code region division state_name 
		  unit_1_bldgs unit_1_units unit_1_value unit_2_bldgs unit_2_units unit_2_value unit_34_bldgs unit_34_units unit_34_value unit_5_bldgs 
		  unit_5_units unit_5_value
		  r_unit_1_bldgs r_unit_1_units r_unit_1_value r_unit_2_bldgs r_unit_2_units r_unit_2_value r_unit_34_bldgs r_unit_34_units 
		  r_unit_34_value r_unit_5_bldgs r_unit_5_units r_unit_5_value
	;
run;

data county_permits;
	set sasdata.county_permits;
	bldg_perm_1_4=sum(unit_1_bldgs,unit_2_bldgs,unit_34_bldgs);
	bldg_perm_5plus=unit_5_bldgs;
	length asofdate 3;
	asofdate=date;
	keep asofdate state_code county_code bldg_perm_1_4 bldg_perm_5plus;
run;

proc sort data=county_permits;by state_code county_code asofdate;run;

data county_permits;
	set county_permits;
	by state_code county_code asofdate;

	retain jan2001_value_34 jan2001_value_5;
	if first.county_code then call missing(jan2001_value_34,jan2001_value_5);

	if asofdate=2001 then do;
		jan2001_value_34=bldg_perm_1_4;
		jan2001_value_5=bldg_perm_5plus;
	end;

	if asofdate ge 2001 then do;
		change_bldg_perm_1_4=bldg_perm_1_4-jan2001_value_34;
		change_bldg_perm_5plus=bldg_perm_5plus-jan2001_value_5;
	end;

	label change_bldg_perm_1_4='Change from 2001, Building Permits 1-4 Units for County'
		  change_bldg_perm_5plus='Change from 2001, Building Permits 5+ Units for County'
		  bldg_perm_1_4='Building Permits 1-4 Units for County'
		  bldg_perm_5plus='Building Permits 5+ Units for County'
	;

	drop jan2001_value_34 jan2001_value_5;
run;

data state_permits;
	set sasdata.state_permits;
	where anyalpha(state_code)=0;
	st_bldg_perm_1_4=sum(unit_1_bldgs,unit_2_bldgs,unit_34_bldgs);
	st_bldg_perm_5plus=unit_5_bldgs;
	length asofdate 3;
	asofdate=input(substr(strip(put(date,8.)),1,4),$4.);
	keep asofdate state_code st_bldg_perm_1_4 st_bldg_perm_5plus;
run;

proc sort data=state_permits;by state_code asofdate;run;

data state_permits;
	set state_permits;
	by state_code asofdate;

	retain jan2001_value_34 jan2001_value_5;
	if first.state_code then call missing(jan2001_value_34,jan2001_value_5);

	if asofdate=2001 then do;
		jan2001_value_34=st_bldg_perm_1_4;
		jan2001_value_5=st_bldg_perm_5plus;
	end;

	if asofdate ge 2001 then do;
		change_st_bldg_perm_1_4=st_bldg_perm_1_4-jan2001_value_34;
		change_st_bldg_perm_5plus=st_bldg_perm_5plus-jan2001_value_5;
	end;

	label change_st_bldg_perm_1_4='Change from 2001, Building Permits 1-4 Units for State'
		  change_st_bldg_perm_5plus='Change from 2001, Building Permits 5+ Units for State'
		  st_bldg_perm_1_4='Building Permits 1-4 Units for State'
		  st_bldg_perm_5plus='Building Permits 5+ Units for State'
	;

	drop jan2001_value_34 jan2001_value_5;
run;

data national_permits;
	set sasdata.state_permits;
	where state_code='US';
	nat_bldg_perm_1_4=sum(unit_1_bldgs,unit_2_bldgs,unit_34_bldgs);
	nat_bldg_perm_5plus=unit_5_bldgs;
	length asofdate 3;
	asofdate=input(substr(strip(put(date,8.)),1,4),$4.);
	keep asofdate nat_bldg_perm_1_4 nat_bldg_perm_5plus;
run;

data national_permits;
	set national_permits;
	by asofdate;

	retain jan2001_value_34 jan2001_value_5;

	if asofdate=2001 then do;
		jan2001_value_34=nat_bldg_perm_1_4;
		jan2001_value_5=nat_bldg_perm_5plus;
	end;

	if asofdate ge 2001 then do;
		change_nat_bldg_perm_1_4=nat_bldg_perm_1_4-jan2001_value_34;
		change_nat_bldg_perm_5plus=nat_bldg_perm_5plus-jan2001_value_5;
	end;

	label change_nat_bldg_perm_1_4='Change from 2001, Building Permits 1-4 Units for National'
		  change_nat_bldg_perm_5plus='Change from 2001, Building Permits 5+ Units for National'
		  nat_bldg_perm_1_4='Building Permits 1-4 Units for National'
		  nat_bldg_perm_5plus='Building Permits 5+ Units for National'
	;

	drop jan2001_value_34 jan2001_value_5;
run;

proc sort data=county_permits;by asofdate state_code;run;
proc sort data=state_permits;by asofdate state_code;run;

data building_permits;
	merge county_permits state_permits;
	where asofdate ge 2001;
	by asofdate state_code;
run;

proc sort data=building_permits;by state_code county_code asofdate;run;

data building_permits;
	set building_permits;
	by state_code county_code asofdate;

	/* Building Permits Spread */
	spread_1_to_4_units=divide(change_bldg_perm_1_4,change_st_bldg_perm_1_4);
	spread_5plus_units=divide(change_bldg_perm_5plus,change_st_bldg_perm_5plus);

	label spread_1_to_4_units='Building Permits 1 to 4 Units Spread between State and County, 2001=0'
		  spread_5plus_units='Building Permits 5 Plus Units Spread between State and County, 2001=0'
	;
run;

proc sort data=building_permits;by asofdate;run;

data building_permits;
	length state_code $ 2 county_code $ 3 asofdate 3;
	merge building_permits national_permits;
	where asofdate ge 2001;
	by asofdate;
run;

proc sort data=building_permits out=sasdata.building_permits;by state_code county_code asofdate;run;
