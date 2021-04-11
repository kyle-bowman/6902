
proc datasets lib=work nolist nodetails kill;run;quit;

/********************************************/
/*------------------------------------------*/
/* Census data
/*------------------------------------------*/
/********************************************/

%macro census_import(file,out);
data census_&out.;
    length asofdate 3 census_tract_number $ 9; 
    infile "&data_path.&file." obs=max;
    input asofdate 1-4
          msa_of_property $ 5-9
          state_code $ 10-11
          county_code $ 12-14
          census_tract_number $ 15-20
          principal_city_flag $ 21
          small_county_flag $ 22
          split_tract_flag $ 23
          urban_rural_flag $ 25
          msa_median_family_income 26-33
          msa_mdean_household_income 34-41
          msa_median_family_income_pct 42-47
          hud_median_family_income 48-55
          population 56-63
          families_population 64-71
          households_population 72-79
          female_population 80-87
          male_population 88-95
          minority_population 96-103 
          minority_percentage 104-109
          hispanic_population 302-309
          white_population 382-389
          black_population 390-397
          american_indian_population 398-405
          pacific_island_population 414-421
          other_race_population 422-429
          two_or_more_race_population 430-437
          rural_farm 582-589
          rural_non_farm 590-597
          male_householder 630-637
          female_householder 638-645
          x1 2358-2365 x2 2366-2373 x3 2374-2381 x4 2382-2389 x5 2390-2397 x6 2398-2405 x7 2406-2413 x8 2414-2421
          male_high_school_population 2422-2429 
          y1 2430-2437 y2 2438-2445
          male_assoc_deg_population 2446-2453
          male_college_population 2454-2461
          z1 2462-2469 z2 2470-2477 z3 2478-2485

          a1 2494-2501 a2 2502-2509 a3 2510-2517 a4 2518-2525 a5 2526-2533 a6 2534-2541 a7 2542-2549 a8 2550-2557
          female_high_school_population 2558-2565
          b1 2566-2573 b2 2574-2581
          female_assoc_deg_population 2582-2589
          female_college_population 2590-2597 
          c1 2598-2605 c2 2606-2613 c3 2614-2621

          avg_total_income 5894-5901
          avg_income_black 5910-5917
          avg_income_histpanic 5918-5925
          avg_income_white 5926-5933

          total_housing_units 6876-6883
          total_occupied 6948-6955
          total_vacant 6956-6963
            
          total_occupied_housing 6964-6971
          total_owner_occupied 6972-6979
          total_renter_occupied 6980-6987

          total_vacant_housing 6988-6995
          total_vacant_for_rent 6996-7003
          total_vacant_for_sale 7004-7011
          total_sold_vacant 7012-7019
          total_recreational_vacant 7020-7027

          total_mobile_homes 7116-7123
          total_1_to_4 7132-7139

    ;

    /* reclassify the 99999 from the CENSUS null definition so that we can match the LARS... */
    if msa_of_property='99999' then msa_of_property='NA';
    male_non_highschool_pop=sum(x1,x2,x3,x4,x5,x6,x7,x8);
    male_some_college_population=sum(y1,y2);
    male_post_grad_population=sum(z1,z2,z3);
    female_non_highschool_pop=sum(a1,a2,a3,a4,a5,a6,a7,a8);
    female_some_college_population=sum(b1,b2);
    female_post_grad_population=sum(c1,c2,c3);

    drop x1 x2 x3 x4 x5 x6 x7 x8 y1 y2 z1 z2 z3
         a1 a2 a3 a4 a5 a6 a7 a8 b1 b2 c1 c2 c3
    ;

run;

proc append base=census_data data=census_&out.;run;

proc datasets lib=work nolist nodetails;
    delete census_&out.;
run;quit;

%mend census_import;

proc datasets lib=work nolist nodetails;
    delete census_data;
run;quit;

%census_import(census2004_all.DAT,out=2004);
%census_import(census2005_all.DAT,out=2005);
%census_import(census2006_all.DAT,out=2006);
%census_import(census2006_all.DAT,out=2007);

/* 
for the extension, the census data in ascii format is not avaliable in later years.  2007 forward,
the census tract information was appended to the loan level lars files below.  for the purposes of this
exercise, we can truncate the variables prior down to the avaliable from the lars files.
*/

data census_data;
	set census_data;
	keep asofdate census_tract_number msa_of_property state_code county_code
		 hud_median_family_income population 
		 minority_percentage /* translates to minority_population in lars, recode to this name */
		 total_owner_occupied /* translates to total 1-4 owner occupied units */
		 total_1_to_4 /* translates to number_of_1_to_4_family_units */
	;
	rename total_1_to_4=number_of_1_to_4_family_units;
run;

/********************************************/
/*------------------------------------------*/
/* LARS data
/*------------------------------------------*/
/********************************************/

