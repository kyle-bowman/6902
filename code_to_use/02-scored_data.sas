
%let target=subprime_institution;
%let target=subprime_use;
%let target=test_subprime;

proc freq data=sasdata.originations_model_random;
	where not missing(state_code) and not missing(county_code);
	table asofdate*&target. / out=table1;
	table asofdate*&target.*hud_subprime*hmda_high_price / out=table1a;
run;

proc means data=sasdata.originations_model_random noprint nway missing;
	class asofdate;
	var spread_equifax_population spread_ruc spread_1_to_4_units spread_population spread_median_ppsft_hpiadj;
	output out=table2 mean=
					  std=
					  p10=
					  median=
					  p90= / autoname;
run;

proc transpose data=table2 (drop=_type_ _freq_) out=table2a;
	id asofdate;
	var _numeric_;
run;

proc freq data=sasdata.originations_model_random noprint;
	where not missing(state_code) and not missing(county_code);
	table sold_to_slim / out=sold_to_slim (drop=percent);
	table purpose / out=purpose (drop=percent);
	table race_2 / out=race_2 (drop=percent);
	table sex / out=sex (drop=percent);
	table preapproval / out=preapproval (drop=percent);
	table lien / out=lien (drop=percent);
	table bin_income_spread / out=bin_income_spread (drop=percent);

/*	table &target.*(sold_to_slim purpose race_2 sex preapproval lien bin_income_spread) / out=table2c;*/
run;

proc freq data=sasdata.originations_model_random noprint;
	where &target.=1 and not missing(state_code) and not missing(county_code);
	table sold_to_slim / out=sold_to_slim_target (rename=(count=target) drop=percent);
	table purpose / out=purpose_target (rename=(count=target) drop=percent);
	table race_2 / out=race_2_target (rename=(count=target) drop=percent);
	table sex / out=sex_target (rename=(count=target) drop=percent);
	table preapproval / out=preapproval_target (rename=(count=target) drop=percent);
	table lien / out=lien_target (rename=(count=target) drop=percent);
	table bin_income_spread / out=bin_income_spread_target (rename=(count=target) drop=percent);
run;

data sold_to_slim;
	merge sold_to_slim sold_to_slim_target;
	by sold_to_slim;
run;

data purpose;
	merge purpose purpose_target;
	by purpose;
run;

data race_2;
	merge race_2 race_2_target;
	by race_2;
run;
data sex;
	merge sex sex_target;
	by sex;
run;
data preapproval;
	merge preapproval preapproval_target;
	by preapproval;
run;
data lien;
	merge lien lien_target;
	by lien;
run;
data bin_income_spread;
	merge bin_income_spread bin_income_spread_target;
	by bin_income_spread;
run;

data test_data;
	set sasdata.originations_model_random;
	where asofdate between 2004 and 2007 /*and &target.=1*/
		and not missing(state_code)
		and not missing(county_code)
	;

	if institution_name in (
/* subprime_use population */
'WORLD SAVINGS BANK (GOLDEN WEST)',
'WASHINGTON MUTUAL',
'INDYMAC',
'DELTA FUNDING CORPORATION',
/* additions */
'COUNTRYWIDE HOME LOANS'
/*'NATIONAL CITY BANK',*/
/*'NEW CENTURY MORTGAGE CORP',*/
/*'OPTION ONE MORTGAGE CORP',*/
/*'WELLS FARGO FINL',*/
/*'AMERICAN HOME MORTGAGE',*/
/*'AMERIQUEST MORTGAGE COMPANY'*/
) then test_subprime=1;
else test_subprime=0;
run;

data sub_investors;
	set sasdata.originations_model_random;
/*	set test_data;*/
	where asofdate between 2004 and 2007 and &target.=1
		and not missing(state_code)
		and not missing(county_code)
	;
run;

proc contents data=sub_investors noprint out=inst_counts (keep=nobs);run;

data _null_;
	set inst_counts (obs=1);
	call symputx('build_pop',floor(nobs*0.7));
	call symputx('valid_pop',floor(nobs*0.3));
run;

