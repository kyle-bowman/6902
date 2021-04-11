proc format;
	value $ loan_type 
		'1'='Conventional (any loan other than FHA, VA or FmHA loans)'
		'2'='FHA-insured (Federal Housing Administration)'
		'3'='VA-guranteed (Veterans Administration)'
		'4'='Farm Service Agency and the Rural Housing Service'
	;
	value $ action_taken
		'1'='Loan originated'
		'2'='Application approved but not accepted'
		'3'='Application denied by financial institution'
		'4'='Application withdrawn by applicant'
		'5'='File closed for incompleteness'
		'6'='Loan purchased by your institution'
		'7'='Preapproval request denied by financial institution'
		'8'='Preapproval request approved but not accepted (optional reporting)'
	;
	value $ type_of_purchaser
		'0'='Loan was not originated or was not sold in calendar year'
		'1'='Fannie Mae'
		'2'='Ginnie Mae'
		'3'='Freddie Mac'
		'4'='Farmer Mac'
		'5'='Private Securitization'
		'6'='Commercial bank, savings bank or savings association'
		'7'='Life insurance company, credit union, mortgage bank or finance company'
		'8'='Affiliate institution'
		'9'='Other type of purchaser'
	;
	value $ property_type
		'1'='One to four-family'
		'2'='Manufactured housing'
		'3'='Multifamily'
	;
	value $ ethinicity
		'1'='Hispanic or Latino'
		'2'='Not Hispanic or Latino'
		'3'='Information not provided'
		'4'='Not applicable'
		'5'='No-co-applicant'
	;
	value $ denial_reason
		'1'='Debt-to-income ratio'
		'2'='Employment history'
		'3'='Credit history'
		'4'='Collateral'
		'5'='Insufficient cash (down-payment, closing costs)'
		'6'='Unverifiable information'
		'7'='Credit application denied'
		'8'='Mortgage insurance denied'
		'9'='Other'
	;
	value $ loan_purpose
		'1'='Home Purchase'
		'2'='Home improvement'
		'3'='Refinancing'
	;
	value $ race
		'1'='American Indian or Alaskan Native'
		'2'='Asian'
		'3'='Black'
		'4'='Hawaiian or Pacific Islander'
		'5'='White'
		'6'='Information not provided'
		'7'='Not applicable'
		'8'='No co-applicant'
	;
	value $ hoepa_status /* only for loans originated or purchases */
		'1'='HOEPA loan'
		'2'='Not a HOEPA loan'
	;
	value $ occupancy
		'1'='Owner-occupied as a principal dwelling'
		'2'='Not owner-occupied'
		'3'='Not applicable'
	;
	value $ sex
		'1'='Male'
		'2'='Female'
		'3'='Information not provided'
		'4'='Not applicable'
		'5'='No co-applicant'
	;
	value $ lien_status
		'1'='Secured by first lien'
		'2'='Secured by a subordinate lien'
		'3'='Not secured by a lien'
		'4'='Not applicable (purchased loans)'
	;
	value $ preapproval
		'1'='Preapproval was requested'
		'2'='Preapproval was not requested'
		'3'='Not applicable'
	;
	value $ error
		'01'='Agency_code not in 1,2,3,4,5,6,7'
		'02'='Loan_type not in 1,2,3,4'
		'03'='Property_type not in 1,2,3'
		'04'='Loan_purpose not in 1,2,3'
		'05'='Illogical, lien_status=3 and loan_purpose ne 2'
		'06'='Occupancy not in 1,2,3'
		'07'='Loan_amount must be gt 0 or not missing'
		'08'='Preapproval not in 1,2,3'
		'09'='Illogical, loan_purpose=1 and action_taken=6 and preapproval ne 3'
		'10'='Illogical, loan_purpose in (2,3) and preapproval ne 3'
		'11'='Illogical, action_taken in (7,8) and preapproval ne 1'
		'12'='Illogical, Denial_reasons_1-3 not matching action_taken'
		'13'='Illogical, preapproval=1 and action_taken not in (1,2,3,4,5,7,8)'
		'14'='Illogical, preapproval=2 and action_taken not in (1,2,3,4,5)'
		'15'='Illogical, preapproval=3 and action_taken not in (1,2,3,4,5,6)'
		'16'='Illogical, ethnicity not in (1,2,3,4)'
		'17'='Illogical, co_ethnicity not in (1,2,3,4,5)'
		'18'='Illogical, co_ethnicity ne 5 and (co_applicant_sex=5 or co_applicant_race=8)'
		'19'='Illogical, applicant_race not in (1,2,3,4,5,6,7)'
		'20'='Illogical, co_applicant_race not in (1,2,3,4,5,6,7,8)'
		'21'='Illogical, co_applicant_race ne 8 and (co_ethnicity=5 or co_applicant_sex=5)'
		'22'='Illogical, applicant_sex not in (1,2,3,4)'
		'23'='Illogical, co_applicant_sex not in (1,2,3,4,5)'
		'24'='Illogical, co_applicant_sex ne 5 and (co_ethnicity=5 or co_applicant_race=8)'
		'25'='Illogical, applicant_inocme is negative or 0'
		'26'='Illogical, property_type=3 and not missing(applicant_income)'
		'27'='Illogical, type_of_purchaser not in (0,1,2,3,4,5,6,7,8,9)'
		'28'='Illogical, type_of_purchaser in (1,2,3,4,5,6,7,8,9) and action_taken not in (1,6)'
		'29'='Illogical, type_of_purchaser=2 and loan_type not in (2,3,4)'
		'30'='Illogical, agency_code and denial reasons'
		'31'='Illogical, agency_code in (1,4) and action_taken not in (3,7) and not missing(denial_reason_1)'
		'32'='Illogical, action_taken in (2,3,4,5,6,7,8) and rate_spread ne .A'
		'33'='Illogical, action_taken in (2,3,4,5,7,8) and hoepa_status ne 2'
		'34'='Illogical, hoepa_status not in (1,2)'
		'35'='Illogical, loan_purpose=1 and hoepa_status ne 2'
		'36'='Illogical, lien_status=3 and hoepa_status ne 2'
		'37'='Illogical, loan_status not in (1,2,3,4)'
		'38'='Illogical, loan_purpose in (1,3) and lien_status not in (1,2,4)'
		'39'='Illogical, action_taken in (1,2,3,4,5,7,8) and lien_status not in (1,2,3)'
		'40'='Illogical, action_taken=6 and lien_status ne 4'
		'41'='Illogical, lien_status=1 and (rate_spread not between 3 and 99.99 or rate_spread=.X)'
		'42'='Illogical, lien_status=2 and (rate_spread not between 5 and 99.99 or rate_spread=.X)'
		'43'='Illogical, lien_status=3 and rate_spread ne .A'
	;
	value $ principal_city_flag
		'0'='Not principal city tract'
		'1'='Principal city tract'
	;
	value $ small_county_flag
		'T'='Tracted county'
		'S'='Small county'
		'I'='Island'
	;
	value $ split_tract_flag
		'N'='Tract in one MSA'
		'S'='Tract Split (New England Only)'
	;
	value $ urban_rural_flag
		'U'='Urban'
		'R'='Rural'
		'M'='Mixed'
		'I'='Island'
	;

run;