proc datasets lib=work nolist nodetails kill;run;quit;
/* Pre 2007 conversion to CSV. */
%macro lars_import(file,out);
data &out.;
    length asofdate 3 census_tract_number orig_census_tract_number $ 9 respondent_id $ 12;
    infile "&data_path.&file." obs=max;
    input asofdate 1-4
          orig_respondent_id $ 5-14
          agency_code $ 15
          loan_type $ 16
          loan_purpose $ 17
          occupancy $ 18
          c_amount_of_loan $ 19-23
          action_taken $ 24
          msa_of_property $ 25-29
          state_code $ 30-31
          county_code $ 32-34
          census_tract_number $ 35-41
          applicant_sex $ 42
          co_applicant_sex $ 43
          c_applicant_income $ 44-47
          type_of_purchaser $ 48
          denial_reason_1 $ 49
          denial_reason_2 $ 50
          denial_reason_3 $ 51
          edit_status $ 52
          property_type $ 53
          preapproval $ 54
          ethinicity $ 55
          co_ethinicity $ 56
          applicant_race $ 57
          co_applicant_race $ 62
          c_rate_spread $ 67-71
          hoepa_status $ 72
          lien_status $ 73
          sequence_number 74-80
    ;

	respondent_id=cats(orig_respondent_id,'-',agency_code);
    if anyalpha(c_applicant_income) then applicant_income=.;
    else applicant_income=input(c_applicant_income,8.)*1000;
    if anyalpha(c_amount_of_loan) then loan_amount=.;
    else loan_amount=input(c_amount_of_loan,8.)*1000;

    if c_rate_spread='NA' then rate_spread=.A;
    else if prxmatch('/\d\d\.\d\d/',c_rate_spread) ne 0 then rate_spread=input(c_rate_spread,8.);
    else rate_spread=.X;
        
    if agency_code not in ('1','2','3','4','5','6','7') then error='01';
    else if loan_type not in ('1','2','3','4') then error='02';
    else if property_type not in ('1','2','3') then error='03';
    else if loan_purpose not in ('1','2','3') then error='04';
    else if lien_status='3' and loan_purpose ne '2' then error='05';
    else if occupancy not in ('1','2','3') then error='06';
    else if coalesce(loan_amount,0) le 0 then error='07';
    else if preapproval not in ('1','2','3') then error='08';
    else if loan_purpose='1' and action_taken='6' and preapproval ne '3' then error'09';
    else if loan_purpose in ('2','3') and preapproval ne '3' then error='10';
    else if action_taken in ('7','8') and preapproval ne '1' then error='11';
    else if (   denial_reason_1 in ('1','2','3','4','5','6','7','8','9')
             or denial_reason_2 in ('1','2','3','4','5','6','7','8','9')
             or denial_reason_3 in ('1','2','3','4','5','6','7','8','9'))
             and action_taken not in ('3','7') then error='12';
    else if preapproval='1' and action_taken not in ('1','2','3','4','5','7','8') then error='13';
    else if preapproval='2' and action_taken not in ('1','2','3','4','5') then error='14';
    else if preapproval='3' and action_taken not in ('1','2','3','4','5','6') then error='15';
    else if ethinicity not in ('1','2','3','4') then error='16';
    else if co_ethinicity not in ('1','2','3','4','5') then error='17';
    else if co_ethinicity ne '5' and (co_applicant_sex='5' or co_applicant_race='8') then error='18';
    else if applicant_race not in ('1','2','3','4','5','6','7') then error='19';
    else if co_applicant_race not in ('1','2','3','4','5','6','7','8') then error='20';
    else if co_applicant_race ne '8' and (co_ethinicity='5' or co_applicant_sex='5') then error='21';
    else if applicant_sex not in ('1','2','3','4') then error='22';
    else if co_applicant_sex not in ('1','2','3','4','5') then error='23';
    else if co_applicant_sex ne '5' and (co_ethinicity='5' or co_applicant_race='8') then error='24';
    else if coalesce(applicant_income,0) lt 0 then error='25';
    else if property_type='3' and not missing(applicant_income) then error='26';
    else if type_of_purchaser not in ('0','1','2','3','4','5','6','7','8','9') then error='27';
    else if type_of_purchaser in ('1','2','3','4','5','6','7','8','9') and action_taken not in ('1','6') then error='28';
    else if type_of_purchaser='2' and loan_type not in ('2','3','4') then error='29';
    else if (agency_code in ('2','3','5','7') or agency_code in ('1','4') and action_taken not in ('3','7'))
             and 
            (   denial_reason_1 not in ('1','2','3','4','5','6','7','8','9','')
             or denial_reason_2 not in ('1','2','3','4','5','6','7','8','9','')
             or denial_reason_3 not in ('1','2','3','4','5','6','7','8','9','')) then error='30';
    else if agency_code in ('1','4') and action_taken not in ('3','7') and not missing(denial_reason_1) then error='31';
    else if action_taken in ('2','3','4','5','6','7','8') and rate_spread ne .A then error='32';
    else if action_taken in ('2','3','4','5','7','8') and hoepa_status ne '2' then error='33';
    else if hoepa_status not in ('1','2') then error='34';
    else if loan_purpose='1' and hoepa_status ne '2' then error='35';
    else if lien_status='3' and hoepa_status ne '2' then error='36';
    else if lien_status not in ('1','2','3','4') then error='37';
    else if loan_purpose in ('1','3') and lien_status not in ('1','2','4') then error='38';
    else if action_taken in ('1','2','3','4','5','7','8') and lien_status not in ('1','2','3') then error='39';
    else if action_taken='6' and lien_status ne '4' then error='40';
    /* come back to rate_spread. */
    else if lien_status='1' and (rate_spread lt 3  or rate_spread gt 99.99 or rate_spread=.X) then error='41';
    else if lien_status='2' and (rate_spread lt 5 or rate_spread gt 99.99 or rate_spread=.X) then error='42';
    else if lien_status='3' and c_rate_spread ne 'NA' then error='43';

    orig_census_tract_number=census_tract_number;
    census_tract_number=strip(compress(orig_census_tract_number,,'kd'));
    
    drop c_amount_of_loan c_applicant_income orig_respondent_id;
