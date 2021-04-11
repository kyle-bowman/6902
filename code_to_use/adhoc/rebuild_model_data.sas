
proc sort data=sasdata.fred_data out=fred_data;by state_code county_code asofdate;run;
proc sort data=sasdata.building_permits out=building_permits nodup dupout=permits_dups;by asofdate state_code county_code;run;
proc sort data=sasdata.zillow_data out=zillow_data;by state_code county_code asofdate;run;

data zillow_data_adj;
    merge zillow_data (in=z)
          fred_data (in=f keep=state_code county_code asofdate county_hpi_growth state_hpi_growth)
    ;
    by state_code county_code asofdate;
    if z;

    zhvi_sfh_hpiadj=zhvi_sfh*county_hpi_growth;
    median_ppsft_hpiadj=median_ppsft*county_hpi_growth;

    st_zhvi_sfh_hpiadj=st_zhvi_sfh*state_hpi_growth;
    st_median_ppsft_hpiadj=st_median_ppsft*state_hpi_growth;

    spread_zhvi_sfh_hpiadj=zhvi_sfh_hpiadj-st_zhvi_sfh_hpiadj;
    spread_median_ppsft_hpiadj=median_ppsft_hpiadj-st_median_ppsft_hpiadj;

    label zhvi_sfh_hpiadj='HPI Adjusted, 2001=0: Zillow Single Family Home Value for County' 
          median_ppsft_hpiadj='HPI Adjusted, 2001=0: Zillow Median Price Per Square Foot for County'
          st_zhvi_sfh_hpiadj='HPI Adjusted, 2001=0: Zillow Single Family Home Value for State'
          st_median_ppsft_hpiadj='HPI Adjusted, 2001=0: Zillow Median Price Per Square Foot for State'
          spread_zhvi_sfh_hpiadj='Single Family Home Value, Spread from County to State adjusted for HPI in 2001 Terms'
          spread_median_ppsft_hpiadj='Median Price Per Sqft, Spread from County to State adjusted for HPI in 2001 Terms'
    ;

    drop county_hpi_growth state_hpi_growth;

run;

proc sort data=fred_data;by asofdate state_code county_code;run;
proc sort data=zillow_data_adj;by asofdate state_code county_code;run;

data attritubes;
    merge fred_data (keep=state_code county_code asofdate 
                          county_hpi_growth state_hpi_growth cpiaucsl_nat_200101_pct
                          spread_equifax_population
                          spread_mhhi
                          spread_ruc
                          spread_pua0t17
                          spread_pua5t17
                          spread_peaa
                          spread_snap_benefits
                          spread_st_rent_vac spread_st_own_rate
						  spread_population)
          zillow_data_adj (keep=state_code county_code asofdate spread_zhvi_sfh_hpiadj spread_median_ppsft_hpiadj)
          building_permits (keep=state_code county_code asofdate spread_1_to_4_units spread_5plus_units)
    ;
    by asofdate state_code county_code;
    where asofdate between 2004 and 2017;
run;

options obs=max;
data /*model_data_build (sortedby=asofdate state_code county_code loan_purpose)*/
     modwork.subprime (sortedby=asofdate state_code county_code loan_purpose)
     modwork.non_subprime (sortedby=asofdate state_code county_code loan_purpose)
;
    merge sasdata.model_data_build (in=base
                                    keep=asofdate respondent_id loan_type loan_purpose occupancy action_taken state_code county_code
                                         applicant_sex type_of_purchaser denial_reason_1-denial_reason_3 property_type preapproval
                                         ethinicity applicant_race hoepa_status lien_status applicant_income loan_amount
                                         institution_name subprime hud_subprime division region state_abrev
                                    where=(/*action_taken ne '6' and*/ asofdate between 2004 and 2007))
          attritubes (in=at)
    ;
    by asofdate state_code county_code;
    if base;

    length purpose $ 8
           race $ %length(Other/NA Female)
           fallout $ %length(INSTITUTION DENIED)
    ;

    if missing(subprime) then subprime=0;

    if loan_purpose in ('2','3') then purpose='REFI';
    else if loan_purpose='1' then purpose='PURCHASE';

    if lien_status='3' then lien_status='2';

    if action_taken in ('2','4','5','8') then fallout='BORROWER FALLOUT';
    else if action_taken in ('3','7') then fallout='INSTITUTION DENIED';
    else if action_taken='6' then fallout='PURCHASED'; *** remove this one...;
    else if action_taken='1' then fallout='ORIGINATED';

    if applicant_sex='1' then do;
        if ethinicity='1' then race='Hispanic Male';
        else if applicant_race='2' then race='Asian Male';
        else if applicant_race='3' then race='Black Male';
        else if applicant_race='5' then race='White Male';
        else race='Other/NA Male';
    end;
    else if applicant_sex='2' then do;
        if ethinicity='1' then race='Hispanic Female';
        else if applicant_race='2' then race='Asian Female';
        else if applicant_race='3' then race='Black Female';
        else if applicant_race='5' then race='White Female';
        else race='Other/NA Female';
    end;
    else do;
        if ethinicity='1' then race='Hispanic N/A';
        else if applicant_race='2' then race='Asian N/A';
        else if applicant_race='3' then race='Black N/A';
        else if applicant_race='5' then race='White N/A';
        else race='Other/NA N/A';
    end;

    county_loan_amount_adj=loan_amount*county_hpi_growth;
    state_loan_amount_adj=loan_amount*state_hpi_growth;
    spread_loan_amount=county_loan_amount_adj-state_loan_amount_adj;
    applicant_income_adj=applicant_income*cpiaucsl_nat_200101_pct;

    random=ranuni(28104);