data build_subprime;
	set 
		sub_investors (where=(random le 0.6))
		sasdata.originations_model_random (where=(&target.=0 and random le 0.6 and not missing(state_code) and not missing(county_code)) obs=&build_pop.)
/*		test_data (where=(&target.=0 and random le 0.6 and not missing(state_code) and not missing(county_code)) obs=&build_pop.)*/
	;
run;

data validate_subprime;
	set 
		sub_investors (where=(random gt 0.6))
		sasdata.originations_model_random (where=(&target.=0 and random gt 0.6 and not missing(state_code) and not missing(county_code)) obs=%eval(&valid_pop.))
/*		test_data (where=(&target.=0 and random gt 0.6 and not missing(state_code) and not missing(county_code)) obs=%eval(&valid_pop.))*/
	;
run;

proc sort data=build_subprime;by sort;run;
proc sort data=validate_subprime;by sort;run;

proc means data=build_subprime;
	var spread_population spread_1_to_4_units spread_ruc spread_equifax_population spread_median_ppsft_hpiadj;
run;

proc logistic data=build_subprime missing outmodel=sasdata.stored_model;
    class purpose 
		  race_2
		  sex
          preapproval 
          lien 
          bin_loan 
          bin_income_spread 
		  state_code
		  sold_to_slim
    ;
    model &target.(event='1')=
		sold_to_slim
		purpose
        race_2
		sex
		preapproval
        lien
		bin_income_spread
		/ rsquare stb expb parmlabel firth lackfit
	;
	output out=model_fit_score predicted=pred;
	score data=validate_subprime out=scored fitstat;
	contrast 'GSE vs HFI' sold_to_slim 0 1 -1 0 0  / estimate=all; 
 	contrast 'Commercial Bank vs HFI' sold_to_slim 1 0 -1 0 0  / estimate=all; 
 	contrast 'Ins/Mort Bank vs HFI' sold_to_slim 0 0 -1 1 0  / estimate=all; 
 	contrast 'Other vs HFI' sold_to_slim 0 0 -1 0 1  / estimate=all; 
/* 	contrast 'Private Sec vs HFI' sold_to_slim 0 0 -1 0 0 1 / estimate=all; */
	contrast 'Purch vs Refi' purpose -1 / estimate=all;
	contrast 'Approved vs Not Approved' preapproval 1 -1 / estimate=all;
/*	contrast 'Approved vs N/A' preapproval 1 0 -1 / estimate=all;*/

run;


proc freq data=sasdata.originations_model_random noprint;
	where not missing(state_code) and not missing(county_code);
	table &target. / out=priors (rename=(count=_prior_) keep=&target. count);
run;

proc logistic inmodel=sasdata.stored_model;
	score data=sasdata.originations_model (where=(/*asofdate gt 2007 and */not missing(state_code) and not missing(county_code)))
/*		  prior=priors*/
		  out=sasdata.scored_model_no_prior
	;
run;
ods listing;
proc freq data=sasdata.scored_model_no_prior;
	table asofdate*i_test_subprime / norow nocol nopercent nocum;
run;

data sasdata.scored_model_p40;
	set sasdata.scored_model;
/*	where asofdate ge 2008;*/
	new_subprime=(p_1 gt 0.4);
run;

proc means data=sasdata.scored_model_p40 noprint nway missing;
	where state_code is not null and county_code is not null;
	class asofdate state_abrev county_code purpose 
		  race_2
		  sex
          preapproval 
          lien 
          bin_loan 
          bin_income_spread 
		  state_code
		  sold_to_slim institution_name /*&target. i_&target. f_&target.*/ new_subprime;
	var asofdate;
	output out=aggregate_institution n(asofdate)=count;
run;

data aggregate_institution_2;
	merge aggregate_institution (drop=_type_ rename=(count=non_subprime) where=(new_subprime=0))
		  aggregate_institution (drop=_type_ rename=(count=subprime) where=(new_subprime=1))
	;
	by asofdate state_abrev county_code purpose 
		  race_2
		  sex
          preapproval 
          lien 
          bin_loan 
          bin_income_spread 
		  state_code
		  sold_to_slim institution_name;

	non_subprime=coalesce(non_subprime,0);
	subprime=coalesce(subprime,0);
	total=sum(non_subprime,subprime);
	ratio=divide(subprime,total);
	drop new_subprime;