run;

proc append base=model_data_build data=&out.;run;

proc datasets lib=work nolist nodetails;
    delete &out.;
run;quit;

%mend lars_import;

%lars_import(f2004lar.public.dat,lars_2004);
%lars_import(LARS.FINAL.2005.DAT,lars_2005);
%lars_import(LARS.FINAL.2006.DAT,lars_2006);
/*%lars_import(lars.final.2007.dat,lars_2007);*/

%macro lars_import_csv(csv);
proc import file="&data_path.&csv."
			out=hmda_lar
			dbms=csv
			replace
			;
run;

data hmda_lar_format;
	length asofdate 3
		   census_tract_number $ 9
		   orig_census_tract_number $ 9
		   respondent_id $ 12
		   agency_code $ 1
		   loan_type $ 1
		   loan_purpose $ 1
		   occupancy $ 1
		   action_taken $ 1
		   msa_of_property $ 5
		   state_code $ 2
		   county_code $ 3
		   applicant_sex $ 1
		   co_applicant_sex $ 1
		   type_of_purchaser $ 1
		   denial_reason_1 $ 1
		   denial_reason_2 $ 1
		   denial_reason_3 $ 1
		   edit_status $ 1
		   property_type $ 1
		   preapproval $ 1
		   ethinicity $ 1
		   co_ethinicity $ 1
		   applicant_race $ 1
		   co_applicant_race $ 1
		   hoepa_status $ 1
		   lien_status  $ 1
		   sequence_number 8
		   loan_amount 8
		   loan_amount 8
		   rate_spread 8
		   c_rate_spread $ 5
	;
	set hmda_lar (obs=max
		 keep=agency_code respondent_id loan_type loan_purpose owner_occupancy loan_amount_000s action_taken
			  msamd state_code county_code census_tract_number applicant_sex co_applicant_sex
			  applicant_income_000s purchaser_type denial_reason_1 denial_reason_2 denial_reason_3 edit_status
			  property_type preapproval applicant_ethnicity co_applicant_ethnicity applicant_race_1
			  co_applicant_race_1 rate_spread hoepa_status lien_status sequence_number as_of_year
			  /* for census only */
			  hud_median_family_income number_of_1_to_4_family_units number_of_owner_occupied_units
			  minority_population population
		 rename=(sequence_number=c_sequence_number 
				 rate_spread=x_rate_spread 
			     census_tract_number=orig_census_tract_number
				 action_taken=c_action_taken
				 agency_code=c_agency_code
				 applicant_sex=c_applicant_sex
				 co_applicant_sex=c_co_applicant_sex
				 county_code=c_county_code
				 denial_reason_1=c_denial_reason_1
			     denial_reason_2=c_denial_reason_2
				 denial_reason_3=c_denial_reason_3
				 edit_status=c_edit_status
				 hoepa_status=c_hoepa_status
				 lien_status=c_lien_status
				 loan_purpose=c_loan_purpose
				 loan_type=c_loan_type
				 preapproval=c_preapproval
				 property_type=c_property_type
				 respondent_id=c_respondent_id
				 state_code=c_state_code
			  	 hud_median_family_income=c_hud_median_family_income
				 number_of_1_to_4_family_units=c_number_of_1_to_4_family_units
				 number_of_owner_occupied_units=c_total_owner_occupied
			  	 minority_population=c_minority_population
				 population=c_population
				 loan_amount_000s=c_loan_amount_000s
			));

	asofdate=input(as_of_year,8.);
	occupancy=owner_occupancy;
    if missing(c_loan_amount_000s) then loan_amount=.;
    else loan_amount=input(c_loan_amount_000s,8.)*1000;
	if missing(msamd) then msa_of_property='NA';
	else msa_of_property=msamd;
    if anyalpha(applicant_income_000s) then applicant_income=.;
	else if missing(applicant_income_000s) then applicant_income=.;
    else applicant_income=input(applicant_income_000s,8.)*1000;

	type_of_purchaser=purchaser_type;
	ethinicity=applicant_ethnicity;
	co_ethinicity=co_applicant_ethnicity;
	applicant_race=applicant_race_1;
	co_applicant_race=co_applicant_race_1;
	sequence_number=input(c_sequence_number,12.);
	/* below is needed to stop initialization warning... */
	c_rate_spread=x_rate_spread;
    if c_rate_spread='' then rate_spread=.X;