/*    output model_data_build;*/
    if 2004 le asofdate le 2007 then do;
        if subprime=1 then output modwork.subprime;
        else if subprime=0 then output modwork.non_subprime;
    end;

run;

data stacked;
    set modwork.subprime modwork.non_subprime;
run;

proc means data=stacked noprint nway missing;
    where fallout='ORIGINATED' and not missing(loan_amount);
    class asofdate state_code county_code;
    var spread_loan_amount;
    output out=loan_amount p20(spread_loan_amount)=p20_spread_loan
                           p40(spread_loan_amount)=p40_spread_loan
                           p60(spread_loan_amount)=p60_spread_loan
                           p80(spread_loan_amount)=p80_spread_loan
    ;
run;
proc means data=stacked noprint nway missing;
    where fallout='ORIGINATED' and coalesce(applicant_income,9999) ne 9999;
    class asofdate state_code;
    var applicant_income_adj;
    output out=state_income mean(applicant_income_adj)=st_applicant_income_mean median(applicant_income_adj)=st_applicant_income_med;
run;

proc means data=stacked noprint nway missing;
    class asofdate state_code fallout purpose county_code;
    output out=approval_denial (drop=_type_ _freq_) n(asofdate)=count;
run;

proc means data=approval_denial noprint nway missing;
    class asofdate state_code fallout purpose;
    output out=state_approval_denial (drop=_type_ _freq_) sum(count)=state_count;
run;

proc means data=approval_denial noprint nway missing;
    class asofdate state_code county_code;
    output out=county_total (drop=_type_ _freq_) sum(count)=county_total;
run;

proc means data=approval_denial noprint nway missing;
    class asofdate state_code;
    output out=state_total (drop=_type_ _freq_) sum(count)=state_total;
run;

data approval_denial_rates;
    merge approval_denial 
          state_approval_denial
    ;
    by asofdate state_code fallout purpose;
run;

proc sort data=approval_denial_rates;by asofdate state_code county_code;run;

data approval_denial_rates;
    merge approval_denial_rates
          county_total
    ;
    by asofdate state_code county_code;
run;

data approval_denial_rates;
    merge approval_denial_rates
          state_total
    ;
    by asofdate state_code;

    county_ratio=divide(count,county_total);
    state_ratio=divide(state_count,state_total);
run;

data approval_denial_rates;
    set approval_denial_rates;
    by asofdate state_code county_code;
    retain spread_borr_fall_purch spread_borr_fall_refi
           spread_inst_deny_purch spread_inst_deny_refi
           spread_orig_purch spread_orig_refi
		   spread_inst_purch spread_inst_refi
    ;

    if first.county_code then call missing(spread_borr_fall_purch,spread_borr_fall_refi,
                                           spread_inst_deny_purch,spread_inst_deny_refi,
                                           spread_orig_purch,spread_orig_refi,
										   spread_inst_purch,spread_inst_refi)
    ;

    if purpose='PURCHASE' then do;
        if fallout='BORROWER FALLOUT' then spread_borr_fall_purch=county_ratio-state_ratio;
        else if fallout='INSTITUTION DENIED' then spread_inst_deny_purch=county_ratio-state_ratio;
        else if fallout='ORIGINATED' then spread_orig_purch=county_ratio-state_ratio;
		else if fallout='PURCHASED' then spread_inst_purch=county_ratio-state_ratio;
    end;
    else if purpose='REFI' then do;
        if fallout='BORROWER FALLOUT' then spread_borr_fall_refi=county_ratio-state_ratio;
        else if fallout='INSTITUTION DENIED' then spread_inst_deny_refi=county_ratio-state_ratio;
        else if fallout='ORIGINATED' then spread_orig_refi=county_ratio-state_ratio;
		else if fallout='PURCHASED' then spread_inst_refi=county_ratio-state_ratio;
    end;

    if last.county_code;

    keep asofdate state_code county_code
         spread_borr_fall_purch spread_borr_fall_refi
         spread_inst_deny_purch spread_inst_deny_refi
         spread_orig_purch spread_orig_refi
		 spread_inst_purch spread_inst_refi
    ;
