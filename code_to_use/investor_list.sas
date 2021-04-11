libname sasdata "&sasdata.";

/*
locaation: 
https://www.ffiec.gov/hmdaadwebreport/DisHomeOffice.aspx?ParmCatalog=Hmda

reference python file, institution_list.py

Wikipedia, aquired banks during the crisis:
https://en.wikipedia.org/wiki/List_of_banks_acquired_or_bankrupted_during_the_Great_Recession

More classifications of investors that were primarily subprime...
https://en.wikipedia.org/wiki/List_of_entities_involved_in_2007%E2%80%9308_financial_crises

*/
data sasdata.investor_list;
	infile "&data_path.institution_list.txt" dsd dlm=',' firstobs=2;
	length asofdate 3 state $ 30 string $ 200 state_code 3 respondent_id $ 12 orig_institution $ 100 institution $ 100;
	input asofdate state string;

	state_code=input(substr(state,1,2),3.);
	orig_institution=strip(substr(string,anyspace(string),length(string)));
	respondent_id=strip(substr(string,1,anyspace(string)));

	institution=strip(substr(strip(orig_institution),1,prxmatch('/\([A-Z][A-Z]\)$/',strip(orig_institution))));


	drop state string;

/*	orig_respondent_id=respondent_id;*/
/*	respondent_id=substr(orig_respondent_id,1,10);*/
	state=substr(strip(orig_institution),prxmatch('/\([A-Z][A-Z]\)/',strip(orig_institution)),4);
	length inst1 institution_name $ 100;
	inst1=tranwrd(strip(orig_institution),strip(state),'');
	state_abrev=compress(state,,'ka');

	if substr(inst1,1,15)='WELLS FARGO FIN' then inst1='WELLS FARGO FINL';

/*
https://en.wikipedia.org/wiki/List_of_banks_acquired_or_bankrupted_during_the_Great_Recession
*/

	length subprime_institution 3;
	if find(inst1,'OWNIT MORTGAGE SOLUTIONS') ne 0 then subprime_institution=1;
	/* https://en.wikipedia.org/wiki/American_Freedom_Mortgage */
	else if find(inst1,'AMERICAN FREEDOM MORTGAGE') ne 0 then subprime_institution=1;
	/* https://en.wikipedia.org/wiki/New_Century*/
	else if find(inst1,'NEW CENTURY') ne 0 then subprime_institution=1;
	else if find(inst1,'HOME123') ne 0 then subprime_institution=1;
	/* https://en.wikipedia.org/wiki/American_Home_Mortgage */
	else if find(inst1,'AMERICAN HOME MORTGAGE') ne 0 then subprime_institution=1;
	/* https://en.wikipedia.org/wiki/Ameriquest_Mortgage */
	else if find(inst1,'AMERIQUEST MORTGAGE') ne 0 then subprime_institution=1;
	/* https://en.wikipedia.org/wiki/NetBank */
	else if find(inst1,'NETBANK') ne 0 then subprime_institution=1;
	/* REVIEW: https://en.wikipedia.org/wiki/Bear_Stearns Careful, this is an AZ Residential Mortgage. */
	else if find(inst1,'BEAR STEARNS') ne 0 then subprime_institution=1;
	/* REVIEW: https://en.wikipedia.org/wiki/Bank_of_America_Home_Loans, lots of noise. */
	else if find(inst1,'COUNTRYWIDE') ne 0 then subprime_institution=1;
	else if find(inst1,'INDYMAC') ne 0 then subprime_institution=1;
	/* https://en.wikipedia.org/wiki/Silver_State_Bank */
	else if find(inst1,'SILVER STATE BANK') ne 0 then subprime_institution=1;
	else if find(inst1,'SILVER STATE HOME FINANCIAL') ne 0 then subprime_institution=1;
	else if find(inst1,'SILVER STATE FINANCIAL SERVICE') ne 0 then subprime_institution=1;
	/* FHLMC and FNMA is not contained here, odd... */
	/* https://en.wikipedia.org/wiki/Washington_Mutual */
	else if find(inst1,'WASHINGTON MUTUAL BANK') ne 0 then subprime_institution=1;
	/* REVIEW, messy, golden west is the key issue here, https://en.wikipedia.org/wiki/Wachovia
	   https://en.wikipedia.org/wiki/Golden_West_Financial
	   Golden West went under the name of WORLD SAVINGS BANK, once Wachovia Purchased they called it WACHOVIA MORTGAGE FSB*/