/*    else if prxmatch('/\d\d\/',c_rate_spread) ne 0 then rate_spread=input(c_rate_spread,8.);*/
	else if not missing(c_rate_spread) then rate_spread=input(c_rate_spread,8.);
    else rate_spread=.X;

    census_tract_number=strip(compress(orig_census_tract_number,,'kd'));

	/* renamed to conicide with lengths... */
	action_taken=c_action_taken;
	agency_code=c_agency_code;
	applicant_sex=c_applicant_sex;
	co_applicant_sex=c_co_applicant_sex;
	if missing(c_county_code) then county_code='';
	else if length(c_county_code)=1 then county_code=cats('00',c_county_code);
	else if length(c_county_code)=2 then county_code=cats('0',c_county_code);
	else county_code=c_county_code;
	denial_reason_1=c_denial_reason_1;
	denial_reason_2=c_denial_reason_2;
	denial_reason_3=c_denial_reason_3;
	edit_status=c_edit_status;
	hoepa_status=c_hoepa_status;
	lien_status=c_lien_status;
	loan_purpose=c_loan_purpose;
	loan_type=c_loan_type;
	preapproval=c_preapproval;
	property_type=c_property_type;
	respondent_id=c_respondent_id;
	respondent_id=cats(respondent_id,'-',agency_code);
	if missing(c_state_code) then state_code='';
	else if length(c_state_code)=1 then state_code=cats('0',c_state_code);
	else state_code=c_state_code;


    if agency_code not in ('1','2','3','4','5','6','7') then error='01';
    else if loan_type not in ('1','2','3','4') then error='02';
    else if property_type not in ('1','2','3') then error='03';
    else if loan_purpose not in ('1','2','3') then error='04';
    else if lien_status='3' and loan_purpose ne '2' then error='05';
    else if occupancy not in ('1','2','3') then error='06';
    else if coalesce(loan_amount,0) le 0 then error='07';
    else if preapproval not in ('1','2','3') then error='08';
    else if loan_purpose='1' and action_taken='6' and preapproval ne '3' then error'09';
    else if loan_purpose in ('2','3') and preapproval ne '3' then error='10';
    else if action_taken in ('7','8') and preapproval ne '1' then error='11';
    else if (   denial_reason_1 in ('1','2','3','4','5','6','7','8','9')
             or denial_reason_2 in ('1','2','3','4','5','6','7','8','9')
             or denial_reason_3 in ('1','2','3','4','5','6','7','8','9'))
             and action_taken not in ('3','7') then error='12';
    else if preapproval='1' and action_taken not in ('1','2','3','4','5','7','8') then error='13';
    else if preapproval='2' and action_taken not in ('1','2','3','4','5') then error='14';
    else if preapproval='3' and action_taken not in ('1','2','3','4','5','6') then error='15';
    else if ethinicity not in ('1','2','3','4') then error='16';
    else if co_ethinicity not in ('1','2','3','4','5') then error='17';
    else if co_ethinicity ne '5' and (co_applicant_sex='5' or co_applicant_race='8') then error='18';
    else if applicant_race not in ('1','2','3','4','5','6','7') then error='19';
    else if co_applicant_race not in ('1','2','3','4','5','6','7','8') then error='20';
    else if co_applicant_race ne '8' and (co_ethinicity='5' or co_applicant_sex='5') then error='21';
    else if applicant_sex not in ('1','2','3','4') then error='22';
    else if co_applicant_sex not in ('1','2','3','4','5') then error='23';
    else if co_applicant_sex ne '5' and (co_ethinicity='5' or co_applicant_race='8') then error='24';
    else if coalesce(applicant_income,0) lt 0 then error='25';
    else if property_type='3' and not missing(applicant_income) then error='26';
    else if type_of_purchaser not in ('0','1','2','3','4','5','6','7','8','9') then error='27';
    else if type_of_purchaser in ('1','2','3','4','5','6','7','8','9') and action_taken not in ('1','6') then error='28';
    else if type_of_purchaser='2' and loan_type not in ('2','3','4') then error='29';
    else if (agency_code in ('2','3','5','7') or agency_code in ('1','4') and action_taken not in ('3','7'))
             and 
            (   denial_reason_1 not in ('1','2','3','4','5','6','7','8','9','')
             or denial_reason_2 not in ('1','2','3','4','5','6','7','8','9','')
             or denial_reason_3 not in ('1','2','3','4','5','6','7','8','9','')) then error='30';
    else if agency_code in ('1','4') and action_taken not in ('3','7') and not missing(denial_reason_1) then error='31';
    else if action_taken in ('2','3','4','5','6','7','8') and rate_spread ne .X then error='32';
    else if action_taken in ('2','3','4','5','7','8') and hoepa_status ne '2' then error='33';
    else if hoepa_status not in ('1','2') then error='34';
    else if loan_purpose='1' and hoepa_status ne '2' then error='35';
    else if lien_status='3' and hoepa_status ne '2' then error='36';
    else if lien_status not in ('1','2','3','4') then error='37';
    else if loan_purpose in ('1','3') and lien_status not in ('1','2','4') then error='38';
    else if action_taken in ('1','2','3','4','5','7','8') and lien_status not in ('1','2','3') then error='39';
    else if action_taken='6' and lien_status ne '4' then error='40';
    /* come back to rate_spread. */
    else if lien_status='1' and (rate_spread lt 3  or rate_spread gt 99.99 or rate_spread=.X) then error='41';
    else if lien_status='2' and (rate_spread lt 5 or rate_spread gt 99.99 or rate_spread=.X) then error='42';
    else if lien_status='3' and c_rate_spread ne 'NA' then error='43';
	
	/* for census data... */
	if missing(c_hud_median_family_income) then hud_median_family_income=.;
	else hud_median_family_income=input(c_hud_median_family_income,8.);
	if missing(c_number_of_1_to_4_family_units) then number_of_1_to_4_family_units=.;
	else number_of_1_to_4_family_units=input(c_number_of_1_to_4_family_units,8.);
	if missing(c_total_owner_occupied) then total_owner_occupied=.;
	else total_owner_occupied=input(c_total_owner_occupied,8.);
	if missing(c_minority_population) then minority_population=.;
	else minority_population=input(c_minority_population,8.);
	if missing(c_population) then population=.;
	else population=input(c_population,8.);

	keep  asofdate respondent_id agency_code loan_type loan_purpose action_taken msa_of_property state_code county_code 
          census_tract_number applicant_sex co_applicant_sex denial_reason_1 denial_reason_2 denial_reason_3 
          edit_status property_type preapproval ethinicity co_ethinicity applicant_race co_applicant_race 
          hoepa_status lien_status sequence_number orig_census_tract_number
		  error occupancy loan_amount msa_of_property applicant_income rate_spread
		  type_of_purchaser c_rate_spread

		  /* drop for append */

		  hud_median_family_income number_of_1_to_4_family_units total_owner_occupied
		  minority_population population
	;