run;

proc sort data=stacked force;by asofdate state_code county_code;run;
data stacked_originations;
    merge stacked (in=m where=(fallout='ORIGINATED'))
          approval_denial_rates
          loan_amount
    ;
    by asofdate state_code county_code;
    if m;

    length bin_loan 3;
    if missing(loan_amount) then bin_loan=0;
    else if spread_loan_amount le p20_spread_loan then bin_loan=1;
    else if spread_loan_amount le p40_spread_loan then bin_loan=2;
    else if spread_loan_amount le p60_spread_loan then bin_loan=3;
    else if spread_loan_amount le p80_spread_loan then bin_loan=4;
    else if spread_loan_amount gt p80_spread_loan then bin_loan=5;
run;

data stacked_originations;
    merge stacked_originations state_income (keep=asofdate state_code st_applicant_income_med);
    by asofdate state_code;

    spread_income=applicant_income_adj-st_applicant_income_med;
run;

proc means data=stacked_originations noprint nway missing;
    class asofdate state_code county_code;
    var spread_income;
    output out=income_spread (drop=_type_ _freq_)
           p20(spread_income)=p20_spread_income
           p40(spread_income)=p40_spread_income
           p60(spread_income)=p60_spread_income
           p80(spread_income)=p80_spread_income
    ;
run;

data modwork.stacked_originations;
    merge stacked_originations income_spread;
    by asofdate state_code county_code;

    length bin_income_spread 3;
    if missing(applicant_income) or applicant_income=9999 then bin_income_spread=0;
    else if spread_income le p20_spread_income then bin_income_spread=1;
    else if spread_income le p40_spread_income then bin_income_spread=2;
    else if spread_income le p60_spread_income then bin_income_spread=3;
    else if spread_income le p80_spread_income then bin_income_spread=4;
    else if spread_income gt p80_spread_income then bin_income_spread=5;
run;

/*proc copy in=work out=modwork;*/
/*	select stacked_originations;*/
/*run;*/
/**/
/*proc means data=modwork.subprime noprint nway missing;*/
/*	where fallout='ORIGINATED';*/
/*	class institution_name;*/
/*	output out=subprime_by_inst (drop=_type_ _freq_) n(asofdate)=count;*/
/*run;*/
/*
	where institution_name not in ('COUNTRYWIDE BANK, N.A.',
								   'ACCREDITED HOME LENDERS, INC',
								   'HOME123',
								   'NOVASTAR',
								   'OWNIT MORTGAGE SOLUTIONS',
								   'SILVER STATE FINANCIAL SERVICE')
	reset these so that they are non-subprime... 
*/

proc sort data=modwork.stacked_originations out=modwork.stacked_originations_random;by random;run;

data acc_home_lenders
	 ameriquest
	 amtrust
	 bear_stearns
	 countrywide
	 decision_one
	 e_trade
	 home123
	 indymac
	 netbank
	 new_century
	 novastar
	 option_one
	 ownit
	 silver_state
	 washington_mutual
	 wmc_mortgage
	 golden_west
	 wells_fargo_finl
	 ;
	set modwork.stacked_originations;
	where fallout='ORIGINATED' and subprime=1;

	if institution_name='ACCREDITED HOME LENDERS, INC' then output acc_home_lenders;
	else if institution_name='AMERIQUEST MORTGAGE COMPANY' then output ameriquest;
	else if institution_name='AMTRUST BANK' then output amtrust;
	else if institution_name='BEAR STEARNS RESIDENTIAL' then output bear_stearns;
	else if institution_name='COUNTRYWIDE BANK, N.A.' then output countrywide;
	else if institution_name='DECISION ONE' then output decision_one;
	else if institution_name='E*TRADE BANK' then output e_trade;
	else if institution_name='HOME123' then output home123;
	else if institution_name='INDYMAC' then output indymac;
	else if institution_name='NETBANK' then output netbank;
	else if institution_name='NEW CENTURY MORTGAGE CORP' then output new_century;
	else if institution_name='NOVASTAR' then output novastar;
	else if institution_name='OPTION ONE MORTGAGE CORP' then output option_one;
	else if institution_name='OWNIT MORTGAGE SOLUTIONS' then output ownit;
	else if institution_name='SILVER STATE FINANCIAL SERVICE' then output silver_state;
	else if institution_name='WASHINGTON MUTUAL' then output washington_mutual;
	else if institution_name='WMC MORTGAGE COMPANY' then output wmc_mortgage;
	else if institution_name='WORLD SAVINGS BANK (GOLDEN WEST)' then output golden_west;
	else if institution_name='WELLS FARGO FINL' then output wells_fargo_finl;