run;

/* top county */
proc means data=aggregate_institution_2 noprint nway missing;
	where asofdate ge 2008;
	class state_code;
	var subprime non_subprime total;
	output out=state_predict sum=;
run;
proc sort data=state_predict;by descending subprime;run;

proc means data=aggregate_institution_2 noprint nway missing;
	where asofdate ge 2008;
	class institution_name;
	var subprime non_subprime total;
	output out=institution_predict sum=;
run;
proc sort data=institution_predict;by descending subprime;run;

proc means data=aggregate_institution_2 noprint nway missing;
	where asofdate ge 2008;
	class sold_to_slim;
	var subprime non_subprime total;
	output out=sold_to_predict sum=;
run;
proc sort data=sold_to_predict;by descending subprime;run;

proc means data=aggregate_institution_2 noprint nway missing;
	where asofdate ge 2008;
	class asofdate;
	var subprime non_subprime total;
	output out=time_predict sum=;
run;


proc freq data=sasdata.scored_model_p40 noprint;
	where not missing(state_code) and not missing(county_code) and asofdate between 2008 and 2016;
	table sold_to_slim / out=score_sold_to_slim (drop=percent);
	table purpose / out=score_purpose (drop=percent);
	table race_2 / out=score_race_2 (drop=percent);
	table sex / out=score_sex (drop=percent);
	table preapproval / out=score_preapproval (drop=percent);
	table lien / out=score_lien (drop=percent);
	table bin_income_spread / out=score_bin_income_spread (drop=percent);

/*	table &target.*(sold_to_slim purpose race_2 sex preapproval lien bin_income_spread) / out=table2c;*/
run;

proc freq data=sasdata.scored_model_p40 noprint;
	where new_subprime=1 and not missing(state_code) and not missing(county_code) and asofdate between 2008 and 2016;
	table sold_to_slim / out=score_sold_to_slim_target (rename=(count=target) drop=percent);
	table purpose / out=score_purpose_target (rename=(count=target) drop=percent);
	table race_2 / out=score_race_2_target (rename=(count=target) drop=percent);
	table sex / out=score_sex_target (rename=(count=target) drop=percent);
	table preapproval / out=score_preapproval_target (rename=(count=target) drop=percent);
	table lien / out=score_lien_target (rename=(count=target) drop=percent);
	table bin_income_spread / out=score_bin_income_spread_target (rename=(count=target) drop=percent);
run;

data s_sold_to_slim;
	merge score_sold_to_slim score_sold_to_slim_target;
	by sold_to_slim;
run;

data s_purpose;
	merge score_purpose score_purpose_target;
	by purpose;
run;

data s_race_2;
	merge score_race_2 score_race_2_target;
	by race_2;
run;
data s_sex;
	merge score_sex score_sex_target;
	by sex;
run;
data s_preapproval;
	merge score_preapproval score_preapproval_target;
	by preapproval;
run;
data s_lien;
	merge score_lien score_lien_target;
	by lien;
run;
data s_bin_income_spread;
	merge score_bin_income_spread score_bin_income_spread_target;
	by bin_income_spread;
run;

/* subprime institution stacked bar chart... */

proc means data=sasdata.scored_model_p40 noprint nway missing;
	where state_code is not null and county_code is not null;
	class asofdate new_subprime;
	var asofdate;
	output out=new_subprime_series n(asofdate)=predicted;
run;

proc means data=sasdata.scored_model_p40 noprint nway missing;
	where state_code is not null and county_code is not null and asofdate lt 2008;
	class asofdate test_subprime;
	var asofdate;
	output out=actual_subprime_series n(asofdate)=actual;
run;

data new_subprime_series2;
	set new_subprime_series;
	type='Predicted';
	rename new_subprime=target /*predicted=value*/;
	drop _type_ _freq_;