run;

proc append base=model_data_build 
			data=hmda_lar_format (drop=hud_median_family_income number_of_1_to_4_family_units total_owner_occupied
		  							   minority_population population)
	;
run;

/* before deleting the formatted data... run it through a proc means, agg on asofdate census_tract_number
   msa_of_property state_code county_code
*/

proc means data=hmda_lar_format noprint nway missing;
	class asofdate census_tract_number msa_of_property state_code county_code;
	output out=census_agg (drop=_type_ _freq_)
		   mean(hud_median_family_income)=hud_median_family_income
		   mean(number_of_1_to_4_family_units)=number_of_1_to_4_family_units
		   mean(total_owner_occupied)=total_owner_occupied
		   mean(minority_population)=minority_percentage
		   mean(population)=population
	;
run;

proc append base=census_data data=census_agg;run;

proc datasets lib=work nolist nodetails;
	delete hmda_lar hmda_lar_format census_agg;
run;quit;

%mend;

%lars_import_csv(hmda_lar_2007.csv);
%lars_import_csv(hmda_lar_2008.csv);
%lars_import_csv(hmda_lar_2009.csv);
%lars_import_csv(hmda_lar_2010.csv);
%lars_import_csv(hmda_lar_2011.csv);
%lars_import_csv(hmda_lar_2012.csv);
%lars_import_csv(hmda_lar_2013.csv);
%lars_import_csv(hmda_lar_2014.csv);
%lars_import_csv(hmda_lar_2015.csv);
%lars_import_csv(hmda_lar_2016.csv);
%lars_import_csv(hmda_lar_2017.csv);

proc sort data=model_data_build;by asofdate state_code county_code;run;

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