run;



	
%macro model_fit(input=,institution=,selection_method=,delete_input=N,stack_stats=model_runs);

%if &delete_input.=Y %then %do;

	proc datasets lib=work nolist nodetails;
		delete build_subprime validate_subprime;
	run;quit;

	proc contents data=&input. noprint out=inst_counts (keep=nobs);run;

	data _null_;
		set inst_counts (obs=1);
		call symputx('build_pop',floor(nobs*0.6));
		call symputx('valid_pop',floor(nobs*0.4));
	run;

	data build_subprime;
		set &input. (obs=&build_pop.)
			modwork.stacked_originations_random (where=(subprime=0) obs=&build_pop.)
		;
	run;

	data validate_subprime;
		set &input. (firstobs=&build_pop. obs=%eval(&build_pop.+&valid_pop.))
			modwork.stacked_originations_random (where=(subprime=0) firstobs=&build_pop. obs=%eval(&build_pop.+&valid_pop.))
		;
	run;
	proc datasets lib=work nolist nodetails;
		delete inst_counts;
	run;quit;
%end;
ods output rsquare=rsquare
		   modelbuildingsummary=model_build_summary
		   association=roc_info
		   parameterestimates=parameter_estimates
		   lackfitchisq=lackfit_chisq
		   fitstatistics=fit_statistics
		   scorefitstat=scored_fit_statistics
		   responseprofile=response_profile
;
/* pick one, SC 3924508.9, ERROR RATE 0.3904 */
        /*spread_pua5t17*/ /* pick one , SC 3935691.1, ERROR RATE 0.3959 */
        /*spread_peaa*/  /* pick one, SC 3933478.9, ERROR RATE 0.3955 */
        /*spread_snap_benefits*/ /* pick one, SC 3937241.9, ERROR RATE 0.3954 */
/*        spread_orig_purch */
/*        spread_orig_refi*/

proc logistic data=build_subprime missing;
    class purpose 
          race 
          preapproval 
          lien_status 
          bin_loan 
          bin_income_spread 
    ;
    model subprime(event='1')=
        purpose
        race
        preapproval
        lien_status
        bin_loan
        bin_income_spread
        spread_equifax_population
/*        spread_mhhi*/
        spread_ruc
        spread_pua0t17 
/*        spread_st_rent_vac */
/*        spread_st_own_rate*/
/*        spread_borr_fall_purch */
/*        spread_borr_fall_refi*/
/*        spread_inst_deny_purch */
/*        spread_inst_deny_refi*/
        spread_zhvi_sfh_hpiadj 
        spread_orig_purch 
        spread_orig_refi
/*        spread_median_ppsft_hpiadj*/
        spread_1_to_4_units 
/*        spread_5plus_units*/
		/ rsquare stb lackfit expb parmlabel selection=&selection_method.
	;
	score data=validate_subprime out=scored fitstat;
run;

data ass1;
	set roc_info (obs=1 keep=nvalue1 rename=(nvalue1=pct_concordant));
run;
data ass2;
	set roc_info (keep=nvalue1 obs=2 firstobs=2 rename=(nvalue1=pct_discordant));
run;
data ass3;
	set roc_info (keep=nvalue2 obs=1 rename=(nvalue2=somers_d));
run;
data ass4;
	set roc_info (keep=nvalue2 firstobs=4 obs=4 rename=(nvalue2=c));
run;

data rsquare;
	set rsquare end=eof;

	if eof;
	rename nvalue1=rsquare nvalue2=rescaled_rsquare;
	keep nvalue1 nvalue2;
run;

%if &selection_method.=forward %then %do;
	data removed_predictors;
		length removed_predictors $ 10000;
		removed_predictors='';
	run;
%end;
%else %do;
data removed_predictors;
	set model_build_summary end=eof;
	length removed_predictors $ 10000;
	retain removed_predictors;
	removed_predictors=cats(removed_predictors,cats(effectremoved,'|'));
	if eof;
	keep removed_predictors;
run;
%end;

data kept_parameters;
	set parameter_estimates end=eof;
	length kept_predictors $ 10000;
	retain kept_predictors;
	kept_predictors=cats(kept_predictors,cats(variable,'|'));
	if eof;
	keep kept_predictors;
run;

proc sql noprint;
	select max(step) 
	into :max_step
	from fit_statistics
;quit;

data fit_stats;
	set fit_statistics end=eof;
	where step=&max_step.;

	retain aic sbc logliklihood;
	if criterion='AIC' then aic=interceptandcovariates;
	else if criterion='SC' then sbc=interceptandcovariates;
	else if criterion='-2 Log L' then logliklihood=interceptandcovariates;

	keep aic sbc logliklihood;
	if eof;