run;
data actual_subprime_series2;
	set actual_subprime_series;
	type='Actual';
	rename test_subprime=target	/*actual=value*/;
	drop _type_ _freq_;
run;

data subprime_chart;
	merge new_subprime_series2 actual_subprime_series2;
	by asofdate target;
run;

proc format;
	value target
		1='Subprime Institution'
		0='HMDA Total'
	;
	value hp_target
		1='HDMA High Price'
		0='HMDA Total';
	;
run;
proc sgplot data=subprime_chart;
	yaxis label='HMDA Total';
	xaxis label='Year';
	format predicted comma20. target target.;
	label target='';
	vbar asofdate / response=predicted group=target stat=mean /*groupdisplay=cluster*/ grouporder=descending fillattrs=(transparency=.3);
/*	vbar asofdate / response=actual group=target stat=mean groupdisplay=cluster grouporder=descending;*/
run;

proc means data=sasdata.scored_model_p40 noprint nway missing;
	where state_code is not null and county_code is not null;
	class asofdate hmda_high_price;
	var asofdate;
	output out=high_price_subprime_series n(asofdate)=actual;
run;


proc sgplot data=high_price_subprime_series;
	yaxis label='HMDA Total';
	xaxis label='Year';
	format actual comma20. hmda_high_price hp_target.;
	label hmda_high_price='';
	vbar asofdate / response=actual group=hmda_high_price stat=mean /*groupdisplay=cluster*/ grouporder=descending fillattrs=(transparency=.3);
/*	vbar asofdate / response=actual group=target stat=mean groupdisplay=cluster grouporder=descending;*/
run;


proc means data=sasdata.scored_model_p40 noprint nway missing;
	where state_code is not null and county_code is not null;
	class asofdate hmda_high_price;
	var asofdate;
	output out=hmda_subprime_series n(asofdate)=predicted;
run;

proc means data=sasdata.scored_model_p40 noprint nway missing;
	where state_code is not null and county_code is not null and asofdate lt 2008;
	class asofdate hmda_high_price;
	var asofdate;
	output out=hmda_actual_subprime_series n(asofdate)=actual;
run;

data hmda_subprime_series2;
	set hmda_subprime_series;
	type='Predicted';
	rename test_hmda_target=predicted /*predicted=value*/;
	drop _type_ _freq_;
run;
data hmda_actual_subprime_series2;
	set hmda_actual_subprime_series;
	type='Actual';
	rename test_subprime=actual	/*actual=value*/;
	drop _type_ _freq_;
run;

data subprime_chart_final;
	merge subprime_chart high_price_subprime_series (rename=(hmda_high_price=target actual=hmda_high_priced_target));
	by asofdate target;
run;

/*data stacked_subprime_chart;*/
/*	set new_subprime_series2 actual_subprime_series2;*/
/*run;*/
/**/
/*proc sgplot data=stacked_subprime_chart;*/
/*	vbar asofdate / response=value group=type stat=mean;*/
/*run;*/


/* https://www.ffiec.gov/ratespread/newcalchelp.aspx#4 */

proc import file='F:\6901\report\apor\YieldTable.csv'
			out=apor
			dbms=csv
			replace
			;
run;
proc import file='F:\6901\report\apor\MORTGAGE30US.csv'
			out=MORTGAGE30US
			dbms=csv
			replace
			;
run;
proc import file='F:\6901\report\apor\MORTPTS30US.csv'
			out=MORTPTS30US
			dbms=csv
			replace
			;
run;

	
proc means data=apor noprint nway missing;
	format Maturities_Yield_Date yymmn6.;
	class Maturities_Yield_Date;
	var _30;
	output out=apor_monthly (rename=(Maturities_Yield_Date=date)) mean(_30)=apor;
run;

data apor_monthly;
	set apor_monthly;
	date=intnx('month',date,0,'B');
run;

proc means data=MORTGAGE30US noprint nway missing;
	format date yymmn6.;
	class date;
	var MORTGAGE30US;
	output out=MORTGAGE30US_monthly mean=;