/*	else if find(inst1,'WACHOVIA') ne 0 then subprime_institution=1;*/
	else if inst1='WACHOVIA MORTGAGE FSB' then subprime_institution=1;
	else if inst1='WORLD SAVINGS BANK' then subprime_institution=1;
	else if find(inst1,'GOLDENWESTFUNDING:01-06/2006') ne 0 then subprime_institution=1;
	else if find(inst1,'GOLDEN WEST FUNDING') ne 0 then subprime_institution=1;
	else if find(inst1,'WESTERN FINANCIAL BANK') ne 0 then subprime_institution=1;
	else if find(inst1,'SOUTH TRUST BANK') ne 0 then subprime_institution=1;
	else if find(inst1,'SOUTH TRUST MORTGAGE') ne 0 then subprime_institution=1;
	/* https://en.wikipedia.org/wiki/Santander_Bank#History */
	else if find(inst1,'SOVEREIGN BANK') ne 0 and state_abrev='PA' then subprime_institution=1;
	/* https://en.wikipedia.org/wiki/National_City_Corp. */
	else if substr(inst1,1,%length(NATIONAL CITY BANK))='NATIONAL CITY BANK' then subprime_institution=1;
	else if substr(inst1,1,%length(NATIONAL CITY MORTGAGE))='NATIONAL CITY MORTGAGE' then subprime_institution=1;

	/* REVIEW Hard to handle, https://en.wikipedia.org/wiki/Commerce_Bancorp */

	/* https://en.wikipedia.org/wiki/IndyMac */
	else if find(inst1,'INDYMAC') ne 0 then subprime_institution=1;
	/* no linke. */
	else if inst1='DOWNEY SAVINGS AND LOAN' then subprime_institution=1;
	/* https://en.wikipedia.org/wiki/HSBC_Finance */
	else if find(inst1,'HSBC MORTGAGE CORP') ne 0 then subprime_institution=1;
	else if find(inst1,'HSBC MORTGAGE SERVICES') ne 0 then subprime_institution=1;
	else if find(inst1,'DECISION ONE') ne 0 then subprime_institution=1;
	/* https://en.wikipedia.org/wiki/Cape_Fear_Bank */
	else if inst1='CAPE FEAR BANK' then subprime_institution=1;
	/* https://en.wikipedia.org/wiki/New_Frontier_Bank */
	else if inst1='CAPE FEAR BANK' and state_abrev='CO' then subprime_institution=1;
	/* https://en.wikipedia.org/wiki/American_Sterling_Bank */
	else if inst1='AMERICAN STERLING BANK' and state_abrev='MO' then subprime_institution=1;
	/* https://en.wikipedia.org/wiki/American_Southern_Bank */
	else if inst1='AMERICAN SOUTHERN BANK' and state_abrev='GA' then subprime_institution=1;
	/* https://en.wikipedia.org/wiki/Colonial_Bank_(United_States) */
	else if find(inst1,'COLONIAL BANK') ne 0 and state_abrev='AL' then subprime_institution=1;
	/* https://en.wikipedia.org/wiki/Guaranty_Bank_(Texas) */
	else if inst1='GUARANTY BANK' and state_abrev='TX' then subprime_institution=1;
	/* https://en.wikipedia.org/wiki/Cal_National_Bank */
	else if inst1='CALIFORNIA NATIONAL BANK' then subprime_institution=1;
	/* https://en.wikipedia.org/wiki/AmTrust_Bank */
	else if inst1='AMTRUST BANK' and state_abrev='OH' then subprime_institution=1;
	/* https://en.wikipedia.org/wiki/First_Federal_Bank_of_California */
	else if find(inst1,'FIRST FEDERAL BANK') ne 0 and state_abrev='CA' then subprime_institution=1;

	/* do not forget these... https://en.wikipedia.org/wiki/List_of_entities_involved_in_2007%E2%80%9308_financial_crises */
	/*https://en.wikipedia.org/wiki/Accredited_Home_Lenders */
	else if find(inst1,'ACCREDITED HOME LENDERS') ne 0 and state_abrev='CA' then subprime_institution=1;
	/* https://en.wikipedia.org/wiki/E-Trade */
	else if find(inst1,'E*TRADE') ne 0 and state_abrev='VA' then subprime_institution=1;
	/* https://en.wikipedia.org/wiki/Option_One */
	else if find(inst1,'OPTION ONE') ne 0 and state_abrev='CA' then subprime_institution=1;
	/* https://en.wikipedia.org/wiki/American_Freedom_Mortgage */
	else if find(inst1,'AMERICAN EQUITY MORTGAGE') ne 0 and state_abrev='MO' then subprime_institution=1;
	/* https://en.wikipedia.org/wiki/MortgageIT */
	else if find(inst1,'MORTGAGEIT') ne 0 and state_abrev='NY' then subprime_institution=1;
	/* https://en.wikipedia.org/wiki/Novation_Companies */
	else if find(inst1,'NOVASTAR') ne 0 then subprime_institution=1;
	else if inst1='ADVENT MORTGAGE, LLC' then subprime_institution=1;

	/* additional, flagged by the HUD. */
	/* https://www.occ.gov/static/cra/craeval/jul15/708183.pdf */
	else if find(inst1,'EASTERN SAVINGS BANK') ne 0 then subprime_institution=1;

	/* known subprime lender */
	else if find(inst1,"WELLS FARGO FINL") ne 0 then subprime_institution=1;
	/* https://en.wikipedia.org/wiki/WMC_Mortgage */
	else if find(inst1,'WMC MORTGAGE') ne 0 then subprime_institution=1;