run;

data response_profile;
	set response_profile end=eof;

	retain target_1 target_0;
	if strip(outcome)='1' then target_1=count;
	else if strip(outcome)='0' then target_0=count;

	if eof;

	keep target_1 target_0;
run;

data scored_fit_statistics;
	set scored_fit_statistics;
	drop dataset;
	rename freq=valid_freq
		   loglike=valid_loglike
		   misclass=valid_misclass
		   auc=valid_auc
		   aic=valid_aic
		   aicc=valid_aicc
		   bic=valid_bic
		   sc=valid_sc
		   rsquare=valid_rsquare
		   adjrsquare=valid_adjrsquare
		   brierscore=valid_brierscore
	;
run;

data lackfit_chisq;
	set lackfit_chisq;
	rename chisq=lack_fit_chisq probchisq=lack_fit_probchisq; 
	drop df;
run;

ods output ks2stats=ks;
proc npar1way data=scored plots=none;
	class subprime;
	var p_1;
run;quit;
	
data ks;
	set ks (obs=1 keep=nvalue2 rename=(nvalue2=ks));
run;

data run_stats;
	length institution $ 100 selection_method $ 20;
	merge ass1 ass2 ass3 ass4 rsquare fit_stats response_profile scored_fit_statistics kept_parameters removed_predictors
	      lackfit_chisq ks;
	selection_method="&selection_method.";
	institution="&institution";
run;

proc append base=modwork.&stack_stats. data=run_stats;run;

proc datasets lib=work nolist nodetails;
	delete rsquare
		   model_build_summary
		   roc_info
		   parameter_estimates
		   lackfit_chisq
		   fit_statistics
		   scored_fit_statistics
		   response_profile
		   ass1 ass2 ass3 ass4
		   fit_stats
		   kept_parameters
		   removed_parameters
		   run_stats
		   scored
		   ks
	;
run;quit;

%mend model_fit;

proc datasets lib=modwork nolist nodetails;
	delete slim;
run;quit;

%model_fit(input=acc_home_lenders,institution=%str(ACCREDITED HOME LENDERS, INC),selection_method=backward,delete_input=Y,stack_stats=slim);
%model_fit(input=acc_home_lenders,institution=%str(ACCREDITED HOME LENDERS, INC),selection_method=forward,stack_stats=slim);
/*%model_fit(input=acc_home_lenders,institution=%str(ACCREDITED HOME LENDERS, INC),selection_method=stepwise);*/

%model_fit(input=ameriquest,institution=%str(AMERIQUEST MORTGAGE COMPANY),selection_method=backward,delete_input=Y,stack_stats=slim);
%model_fit(input=ameriquest,institution=%str(AMERIQUEST MORTGAGE COMPANY),selection_method=forward,stack_stats=slim);
/*%model_fit(input=ameriquest,institution=%str(AMERIQUEST MORTGAGE COMPANY),selection_method=stepwise);*/

%model_fit(input=amtrust,institution=%str(AMTRUST BANK),selection_method=backward,delete_input=Y,stack_stats=slim);
%model_fit(input=amtrust,institution=%str(AMTRUST BANK),selection_method=forward,stack_stats=slim);
/*%model_fit(input=amtrust,institution=%str(AMTRUST BANK),selection_method=stepwise);*/

%model_fit(input=bear_stearns,institution=%str(BEAR STEARNS RESIDENTIAL),selection_method=backward,delete_input=Y,stack_stats=slim);
%model_fit(input=bear_stearns,institution=%str(BEAR STEARNS RESIDENTIAL),selection_method=forward,stack_stats=slim);
/*%model_fit(input=bear_stearns,institution=%str(BEAR STEARNS RESIDENTIAL),selection_method=stepwise);*/

%model_fit(input=countrywide,institution=%str(COUNTRYWIDE BANK, N.A.),selection_method=backward,delete_input=Y,stack_stats=slim);
%model_fit(input=countrywide,institution=%str(COUNTRYWIDE BANK, N.A.),selection_method=forward,stack_stats=slim);
/*%model_fit(input=countrywide,institution=%str(COUNTRYWIDE BANK, N.A.),selection_method=stepwise);*/

%model_fit(input=decision_one,institution=%str(DECISION ONE),selection_method=backward,delete_input=Y,stack_stats=slim);
%model_fit(input=decision_one,institution=%str(DECISION ONE),selection_method=forward,stack_stats=slim);
/*%model_fit(input=decision_one,institution=%str(DECISION ONE),selection_method=stepwise);*/