data sasdata.model_data_build (sortedby=asofdate state_code county_code);
	length asofdate 3 respondent_id $ 12 state_code $ 2 county_code $ 3
		   institution_name $ 100 subprime_institution subprime subprime_use 3
			;
	if _n_=1 then do;
		declare hash inst(dataset:'sasdata.investor_list');
			inst.definekey('asofdate','respondent_id');
			inst.definedata('institution_name','subprime_institution','subprime');
			inst.definedone();
		call missing(institution_name,subprime_institution,subprime);
	end;
	merge model_data_build (in=mb)
		  attritubes (in=at)
	;
	by asofdate state_code county_code;
	if mb;

	rc=inst.find();

    length purpose $ 8
           race $ %length(Other/NA Female)
           fallout $ %length(INSTITUTION DENIED)
		   sold_to sold_to_slim $ %length(INSURANCE/MORTGAGE BANK)
		   lien $ 1
		   race_2 $ 8 
		   sex $ 6
		   state_abrev $ 2 
		   division $ 10 
		   region $ 10
		   sand_state $ 1
    ;

    if missing(subprime) then subprime=0;

    if loan_purpose in ('2','3') then purpose='REFI';
    else if loan_purpose='1' then purpose='PURCHASE';

	lien=lien_status;
	if lien='3' then lien='2';

    if action_taken in ('2','4','5','8') then fallout='BORROWER FALLOUT';
    else if action_taken in ('3','7') then fallout='INSTITUTION DENIED';
    else if action_taken='6' then fallout='PURCHASED'; *** remove this one...;
    else if action_taken='1' then fallout='ORIGINATED';

	if fallout='ORIGINATED' then do;
		if type_of_purchaser in ('0','8') then sold_to='HELD FOR INVESTMENT';
		else if type_of_purchaser='1' then sold_to='FNMA';
		else if type_of_purchaser='2' then sold_to='GNMA';
		else if type_of_purchaser='3' then sold_to='FHLMC';
		else if type_of_purchaser='4' then sold_to='Farmer Mac';
		else if type_of_purchaser in ('5') then sold_to='PRIVATE SECURITY';
		else if type_of_purchaser='6' then sold_to='COMMERCIAL BANK';
		else if type_of_purchaser='7' then sold_to='INSURANCE/MORTGAGE BANK';
		else if type_of_purchaser='9' then sold_to='OTHER';

		if sold_to in ('FNMA','FNMA','GNMA','FHLMC','Farmer Mac') then sold_to_slim='GSE';
		else sold_to_slim=sold_to;
	end;

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

	if find(race,'Asian') ne 0 then race_2='Asian';
	else if find(race,'Black') ne 0 then race_2='Black';
	else if find(race,'Hispanic') ne 0 then race_2='Hispanic';
	else if find(race,'White') ne 0 then race_2='White';
	else race_2='Other';
	if find(race,'Male') ne 0 then sex='Male';
	else if find(race,'Female') ne 0 then sex='Female';
	else sex='Other';

	if state_code='01' then state_abrev='AL'; 
	else if state_code='02' then state_abrev='AK'; 
	else if state_code='04' then state_abrev='AZ'; 
	else if state_code='05' then state_abrev='AR'; 
	else if state_code='06' then state_abrev='CA'; 
	else if state_code='08' then state_abrev='CO'; 
	else if state_code='09' then state_abrev='CT'; 
	else if state_code='10' then state_abrev='DE'; 
	else if state_code='11' then state_abrev='DC'; 
	else if state_code='12' then state_abrev='FL'; 
	else if state_code='13' then state_abrev='GA'; 
	else if state_code='15' then state_abrev='HI'; 
	else if state_code='16' then state_abrev='ID'; 
	else if state_code='17' then state_abrev='IL'; 
	else if state_code='18' then state_abrev='IN'; 
	else if state_code='19' then state_abrev='IA'; 
	else if state_code='20' then state_abrev='KS'; 
	else if state_code='21' then state_abrev='KY'; 
	else if state_code='22' then state_abrev='LA'; 
	else if state_code='23' then state_abrev='ME'; 
	else if state_code='24' then state_abrev='MD'; 
	else if state_code='25' then state_abrev='MA'; 
	else if state_code='26' then state_abrev='MI'; 
	else if state_code='27' then state_abrev='MN'; 
	else if state_code='28' then state_abrev='MS'; 
	else if state_code='29' then state_abrev='MO'; 
	else if state_code='30' then state_abrev='MT'; 
	else if state_code='31' then state_abrev='NE'; 
	else if state_code='32' then state_abrev='NV'; 
	else if state_code='33' then state_abrev='NH'; 
	else if state_code='34' then state_abrev='NJ'; 
	else if state_code='35' then state_abrev='NM'; 
	else if state_code='36' then state_abrev='NY'; 
	else if state_code='37' then state_abrev='NC'; 
	else if state_code='38' then state_abrev='ND'; 
	else if state_code='39' then state_abrev='OH'; 
	else if state_code='40' then state_abrev='OK'; 
	else if state_code='41' then state_abrev='OR'; 
	else if state_code='42' then state_abrev='PA'; 
	else if state_code='44' then state_abrev='RI'; 
	else if state_code='45' then state_abrev='SC'; 
	else if state_code='46' then state_abrev='SD'; 
	else if state_code='47' then state_abrev='TN'; 
	else if state_code='48' then state_abrev='TX'; 
	else if state_code='49' then state_abrev='UT'; 
	else if state_code='50' then state_abrev='VT'; 
	else if state_code='51' then state_abrev='VA'; 
	else if state_code='53' then state_abrev='WA'; 
	else if state_code='54' then state_abrev='WV'; 
	else if state_code='55' then state_abrev='WI'; 
	else if state_code='56' then state_abrev='WY'; 
	else if state_code='64' then state_abrev='FM'; 
	else if state_code='66' then state_abrev='GU'; 
	else if state_code='68' then state_abrev='MH'; 
	else if state_code='69' then state_abrev='MP'; 
	else if state_code='70' then state_abrev='PW'; 
	else if state_code='72' then state_abrev='PR'; 
	else if state_code='78' then state_abrev='VI'; 

	if state_abrev in ('CT','ME','MA','NH','RI','VT') then division='Division 1';
	else if state_abrev in ('NJ','NY','PA') then division='Division 2';
	else if state_abrev in ('IL','IN','MI','OH','WI') then division='Division 3';
	else if state_abrev in ('IA','KS','MN','MO','NE','ND','SD') then division='Division 4';
	else if state_abrev in ('DE','FL','GA','MD','NC','SC','VA','DC','WV') then division='Division 5';
	else if state_abrev in ('AL','KY','MS','TN') then division='Division 6';
	else if state_abrev in ('AR','LA','OK','TX') then division='Division 7';
	else if state_abrev in ('AZ','CO','ID','MT','NV','NM','UT','WY') then division='Division 8';
	else if state_abrev in ('AK','CA','HI','OR','WA') then division='Division 9';

	if division in ('Division 1','Division 2') then region='North East';
	else if division in ('Division 3','Division 4') then region='Mid West';
	else if division in ('Division 5','Division 6','Division 7') then region='South';
	else if division in ('Division 8','Division 9') then region='West';

	if state_abrev in ('NV','AZ','CA','FL') then sand_state='Y';
	else sand_state='N';

	if institution_name in (
							'WORLD SAVINGS BANK (GOLDEN WEST)',
							'WASHINGTON MUTUAL',
							'RESMAE MORTGAGE CORPORATION',
							'INDYMAC',
							'E*TRADE BANK',
							'DELTA FUNDING CORPORATION',
							'AMERIQUEST MORTGAGE COMPANY',
							'AEGIS LENDING CORPORATION')
		then subprime_use=1;
	else subprime_use=0;

    county_loan_amount_adj=loan_amount*county_hpi_growth;
    state_loan_amount_adj=loan_amount*state_hpi_growth;
    spread_loan_amount=county_loan_amount_adj-state_loan_amount_adj;
    applicant_income_adj=applicant_income*cpiaucsl_nat_200101_pct;

	label county_loan_amount_adj='Loan Amount Adjusted for County HPI Growth, 2001=0'
		  state_loan_amount_adj='Loan Amount Adjusted for State HPI Growth, 2001=0'
		  spread_loan_amount='Spread between County Adjusted Loan Amount and State Adjusted Loan Amount'
		  applicant_income_adj='Applicant Income Adjusted for CPI, 2001=0'
	;		  

    random=ranuni(28104);

	drop rc;

