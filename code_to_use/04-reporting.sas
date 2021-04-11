
/* frequency counts for purpose */

proc freq data=sasdata.model_data_build noprint;
	where asofdate le 2007;
	table subprime_use*state_abrev*purpose / out=purpose_insample;
	table subprime_institution*state_abrev*purpose / out=purpose_insample;
run;

proc means data=sasdata.scored_model noprint nway missing;
	where coalescec(state_code,'NA') ne 'NA' 
		and coalescec(county_code,'NA') ne 'NA'
/*		and asofdate le 2007*/
		and fallout in ('ORIGINATED')
	;
	class asofdate state_code county_code institution_name
		  sold_to_slim purpose race_2 sex preapproval lien bin_loan bin_income_spread 
		  /*subprime_use subprime_institution subprime*/ test_subprime i_test_subprime f_test_subprime		  
	;
	output out=cohort (drop=_type_ _freq_)
		   n(asofdate)=units
		   mean(spread_equifax_population)=spread_equifax_population
		   mean(spread_ruc)=spread_ruc
		   mean(spread_1_to_4_units)=spread_1_to_4_units
		   mean(spread_5plus_units)=spread_5plus_units
		   mean(spread_population)=spread_population
		   mean(applicant_income_adj)=applicant_income_adj
		   mean(county_loan_amount_adj)=county_loan_amount_adj
		   mean(state_loan_amount_adj)=state_loan_amount_adj
		   mean(spread_median_ppsft_hpiadj)=spread_median_ppsft_hpiadj
	;
run;

proc means data=cohort noprint nway missing;
	class institution_name asofdate state_code county_code sold_to_slim i_test_subprime;
	output out=institution_subprime sum(units)=units;
run;
	
data institution_subprime;
	merge institution_subprime (keep=institution_name asofdate state_code county_code i_test_subprime sold_to_slim i_test_subprime units 
								where=(i_test_subprime='1') rename=(units=predicted_subprime))
		  institution_subprime (keep=institution_name asofdate state_code county_code i_test_subprime sold_to_slim i_test_subprime units 
								where=(i_test_subprime='0') rename=(units=predicted_nonsubprime))
	;
	by institution_name asofdate state_code county_code sold_to_slim;

	retain hfi_subprime hfi_nonsubprime
		   gse_subprime gse_nonsubprime
		   ps_subprime ps_nonsubprime
		   cm_subprime cm_nonsubprime
	;
	if first.county_code then call missing(hfi_subprime,hfi_nonsubprime,
										   gse_subprime,gse_nonsubprime,
										   ps_subprime,ps_nonsubprime,
										   cm_subprime,cm_nonsubprime)
	;

	if sold_to_slim='GSE' then do;
		gse_subprime=predicted_subprime;
		gse_nonsubprime=predicted_nonsubprime;
	end;
	else if sold_to_slim='COMMERCIAL BANK' then do;
		cm_subprime=predicted_subprime;
		cm_nonsubprime=predicted_nonsubprime;
	end;
	else if sold_to_slim='HELD FOR INVESTMENT' then do;
		hfi_subprime=predicted_subprime;
		hfi_nonsubprime=predicted_nonsubprime;
	end;
	else if sold_to_slim='PRIVATE SECURITY' then do;
		ps_subprime=predicted_subprime;
		ps_nonsubprime=predicted_nonsubprime;
	end;

	if last.county_code;

	total_loans=sum(hfi_subprime,hfi_nonsubprime,
					gse_subprime,gse_nonsubprime,
					ps_subprime,ps_nonsubprime,
					cm_subprime,cm_nonsubprime)
	;
	total_subprime=sum(hfi_subprime,gse_subprime,ps_subprime,cm_subprime);

	drop predicted_subprime predicted_nonsubprime i_test_subprime sold_to_slim;
run;

proc means data=institution_subprime nway noprint missing;
	where asofdate le 2007;
	class state_code;
	var total_loans total_subprime hfi_subprime gse_subprime ps_subprime cm_subprime;
	output out=state_2007_sub sum=;
run;

proc means data=institution_subprime nway noprint missing;
	where asofdate=2017;
	class state_code;
	var total_loans total_subprime hfi_subprime gse_subprime ps_subprime cm_subprime;
	output out=state_2017_sub sum=;
run;


 

proc means data=sasdata.model_data_build noprint nway missing;
	where asofdate le 2007 and fallout in ('ORIGINATED','PURCHASED')
		and coalescec(state_code,'NA') ne 'NA' 
		and coalescec(county_code,'NA') ne 'NA'
	;
	class asofdate state_code county_code
		  purpose race_2 sex preapproval lien sold_to_slim fallout
		  subprime_use subprime_institution subprime institution_name
	;
	output out=cohort_purch (drop=_type_ _freq_)
		   n(asofdate)=units
		   mean(spread_equifax_population)=spread_equifax_population
		   mean(spread_ruc)=spread_ruc
		   mean(spread_1_to_4_units)=spread_1_to_4_units
		   mean(spread_5plus_units)=spread_5plus_units
		   mean(spread_population)=spread_population
		   mean(applicant_income_adj)=applicant_income_adj
		   mean(county_loan_amount_adj)=county_loan_amount_adj
		   mean(state_loan_amount_adj)=state_loan_amount_adj
	;
run;

proc freq data=cohort_purch;
	table subprime_use*fallout*sold_to_slim;
	table subprime_institution*fallout*sold_to_slim;
	table subprime*fallout*sold_to_slim;
run;

proc freq data=sasdata.model_data_build noprint;
	where asofdate le 2007 and fallout in ('ORIGINATED','PURCHASED');
	table subprime_use*state_abrev*county_code / out=purpose_insample;
	table subprime_institution*state_abrev*county_code / out=purpose_;
run;

proc means data=cohort mean;
	class subprime_institution;
	var spread_inst_deny_purch spread_inst_deny_refi spread_inst_purch spread_inst_refi;
run;