%model_fit(input=e_trade,institution=%str(E*TRADE BANK),selection_method=backward,delete_input=Y,stack_stats=slim);
%model_fit(input=e_trade,institution=%str(E*TRADE BANK),selection_method=forward,stack_stats=slim);
/*%model_fit(input=e_trade,institution=%str(E*TRADE BANK),selection_method=stepwise);*/

%model_fit(input=home123,institution=%str(HOME123),selection_method=backward,delete_input=Y,stack_stats=slim);
%model_fit(input=home123,institution=%str(HOME123),selection_method=forward,stack_stats=slim);
/*%model_fit(input=home123,institution=%str(HOME123),selection_method=stepwise);*/

%model_fit(input=indymac,institution=%str(INDYMAC),selection_method=backward,delete_input=Y,stack_stats=slim);
%model_fit(input=indymac,institution=%str(INDYMAC),selection_method=forward,stack_stats=slim);
/*%model_fit(input=indymac,institution=%str(INDYMAC),selection_method=stepwise);*/

%model_fit(input=netbank,institution=%str(NETBANK),selection_method=backward,delete_input=Y,stack_stats=slim);
%model_fit(input=netbank,institution=%str(NETBANK),selection_method=forward,stack_stats=slim);
/*%model_fit(input=netbank,institution=%str(NETBANK),selection_method=stepwise);*/

%model_fit(input=new_century,institution=%str(NEW CENTURY MORTGAGE CORP),selection_method=backward,delete_input=Y,stack_stats=slim);
%model_fit(input=new_century,institution=%str(NEW CENTURY MORTGAGE CORP),selection_method=forward,stack_stats=slim);
/*%model_fit(input=new_century,institution=%str(NEW CENTURY MORTGAGE CORP),selection_method=stepwise);*/

%model_fit(input=novastar,institution=%str(NOVASTAR),selection_method=backward,delete_input=Y,stack_stats=slim);
%model_fit(input=novastar,institution=%str(NOVASTAR),selection_method=forward,stack_stats=slim);
/*%model_fit(input=novastar,institution=%str(NOVASTAR),selection_method=stepwise);*/

%model_fit(input=option_one,institution=%str(OPTION ONE MORTGAGE CORP),selection_method=backward,delete_input=Y,stack_stats=slim);
%model_fit(input=option_one,institution=%str(OPTION ONE MORTGAGE CORP),selection_method=forward,stack_stats=slim);
/*%model_fit(input=option_one,institution=%str(OPTION ONE MORTGAGE CORP),selection_method=stepwise);*/

%model_fit(input=ownit,institution=%str(OWNIT MORTGAGE SOLUTIONS),selection_method=backward,delete_input=Y,stack_stats=slim);
%model_fit(input=ownit,institution=%str(OWNIT MORTGAGE SOLUTIONS),selection_method=forward,stack_stats=slim);
/*%model_fit(input=ownit,institution=%str(OWNIT MORTGAGE SOLUTIONS),selection_method=stepwise);*/

%model_fit(input=silver_state,institution=%str(SILVER STATE FINANCIAL SERVICE),selection_method=backward,delete_input=Y,stack_stats=slim);
%model_fit(input=silver_state,institution=%str(SILVER STATE FINANCIAL SERVICE),selection_method=forward,stack_stats=slim);
/*%model_fit(input=silver_state,institution=%str(SILVER STATE FINANCIAL SERVICE),selection_method=stepwise);*/

%model_fit(input=washington_mutual,institution=%str(WASHINGTON MUTUAL),selection_method=backward,delete_input=Y,stack_stats=slim);
%model_fit(input=washington_mutual,institution=%str(WASHINGTON MUTUAL),selection_method=forward,stack_stats=slim);
/*%model_fit(input=washington_mutual,institution=%str(WASHINGTON MUTUAL),selection_method=stepwise);*/

%model_fit(input=wmc_mortgage,institution=%str(WMC MORTGAGE COMPANY),selection_method=backward,delete_input=Y,stack_stats=slim);
%model_fit(input=wmc_mortgage,institution=%str(WMC MORTGAGE COMPANY),selection_method=forward,stack_stats=slim);
/*%model_fit(input=wmc_mortgage,institution=%str(WMC MORTGAGE COMPANY),selection_method=stepwise);*/

%model_fit(input=golden_west,institution=%str(WORLD SAVINGS BANK GOLDEN WEST),selection_method=backward,delete_input=Y,stack_stats=slim);
%model_fit(input=golden_west,institution=%str(WORLD SAVINGS BANK GOLDEN WEST),selection_method=forward,stack_stats=slim);
/*%model_fit(input=golden_west,institution=%str(WORLD SAVINGS BANK GOLDEN WEST),selection_method=stepwise);*/