run;

data MORTGAGE30US_monthly;
	set MORTGAGE30US_monthly;
	date=intnx('month',date,0,'B');
run;

proc means data=MORTPTS30US noprint nway missing;
	format date yymmn6.;
	class date;
	var MORTPTS30US;
	output out=MORTPTS30US_monthly mean=;
run;

data MORTPTS30US_monthly;
	set MORTPTS30US_monthly;
	date=intnx('month',date,0,'B');
run;


data thrity_year;
	merge MORTGAGE30US_monthly MORTPTS30US_monthly apor_monthly;
	by date;
	total=MORTPTS30US+MORTGAGE30US;
	diff=total-apor;
	pct_diff=diff/apor;
run;


proc sgplot data=thrity_year;
	format apor total 8.2 diff 8.2;
	label apor='Average Prime Offer Rate' total='Average 30 Year + Points' diff='Spread Between';
	yaxis label='Rate';
	y2axis label='Rate Difference';
	xaxis label='Average Monthly Rate';
	where not missing(apor);
	series x=date y=apor / lineattrs=(thickness=3 color=blue);
	series x=date y=total / lineattrs=(thickness=3 color=black);
	series x=date y=diff / y2axis lineattrs=(thickness=3 color=red pattern=dash);
run;


proc means data=sasdata.scored_model_p40 noprint nway missing;
	where state_code is not null and county_code is not null;
	class asofdate;
	var rate_spread;
	output out=spread_report n(rate_spread)=populated_spread nmiss(rate_spread)=missing_spread;
run;

/*https://support.sas.com/rnd/app/ets/examples/margeff/index.html*/
/*http://support.sas.com/kb/22/604.html*/

proc qlim data=build_subprime;
    class purpose 
          race 
		  race_2
		  sex
          preapproval 
          lien 
          bin_loan 
          bin_income_spread 
		  state_code
		  division
		  region
    ;
    model subprime_use=
		purpose
        race_2
		sex
		preapproval
        lien
		bin_income_spread
        spread_equifax_population
        spread_ruc
        spread_1_to_4_units 
		spread_5plus_units
        spread_borr_fall_refi
        spread_inst_deny_purch 
        spread_inst_deny_refi
		spread_inst_purch 
		spread_inst_refi
		spread_population / discrete(d=logistic);
	output out=outqlim marginal;
run;
proc print data=outqlim (obs=5) noobs;
	var smear blast meff:;
run;
proc means data=outqlim mean min max;
	var Meff_P2:;
run;
proc freq data=scored;
/*	where &target.=1;*/
	table /*institution_name**/f_&target.*i_&target.;
run;

/* simple statistics */
proc means data=sasdata.originations_model noprint nway missing;
	where not missing(state_code) and not missing(county_code);
	class asofdate state_code county_code subprime_use
		  purpose race_2 sex preapproval lien bin_income_spread /* <-- model inputs */
	;
	var spread_equifax_population spread_ruc spread_1_to_4_units 
		spread_5plus_units spread_borr_fall_refi spread_inst_deny_purch 
		spread_inst_deny_refi spread_inst_purch spread_inst_refi spread_population
	;
	output out=simple_stats mean=;
run;

/* split between subprime_use and purpose by year */
proc freq data=simple_stats;
	table asofdate*subprime_use*purpose;
	table asofdate*purpose;
	table asofdate*subprime_use*race_2;
	table asofdate*race_2;
	table asofdate*subprime_use*sex;
	table asofdate*sex;
	table asofdate*subprime_use*preapproval;
	table asofdate*preapproval;
	table asofdate*subprime_use*lien;
	table asofdate*lien;
	table asofdate*subprime_use*bin_income_spread;
	table asofdate*bin_income_spread;
run;

proc means data=simple_stats mean nway;
	class asofdate;
	var spread_equifax_population spread_ruc spread_1_to_4_units 
		spread_5plus_units spread_borr_fall_refi spread_inst_deny_purch 
		spread_inst_deny_refi spread_inst_purch spread_inst_refi spread_population
	;
run;

/* marginal effects */