run;

proc means data=sasdata.model_data_build noprint nway missing;
    where fallout='ORIGINATED' and not missing(loan_amount);
/*    where fallout in ('ORIGINATED','PURCHASED') and not missing(loan_amount);*/
    class asofdate state_code county_code;
    var spread_loan_amount;
    output out=loan_amount p20(spread_loan_amount)=p20_spread_loan
                           p40(spread_loan_amount)=p40_spread_loan
                           p60(spread_loan_amount)=p60_spread_loan
                           p80(spread_loan_amount)=p80_spread_loan
    ;
run;
proc means data=sasdata.model_data_build noprint nway missing;
    where fallout='ORIGINATED' and coalesce(applicant_income,9999) ne 9999;
    class asofdate state_code;
    var applicant_income_adj;
    output out=state_income mean(applicant_income_adj)=st_applicant_income_mean median(applicant_income_adj)=st_applicant_income_med;
run;
proc freq data=sasdata.model_data_build noprint;
    where fallout='ORIGINATED';
    table asofdate*state_code*county_code*sold_to*sold_to_slim / out=sold;
run;
proc means data=sasdata.model_data_build noprint nway missing;
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

/* add sold crap here... */
data sold_combine;
	set sold;
	if sold_to_slim='PRIVATE SECURITY' then sold_to_slim='OTHER';
run;
proc means data=sold_combine nway noprint missing;
	class asofdate state_code sold_to_slim;
	var count;
	output out=sold_state (drop=_type_ _freq_) sum(count)=st_sold_count;
run;
proc means data=sold_combine nway noprint missing;
	class asofdate state_code county_code sold_to_slim;
	var count;
	output out=sold_county (drop=_type_ _freq_) sum(count)=cnt_sold_count;
run;

proc means data=approval_denial noprint nway missing;
	where fallout='ORIGINATED';
	class asofdate state_code;
	var count;
	output out=originated_state_total (drop=_type_ _freq_) sum(count)=state_total;
run;
proc means data=approval_denial noprint nway missing;
	where fallout='ORIGINATED';
	class asofdate state_code county_code;
	var count;
	output out=originated_county_total (drop=_type_ _freq_) sum(count)=county_total;
run;