%model_fit(input=wells_fargo_finl,institution=%str(WELLS FARGO FINL),selection_method=backward,delete_input=Y,stack_stats=slim);
%model_fit(input=wells_fargo_finl,institution=%str(WELLS FARGO FINL),selection_method=forward,stack_stats=slim);
/*%model_fit(input=wells_fargo_finl,institution=%str(WELLS FARGO FINL),selection_method=stepwise);*/



	 
data sub_investors;
	set acc_home_lenders
		ameriquest
		countrywide
		e_trade
		home123
		indymac
		novastar
		option_one
		ownit
		silver_state
		wmc_mortgage
		golden_west
		wells_fargo_finl
	;

	where institution_name not in ('COUNTRYWIDE BANK, N.A.',
								   'ACCREDITED HOME LENDERS, INC',
								   'HOME123',
								   'NOVASTAR',
								   'OWNIT MORTGAGE SOLUTIONS',
								   'SILVER STATE FINANCIAL SERVICE')

run;

proc means data=modwork.stacked_originations_random noprint nway missing;
	where max(hud_subprime,subprime,slim_subprime,0)=1;
	class institution_name hud_subprime subprime slim_subprime;
	var asofdate;
	output out=cuts n=;
run;

data modwork.stacked_originations_random;
	set modwork.stacked_originations_random;


	if institution_name in (
								   'COUNTRYWIDE BANK, N.A.',/* very bad */
								   'ACCREDITED HOME LENDERS, INC', /* nope */
								   'HOME123', /*nope*/
								   'NOVASTAR', /* nope */
								   'OWNIT MORTGAGE SOLUTIONS', /* nope */
								   'SILVER STATE FINANCIAL SERVICE', /* nope */
									'AMTRUST BANK', /* nope */
									'BEAR STEARNS RESIDENTIAL', /* nope */
									'NETBANK', /* nope */
									'WMC MORTGAGE COMPANY', /* nope */
									'DECISION ONE', /* nope */
									'NEW CENTURY MORTGAGE CORP', /* nope */
									'OPTION ONE MORTGAGE CORP', /* nope */
									'WELLS FARGO FINL' /* bad */
									)
		then slim_subprime=0;
		/* RESMAE MORTGAGE CORPORATION */
		/* PEOPLE'S CHOICE HOME LOAN, INC ; PEOPLE'S CHOICE FINANCIAL CORP */
		/* NOVASTAR HOME MORTGAGE INC ; NOVASTAR HOME MORTGAGE, INC. */
		/* MASTER FINANCIAL, INC. */
		/* LONG BEACH MORTGAGE CO. */
		/* HOMEOWNERS LOAN CORPORATION */
		/* FREMONT INVESTMENT & LOAN */
		/* FIRST STREET FINANCIAL, INC. */
		/* FIRST NLC FINANCIAL SERVICES */
		/* FIRST GREENSBORO HOME EQUITY */
		/* FINANCE AMERICA, LLC */
		/* ENCORE CREDIT CORP. ; ENCORE CREDIT CORP */
		/* DELTA FUNDING CORPORATION */
		/* CITIFINANCIAL INC ; CITIFINANCIAL EQUITY SERVICES, ; CITIFINANCIAL EQUITY SERVICES */
		/* AMERIQUEST MORTGAGE COMPANY */
		/* AMERICAN BUSINESS FINANCIAL */
		/* AEGIS LENDING CORPORATION */
		/* AAMES FUNDING CORPORATION */
	else if institution_name in (
								 'RESMAE MORTGAGE CORPORATION',
/*								 "PEOPLE'S CHOICE HOME LOAN, INC","PEOPLE'S CHOICE FINANCIAL CORP",*/
/*								 'NOVASTAR HOME MORTGAGE INC','NOVASTAR HOME MORTGAGE, INC.',*/
/*								 'MASTER FINANCIAL, INC.',*/
/*								 'LONG BEACH MORTGAGE CO.',*/
/*								 'HOMEOWNERS LOAN CORPORATION',*/
/*								 'FREMONT INVESTMENT & LOAN',*/
/*								 'FIRST STREET FINANCIAL, INC.',*/
/*								 'FIRST NLC FINANCIAL SERVICES',*/
/*								 'FIRST GREENSBORO HOME EQUITY',*/
/*								 'FINANCE AMERICA, LLC',*/
/*								 'ENCORE CREDIT CORP.','ENCORE CREDIT CORP',*/
								 'DELTA FUNDING CORPORATION',
/*								 'AMERIQUEST MORTGAGE COMPANY', i could keep this, not terrible*/
/*								 'AMERICAN BUSINESS FINANCIAL',*/
								 'AEGIS LENDING CORPORATION'
/*								 'AAMES FUNDING CORPORATION'*/
								)
		then slim_subprime=1;