/* good for reference...
https://pdfs.semanticscholar.org/b7ef/c6b376437ff53a95cee9a115fe99d68d47e9.pdf
in addition, has stated subprime lenders.
*/

	else subprime_institution=0;

	if respondent_id='0000024141-1' then institution_name='COUNTRYWIDE BANK, N.A.';
	else if respondent_id='0000012642-4' then institution_name='WORLD SAVINGS BANK (GOLDEN WEST)';
	else if respondent_id='7900200006-7' then institution_name='NEW CENTURY MORTGAGE CORP';
	else if respondent_id='1556900003-7' then institution_name='HOME123';
	else if respondent_id='7431100008-7' then institution_name='OWNIT MORTGAGE SOLUTIONS';
	else if respondent_id='7756600001-7' then institution_name='AMERIQUEST MORTGAGE COMPANY';
	else if respondent_id='0000008475-4' then institution_name='NETBANK';
	else if respondent_id='2276200003-7' then institution_name='BEAR STEARNS RESIDENTIAL';
	else if respondent_id='0000003970-4' then institution_name='INDYMAC';
	else if respondent_id='88-0324039-7' then institution_name='SILVER STATE FINANCIAL SERVICE';
	else if respondent_id in ('0000008551-4','0000011905-4','0000009576-3') then institution_name='WASHINGTON MUTUAL';
	else if respondent_id in ('0003197134-2','51-0113718-7','1265700002-7') then institution_name='DECISION ONE';
	else if respondent_id='0000004072-4' then institution_name='AMTRUST BANK';
	else if respondent_id='7185300006-7' then institution_name='ACCREDITED HOME LENDERS, INC';
	else if respondent_id='7604800006-7' then institution_name='OPTION ONE MORTGAGE CORP';
	else if respondent_id='7604800006-7' and asofdate=2007 then institution_name='MORTGAGEIT (2007 ONLY)';
	else if respondent_id='1512400000-7' then institution_name='NOVASTAR';
	else if respondent_id='0458600405-7' then institution_name='WMC MORTGAGE COMPANY';
	else if respondent_id='0000005848-4' then institution_name='E*TRADE BANK';
	else if respondent_id in ('0001426027-2','0001843606-2','0001843624-2','0001844265-2','0001844283-2','0001844331-2',
							  '0001844340-2','0001844359-2','0001844818-2','0001844827-2','0001844836-2','0001844845-2',
							  '0001844920-2','0001844939-2','0001844948-2','0001844957-2','0001844966-2','0001844975-2',
							  '0001844984-2','0001844993-2','0001845002-2','0001845011-2','0001845020-2','0001845039-2',
							  '0001845057-2','0001847163-2','0001847172-2','0001847275-2','0001847305-2','0001847323-2',
							  '0001847332-2','0001847369-2','0001847378-2','0001868177-2','0002039488-2','0002040381-2',
							  '0002040402-2','0002040961-2','0002040970-2','0002040989-2','0002041007-2','0002041034-2',
							  '0002041098-2','0002041418-2','0002134936-2','0002135401-2','0002266659-2','0002418980-2',
							  '0002618744-2','0002913597-2','0003020483-2','0003125575-2','0003144576-2','0003315853-2')
		then institution_name='WELLS FARGO FINL';

	length subprime 3;
	if not missing(institution_name) then subprime=1;
	else subprime=0;
	*** assigned after subprime flag. ;
	if missing(institution_name) then institution_name=inst1;

run;