/*data sold_county;*/
/*	merge originated_county_total*/
/*		  sold_county (in=sc)*/
/*	;*/
/*	by asofdate state_code county_code;*/
/*	if sc;*/
/*run;*/
/*data sold_state;*/
/*	merge originated_state_total*/
/*		  sold_state (in=st)*/
/*	;*/
/*	by asofdate state_code;*/
/*	if st;*/
/*run;*/
/**/
/*proc sort data=sold_county;by asofdate state_code sold_to_slim county_code;run;*/
/**/
/*data sold_combined;*/
/*	merge sold_county sold_state;*/
/*	by asofdate state_code sold_to_slim;*/
/*	weight=divide(county_total,state_total);*/
/*	wgt_county_count=cnt_sold_count*weight;*/
/*	county_ratio=divide(cnt_sold_count,county_total)*weight;*/
/*	state_ratio=divide(st_sold_count,state_total);*/
/*run;*/
/**/
/*proc sort data=sold_combined;by asofdate state_code county_code sold_to_slim;run;*/
/**/
/*data sold_comined;*/
/*	set sold_combined;*/
/**/
/*    retain spread_borr_fall_purch spread_borr_fall_refi*/
/*           spread_inst_deny_purch spread_inst_deny_refi*/
/*           spread_orig_purch spread_orig_refi*/
/*		   spread_inst_purch spread_inst_refi*/
/*    ;*/
/**/
/*    if first.county_code then call missing(spread_borr_fall_purch,spread_borr_fall_refi,*/
/*                                           spread_inst_deny_purch,spread_inst_deny_refi,*/
/*                                           spread_orig_purch,spread_orig_refi,*/
/*										   spread_inst_purch,spread_inst_refi)*/
/*    ;*/
/**/
/*    if purpose='PURCHASE' then do;*/
/*        if fallout='BORROWER FALLOUT' then spread_borr_fall_purch=county_ratio-state_ratio;*/
/*        else if fallout='INSTITUTION DENIED' then spread_inst_deny_purch=county_ratio-state_ratio;*/
/*        else if fallout='ORIGINATED' then spread_orig_purch=county_ratio-state_ratio;*/
/*		else if fallout='PURCHASED' then spread_inst_purch=county_ratio-state_ratio;*/
/*    end;*/
/*    else if purpose='REFI' then do;*/
/*        if fallout='BORROWER FALLOUT' then spread_borr_fall_refi=county_ratio-state_ratio;*/
/*        else if fallout='INSTITUTION DENIED' then spread_inst_deny_refi=county_ratio-state_ratio;*/
/*        else if fallout='ORIGINATED' then spread_orig_refi=county_ratio-state_ratio;*/
/*		else if fallout='PURCHASED' then spread_inst_refi=county_ratio-state_ratio;*/
/*    end;*/
/**/
/*    if last.county_code;*/
/**/
/*    keep asofdate state_code county_code*/
/*         spread_borr_fall_purch spread_borr_fall_refi*/
/*         spread_inst_deny_purch spread_inst_deny_refi*/
/*         spread_orig_purch spread_orig_refi*/
/*		 spread_inst_purch spread_inst_refi*/
/*    ;*/

	


data stacked_originations;
    merge sasdata.model_data_build (in=m where=(fallout='ORIGINATED'))
/*    merge sasdata.model_data_build (in=m where=(fallout in ('ORIGINATED','PURCHASED')))*/
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

data sasdata.originations_model (sortedby=asofdate state_code county_code);
    merge stacked_originations income_spread;
    by asofdate state_code county_code;

    length bin_income_spread 3 hmda_high_price 3;
    if missing(applicant_income) or applicant_income=9999 then bin_income_spread=0;
    else if spread_income le p20_spread_income then bin_income_spread=1;
    else if spread_income le p40_spread_income then bin_income_spread=2;
    else if spread_income le p60_spread_income then bin_income_spread=3;
    else if spread_income le p80_spread_income then bin_income_spread=4;
    else if spread_income gt p80_spread_income then bin_income_spread=5;

	length sort 3;
	if sold_to_slim='HELD FOR INVESTMENT' then sort=1;
	else if sold_to_slim='GSE' then sort=2;
	else sort=3;

    if lien_status='1' and rate_spread ge 3 then hmda_high_price=1;
    else if lien_status='2' and rate_spread ge 5 then hmda_high_price=1;
    else hmda_high_price=0;
run;

data sasdata.originations_model (sortedby=asofdate state_code county_code);
	set sasdata.originations_model;

	length test_subprime 3;
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

data sasdata.originations_model (sortedby=asofdate state_code county_code);
/*data h (sortedby=asofdate state_code county_code);*/
	length asofdate 3 respondent_id $ 12 hud_subprime 3;
	if _n_=1 then do;
		declare hash hud(dataset:'sasdata.hud_subprime_investor');
			hud.definekey('asofdate','respondent_id');
			hud.definedone();
			call missing(respondent_id,asofdate);
	end;
	set sasdata.originations_model;

	rc_hud=hud.check();
	if rc_hud=0 then hud_subprime=1;
	else hud_subprime=0;
run;

proc sql;
	create table sasdata.originations_model_random as
		select
			asofdate
		,	state_code
		,	county_code
		,	respondent_id
		,	sequence_number
		,	sort
		,	institution_name
		,	subprime
		,	hmda_high_price
		,	hud_subprime
		,	subprime_institution
		,	subprime_use
		,	test_subprime
		,	sold_to
		,	sold_to_slim
		,	purpose
	    ,   race_2
		,	sex
		,	preapproval
	    ,   lien
		,	bin_income_spread
		,	bin_loan
	    ,   spread_equifax_population
	    ,   spread_ruc
	    ,   spread_1_to_4_units 
		,	spread_5plus_units
	    ,   spread_borr_fall_refi
	    ,   spread_inst_deny_purch 
	    ,   spread_inst_deny_refi
		,	spread_inst_purch 
		,	spread_inst_refi
		,	spread_population
		,	spread_peaa
		,	spread_pua0t17
		,	spread_pua5t17
		,	spread_median_ppsft_hpiadj
		,	random
	from sasdata.originations_model
	where asofdate between 2004 and 2007
	order by
		random
;quit;

    if lien_status='1' and rate_spread ge 3 then hmda_high_price='1';
    else if lien_status='2' and rate_spread ge 5 then hmda_high_price='1';
    else hmda_high_price='0';