/*	else if substr(institution_name,1,13)='CITIFINANCIAL' then slim_subprime=1;*/
	else slim_subprime=subprime;
run; 

data sub_investors;
	set modwork.stacked_originations_random;
	where slim_subprime=1;
run;

proc contents data=sub_investors noprint out=inst_counts (keep=nobs);run;

data _null_;
	set inst_counts (obs=1);
	call symputx('build_pop',floor(nobs*0.7));
	call symputx('valid_pop',floor(nobs*0.3));
run;

data build_subprime;
	set sub_investors (/*obs=&build_pop.*/ where=(random le 0.6))
		modwork.stacked_originations_random (where=(slim_subprime=0 and random le 0.6) obs=&build_pop.)
	;
	length race_2 $ 8 sex $ 6;
	if find(race,'Asian') ne 0 then race_2='Asian';
	else if find(race,'Black') ne 0 then race_2='Black';
	else if find(race,'Hispanic') ne 0 then race_2='Hispanic';
	else if find(race,'White') ne 0 then race_2='White';
	else race_2='Other';
	if find(race,'Male') ne 0 then sex='Male';
	else sex='Female';
run;

data validate_subprime;
	set sub_investors (/*firstobs=&build_pop. obs=%eval(&build_pop.+&valid_pop.)*/ where=(random gt 0.6))
		modwork.stacked_originations_random (where=(slim_subprime=0 and random gt 0.6) /*firstobs=&build_pop.*/ obs=%eval(/*&build_pop.+*/&valid_pop.))
	;
	length race_2 $ 8 sex $ 6;
	if find(race,'Asian') ne 0 then race_2='Asian';
	else if find(race,'Black') ne 0 then race_2='Black';
	else if find(race,'Hispanic') ne 0 then race_2='Hispanic';
	else if find(race,'White') ne 0 then race_2='White';
	else race_2='Other';
	if find(race,'Male') ne 0 then sex='Male';
	else sex='Female';
run;

proc logistic data=build_subprime missing;
    class purpose 
          race 
		  race_2
		  sex
          preapproval 
          lien_status 
          bin_loan 
          bin_income_spread 
		  state_code
		  division
		  region
    ;
    model slim_subprime(event='1')=
/*        purpose*race_2*/
/*		division*/
/*		region*/
		purpose
		purpose*race_2
/*		division*race_2*/
/*		purpose*/
        race_2
		sex
/*		sex*race_2*/
        preapproval*race_2
		preapproval
        lien_status
/*        bin_loan*race_2*/
/*		bin_loan*/
/*        bin_income_spread*race_2*/
		bin_income_spread
/*		race_2*bin_income_spread*/
/*		state_code*/
        spread_equifax_population
        spread_ruc
/*        spread_pua0t17 */
/*        spread_zhvi_sfh_hpiadj */
/*        spread_orig_purch */
/*        spread_orig_refi*/
        spread_1_to_4_units 
		spread_5plus_units
/*	    spread_borr_fall_purch */
        spread_borr_fall_refi
        spread_inst_deny_purch 
        spread_inst_deny_refi
		spread_inst_purch 
		spread_inst_refi
		spread_population
		/ rsquare stb expb parmlabel firth lackfit ctable
	;
	units spread_borr_fall_refi=0.0001
          spread_inst_deny_purch=0.0001 
          spread_inst_deny_refi=0.0001
		  spread_inst_purch=0.0001 
		  spread_inst_refi=0.0001
		  spread_population=500
          spread_equifax_population=500
          spread_ruc=0.01
		  spread_1_to_4_units=100
		  spread_5plus_units=10
	;
	output out=model_fit_score predicted=pred /*predprobs=probs*/ ;
	score data=validate_subprime out=scored fitstat /*priorevent=0.1796784455*/;
run;

/*proc sgplot data=r;*/
/*	series x=_sensit_ y=_1mspec_;*/
/*run;*/

proc freq data=scored;
	where slim_subprime=1;
	table institution_name*f_slim_subprime*i_slim_subprime;
run;

proc freq data=scored;
	table f_slim_subprime*i_slim_subprime / missing;
run;


data model_fit_score;
	set model_fit_score;
	help_me=(pred ge 0.5);
run;

proc freq data=model_fit_score;
	where slim_subprime=1;
	table institution_name*slim_subprime*help_me;
run;

proc npar1way data=scored plots=none;
	class slim_subprime;
	var p_1;
run;quit;

/*proc freq data=build_subprime;*/
/*	where slim_subprime=1;*/
/*	table institution_name;*/
/*run;*/
         
proc freq data=model_fit_score;
	table state_abrev*slim_subprime;
run;

proc sql;
	select
		state_abrev
	,	count(*)
from scored
where slim_subprime=1
group by
	state_abrev
order by
	state_abrev
;quit;
