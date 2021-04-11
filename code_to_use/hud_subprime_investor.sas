
libname sasdata "&sasdata.";

/* location:
https://www.huduser.gov/portal/datasets/manu.html
*/
data sasdata.hud_subprime_investor;
	length asofdate 3;
    infile datalines dlm='|';
    input title :$500.
          iid :$12.
          code :$1.
          respondent_id :$12.
          mh :$1.
          investor_name :$150.
    ;
/*Note: MH=1 - subprime; MH=2 - manufactured home lender*/
    asofdate=input(compress(title,,'kd'),4.);
	respondent_id=cats(respondent_id,'-',code);
datalines;
Subprime and Manufactured Home List (1998)|10000015033|1|0000015033|1|ADVANTA NB                    
Subprime and Manufactured Home List (1998)|10000022559|1|0000022559|1|FIRST UNION HOME EQUITY BK NA 
Subprime and Manufactured Home List (1998)|10000022908|1|0000022908|1|KEY BK USA NA                 
Subprime and Manufactured Home List (1998)|122-2293022|1|22-2293022|1|THE MONEY STORE               
Subprime and Manufactured Home List (1998)|122-2630964|1|22-2630964|1|CHAMPION MORTGAGE CO.         
Subprime and Manufactured Home List (1998)|136-3706101|1|36-3706101|1|TCF CONSUMER FIN'L SVES,INC.  
Subprime and Manufactured Home List (1998)|138-1620418|1|38-1620418|1|FIRST NATIONAL ACCEPTANCE CO. 
Subprime and Manufactured Home List (1998)|141-1671980|1|41-1671980|1|TCF FINANCIAL SVES, INC.      
Subprime and Manufactured Home List (1998)|141-1775115|1|41-1775115|1|TCF REAL ESTATE FINANCIAL SVCS
Subprime and Manufactured Home List (1998)|159-2645397|1|59-2645397|1|ALTEGRA CREDIT COMPANY        
Subprime and Manufactured Home List (1998)|20000612618|2|0000612618|1|PROVIDENT BK                  
Subprime and Manufactured Home List (1998)|20000765578|2|0000765578|1|BANC ONE FINANCIAL SERVICES   
Subprime and Manufactured Home List (1998)|20000856775|2|0000856775|1|FLEET HOME EQUITY USA         
Subprime and Manufactured Home List (1998)|20000860473|2|0000860473|1|CITY LOAN FINANCIAL SERVICES  
Subprime and Manufactured Home List (1998)|20000902270|2|0000902270|1|COMM.CREDIT PLAN CON.DISCOUNT 
Subprime and Manufactured Home List (1998)|20001035698|2|0001035698|1|CIT GROUP/CONSUMER FINANCE,INC
Subprime and Manufactured Home List (1998)|20001224906|2|0001224906|1|PROVIDENT BK OF FL            
Subprime and Manufactured Home List (1998)|20001942602|2|0001942602|1|EQUITY ONE, INC               
Subprime and Manufactured Home List (1998)|20001999138|2|0001999138|1|CIT GROUP/CONSUMER FINANCE,INC
Subprime and Manufactured Home List (1998)|20002032612|2|0002032612|1|SECURITY MUTUAL FNCL SVC      
Subprime and Manufactured Home List (1998)|20002036450|2|0002036450|1|EQUICREDIT CORP OF AMER       
Subprime and Manufactured Home List (1998)|20002041119|2|0002041119|1|MBNA CONSUMER SVC             
Subprime and Manufactured Home List (1998)|20002142959|2|0002142959|1|NATIONSCREDIT HOME EQT SVC    
Subprime and Manufactured Home List (1998)|20002534303|2|0002534303|1|MID AM FNCL SVC               
Subprime and Manufactured Home List (1998)|20002617242|2|0002617242|1|WEST GA CREDIT SVC            
Subprime and Manufactured Home List (1998)|20002661423|2|0002661423|1|AMERICAN MORTGAGE SOURCE, INC.
Subprime and Manufactured Home List (1998)|20002721701|2|0002721701|1|CIT GROUP/CONSUMER FINANCE,INC
Subprime and Manufactured Home List (1998)|20002750242|2|0002750242|1|COMMERCIAL CREDIT CORP.       
Subprime and Manufactured Home List (1998)|20002750532|2|0002750532|1|COMMERCIAL CREDIT CORP.       
Subprime and Manufactured Home List (1998)|20002751744|2|0002751744|1|COMMERCIAL CREDIT PLAN INC.   
Subprime and Manufactured Home List (1998)|20002751762|2|0002751762|1|COMMERCIAL CREDIT PLAN INC.   
Subprime and Manufactured Home List (1998)|20002751801|2|0002751801|1|COMMERCIAL CREDIT LOANS       
Subprime and Manufactured Home List (1998)|20002751810|2|0002751810|1|COMMERCIAL CREDIT LOANS INC.  
Subprime and Manufactured Home List (1998)|20002751847|2|0002751847|1|COMMERCIAL CREDIT PLAN INC.   
Subprime and Manufactured Home List (1998)|20002751913|2|0002751913|1|COMM.CREDIT PLAN IND.LOAN CO. 
Subprime and Manufactured Home List (1998)|20002751922|2|0002751922|1|COMM.CREDIT PLAN, INC.        
Subprime and Manufactured Home List (1998)|20002751968|2|0002751968|1|COMMERCIAL CREDIT CORP.       
Subprime and Manufactured Home List (1998)|20002751986|2|0002751986|1|COMMERCIAL CREDIT CORP.       
Subprime and Manufactured Home List (1998)|20002751995|2|0002751995|1|CONSUMER SERVICES, INC        
Subprime and Manufactured Home List (1998)|20002752013|2|0002752013|1|COMMERCIAL CREDIT INVEST. INC.
Subprime and Manufactured Home List (1998)|20002752022|2|0002752022|1|COMMERCIAL CREDIT CORP.       
Subprime and Manufactured Home List (1998)|20002752031|2|0002752031|1|COMMERCIAL CREDIT OF MISS.    
Subprime and Manufactured Home List (1998)|20002752040|2|0002752040|1|COMMERCIAL CREDIT OF ALABAMA  
Subprime and Manufactured Home List (1998)|20002752077|2|0002752077|1|COMMERCIAL CREDIT CORP.       
Subprime and Manufactured Home List (1998)|20002752321|2|0002752321|1|COMM.CREDIT PLAN OF GEORGETOWN
Subprime and Manufactured Home List (1998)|20002752684|2|0002752684|1|COMM.CREDIT PLAN, INC.        
Subprime and Manufactured Home List (1998)|20002760447|2|0002760447|1|TRAVELERS HOME MORT.SERV.INC. 
Subprime and Manufactured Home List (1998)|30000025147|3|0000025147|1|COMMERCIAL CR CORP HI         
Subprime and Manufactured Home List (1998)|30000025653|3|0000025653|1|FREMONT INV & LOAN            
Subprime and Manufactured Home List (1998)|30000025870|3|0000025870|1|FINANCE & THRIFT CO           
Subprime and Manufactured Home List (1998)|30000026363|3|0000026363|1|COMMUNITY T&LA                
Subprime and Manufactured Home List (1998)|30000027415|3|0000027415|1|PACIFIC T&LC                  
Subprime and Manufactured Home List (1998)|325-1238830|3|25-1238830|1|PV FINANCIAL SERVICE, INC     
Subprime and Manufactured Home List (1998)|358-2043633|3|58-2043633|1|SFI FINANCIAL SRVS, INC. (GA) 
Subprime and Manufactured Home List (1998)|358-2374513|3|58-2374513|1|BEST FINANCIAL SRVS. (ALABAMA)
Subprime and Manufactured Home List (1998)|362-1376832|3|62-1376832|1|SOUTHERN FINANCIAL INC        
Subprime and Manufactured Home List (1998)|362-1460952|3|62-1460952|1|SOUTHERN FIN MORTGAGE INC.    
Subprime and Manufactured Home List (1998)|362-1688241|3|62-1688241|1|FB FINANCIAL SERVICES         
Subprime and Manufactured Home List (1998)|364-0838616|3|64-0838616|1|HANCOCK MORTGAGE CORP         
Subprime and Manufactured Home List (1998)|40000004592|4|0000004592|1|Ocwen Federal Bank FSB        
Subprime and Manufactured Home List (1998)|40000006194|4|0000006194|1|Household Bank, FSB           
Subprime and Manufactured Home List (1998)|40000007645|4|0000007645|1|Western Financial Bank        
Subprime and Manufactured Home List (1998)|40000007946|4|0000007946|1|Life Bank                     
Subprime and Manufactured Home List (1998)|40000008051|4|0000008051|1|Bay Financial Savings Bank, F.
Subprime and Manufactured Home List (1998)|40000008327|4|0000008327|1|Oceanmark Bank, a FSB         
Subprime and Manufactured Home List (1998)|40000008566|4|0000008566|1|Superior Bank FSB             
Subprime and Manufactured Home List (1998)|40000011968|4|0000011968|1|Pan American Bank, FSB        
Subprime and Manufactured Home List (1998)|40000014470|4|0000014470|1|Travelers Bank & Trust, FSB   
Subprime and Manufactured Home List (1998)|40341225701|4|0341225701|1|CHARTER ONE CREDIT CORP       
Subprime and Manufactured Home List (1998)|40582257419|4|0582257419|1|NEWSOUTH FINANCIAL SERVICES   
Subprime and Manufactured Home List (1998)|70232433020|7|0232433020|1|MOREQUITY, INC. (DE)          
Subprime and Manufactured Home List (1998)|70232772890|7|0232772890|1|RESIDENTIAL MONEY CENTERS, INC
Subprime and Manufactured Home List (1998)|70330756645|7|0330756645|1|GREATER MORTGAGE ACCEPTANCE CO
Subprime and Manufactured Home List (1998)|70351925329|7|0351925329|1|MOREQUITY, INC. (CA)          
Subprime and Manufactured Home List (1998)|70458600405|7|0458600405|1|WMC MORTGAGE CORP.            
Subprime and Manufactured Home List (1998)|705-0416938|7|05-0416938|1|SECURITY FUNDING CORP.        
Subprime and Manufactured Home List (1998)|70510312284|7|0510312284|1|MOREQUITY, INC. (NV)          
Subprime and Manufactured Home List (1998)|70520781182|7|0520781182|1|APPROVED FEDERAL SAVINGS BANK 
Subprime and Manufactured Home List (1998)|70522009990|7|0522009990|1|NATIONAL MORTGAGE CORPORATION 
Subprime and Manufactured Home List (1998)|70541664826|7|0541664826|1|APPROVED FINANCIAL CORP       
Subprime and Manufactured Home List (1998)|70561720433|7|0561720433|1|THE MONEY CENTRE, INC.        
Subprime and Manufactured Home List (1998)|70861409991|7|0861409991|1|METROPOLITAN MORTGAGE COMPANY 
Subprime and Manufactured Home List (1998)|71003800004|7|1003800004|1|LONG BEACH MORTGAGE COMPANY   
Subprime and Manufactured Home List (1998)|71006200008|7|1006200008|1|AMRESCO RESIDENTIAL MTG. CORP.
Subprime and Manufactured Home List (1998)|71014100002|7|1014100002|1|FULL SPECTRUM LENDING INC.    
Subprime and Manufactured Home List (1998)|71025900004|7|1025900004|1|LENDERS M.D., INC.            
Subprime and Manufactured Home List (1998)|71037200009|7|1037200009|1|MOFC, INC. DBA CONSUMER ONE FI
Subprime and Manufactured Home List (1998)|71053700004|7|1053700004|1|AMERICAN MONEY CENTERS, INC.  
Subprime and Manufactured Home List (1998)|71058700006|7|1058700006|1|NOVASTAR MORTGAGE, INC.       
Subprime and Manufactured Home List (1998)|71061700007|7|1061700007|1|TOWN AND COUNTRY CREDIT CORP. 
Subprime and Manufactured Home List (1998)|71075700003|7|1075700003|1|AURORA LOANS SERVICES INC.    
Subprime and Manufactured Home List (1998)|71077300002|7|1077300002|1|CAPSTONE MORTGAGE CORPORATION 
Subprime and Manufactured Home List (1998)|71078900004|7|1078900004|1|FIRST STREET MORTGAGE CORP    
Subprime and Manufactured Home List (1998)|71085800002|7|1085800002|1|SPECIALTY MORTGAGE CORPORATION
Subprime and Manufactured Home List (1998)|71097600001|7|1097600001|1|MORTGAGE AMERICA (IMC), INC.  
Subprime and Manufactured Home List (1998)|711-2815564|7|11-2815564|1|FHB FUNDING CORP.             
Subprime and Manufactured Home List (1998)|71118100001|7|1118100001|1|MORTGAGE LENDERS NETWORK USA  
Subprime and Manufactured Home List (1998)|71120700004|7|1120700004|1|MORTGAGE ASSOCIATES INC.      
Subprime and Manufactured Home List (1998)|71125400003|7|1125400003|1|EQUIFIRST CORPORATION         
Subprime and Manufactured Home List (1998)|71140500009|7|1140500009|1|FIDELITY MORTGAGE INC.        
Subprime and Manufactured Home List (1998)|71151600004|7|1151600004|1|ACG FINANCIAL SERVICES IMC INC
Subprime and Manufactured Home List (1998)|71162000003|7|1162000003|1|AMERICAN MORTGAGE REDUCTION   
Subprime and Manufactured Home List (1998)|71189600005|7|1189600005|1|EQUITY MORTGAGE COMPANY, IMC. 
Subprime and Manufactured Home List (1998)|71197700006|7|1197700006|1|PAN AMERICAN FINANCIAL SERVICE
Subprime and Manufactured Home List (1998)|71248200000|7|1248200000|1|AMERUS HOME EQUITY, INC.      
Subprime and Manufactured Home List (1998)|71254000001|7|1254000001|1|WASHINGTON MORTGAGE COMPANY   
Subprime and Manufactured Home List (1998)|71259600009|7|1259600009|1|SOUTH STAR FUNDING LLC        
Subprime and Manufactured Home List (1998)|71291700001|7|1291700001|1|HEARTHSIDE LENDING CORP.      
Subprime and Manufactured Home List (1998)|713-2530491|7|13-2530491|1|AVCO FINANCIAL SERVICES, INC. 
Subprime and Manufactured Home List (1998)|713-3237773|7|13-3237773|1|ADVANTA MORTGAGE CORP. - NE   
Subprime and Manufactured Home List (1998)|71562209992|7|1562209992|1|MCGUIRE MORTGAGE COMPANY      
Subprime and Manufactured Home List (1998)|723-2159309|7|23-2159309|1|ADVANTA MTG CORP MID ATLANTIC 
Subprime and Manufactured Home List (1998)|723-2434974|7|23-2434974|1|ADVANTA MTG CORP. - MIDWEST   
Subprime and Manufactured Home List (1998)|723-2532654|7|23-2532654|1|ADVANTA MORTGAGE CORP. USA    
Subprime and Manufactured Home List (1998)|723-2681022|7|23-2681022|1|RESOURCE ONE CONSUMER DISCOUNT
Subprime and Manufactured Home List (1998)|723-2723382|7|23-2723382|1|ADVANTA CONDUIT SERVICES, INC.
Subprime and Manufactured Home List (1998)|723-2778991|7|23-2778991|1|ADVANTA FINANCE CORP          
Subprime and Manufactured Home List (1998)|733-0596889|7|33-0596889|1|QUALIFIED FINANCIAL SERVICES  
Subprime and Manufactured Home List (1998)|733-0651685|7|33-0651685|1|PINNFUND, USA                 
Subprime and Manufactured Home List (1998)|733-0729914|7|33-0729914|1|ROYAL MORTAGEBANC             
Subprime and Manufactured Home List (1998)|735-1781299|7|35-1781299|1|CAPITAL FINANCIAL SERVICES    
Subprime and Manufactured Home List (1998)|736-4013134|7|36-4013134|1|FIDELITY MORTGAGE DECISIONS   
Subprime and Manufactured Home List (1998)|738-3075078|7|38-3075078|1|FRANKLIN MORTGAGE FUNDING, INC
Subprime and Manufactured Home List (1998)|738-3170942|7|38-3170942|1|PROFESSIONAL LOAN FUNDING     
Subprime and Manufactured Home List (1998)|74893600009|7|4893600009|1|FEDERAL MORTGAGE              
Subprime and Manufactured Home List (1998)|75035300002|7|5035300002|1|FIRSTPLUS FINANACIAL INC      
Subprime and Manufactured Home List (1998)|75049400004|7|5049400004|1|ANSON FINANCIAL, INC.         
Subprime and Manufactured Home List (1998)|75058400002|7|5058400002|1|EMPIRE FUNDING CORP.          
Subprime and Manufactured Home List (1998)|75062100002|7|5062100002|1|FIRST FINANCIAL FUNDING GROUP 
Subprime and Manufactured Home List (1998)|752-0792752|7|52-0792752|1|APPROVED FINANACIAL CORP      
Subprime and Manufactured Home List (1998)|752-1681629|7|52-1681629|1|FEC MORTGAGE CORPORATION      
Subprime and Manufactured Home List (1998)|75220609999|7|5220609999|1|HOMEOWNERS PLUS FINACIAL SVCS 
Subprime and Manufactured Home List (1998)|75221409993|7|5221409993|1|DIVERSIFIED MORTGAGE SERVICES 
Subprime and Manufactured Home List (1998)|75222409994|7|5222409994|1|FIRSTPLUS FREEDOM MORTGAGE    
Subprime and Manufactured Home List (1998)|75535100002|7|5535100002|1|METWEST MORTGAGE SERVICES, INC
Subprime and Manufactured Home List (1998)|756-1548939|7|56-1548939|1|CONSOLIDATED MORTGAGE         
Subprime and Manufactured Home List (1998)|756-1960744|7|56-1960744|1|DECISION ONE MORTGAGE COMPANY 
Subprime and Manufactured Home List (1998)|756-1979460|7|56-1979460|1|MONEY AMERICA, INC.           
Subprime and Manufactured Home List (1998)|756-2023609|7|56-2023609|1|EQUIFIRST MORTGAGE CORPORATION
Subprime and Manufactured Home List (1998)|757-1042033|7|57-1042033|1|STERLING LENDING CORPORATION  
Subprime and Manufactured Home List (1998)|758-2255644|7|58-2255644|1|PENNANT FINANCIAL SERVICES    
Subprime and Manufactured Home List (1998)|759-3324910|7|59-3324910|1|HOMEGOLD INC.                 
Subprime and Manufactured Home List (1998)|76465609998|7|6465609998|1|AMERICAN CITY MORTGAGE CORP.  
Subprime and Manufactured Home List (1998)|76473009998|7|6473009998|1|FIRST FRANKLIN FINANCIAL CORP 
Subprime and Manufactured Home List (1998)|76473909996|7|6473909996|1|FIRST NATIONAL MORTGAGE CO.   
Subprime and Manufactured Home List (1998)|76485609994|7|6485609994|1|WESTMARK MORTGAGE CORPORATION 
Subprime and Manufactured Home List (1998)|766-0524453|7|66-0524453|1|CARIBBEAN FIN. SERV. CORP.    
Subprime and Manufactured Home List (1998)|77023300002|7|7023300002|1|SEACOAST EQUITIES, INC.       
Subprime and Manufactured Home List (1998)|77033900007|7|7033900007|1|TITLE WEST MORTGAGE, INC.     
Subprime and Manufactured Home List (1998)|77042100008|7|7042100008|1|DOLLAR MORTGAGE CORPORATION   
Subprime and Manufactured Home List (1998)|77049700003|7|7049700003|1|MEGO MORTGAGE                 
Subprime and Manufactured Home List (1998)|77051800006|7|7051800006|1|INTERBANK FUNDING GROUP       
Subprime and Manufactured Home List (1998)|77056700003|7|7056700003|1|CALIFORNIA LENDING GROUP      
Subprime and Manufactured Home List (1998)|77059200001|7|7059200001|1|PREFERRED FINANCIAL FUNDING, I
Subprime and Manufactured Home List (1998)|77062300004|7|7062300004|1|BUDGET NATIONAL FINANCE COMPAN
Subprime and Manufactured Home List (1998)|77069000008|7|7069000008|1|DELTA FUNDING CORPORATION     
Subprime and Manufactured Home List (1998)|77075600006|7|7075600006|1|NF INVESTMENTS, INC.          
Subprime and Manufactured Home List (1998)|77113200004|7|7113200004|1|ADCO FINANCIAL MORTGAGE SERVIC
Subprime and Manufactured Home List (1998)|77132500005|7|7132500005|1|TWENTY-FIRST CENTURY LENDING  
Subprime and Manufactured Home List (1998)|77152500000|7|7152500000|1|PLATINUM CAPITAL GROUP        
Subprime and Manufactured Home List (1998)|77157600003|7|7157600003|1|HOMEADD FINANCIAL CORP.       
Subprime and Manufactured Home List (1998)|77162500008|7|7162500008|1|FIRST CONSUMERS MORTGAGE      
Subprime and Manufactured Home List (1998)|77177000002|7|7177000002|1|MERITAGE MORTGAGE CORPORATION 
Subprime and Manufactured Home List (1998)|77177900003|7|7177900003|1|CHADWICK MORTGAGE, INC.       
Subprime and Manufactured Home List (1998)|77185300006|7|7185300006|1|ACCREDITED HOME LENDERS, INC. 
Subprime and Manufactured Home List (1998)|77187400002|7|7187400002|1|NCS MORTGAGE SERVICES         
Subprime and Manufactured Home List (1998)|77213700003|7|7213700003|1|FIDELITY FUNDING MORTGAGE     
Subprime and Manufactured Home List (1998)|77226600000|7|7226600000|1|CAPITAL PLUS FINANCIAL        
Subprime and Manufactured Home List (1998)|77230100005|7|7230100005|1|HMC FUNDING                   
Subprime and Manufactured Home List (1998)|77260600007|7|7260600007|1|AMERICAN FAMILY FINANCIAL SERV
Subprime and Manufactured Home List (1998)|77261100005|7|7261100005|1|UNICOR FUNDING, INC           
Subprime and Manufactured Home List (1998)|77269800002|7|7269800002|1|MORTGAGE FUNDING              
Subprime and Manufactured Home List (1998)|77270500007|7|7270500007|1|FIRST CONSOLIDATED MORTGAGE CO
Subprime and Manufactured Home List (1998)|77280000004|7|7280000004|1|POWER FUNDING GROUP, INC.     
Subprime and Manufactured Home List (1998)|77284300006|7|7284300006|1|AFFINITY FINANCE, LLC         
Subprime and Manufactured Home List (1998)|77285400003|7|7285400003|1|OMNIA CREDIT COMPANY, LLC     
Subprime and Manufactured Home List (1998)|77346500008|7|7346500008|1|DFS FINANCIAL SERVICES        
Subprime and Manufactured Home List (1998)|77354400002|7|7354400002|1|ENCORE MORTGAGE SERVICES, INC.
Subprime and Manufactured Home List (1998)|77397300003|7|7397300003|1|RESIDENTIAL MORTGAGE CORP. IMC
Subprime and Manufactured Home List (1998)|774-2827093|7|74-2827093|1|AUSTIN FUNDING CORPORATION    
Subprime and Manufactured Home List (1998)|77434800003|7|7434800003|1|UNITED COMPANIES LENDING CORP.
Subprime and Manufactured Home List (1998)|77464900009|7|7464900009|1|EMC MORTGAGE CORPORATION      
Subprime and Manufactured Home List (1998)|77466400007|7|7466400007|1|FIRST NATIONAL SECURITY       
Subprime and Manufactured Home List (1998)|77496500002|7|7496500002|1|CITYSCAPE CORPORATION         
Subprime and Manufactured Home List (1998)|775-2428356|7|75-2428356|1|EAGLE CAPITAL MORTGAGE        
Subprime and Manufactured Home List (1998)|775-2536023|7|75-2536023|1|KPG FINANCIAL, LIMITED        
Subprime and Manufactured Home List (1998)|775-2570083|7|75-2570083|1|CENTEX CREDIT CORPORATION     
Subprime and Manufactured Home List (1998)|77507300007|7|7507300007|1|ALLIED MORTGAGE CAPITAL CORP  
Subprime and Manufactured Home List (1998)|77511600000|7|7511600000|1|CONTIMORTGAGE CORPORATION     
Subprime and Manufactured Home List (1998)|77516500000|7|7516500000|1|PACIFIC SHORE FUNDING         
Subprime and Manufactured Home List (1998)|77542800002|7|7542800002|1|MLSG, INC.                    
Subprime and Manufactured Home List (1998)|77568500004|7|7568500004|1|CUSTOM MORTGAGE INC           
Subprime and Manufactured Home List (1998)|77576100006|7|7576100006|1|ACCEPTANCE MORTGAGE CORP.     
Subprime and Manufactured Home List (1998)|77604800006|7|7604800006|1|OPTION ONE MORTGAGE CORPORATIO
Subprime and Manufactured Home List (1998)|77607800005|7|7607800005|1|HEADLANDS MORTGAGE COMPANY    
Subprime and Manufactured Home List (1998)|77621700002|7|7621700002|1|WORLD WIDE FINANCIAL SERVICES 
Subprime and Manufactured Home List (1998)|77642300001|7|7642300001|1|LIBERTY FEDERAL SERVICE CORP  
Subprime and Manufactured Home List (1998)|77646700017|7|7646700017|1|PMCC MORTGAGE CORP            
Subprime and Manufactured Home List (1998)|77648500001|7|7648500001|1|HOME MORTGAGE USA             
Subprime and Manufactured Home List (1998)|77652800004|7|7652800004|1|NATION ONE MORTGAGE COMPANY, I
Subprime and Manufactured Home List (1998)|77657100000|7|7657100000|1|TOWER FUNDING OF VALENCIA, INC
Subprime and Manufactured Home List (1998)|77662200007|7|7662200007|1|SOUND MORTGAGE CORPORATION    
Subprime and Manufactured Home List (1998)|77665200006|7|7665200006|1|AMERICAN ACCEPTANCE MORTGAGE  
Subprime and Manufactured Home List (1998)|77673400003|7|7673400003|1|INVESTAID CORPORATION         
Subprime and Manufactured Home List (1998)|77678600007|7|7678600007|1|IVY MORTGAGE CORP.            
Subprime and Manufactured Home List (1998)|77696200007|7|7696200007|1|IMC MORTGAGE COMPANY          
Subprime and Manufactured Home List (1998)|77699600007|7|7699600007|1|FIRST MORTGAGE NETWORK, INC.  
Subprime and Manufactured Home List (1998)|77718200008|7|7718200008|1|CBSK FINANCIAL GROUP INC      
Subprime and Manufactured Home List (1998)|77743800006|7|7743800006|1|MASTERS FUNDING GROUP INC     
Subprime and Manufactured Home List (1998)|77750300000|7|7750300000|1|FAIRWAY FINANCIAL             
Subprime and Manufactured Home List (1998)|77751500009|7|7751500009|1|WALSH SECURITIES              
Subprime and Manufactured Home List (1998)|77756300009|7|7756300009|1|AMERICAN EQUITY MORTGAGE, INC.
Subprime and Manufactured Home List (1998)|77756600001|7|7756600001|1|AMERIQUEST MORTGAGE COMPANY   
Subprime and Manufactured Home List (1998)|77770100005|7|7770100005|1|BOMAC HOME MORTGAGE, INC      
Subprime and Manufactured Home List (1998)|77771600006|7|7771600006|1|SHASTA FINANCIAL SERVICE      
Subprime and Manufactured Home List (1998)|77772900005|7|7772900005|1|MORTGAGE PLUS EQUITY & LOAN   
Subprime and Manufactured Home List (1998)|77786700007|7|7786700007|1|COLUMBIA MORTGAGE & FUNDING CO
Subprime and Manufactured Home List (1998)|77840600009|7|7840600009|1|BNC MORTGAGE, INC.            
Subprime and Manufactured Home List (1998)|77853200002|7|7853200002|1|PARKWAY MORTGAGE              
Subprime and Manufactured Home List (1998)|77862700009|7|7862700009|1|NEWPORT SHORES FINANCIAL, INC.
Subprime and Manufactured Home List (1998)|77865800009|7|7865800009|1|ONE STOP MORTGAGE, INC        
Subprime and Manufactured Home List (1998)|77871200006|7|7871200006|1|SUMMIT MORTGAGE CORPORATION   
Subprime and Manufactured Home List (1998)|77875200001|7|7875200001|1|FIRST GREENSBORO HOME EQUITY  
Subprime and Manufactured Home List (1998)|77875900008|7|7875900008|1|EQUIVANTAGE, INC.             
Subprime and Manufactured Home List (1998)|77885300000|7|7885300000|1|STERLING MORT. & INVESTMENT CO
Subprime and Manufactured Home List (1998)|77885400001|7|7885400001|1|COREWEST BANC                 
Subprime and Manufactured Home List (1998)|77892800004|7|7892800004|1|FIELDSTONE MORTGAGE COMPANY   
Subprime and Manufactured Home List (1998)|77895000006|7|7895000006|1|THE MORTGAGE BANC, INC.       
Subprime and Manufactured Home List (1998)|77900200006|7|7900200006|1|NEW CENTURY MORTGAGE CORP.    
Subprime and Manufactured Home List (1998)|77903500008|7|7903500008|1|IMPERIAL HOME LOANS           
Subprime and Manufactured Home List (1998)|77905300009|7|7905300009|1|AMERICREDIT CORP OF CALIFORNIA
Subprime and Manufactured Home List (1998)|77939800003|7|7939800003|1|CENTERPOINT MORTGAGE CORP.    
Subprime and Manufactured Home List (1998)|77942800007|7|7942800007|1|TRANSAMERICA MORTGAGE COMPANY 
Subprime and Manufactured Home List (1998)|77943800003|7|7943800003|1|SAXON MORTGAGE, INC.          
Subprime and Manufactured Home List (1998)|77957300002|7|7957300002|1|MARSHALL REDDER HOME MTG.     
Subprime and Manufactured Home List (1998)|77958900004|7|7958900004|1|YES CAPITAL FUNDING, INC      
Subprime and Manufactured Home List (1998)|77967200005|7|7967200005|1|PORTFOLIO MORTGAGE COMPANY    
Subprime and Manufactured Home List (1998)|77970400005|7|7970400005|1|1ST GOV'T MTG & INVESTORS CORP
Subprime and Manufactured Home List (1998)|77994800000|7|7994800000|1|OCWEN FINANCIAL SERVICES,INC  
Subprime and Manufactured Home List (1998)|787-0418807|7|87-0418807|1|ABFS INC.                     
Subprime and Manufactured Home List (1998)|788-0379692|7|88-0379692|1|GOODRICH & PENNINGTON MORTGAGE
Subprime and Manufactured Home List (1998)|791-1872563|7|91-1872563|1|SEATTLE FUNDING GROUP, LTD.   
Subprime and Manufactured Home List (1998)|795-2622032|7|95-2622032|1|AAMES FUNDING CORPORATION     
Subprime and Manufactured Home List (1998)|795-4362095|7|95-4362095|1|AAMES HOME LOAN               
Subprime and Manufactured Home List (1998)|795-4438859|7|95-4438859|1|AAMES CAPITAL CORPORATION     
Subprime and Manufactured Home List (1998)|795-4601683|7|95-4601683|1|AAMES CAPITAL CORP. OF MINNESO
Subprime and Manufactured Home List (1998)|799-0329470|7|99-0329470|1|QUALITY FUNDING INC.          
Subprime and Manufactured Home List (1998)|10000001122|1|0000001122|2|CENTRAL NB                    
Subprime and Manufactured Home List (1998)|10000014569|1|0000014569|2|SOUTHTRUST BK NA              
Subprime and Manufactured Home List (1998)|192-0145407|1|92-0145407|2|NORTHLAND CREDIT CORPORATION  
Subprime and Manufactured Home List (1998)|20000331647|2|0000331647|2|NBD BK                        
Subprime and Manufactured Home List (1998)|20001035401|2|0001035401|2|CIT GROUP/SALES FINANCING DE  
Subprime and Manufactured Home List (1998)|20002473309|2|0002473309|2|NATIONSCREDIT MAN. HOUS. CORP.
Subprime and Manufactured Home List (1998)|30000007319|3|0000007319|2|ONBANK & TC                   
Subprime and Manufactured Home List (1998)|30000025726|3|0000025726|2|MURPHY BK                     
Subprime and Manufactured Home List (1998)|30000033792|3|0000033792|2|ASSOCIATES CAP BK             
Subprime and Manufactured Home List (1998)|30000034536|3|0000034536|2|CONSECO BK, INC.              
Subprime and Manufactured Home List (1998)|313-4002891|3|13-4002891|2|GREENPOINT CREDIT CORP.       
Subprime and Manufactured Home List (1998)|40000007705|4|0000007705|2|Northeast Bank, F.S.B.        
Subprime and Manufactured Home List (1998)|706-1104540|7|06-1104540|2|THE ASSOCIATES                
Subprime and Manufactured Home List (1998)|72294709990|7|2294709990|2|GREEN TREE FINANCIAL          
Subprime and Manufactured Home List (1998)|736-3423660|7|36-3423660|2|JOHN DEERE CREDIT MH RETAIL   
Subprime and Manufactured Home List (1998)|74856500006|7|4856500006|2|VANDERBILT MORTGAGE           
Subprime and Manufactured Home List (1998)|754-1779092|7|54-1779092|2|DYNEX FINANCIAL INC.          
Subprime and Manufactured Home List (1998)|756-1977469|7|56-1977469|2|DUETSCHE FINANCIAL CAPITAL    
Subprime and Manufactured Home List (1998)|76502700005|7|6502700005|2|ACCESS FINANCIAL LENDING CORP 
Subprime and Manufactured Home List (1998)|77162800002|7|7162800002|2|21ST CENTURY MORTGAGE         
Subprime and Manufactured Home List (1998)|775-2585326|7|75-2585326|2|COUNTRYPLACE MORTGAGE, LTD.   
Subprime and Manufactured Home List (1998)|775-2731850|7|75-2731850|2|ASSOCIATES HOUSING FINANCE    
Subprime and Manufactured Home List (1998)|77506600003|7|7506600003|2|OAKWOOD ACCEPTANCE CORPORATION
Subprime and Manufactured Home List (1998)|795-4229749|7|95-4229749|2|WILSHIRE FUNDING CORPORATION  
Subprime and Manufactured Home List (1999)|10000015033|1|0000015033|1|ADVANTA NB                    
Subprime and Manufactured Home List (1999)|10000022559|1|0000022559|1|FIRST UNION HOME EQUITY BK NA 
Subprime and Manufactured Home List (1999)|10000022908|1|0000022908|1|KEY BK USA NA                 
Subprime and Manufactured Home List (1999)|122-2293022|1|22-2293022|1|THE MONEY STORE               
Subprime and Manufactured Home List (1999)|122-2630964|1|22-2630964|1|CHAMPION MORTGAGE CO.         
Subprime and Manufactured Home List (1999)|136-3706101|1|36-3706101|1|TCF CONSUMER FIN'L SVES,INC.  
Subprime and Manufactured Home List (1999)|138-1620418|1|38-1620418|1|FIRST NATIONAL ACCEPTANCE CO. 
Subprime and Manufactured Home List (1999)|141-1775115|1|41-1775115|1|TCF REAL ESTATE FINANCIAL SVCS
Subprime and Manufactured Home List (1999)|152-2113031|1|52-2113031|1|HOMEOWNERS LOAN CORP          
Subprime and Manufactured Home List (1999)|156-1796719|1|56-1796719|1|NATIONSCREDIT FINANCIAL SVES  
Subprime and Manufactured Home List (1999)|159-2645397|1|59-2645397|1|ALTEGRA CREDIT COMPANY        
Subprime and Manufactured Home List (1999)|20000612618|2|0000612618|1|PROVIDENT BK                  
Subprime and Manufactured Home List (1999)|20000765578|2|0000765578|1|BANC ONE FINANCIAL SERVICES   
Subprime and Manufactured Home List (1999)|20000860473|2|0000860473|1|CITIFINANCIAL INC - OHIO      
Subprime and Manufactured Home List (1999)|20000902270|2|0000902270|1|CITIFINANCIAL SERVICES INC-PA 
Subprime and Manufactured Home List (1999)|20001035698|2|0001035698|1|CIT GROUP/CONSUMER FINANCE,INC
Subprime and Manufactured Home List (1999)|20001224906|2|0001224906|1|PROVIDENT BK OF FL            
Subprime and Manufactured Home List (1999)|20001942602|2|0001942602|1|EQUITY ONE, INC               
Subprime and Manufactured Home List (1999)|20001999138|2|0001999138|1|CIT GROUP/CONSUMER FINANCE,INC
Subprime and Manufactured Home List (1999)|20002032612|2|0002032612|1|SECURITY MUTUAL FNCL SVC      
Subprime and Manufactured Home List (1999)|20002041119|2|0002041119|1|MBNA CONSUMER SVC             
Subprime and Manufactured Home List (1999)|20002418980|2|0002418980|1|COMMUNITY CR CO AMER          
Subprime and Manufactured Home List (1999)|20002534303|2|0002534303|1|MID AM FNCL SVC               
Subprime and Manufactured Home List (1999)|20002601018|2|0002601018|1|FIRST FRANKLIN FNCL CO        
Subprime and Manufactured Home List (1999)|20002617242|2|0002617242|1|WEST GA CREDIT SVC            
Subprime and Manufactured Home List (1999)|20002661423|2|0002661423|1|AMER MTG SOURCE               
Subprime and Manufactured Home List (1999)|20002721701|2|0002721701|1|CIT GROUP/CONSUMER FINANCE,INC
Subprime and Manufactured Home List (1999)|20002750242|2|0002750242|1|CITIFINANCIAL SERVICES INC -MN
Subprime and Manufactured Home List (1999)|20002750532|2|0002750532|1|CITIFINANCIAL INC - WV        
Subprime and Manufactured Home List (1999)|20002751744|2|0002751744|1|CITIFINANCIAL SERVICES INC UT 
Subprime and Manufactured Home List (1999)|20002751762|2|0002751762|1|CITIFINANCIAL INC - TENN.     
Subprime and Manufactured Home List (1999)|20002751801|2|0002751801|1|CITIFINANCIAL SERVICES INC-OH 
Subprime and Manufactured Home List (1999)|20002751810|2|0002751810|1|CITIFINANCIAL SERVICES INC-DEL
Subprime and Manufactured Home List (1999)|20002751847|2|0002751847|1|CITIFINANCIAL SERVICES INC-MO 
Subprime and Manufactured Home List (1999)|20002751913|2|0002751913|1|CITIFINANCIAL OF VIRGINIA     
Subprime and Manufactured Home List (1999)|20002751922|2|0002751922|1|CITIFINANCIAL SERVICES INC-GA 
Subprime and Manufactured Home List (1999)|20002751968|2|0002751968|1|CITIFINANCIAL INC-SC          
Subprime and Manufactured Home List (1999)|20002751986|2|0002751986|1|CITIFINANCIAL INC - MD        
Subprime and Manufactured Home List (1999)|20002751995|2|0002751995|1|CITIFINANCIAL EQUITY SER. - OK
Subprime and Manufactured Home List (1999)|20002752013|2|0002752013|1|CITIFINANCIAL SERVICES INC-KY 
Subprime and Manufactured Home List (1999)|20002752022|2|0002752022|1|CITIFINANCIAL INC-IOWA        
Subprime and Manufactured Home List (1999)|20002752031|2|0002752031|1|CITIFINANCIAL INC OF MISS.    
Subprime and Manufactured Home List (1999)|20002752040|2|0002752040|1|CITIFINANCIAL CORP. DELAWARE  
Subprime and Manufactured Home List (1999)|20002752077|2|0002752077|1|CITIFINANCIAL SERVICES INC-CA 
Subprime and Manufactured Home List (1999)|20002752321|2|0002752321|1|CITIFINANCIAL COMPANY         
Subprime and Manufactured Home List (1999)|20002752684|2|0002752684|1|CITIFINANCIAL CORP. COLORADO  
Subprime and Manufactured Home List (1999)|20002817118|2|0002817118|1|CITIFINANCIAL INC -TEXAS CORP 
Subprime and Manufactured Home List (1999)|20002861287|2|0002861287|1|CITIFINANCIAL MORTGAGE, DELAWA
Subprime and Manufactured Home List (1999)|20002861595|2|0002861595|1|CITIFINANCIAL SERVICES INC-MA 
Subprime and Manufactured Home List (1999)|30000025653|3|0000025653|1|FREMONT INV & LOAN            
Subprime and Manufactured Home List (1999)|30000025870|3|0000025870|1|FINANCE & THRIFT CO           
Subprime and Manufactured Home List (1999)|30000026363|3|0000026363|1|COMMUNITY CMRC BK             
Subprime and Manufactured Home List (1999)|30000033535|3|0000033535|1|ADVANTA BK CORP               
Subprime and Manufactured Home List (1999)|325-1238830|3|25-1238830|1|PV FINANCIAL SERVICE, INC     
Subprime and Manufactured Home List (1999)|358-2043633|3|58-2043633|1|SFI FINANCIAL SRVS, INC. (GA) 
Subprime and Manufactured Home List (1999)|358-2374513|3|58-2374513|1|BEST FINANCIAL SRVS. (ALABAMA)
Subprime and Manufactured Home List (1999)|362-1376832|3|62-1376832|1|SOUTHERN FINANCIAL INC        
Subprime and Manufactured Home List (1999)|362-1460952|3|62-1460952|1|SOUTHERN FIN MORTGAGE INC.    
Subprime and Manufactured Home List (1999)|362-1688241|3|62-1688241|1|FB FINANCIAL SERVICES         
Subprime and Manufactured Home List (1999)|363-1121281|3|63-1121281|1|ACCEPTANCE LOAN CO.           
Subprime and Manufactured Home List (1999)|364-0838616|3|64-0838616|1|HANCOCK MORTGAGE CORP         
Subprime and Manufactured Home List (1999)|40000004592|4|0000004592|1|OCWEN FEDERAL BANK FSB        
Subprime and Manufactured Home List (1999)|40000006194|4|0000006194|1|HOUSEHOLD BANK, FSB           
Subprime and Manufactured Home List (1999)|40000007645|4|0000007645|1|WESTERN FINANCIAL BANK        
Subprime and Manufactured Home List (1999)|40000007946|4|0000007946|1|LIFE BANK                     
Subprime and Manufactured Home List (1999)|40000008051|4|0000008051|1|BAY FINANCIAL SAVINGS BANK, F.
Subprime and Manufactured Home List (1999)|40000008566|4|0000008566|1|SUPERIOR BANK FSB             
Subprime and Manufactured Home List (1999)|40000008569|4|0000008569|1|APPROVED FEDERAL SAVINGS BANK 
Subprime and Manufactured Home List (1999)|40000011968|4|0000011968|1|PAN AMERICAN BANK, FSB        
Subprime and Manufactured Home List (1999)|40000014470|4|0000014470|1|TRAVELERS BANK & TRUST, FSB   
Subprime and Manufactured Home List (1999)|40341225701|4|0341225701|1|CHARTER ONE CREDIT CORP       
Subprime and Manufactured Home List (1999)|40582257419|4|0582257419|1|NEWSOUTH FINANCIAL SERVICES   
Subprime and Manufactured Home List (1999)|40650702871|4|0650702871|1|OCWEN FINANCIAL SERVICES, INC.
Subprime and Manufactured Home List (1999)|40760539855|4|0760539855|1|HS MORTGAGE ACCEPTANCE        
Subprime and Manufactured Home List (1999)|70232433020|7|0232433020|1|MOREQUITY, INC. (DE)          
Subprime and Manufactured Home List (1999)|70232646780|7|0232646780|1|AMERICAN BUSINESS FINANCIAL   
Subprime and Manufactured Home List (1999)|70330756645|7|0330756645|1|GREATER MORTGAGE ACCEPTANCE CO
Subprime and Manufactured Home List (1999)|70351925329|7|0351925329|1|MOREQUITY, INC. (CA)          
Subprime and Manufactured Home List (1999)|70383170942|7|0383170942|1|PROFESSIONAL LOAN BROKERS, INC
Subprime and Manufactured Home List (1999)|70458600405|7|0458600405|1|WMC MORTGAGE CORP.            
Subprime and Manufactured Home List (1999)|705-0416938|7|05-0416938|1|SECURITY FUNDING CORP.        
Subprime and Manufactured Home List (1999)|70510312284|7|0510312284|1|MOREQUITY, INC. (NV)          
Subprime and Manufactured Home List (1999)|70561720433|7|0561720433|1|THE MONEY CENTRE, INC.        
Subprime and Manufactured Home List (1999)|706-1104540|7|06-1104540|1|ASSOCIATES HOME EQUITY SERVICE
Subprime and Manufactured Home List (1999)|70861409991|7|0861409991|1|METROPOLITAN MORTGAGE COMPANY 
Subprime and Manufactured Home List (1999)|71003800004|7|1003800004|1|LONG BEACH MORTGAGE COMPANY   
Subprime and Manufactured Home List (1999)|71006200008|7|1006200008|1|AMRESCO RESIDENTIAL MORTGAGE C
Subprime and Manufactured Home List (1999)|71014100002|7|1014100002|1|FULL SPECTRUM LENDING, INC.   
Subprime and Manufactured Home List (1999)|71025900004|7|1025900004|1|LENDERS M.D., INC             
Subprime and Manufactured Home List (1999)|71053700004|7|1053700004|1|AMERICAN MONEY CENTERS INC.   
Subprime and Manufactured Home List (1999)|71061700007|7|1061700007|1|TOWN & COUNTRY CREDIT CORP    
Subprime and Manufactured Home List (1999)|71075700003|7|1075700003|1|AURORA LOANS SERVICES INC.    
Subprime and Manufactured Home List (1999)|71077300002|7|1077300002|1|CAPSTONE MORTGAGE CORPORATION 
Subprime and Manufactured Home List (1999)|71085800002|7|1085800002|1|SPECIALTY MORTGAGE CORPORATION
Subprime and Manufactured Home List (1999)|71097600001|7|1097600001|1|MORTGAGE AMERICA (IMC), INC.  
Subprime and Manufactured Home List (1999)|711-2815564|7|11-2815564|1|EHOMECREDIT CORP.             
Subprime and Manufactured Home List (1999)|71113300001|7|1113300001|1|UNION FUNDING USA, INC.       
Subprime and Manufactured Home List (1999)|71118100001|7|1118100001|1|MORTGAGE LENDERS NETWORK USA  
Subprime and Manufactured Home List (1999)|71125400003|7|1125400003|1|EQUIFIRST CORPORATION         
Subprime and Manufactured Home List (1999)|71126000006|7|1126000006|1|SEBRING CAPITAL CORPORATION   
Subprime and Manufactured Home List (1999)|71140500009|7|1140500009|1|FIDELITY MORTGAGE             
Subprime and Manufactured Home List (1999)|71151600004|7|1151600004|1|ACG FINANCIAL SERVICES IMC INC
Subprime and Manufactured Home List (1999)|71162000003|7|1162000003|1|AMERICAN MORTGAGE REDUCTION   
Subprime and Manufactured Home List (1999)|71189600005|7|1189600005|1|EQUITY MORTGAGE COMPANY, IMC. 
Subprime and Manufactured Home List (1999)|71195900005|7|1195900005|1|LOAN FUNDING CORP. OF AMERICA 
Subprime and Manufactured Home List (1999)|71207500004|7|1207500004|1|COURTESY MORTGAGE COMPANY     
Subprime and Manufactured Home List (1999)|71248200000|7|1248200000|1|AMERUS HOME EQUITY, INC.      
Subprime and Manufactured Home List (1999)|71250200008|7|1250200008|1|MONEYONE, INC.                
Subprime and Manufactured Home List (1999)|71254000001|7|1254000001|1|WASHINGTON MORTGAGE COMPANY   
Subprime and Manufactured Home List (1999)|71259600009|7|1259600009|1|SOUTH STAR FUNDING, LLC       
Subprime and Manufactured Home List (1999)|71288100002|7|1288100002|1|NORTHWOOD CREDIT INC.         
Subprime and Manufactured Home List (1999)|71291700001|7|1291700001|1|HEARTHSIDE LENDING CORP.      
Subprime and Manufactured Home List (1999)|713-3237773|7|13-3237773|1|ADVANTA MORTGAGE CORP. - NE   
Subprime and Manufactured Home List (1999)|71340900003|7|1340900003|1|CAPITAL PLUS FINANCIAL        
Subprime and Manufactured Home List (1999)|71345300006|7|1345300006|1|THE PETKEWICH CORPORATION     
Subprime and Manufactured Home List (1999)|71393600007|7|1393600007|1|HOMEALLIANCE MORTGAGE COMPANY 
Subprime and Manufactured Home List (1999)|71421000005|7|1421000005|1|PRIMESOURCE FINANCIAL, L.L.C. 
Subprime and Manufactured Home List (1999)|71474600000|7|1474600000|1|NORTHERN STAR FUNDING, LLC    
Subprime and Manufactured Home List (1999)|71512400000|7|1512400000|1|NOVASTAR FINANCIAL            
Subprime and Manufactured Home List (1999)|71515800003|7|1515800003|1|THE LENDING GROUP, INC.       
Subprime and Manufactured Home List (1999)|72179409992|7|2179409992|1|DMR FINANCIAL SERVICES, INC.  
Subprime and Manufactured Home List (1999)|722-3397885|7|22-3397885|1|AMERICAP FINANCIAL, INC.      
Subprime and Manufactured Home List (1999)|723-2159309|7|23-2159309|1|ADVANTA MTG CORP MID ATLANTIC 
Subprime and Manufactured Home List (1999)|723-2434974|7|23-2434974|1|ADVANTA MTG CORP. - MIDWEST   
Subprime and Manufactured Home List (1999)|723-2532654|7|23-2532654|1|ADVANTA MORTGAGE CORP. USA    
Subprime and Manufactured Home List (1999)|723-2681022|7|23-2681022|1|RESOURCE ONE CONSUMER DISCOUNT
Subprime and Manufactured Home List (1999)|723-2723382|7|23-2723382|1|ADVANTA CONDUIT SERVICES, INC.
Subprime and Manufactured Home List (1999)|723-2772890|7|23-2772890|1|RESIDENTIAL MONEY CENTERS, INC
Subprime and Manufactured Home List (1999)|723-2778991|7|23-2778991|1|ADVANTA FINANCE CORP          
Subprime and Manufactured Home List (1999)|733-0515201|7|33-0515201|1|SOUTH SHORE MORTGAGE, INC.    
Subprime and Manufactured Home List (1999)|733-0596889|7|33-0596889|1|QUALIFIED FINANCIAL SERVICES  
Subprime and Manufactured Home List (1999)|733-0651685|7|33-0651685|1|PINNFUND, USA                 
Subprime and Manufactured Home List (1999)|733-0729914|7|33-0729914|1|ROYAL MORTGAGE PARTNERS LMT.  
Subprime and Manufactured Home List (1999)|735-1152804|7|35-1152804|1|CFC MORTGAGE                  
Subprime and Manufactured Home List (1999)|735-1158886|7|35-1158886|1|ASSOCIATES FINANCIAL SERVICES 
Subprime and Manufactured Home List (1999)|735-1781299|7|35-1781299|1|CAPITAL FINANCIAL SERVICES    
Subprime and Manufactured Home List (1999)|736-3581221|7|36-3581221|1|HEARTLAND MTG. & REAL EST. SVC
Subprime and Manufactured Home List (1999)|736-3692035|7|36-3692035|1|HEARTLAND HOME FINANCE, INC.  
Subprime and Manufactured Home List (1999)|738-3075078|7|38-3075078|1|FRANKLIN MORTGAGE FUNDING     
Subprime and Manufactured Home List (1999)|74893600009|7|4893600009|1|FEDERAL MORTGAGE & INVESTMENT 
Subprime and Manufactured Home List (1999)|75049400004|7|5049400004|1|ANSON FINANCIAL, INC.         
Subprime and Manufactured Home List (1999)|75062100002|7|5062100002|1|FIRST FINANCIAL FUNDING GROUP 
Subprime and Manufactured Home List (1999)|752-1681629|7|52-1681629|1|FEC MORTGAGE CORPORATION      
Subprime and Manufactured Home List (1999)|75221409993|7|5221409993|1|DIVERSIFIED MORTGAGE SERVICES 
Subprime and Manufactured Home List (1999)|75535100002|7|5535100002|1|METWEST MORTGAGE SERVICES, INC
Subprime and Manufactured Home List (1999)|756-1960744|7|56-1960744|1|DECISION ONE MORTGAGE COMPANY 
Subprime and Manufactured Home List (1999)|756-1979460|7|56-1979460|1|MONEY AMERICA, INC            
Subprime and Manufactured Home List (1999)|756-2023609|7|56-2023609|1|EQUIFIRST MORTGAGE CORPORATION
Subprime and Manufactured Home List (1999)|756-2031177|7|56-2031177|1|EMMCO, THE MORTGAGE SERVICE ST
Subprime and Manufactured Home List (1999)|756-2114785|7|56-2114785|1|EQUIFIRST MORTGAGE (MN)       
Subprime and Manufactured Home List (1999)|757-0889694|7|57-0889694|1|HOMESENSE FINANCIAL CORP      
Subprime and Manufactured Home List (1999)|757-1046687|7|57-1046687|1|HOMESENSE FIN. CORP. ORLANDO  
Subprime and Manufactured Home List (1999)|757-1048268|7|57-1048268|1|HOMESENSE FIN. OF SAVANNAH    
Subprime and Manufactured Home List (1999)|757-1053677|7|57-1053677|1|HOMESENSE FIN. OF BATON ROUGE 
Subprime and Manufactured Home List (1999)|757-1053680|7|57-1053680|1|HOMESENSE FIN. OF LITTLE ROCK 
Subprime and Manufactured Home List (1999)|757-1057007|7|57-1057007|1|HOMESENSE FINANCIAL CORP OF AL
Subprime and Manufactured Home List (1999)|759-3324910|7|59-3324910|1|HOMEGOLD INC.                 
Subprime and Manufactured Home List (1999)|759-3504854|7|59-3504854|1|PINNACLE DIRECT FUNDING CORP. 
Subprime and Manufactured Home List (1999)|76461609992|7|6461609992|1|CLASSIC FINANCIAL CORPORATION 
Subprime and Manufactured Home List (1999)|76465609998|7|6465609998|1|AMERICAN CITY MORTGAGE CORP   
Subprime and Manufactured Home List (1999)|76473909996|7|6473909996|1|FIRST NATIONAL MORTGAGE CO.   
Subprime and Manufactured Home List (1999)|76485609994|7|6485609994|1|WESTMARK MORTGAGE CORPORATION 
Subprime and Manufactured Home List (1999)|766-0524453|7|66-0524453|1|EASY MONEY - MORTGAGE DIVISION
Subprime and Manufactured Home List (1999)|77023300002|7|7023300002|1|SEACOAST EQUITIES, INC.       
Subprime and Manufactured Home List (1999)|77033900007|7|7033900007|1|TITLE WEST MORTGAGE ,INC      
Subprime and Manufactured Home List (1999)|77042100008|7|7042100008|1|DOLLAR MORTGAGE CORPORATION   
Subprime and Manufactured Home List (1999)|77051800006|7|7051800006|1|INTERBANK FUNDING GROUP       
Subprime and Manufactured Home List (1999)|77056700003|7|7056700003|1|CALIFORNIA LENDING GROUP      
Subprime and Manufactured Home List (1999)|77059200001|7|7059200001|1|PREFERRED FINANCAIL FUNDING, I
Subprime and Manufactured Home List (1999)|77062300004|7|7062300004|1|BUDGET NATIONAL FINANCE COMPAN
Subprime and Manufactured Home List (1999)|77069000008|7|7069000008|1|DELTA FUNDING CORPORATION     
Subprime and Manufactured Home List (1999)|77075600006|7|7075600006|1|NF INVESTMENTS, INC.          
Subprime and Manufactured Home List (1999)|77086400004|7|7086400004|1|AMERICAN BENEFIT MORTGAGE, INC
Subprime and Manufactured Home List (1999)|77113200004|7|7113200004|1|ADCO FINANCIAL MORTGAGE SERVIC
Subprime and Manufactured Home List (1999)|77132500005|7|7132500005|1|FLAGSHIP CAPITAL              
Subprime and Manufactured Home List (1999)|77152500000|7|7152500000|1|PLATINUM CAPITAL GROUP        
Subprime and Manufactured Home List (1999)|77177000002|7|7177000002|1|MERITAGE MORTGAGE CORPORATION 
Subprime and Manufactured Home List (1999)|77177900003|7|7177900003|1|CHADWICK MORTGAGE, INC.       
Subprime and Manufactured Home List (1999)|77185300006|7|7185300006|1|ACCREDITED HOME LENDERS, INC. 
Subprime and Manufactured Home List (1999)|77187400002|7|7187400002|1|NCS MORTGAGE SERVICES LLC     
Subprime and Manufactured Home List (1999)|77204700004|7|7204700004|1|PREFERRED CAPITAL GROUP       
Subprime and Manufactured Home List (1999)|77230100005|7|7230100005|1|HMC FUNDING                   
Subprime and Manufactured Home List (1999)|77260600007|7|7260600007|1|AMERICAN FAMILY FINANCIAL SERV
Subprime and Manufactured Home List (1999)|77261100005|7|7261100005|1|UNICOR FUNDING, INC.          
Subprime and Manufactured Home List (1999)|77269800002|7|7269800002|1|MORTGAGE FUNDING              
Subprime and Manufactured Home List (1999)|77308900005|7|7308900005|1|LINEAR CAPITAL, INC.          
Subprime and Manufactured Home List (1999)|77323800008|7|7323800008|1|EXPRESS CAPITAL LENDING       
Subprime and Manufactured Home List (1999)|77325600006|7|7325600006|1|OAKTREE FUNDING CORPORATION   
Subprime and Manufactured Home List (1999)|77325900004|7|7325900004|1|PSP DIRECT                    
Subprime and Manufactured Home List (1999)|77346500008|7|7346500008|1|DFS FINANCIAL SERVICES        
Subprime and Manufactured Home List (1999)|77354400002|7|7354400002|1|ENCORE MORTGAGE SERVICES, INC.
Subprime and Manufactured Home List (1999)|77397300003|7|7397300003|1|RESIDENTIAL MORTGAGE CORP  IMC
Subprime and Manufactured Home List (1999)|77407100001|7|7407100001|1|FOOTHILL FUNDING GROUP        
Subprime and Manufactured Home List (1999)|77431100008|7|7431100008|1|OAKMONT MORTGAGE COMPANY      
Subprime and Manufactured Home List (1999)|77434800003|7|7434800003|1|UNITED COMPANIES LENDING CORPO
Subprime and Manufactured Home List (1999)|77464900009|7|7464900009|1|EMC MORTGAGE CORPORATION      
Subprime and Manufactured Home List (1999)|77466400007|7|7466400007|1|FIRST NATIONAL SECURITY       
Subprime and Manufactured Home List (1999)|77479800008|7|7479800008|1|CHAPEL MORTGAGE CORPORATION   
Subprime and Manufactured Home List (1999)|775-2536023|7|75-2536023|1|KPG FINANCIAL, LTD            
Subprime and Manufactured Home List (1999)|775-2570083|7|75-2570083|1|CENTEX CREDIT CORPORATION     
Subprime and Manufactured Home List (1999)|775-2712433|7|75-2712433|1|CONCORDE ACCEPTANCE CORPORATIO
Subprime and Manufactured Home List (1999)|77507300007|7|7507300007|1|ALLIED MORTGAGE CAPITAL CORP  
Subprime and Manufactured Home List (1999)|77511600000|7|7511600000|1|CONTIMORTGAGE CORPORATION     
Subprime and Manufactured Home List (1999)|77516500000|7|7516500000|1|PACIFIC SHORE FUNDING         
Subprime and Manufactured Home List (1999)|77542800002|7|7542800002|1|MLSG, INC.                    
Subprime and Manufactured Home List (1999)|77568500004|7|7568500004|1|CUSTOM MORTGAGE, INC.         
Subprime and Manufactured Home List (1999)|77604800006|7|7604800006|1|OPTION ONE MORTGAGE CORPORATIO
Subprime and Manufactured Home List (1999)|77619100004|7|7619100004|1|C & G FINANCIAL SERVICES, INC.
Subprime and Manufactured Home List (1999)|77621700002|7|7621700002|1|WORLD WIDE FINANCIAL SERVICES 
Subprime and Manufactured Home List (1999)|77642300001|7|7642300001|1|LIBERTY AMERICAN MORTGAGE     
Subprime and Manufactured Home List (1999)|77646700017|7|7646700017|1|PMCC MORTGAGE CORP.           
Subprime and Manufactured Home List (1999)|77648500001|7|7648500001|1|HOME MORTGAGE USA             
Subprime and Manufactured Home List (1999)|77650700000|7|7650700000|1|AMERICA'S MONEYLINE           
Subprime and Manufactured Home List (1999)|77652800004|7|7652800004|1|NATION ONE MORTGAGE COMPANY   
Subprime and Manufactured Home List (1999)|77662200007|7|7662200007|1|SOUND MORTGAGE CORPORATION    
Subprime and Manufactured Home List (1999)|77665200006|7|7665200006|1|AMERICAN ACCEPTANCE MORTGAGE, 
Subprime and Manufactured Home List (1999)|77673400003|7|7673400003|1|INVESTAID CORPORATION         
Subprime and Manufactured Home List (1999)|77696200007|7|7696200007|1|IMC MORTGAGE COMPANY          
Subprime and Manufactured Home List (1999)|77699600007|7|7699600007|1|MORTGAGE.COM                  
Subprime and Manufactured Home List (1999)|77718200008|7|7718200008|1|AMERICAN HOME LOANS           
Subprime and Manufactured Home List (1999)|77733200002|7|7733200002|1|CENTURY FINANCIAL GROUP, INC. 
Subprime and Manufactured Home List (1999)|77735800000|7|7735800000|1|FIRST ALLIANCE MORTGAGE COMPAN
Subprime and Manufactured Home List (1999)|77756300009|7|7756300009|1|AMERICAN EQUITY MORTGAGE, INC.
Subprime and Manufactured Home List (1999)|77756600001|7|7756600001|1|AMERIQUEST MORTGAGE COMPANY   
Subprime and Manufactured Home List (1999)|77770100005|7|7770100005|1|BOMAC HOME MORTGAGE           
Subprime and Manufactured Home List (1999)|77771600006|7|7771600006|1|SHASTA FINANCIAL SERVICES, INC
Subprime and Manufactured Home List (1999)|77772900005|7|7772900005|1|MORTGAGE PLUS EQUITY & LOAN   
Subprime and Manufactured Home List (1999)|77775100007|7|7775100007|1|MILA, INC.                    
Subprime and Manufactured Home List (1999)|77786700007|7|7786700007|1|COLUMBIA MORTGAGE & FUNDING CO
Subprime and Manufactured Home List (1999)|77840600009|7|7840600009|1|BNC MORTGAGE, INC.            
Subprime and Manufactured Home List (1999)|77853200002|7|7853200002|1|PARKWAY MORTGAGE              
Subprime and Manufactured Home List (1999)|77859500003|7|7859500003|1|UNITED COMPANIES FUNDING INCOR
Subprime and Manufactured Home List (1999)|77871200006|7|7871200006|1|SUMMIT MORTGAGE CORPORATION   
Subprime and Manufactured Home List (1999)|77875200001|7|7875200001|1|FIRST GREENSBORO HOME EQUITY  
Subprime and Manufactured Home List (1999)|77875900008|7|7875900008|1|EQUIVANTAGE INC.              
Subprime and Manufactured Home List (1999)|77885300000|7|7885300000|1|STERLING MORTGAGE & INVESTMENT
Subprime and Manufactured Home List (1999)|77885400001|7|7885400001|1|COREWEST BANC                 
Subprime and Manufactured Home List (1999)|77892800004|7|7892800004|1|FIELDSTONE MORTGAGE COMPANY   
Subprime and Manufactured Home List (1999)|77900200006|7|7900200006|1|NEW CENTURY MORTGAGE          
Subprime and Manufactured Home List (1999)|77903500008|7|7903500008|1|IMPERIAL HOME LOANS, INC.     
Subprime and Manufactured Home List (1999)|77905300009|7|7905300009|1|AMERICREDIT CORP OF CALIFORNIA
Subprime and Manufactured Home List (1999)|77920900009|7|7920900009|1|FIRST EQUITY MORTGAGE CORPORAT
Subprime and Manufactured Home List (1999)|77927200007|7|7927200007|1|NEW FREEDOM MORTGAGE CORP     
Subprime and Manufactured Home List (1999)|77942800007|7|7942800007|1|TRANSAMERICA MORTGAGE COMPANY 
Subprime and Manufactured Home List (1999)|77943800003|7|7943800003|1|SAXON MORTGAGE                
Subprime and Manufactured Home List (1999)|77957300002|7|7957300002|1|MARSHALL REDDER HOME MTG.     
Subprime and Manufactured Home List (1999)|77958900004|7|7958900004|1|YES CAPITAL FUNDING           
Subprime and Manufactured Home List (1999)|77967200005|7|7967200005|1|PORTFOLIO MORTGAGE COMPANY INC
Subprime and Manufactured Home List (1999)|77970400005|7|7970400005|1|FIRST GOVERNMENT MORTGAGE     
Subprime and Manufactured Home List (1999)|788-0379692|7|88-0379692|1|GOODRICH & PENNINGTON MORTGAGE
Subprime and Manufactured Home List (1999)|791-1872563|7|91-1872563|1|SEATTLE FUNDING GROUP, LTD.   
Subprime and Manufactured Home List (1999)|795-2622032|7|95-2622032|1|AAMES FUNDING CORPORATION     
Subprime and Manufactured Home List (1999)|795-2944875|7|95-2944875|1|FIRST ALLIANCE MORTGAGE COMPAN
Subprime and Manufactured Home List (1999)|795-4438859|7|95-4438859|1|AAMES CAPITAL CORPORATION     
Subprime and Manufactured Home List (1999)|10000001122|1|0000001122|2|CENTRAL NB                    
Subprime and Manufactured Home List (1999)|10000014569|1|0000014569|2|SOUTHTRUST BK NA              
Subprime and Manufactured Home List (1999)|134-1831194|1|34-1831194|2|MOBILE CONSULTANTS INC        
Subprime and Manufactured Home List (1999)|192-0145407|1|92-0145407|2|NORTHLAND CREDIT CORPORATION  
Subprime and Manufactured Home List (1999)|20000331647|2|0000331647|2|BANK ONE MICHIGAN             
Subprime and Manufactured Home List (1999)|20001035401|2|0001035401|2|CIT GROUP/SALES FINANCING DE  
Subprime and Manufactured Home List (1999)|20002686305|2|0002686305|2|CRESTPOINTE FINANCIAL CORP    
Subprime and Manufactured Home List (1999)|30000025726|3|0000025726|2|MURPHY BK                     
Subprime and Manufactured Home List (1999)|30000033792|3|0000033792|2|ASSOCIATES CAP BK             
Subprime and Manufactured Home List (1999)|30000034536|3|0000034536|2|CONSECO BK                    
Subprime and Manufactured Home List (1999)|333-0862378|3|33-0862378|2|GREENPOINT CREDIT LLC         
Subprime and Manufactured Home List (1999)|333-0875033|3|33-0875033|2|GREENPOINT CREDIT OF MS LLC   
Subprime and Manufactured Home List (1999)|40000007705|4|0000007705|2|NORTHEAST BANK, F.S.B.        
Subprime and Manufactured Home List (1999)|70383313951|7|0383313951|2|MHFC, INC.                    
Subprime and Manufactured Home List (1999)|72294709990|7|2294709990|2|CONSECO FINANCE SERVICING CORP
Subprime and Manufactured Home List (1999)|736-3423660|7|36-3423660|2|JOHN DEERE CREDIT MH RETAIL   
Subprime and Manufactured Home List (1999)|74856500006|7|4856500006|2|VANDERBILT MORTGAGE           
Subprime and Manufactured Home List (1999)|754-1779092|7|54-1779092|2|DYNEX FINANCIAL, INC          
Subprime and Manufactured Home List (1999)|756-1977469|7|56-1977469|2|DEUTSCHE FINANCIAL CAPITAL LLC
Subprime and Manufactured Home List (1999)|77162800002|7|7162800002|2|21ST CENTURY MORTGAGE         
Subprime and Manufactured Home List (1999)|775-2585326|7|75-2585326|2|COUNTRYPLACE MORTGAGE, LTD.   
Subprime and Manufactured Home List (1999)|775-2731850|7|75-2731850|2|THE ASSOCIATES                
Subprime and Manufactured Home List (1999)|77506600003|7|7506600003|2|OAKWOOD ACCEPTANCE CORPORATION
Subprime and Manufactured Home List (2000)|10000015033|1|0000015033|1|ADVANTA NB                    
Subprime and Manufactured Home List (2000)|10000022559|1|0000022559|1|FIRST UNION NATIONAL BANK - DE
Subprime and Manufactured Home List (2000)|10000022908|1|0000022908|1|KEY BK USA NA                 
Subprime and Manufactured Home List (2000)|10000023160|1|0000023160|1|CHASE MANHATTAN BK USA NA     
Subprime and Manufactured Home List (2000)|122-2293022|1|22-2293022|1|THE MONEY STORE               
Subprime and Manufactured Home List (2000)|122-2630964|1|22-2630964|1|CHAMPION MORTGAGE CO.         
Subprime and Manufactured Home List (2000)|136-4114231|1|36-4114231|1|FIRST FRANKLIN FNCL CO        
Subprime and Manufactured Home List (2000)|138-3360279|1|38-3360279|1|FIRST NATL ACCEPTANCE CO OF NA
Subprime and Manufactured Home List (2000)|152-2113031|1|52-2113031|1|HOMEOWNERS LOAN CORP          
Subprime and Manufactured Home List (2000)|156-1796719|1|56-1796719|1|NATIONSCREDIT FINANCIAL SVES  
Subprime and Manufactured Home List (2000)|159-2645397|1|59-2645397|1|ALTEGRA CREDIT COMPANY        
Subprime and Manufactured Home List (2000)|20000765578|2|0000765578|1|BANC ONE FINANCIAL SERVICES   
Subprime and Manufactured Home List (2000)|20000860473|2|0000860473|1|CITIFINANCIAL INC - OHIO      
Subprime and Manufactured Home List (2000)|20000902270|2|0000902270|1|CITIFINANCIAL SERVICES INC-PA 
Subprime and Manufactured Home List (2000)|20001035698|2|0001035698|1|CIT GROUP/CONSUMER FINANCE,INC
Subprime and Manufactured Home List (2000)|20001942602|2|0001942602|1|EQUITY ONE, INC               
Subprime and Manufactured Home List (2000)|20001999138|2|0001999138|1|CIT GROUP/SALES FINANCE       
Subprime and Manufactured Home List (2000)|20002032612|2|0002032612|1|SECURITY MUTUAL FNCL SVC      
Subprime and Manufactured Home List (2000)|20002039488|2|0002039488|1|WELLS FARGO FNCL AMER DES MOIN
Subprime and Manufactured Home List (2000)|20002134936|2|0002134936|1|WELLS FARGO FNCL SYS FL DESMOI
Subprime and Manufactured Home List (2000)|20002418980|2|0002418980|1|WELLS FARGO FNCL ACCEPT AMER  
Subprime and Manufactured Home List (2000)|20002534303|2|0002534303|1|MID AM FNCL SVC               
Subprime and Manufactured Home List (2000)|20002617242|2|0002617242|1|WEST GA CREDIT SVC            
Subprime and Manufactured Home List (2000)|20002721701|2|0002721701|1|CIT GROUP/CONSUMER FINANCE,INC
Subprime and Manufactured Home List (2000)|20002750532|2|0002750532|1|CITIFINANCIAL INC-WV          
Subprime and Manufactured Home List (2000)|20002751762|2|0002751762|1|CITIFINANCIAL INC - TENN      
Subprime and Manufactured Home List (2000)|20002751801|2|0002751801|1|CITIFINANCIAL  SERVICES INC-OH
Subprime and Manufactured Home List (2000)|20002751810|2|0002751810|1|CITIFINANCIAL SERVICES INC-DEL
Subprime and Manufactured Home List (2000)|20002751847|2|0002751847|1|CITIFINANCIAL SERVICES INC-MO 
Subprime and Manufactured Home List (2000)|20002751913|2|0002751913|1|CITIFINANCIAL OF VIRGINIA     
Subprime and Manufactured Home List (2000)|20002751922|2|0002751922|1|CITIFINANCIAL SERVICES INC-GA 
Subprime and Manufactured Home List (2000)|20002751968|2|0002751968|1|CITIFINANCIAL  INC - SC       
Subprime and Manufactured Home List (2000)|20002751986|2|0002751986|1|CITIFINANCIAL INC-MD          
Subprime and Manufactured Home List (2000)|20002751995|2|0002751995|1|CITIFINANCIAL EQUITY SER - OK 
Subprime and Manufactured Home List (2000)|20002752013|2|0002752013|1|CITIFINANCIAL  SERVICES INC-KY
Subprime and Manufactured Home List (2000)|20002752022|2|0002752022|1|CITIFINANCIAL  INC - IOWA     
Subprime and Manufactured Home List (2000)|20002752031|2|0002752031|1|CITIFINANCIAL INC OF MISS.    
Subprime and Manufactured Home List (2000)|20002752077|2|0002752077|1|CITIFINANCIAL SERVICES INC-CA 
Subprime and Manufactured Home List (2000)|20002752321|2|0002752321|1|CITIFINANCIAL COMPANY         
Subprime and Manufactured Home List (2000)|20002817118|2|0002817118|1|CITIFINANCIAL INC - TEXAS CORP
Subprime and Manufactured Home List (2000)|20002861287|2|0002861287|1|CITIFINANCIAL MORTGAGE, DELAWA
Subprime and Manufactured Home List (2000)|20002861595|2|0002861595|1|CITIFINANCIAL SERVICES INC-MA 
Subprime and Manufactured Home List (2000)|20002914969|2|0002914969|1|NCS MORTGAGE LENDING CO       
Subprime and Manufactured Home List (2000)|20002975027|2|0002975027|1|ASSOCIATES FIN. SERV. CO OF TX
Subprime and Manufactured Home List (2000)|20002977151|2|0002977151|1|ASSOCIATES HOME EQUITY SERVICE
Subprime and Manufactured Home List (2000)|30000025653|3|0000025653|1|FREMONT INV & LOAN            
Subprime and Manufactured Home List (2000)|30000025870|3|0000025870|1|FINANCE & THRIFT CO           
Subprime and Manufactured Home List (2000)|30000026363|3|0000026363|1|COMMUNITY CMRC BK             
Subprime and Manufactured Home List (2000)|30000033535|3|0000033535|1|ADVANTA BK CORP               
Subprime and Manufactured Home List (2000)|325-1238830|3|25-1238830|1|PV FINANCIAL SERVICE, INC     
Subprime and Manufactured Home List (2000)|358-2043633|3|58-2043633|1|SFI FINANCIAL SRVS, INC. (GA) 
Subprime and Manufactured Home List (2000)|358-2257419|3|58-2257419|1|LENDMARK FINANCIAL SERVICES   
Subprime and Manufactured Home List (2000)|358-2374513|3|58-2374513|1|BEST FINANCIAL SRVS. (ALABAMA)
Subprime and Manufactured Home List (2000)|362-1376832|3|62-1376832|1|SOUTHERN FINANCIAL INC        
Subprime and Manufactured Home List (2000)|362-1460952|3|62-1460952|1|SOUTHERN FIN MORTGAGE INC.    
Subprime and Manufactured Home List (2000)|362-1688241|3|62-1688241|1|FB FINANCIAL SERVICES         
Subprime and Manufactured Home List (2000)|363-1121281|3|63-1121281|1|ACCEPTANCE LOAN CO.           
Subprime and Manufactured Home List (2000)|364-0838616|3|64-0838616|1|HANCOCK MORTGAGE CORP         
Subprime and Manufactured Home List (2000)|40000004592|4|0000004592|1|OCWEN FEDERAL BANK FSB        
Subprime and Manufactured Home List (2000)|40000006194|4|0000006194|1|HOUSEHOLD BANK, FSB           
Subprime and Manufactured Home List (2000)|40000007645|4|0000007645|1|WESTERN FINANCIAL BANK        
Subprime and Manufactured Home List (2000)|40000007946|4|0000007946|1|LIFE BANK                     
Subprime and Manufactured Home List (2000)|40000008051|4|0000008051|1|BAY FINANCIAL SAVINGS BANK, F.
Subprime and Manufactured Home List (2000)|40000008308|4|0000008308|1|BALTIMORE AMERICAN SAVINGS BAN
Subprime and Manufactured Home List (2000)|40000008566|4|0000008566|1|SUPERIOR BANK FSB             
Subprime and Manufactured Home List (2000)|40000008569|4|0000008569|1|APPROVED FEDERAL SAVINGS BANK 
Subprime and Manufactured Home List (2000)|40000011968|4|0000011968|1|PAN AMERICAN BANK, FSB        
Subprime and Manufactured Home List (2000)|40000014470|4|0000014470|1|TRAVELERS BANK & TRUST, FSB   
Subprime and Manufactured Home List (2000)|40341225701|4|0341225701|1|CHARTER ONE CREDIT CORP       
Subprime and Manufactured Home List (2000)|40510356097|4|0510356097|1|WILMINGTON NATIONAL FINANCE   
Subprime and Manufactured Home List (2000)|40760539855|4|0760539855|1|HS MORTGAGE ACCEPTANCE        
Subprime and Manufactured Home List (2000)|70232646780|7|0232646780|1|AMERICAN BUSINESS FINANCIAL   
Subprime and Manufactured Home List (2000)|70330756645|7|0330756645|1|GREATER ACCEPTANCE MORTGAGE CO
Subprime and Manufactured Home List (2000)|70458600405|7|0458600405|1|WMC MORTGAGE CORP.            
Subprime and Manufactured Home List (2000)|70582509828|7|0582509828|1|CHOICE CAPITAL FUNDING        
Subprime and Manufactured Home List (2000)|70861409991|7|0861409991|1|METROPOLITAN MORTGAGE COMPANY 
Subprime and Manufactured Home List (2000)|70912041536|7|0912041536|1|INFINITY FINANCIAL NETWORK    
Subprime and Manufactured Home List (2000)|71003800004|7|1003800004|1|LONG BEACH MORTGAGE COMPANY   
Subprime and Manufactured Home List (2000)|71014100002|7|1014100002|1|FULL SPECTRUM LENDING, INC.   
Subprime and Manufactured Home List (2000)|71059700002|7|1059700002|1|FIRST CONSOLIDATED MORTGAGE CO
Subprime and Manufactured Home List (2000)|71061700007|7|1061700007|1|TOWN & COUNTRY CREDIT CORP.   
Subprime and Manufactured Home List (2000)|71075700003|7|1075700003|1|AURORA LOAN SERVICES          
Subprime and Manufactured Home List (2000)|71085800002|7|1085800002|1|SPECIALTY MORTGAGE CORPORATION
Subprime and Manufactured Home List (2000)|71118100001|7|1118100001|1|MORTGAGE LENDERS NETWORK USA  
Subprime and Manufactured Home List (2000)|71125400003|7|1125400003|1|EQUIFIRST CORPORATION         
Subprime and Manufactured Home List (2000)|71126000006|7|1126000006|1|SEBRING CAPITAL CORPORATION   
Subprime and Manufactured Home List (2000)|711-2815564|7|11-2815564|1|EHOMECREDIT CORP.             
Subprime and Manufactured Home List (2000)|71195900005|7|1195900005|1|LOAN FUNDING CORP. OF AMERICA 
Subprime and Manufactured Home List (2000)|71207500004|7|1207500004|1|COURTESY MORTGAGE COMPANY     
Subprime and Manufactured Home List (2000)|71248200000|7|1248200000|1|AMERUS HOME EQUITY, INC.      
Subprime and Manufactured Home List (2000)|71250200008|7|1250200008|1|MONEYONE, INC.                
Subprime and Manufactured Home List (2000)|71254000001|7|1254000001|1|WASHINGTON MORTGAGE COMPANY   
Subprime and Manufactured Home List (2000)|71259600009|7|1259600009|1|SOUTH STAR FUNDING, LLC       
Subprime and Manufactured Home List (2000)|71287100006|7|1287100006|1|FIRST CITY FUNDING D/CREDIT CO
Subprime and Manufactured Home List (2000)|71291700001|7|1291700001|1|HEARTHSIDE LENDING CORP.      
Subprime and Manufactured Home List (2000)|71345300006|7|1345300006|1|THE MORTGAGE OUTLET           
Subprime and Manufactured Home List (2000)|71345700002|7|1345700002|1|BRIDGE CAPITAL CORPORATION    
Subprime and Manufactured Home List (2000)|71394900006|7|1394900006|1|SECURED FUNDING CORPORATION   
Subprime and Manufactured Home List (2000)|71441000001|7|1441000001|1|PSP FINANCIAL SERVICES, INC.  
Subprime and Manufactured Home List (2000)|71463300003|7|1463300003|1|MOORE FINANCIAL ENTERPRISES, I
Subprime and Manufactured Home List (2000)|71474600000|7|1474600000|1|NORTHERN STAR FUNDING, LLC    
Subprime and Manufactured Home List (2000)|71483300003|7|1483300003|1|FINANCE AMERICA, LLC          
Subprime and Manufactured Home List (2000)|71512400000|7|1512400000|1|NOVASTAR                      
Subprime and Manufactured Home List (2000)|71515800003|7|1515800003|1|THE LENDING GROUP, INC.       
Subprime and Manufactured Home List (2000)|71534900004|7|1534900004|1|FIRST NLC FINANCIAL SERVICES  
Subprime and Manufactured Home List (2000)|71596200005|7|1596200005|1|GMFS LLC                      
Subprime and Manufactured Home List (2000)|71611300007|7|1611300007|1|EQUITY RESOURCES, INC.        
Subprime and Manufactured Home List (2000)|71665100001|7|1665100001|1|PINNACLE DIRECT FUNDING CORP
Subprime and Manufactured Home List (2000)|722-3397885|7|22-3397885|1|AMERICAP FINANCIAL, INC.      
Subprime and Manufactured Home List (2000)|723-2434974|7|23-2434974|1|ADVANTA MTG CORP. - MIDWEST   
Subprime and Manufactured Home List (2000)|723-2532654|7|23-2532654|1|ADVANTA MORTGAGE CORP. USA    
Subprime and Manufactured Home List (2000)|723-2681022|7|23-2681022|1|RESOURCE ONE CONSUMER DISCOUNT
Subprime and Manufactured Home List (2000)|723-2772890|7|23-2772890|1|RESIDENTIAL MONEY CENTERS, INC
Subprime and Manufactured Home List (2000)|723-2778991|7|23-2778991|1|ADVANTA FINANCE CORP.         
Subprime and Manufactured Home List (2000)|733-0515201|7|33-0515201|1|SOUTH SHORE MORTGAGE, INC.    
Subprime and Manufactured Home List (2000)|733-0651685|7|33-0651685|1|PINNFUND, USA                 
Subprime and Manufactured Home List (2000)|733-0729914|7|33-0729914|1|ROYAL MORTGAGEBANC            
Subprime and Manufactured Home List (2000)|735-1781299|7|35-1781299|1|CAPITAL FINANCIAL SERVICES,INC
Subprime and Manufactured Home List (2000)|735-2088209|7|35-2088209|1|CRESLEIGH FINANCIAL SVC, LLC  
Subprime and Manufactured Home List (2000)|736-4334512|7|36-4334512|1|HEARTLAND ENTERPRISES, INC.   
Subprime and Manufactured Home List (2000)|738-3075078|7|38-3075078|1|FRANKLIN MORTGAGE FUNDING     
Subprime and Manufactured Home List (2000)|74893600009|7|4893600009|1|FEDERAL MORTGAGE & INVESTMENT 
Subprime and Manufactured Home List (2000)|75049400004|7|5049400004|1|ANSON FINANCIAL, INC.         
Subprime and Manufactured Home List (2000)|75221409993|7|5221409993|1|DIVERSIFIED MORTGAGE SERVICES 
Subprime and Manufactured Home List (2000)|75535100002|7|5535100002|1|METWEST MORTGAGE SERVICES, INC
Subprime and Manufactured Home List (2000)|756-2023609|7|56-2023609|1|EQUIFIRST MORTGAGE CORPORATION
Subprime and Manufactured Home List (2000)|756-2114785|7|56-2114785|1|EQUIFIRST MORTGAGE CORP. OF MN
Subprime and Manufactured Home List (2000)|759-3324910|7|59-3324910|1|HOMEGOLD, INC.                
Subprime and Manufactured Home List (2000)|76473909996|7|6473909996|1|FIRST NATIONAL MORTGAGE CO.   
Subprime and Manufactured Home List (2000)|766-0524453|7|66-0524453|1|EASY MONEY - MORTGAGE DIVISION
Subprime and Manufactured Home List (2000)|77023300002|7|7023300002|1|SEACOAST EQUITIES, INC.       
Subprime and Manufactured Home List (2000)|77033900007|7|7033900007|1|TITLE WESTMORTGAGE INC        
Subprime and Manufactured Home List (2000)|77042100008|7|7042100008|1|DOLLAR MORTGAGE CORPORATION   
Subprime and Manufactured Home List (2000)|77059200001|7|7059200001|1|PREFERRED FINANCIAL FUNDING, I
Subprime and Manufactured Home List (2000)|77062300004|7|7062300004|1|BUDGET NATIONAL FINANCE COMPAN
Subprime and Manufactured Home List (2000)|77069000008|7|7069000008|1|DELTA FUNDING CORP            
Subprime and Manufactured Home List (2000)|77086400004|7|7086400004|1|AMERICAN BENEFIT MORTGAGE, INC
Subprime and Manufactured Home List (2000)|77113200004|7|7113200004|1|ADCO FINANCIAL MORTGAGE SERVIC
Subprime and Manufactured Home List (2000)|77152500000|7|7152500000|1|PLATINUM CAPITAL GROUP        
Subprime and Manufactured Home List (2000)|77177000002|7|7177000002|1|MERITAGE MORTGAGE CORPORATION 
Subprime and Manufactured Home List (2000)|77177900003|7|7177900003|1|CHADWICK MORTGAGE, INC.       
Subprime and Manufactured Home List (2000)|77185300006|7|7185300006|1|ACCREDITED HOME LENDERS, INC. 
Subprime and Manufactured Home List (2000)|77230100005|7|7230100005|1|HMC FUNDING                   
Subprime and Manufactured Home List (2000)|77261100005|7|7261100005|1|UNICOR FUNDING, INC.          
Subprime and Manufactured Home List (2000)|77269800002|7|7269800002|1|MORTGAGE FUNDING              
Subprime and Manufactured Home List (2000)|77307200009|7|7307200009|1|HCL FINANCE INC.              
Subprime and Manufactured Home List (2000)|77323800008|7|7323800008|1|EXPRESS CAPITAL LENDING       
Subprime and Manufactured Home List (2000)|77354400002|7|7354400002|1|ENCORE MORTGAGE SERVICES, INC.
Subprime and Manufactured Home List (2000)|77407100001|7|7407100001|1|FOOTHILL FUNDING GROUP, INC   
Subprime and Manufactured Home List (2000)|77431100008|7|7431100008|1|OAKMONT MORTGAGE COMPANY      
Subprime and Manufactured Home List (2000)|77464900009|7|7464900009|1|EMC MORTGAGE CORPORATION      
Subprime and Manufactured Home List (2000)|77479800008|7|7479800008|1|CHAPEL MORTGAGE CORPORATION   
Subprime and Manufactured Home List (2000)|77507300007|7|7507300007|1|ALLIED MORTGAGE CAPITAL CORP. 
Subprime and Manufactured Home List (2000)|77511600000|7|7511600000|1|CONTIMORTGAGE CORPORATION     
Subprime and Manufactured Home List (2000)|775-2570083|7|75-2570083|1|CENTEX HOME EQUITY CORPORATION
Subprime and Manufactured Home List (2000)|775-2712433|7|75-2712433|1|CONCORDE ACCEPTANCE CORPORATIO
Subprime and Manufactured Home List (2000)|77542800002|7|7542800002|1|MLSG, INC.                    
Subprime and Manufactured Home List (2000)|77604800006|7|7604800006|1|OPTION ONE MORTGAGE CORP.     
Subprime and Manufactured Home List (2000)|77619100004|7|7619100004|1|C & G FINANCIAL SERVICES, INC.
Subprime and Manufactured Home List (2000)|77621700002|7|7621700002|1|WORLD WIDE FINANCIAL SERVICES 
Subprime and Manufactured Home List (2000)|77634100004|7|7634100004|1|AMERICAN MORTGAGE EXCHANGE    
Subprime and Manufactured Home List (2000)|77642300001|7|7642300001|1|LIBERTY AMERICAN MORTGAGE CORP
Subprime and Manufactured Home List (2000)|77646700017|7|7646700017|1|PMCC MORTGAGE CORP.           
Subprime and Manufactured Home List (2000)|77648500001|7|7648500001|1|4ADREAM.COM                   
Subprime and Manufactured Home List (2000)|77650700000|7|7650700000|1|AMERICA'S MONEYLINE           
Subprime and Manufactured Home List (2000)|77652800004|7|7652800004|1|NATION ONE MORTGAGE COMPANY   
Subprime and Manufactured Home List (2000)|77662200007|7|7662200007|1|SOUND MORTGAGE CORPORATION    
Subprime and Manufactured Home List (2000)|77665200006|7|7665200006|1|AMERICAN ACCEPTANCE MORTGAGE, 
Subprime and Manufactured Home List (2000)|77673400003|7|7673400003|1|INVESTAID CORPORATION         
Subprime and Manufactured Home List (2000)|77696200007|7|7696200007|1|IMC MORTGAGE COMPANY          
Subprime and Manufactured Home List (2000)|77718200008|7|7718200008|1|AMERICAN HOME LOANS           
Subprime and Manufactured Home List (2000)|77733200002|7|7733200002|1|CENTURY FINANCIAL GROUP, INC. 
Subprime and Manufactured Home List (2000)|77756300009|7|7756300009|1|AMERICAN EQUITY MORTGAGE, INC.
Subprime and Manufactured Home List (2000)|77756600001|7|7756600001|1|AMERIQUEST MORTGAGE COMPANY   
Subprime and Manufactured Home List (2000)|77770100005|7|7770100005|1|BOMAC MORTGAGE HOLDINGS       
Subprime and Manufactured Home List (2000)|77775100007|7|7775100007|1|MILA, INC.                    
Subprime and Manufactured Home List (2000)|77786700007|7|7786700007|1|COLUMBIA MORTGAGE & FUNDING CO
Subprime and Manufactured Home List (2000)|77840600009|7|7840600009|1|BNC MORTGAGE INC              
Subprime and Manufactured Home List (2000)|77853200002|7|7853200002|1|PARKWAY MORTGAGE              
Subprime and Manufactured Home List (2000)|77871200006|7|7871200006|1|SUMMIT MORTGAGE CORPORATION   
Subprime and Manufactured Home List (2000)|77875200001|7|7875200001|1|FIRST GREENSBORO HOME EQUITY  
Subprime and Manufactured Home List (2000)|77885300000|7|7885300000|1|STERLING MORTGAGE & INVESTMENT
Subprime and Manufactured Home List (2000)|77892800004|7|7892800004|1|FIELDSTONE MORTGAGE COMPANY   
Subprime and Manufactured Home List (2000)|77900200006|7|7900200006|1|NEW CENTURY MORTGAGE CORP.    
Subprime and Manufactured Home List (2000)|77905300009|7|7905300009|1|AMERICREDIT CORP OF CALIFORNIA
Subprime and Manufactured Home List (2000)|77920900009|7|7920900009|1|FIRST EQUITY MORTGAGE CORPORAT
Subprime and Manufactured Home List (2000)|77927200007|7|7927200007|1|NEW FREEDOM MORTGAGE CORP     
Subprime and Manufactured Home List (2000)|77942800007|7|7942800007|1|TRANSAMERICA MORTGAGE COMPANY 
Subprime and Manufactured Home List (2000)|77943800003|7|7943800003|1|SAXON MORTGAGE, INC.          
Subprime and Manufactured Home List (2000)|77957300002|7|7957300002|1|MARSHALL REDDER HOME MTG.     
Subprime and Manufactured Home List (2000)|77958900004|7|7958900004|1|YES CAPITAL FUNDING           
Subprime and Manufactured Home List (2000)|77967200005|7|7967200005|1|PORTFOLIO MORTGAGE COMPANY    
Subprime and Manufactured Home List (2000)|791-1872563|7|91-1872563|1|SEATTLE FUNDING GROUP, LTD.   
Subprime and Manufactured Home List (2000)|795-2622032|7|95-2622032|1|AAMES FUNDING CORPORATION     
Subprime and Manufactured Home List (2000)|795-2944875|7|95-2944875|1|FIRST ALLIANCE MORTGAGE CO.   
Subprime and Manufactured Home List (2000)|795-4438859|7|95-4438859|1|AAMES CAPITAL CORPORATION     
Subprime and Manufactured Home List (2000)|10000001122|1|0000001122|2|CENTRAL NB                    
Subprime and Manufactured Home List (2000)|123-3004704|1|23-3004704|2|PENN 1ST FINANCIAL            
Subprime and Manufactured Home List (2000)|134-1831194|1|34-1831194|2|MOBILE CONSULTANTS INC        
Subprime and Manufactured Home List (2000)|192-0145407|1|92-0145407|2|NORTHLAND CREDIT CORPORATION  
Subprime and Manufactured Home List (2000)|20000331647|2|0000331647|2|BANK ONE MI                   
Subprime and Manufactured Home List (2000)|20001035401|2|0001035401|2|CIT GROUP/SALES FINANCING DE  
Subprime and Manufactured Home List (2000)|20002686305|2|0002686305|2|CRESTPOINTE FNCL CORP         
Subprime and Manufactured Home List (2000)|20002977384|2|0002977384|2|ASSOCIATES HOUSING FINANCE LLC
Subprime and Manufactured Home List (2000)|30000025726|3|0000025726|2|MURPHY BK                     
Subprime and Manufactured Home List (2000)|30000033792|3|0000033792|2|ASSOCIATES CAP BK             
Subprime and Manufactured Home List (2000)|30000034536|3|0000034536|2|CONSECO BK                    
Subprime and Manufactured Home List (2000)|333-0862379|3|33-0862379|2|GREENPOINT CREDIT LLC         
Subprime and Manufactured Home List (2000)|333-0875033|3|33-0875033|2|GREENPOINT CREDIT OF MS LLC   
Subprime and Manufactured Home List (2000)|40000007705|4|0000007705|2|NORTHEAST BANK, F.S.B.        
Subprime and Manufactured Home List (2000)|40042590778|4|0042590778|2|FORWARD FINANCIAL             
Subprime and Manufactured Home List (2000)|40411620302|4|0411620302|2|HOMEOWNERS MORTGAGE CORP      
Subprime and Manufactured Home List (2000)|71118300003|7|1118300003|2|BOMBARDIER CAPITAL INC.       
Subprime and Manufactured Home List (2000)|72294709990|7|2294709990|2|CONSECO FINANCE SERVICING CORP
Subprime and Manufactured Home List (2000)|74856500006|7|4856500006|2|VANDERBILT MORTGAGE           
Subprime and Manufactured Home List (2000)|754-1779092|7|54-1779092|2|DYNEX FINANCIAL, INC          
Subprime and Manufactured Home List (2000)|77162800002|7|7162800002|2|21ST CENTURY MORTGAGE         
Subprime and Manufactured Home List (2000)|77245500008|7|7245500008|2|LAND/HOME FINANCIAL SERVICES  
Subprime and Manufactured Home List (2000)|77506600003|7|7506600003|2|OAKWOOD ACCEPTANCE CORPORATION
Subprime and Manufactured Home List (2000)|775-2585326|7|75-2585326|2|COUNTRY PLACE MORTGAGE        
Subprime and Manufactured Home List (2001)|10000015033|1|0000015033|1|ADVANTA NB                    
Subprime and Manufactured Home List (2001)|10000022559|1|0000022559|1|FIRST UNION NB OF DE          
Subprime and Manufactured Home List (2001)|10000022908|1|0000022908|1|KEY BK USA NA                 
Subprime and Manufactured Home List (2001)|10000023160|1|0000023160|1|CHASE MANHATTAN BK USA NA     
Subprime and Manufactured Home List (2001)|10000024095|1|0000024095|1|MBNA AMERICA DE NA            
Subprime and Manufactured Home List (2001)|106-1034218|1|06-1034218|1|ASSOCIATES INTL HOLDING CORP  
Subprime and Manufactured Home List (2001)|136-4114231|1|36-4114231|1|FIRST FRANKLIN FNCL CO        
Subprime and Manufactured Home List (2001)|138-1620418|1|38-1620418|1|FIRST NATIONAL ACCEPTANCE CO. 
Subprime and Manufactured Home List (2001)|138-3360279|1|38-3360279|1|FIRST NATL ACCEPTANCE CO OF NA
Subprime and Manufactured Home List (2001)|152-2113031|1|52-2113031|1|HOMEOWNERS LOAN CORP          
Subprime and Manufactured Home List (2001)|156-1796719|1|56-1796719|1|NATIONSCREDIT FINANCIAL SVES  
Subprime and Manufactured Home List (2001)|159-2645397|1|59-2645397|1|ALTEGRA CREDIT COMPANY        
Subprime and Manufactured Home List (2001)|20000612618|2|0000612618|1|PROVIDENT BK                  
Subprime and Manufactured Home List (2001)|20000860473|2|0000860473|1|CITIFINANCIAL INC - OHIO      
Subprime and Manufactured Home List (2001)|20000902270|2|0000902270|1|CITIFINANCIAL SERVICES INC-PA 
Subprime and Manufactured Home List (2001)|20001035698|2|0001035698|1|CIT GROUP/CONSUMER FNC NY     
Subprime and Manufactured Home List (2001)|20001942602|2|0001942602|1|EQUITY ONE, INC               
Subprime and Manufactured Home List (2001)|20001999138|2|0001999138|1|CIT GROUP/SALES FINANCE       
Subprime and Manufactured Home List (2001)|20002039488|2|0002039488|1|WELLS FARGO FNCL AMER         
Subprime and Manufactured Home List (2001)|20002040961|2|0002040961|1|WELLS FARGO FNCL NV 2         
Subprime and Manufactured Home List (2001)|20002134936|2|0002134936|1|WELLS FARGO FNCL SYS FL       
Subprime and Manufactured Home List (2001)|20002418980|2|0002418980|1|WELLS FARGO FNCL ACCEPT AMER  
Subprime and Manufactured Home List (2001)|20002618744|2|0002618744|1|WELLS FARGO FNCL ACCEPT SYS FL
Subprime and Manufactured Home List (2001)|20002721701|2|0002721701|1|CIT GROUP/CONSUMER FNC TN     
Subprime and Manufactured Home List (2001)|20002750242|2|0002750242|1|CITIFINANCIAL SERVICES INC (MN
Subprime and Manufactured Home List (2001)|20002750532|2|0002750532|1|CITIFINANCIAL INC-WV          
Subprime and Manufactured Home List (2001)|20002751744|2|0002751744|1|CITIFINANCIAL SERVICES INC UT 
Subprime and Manufactured Home List (2001)|20002751762|2|0002751762|1|CITIFINANCIAL INC - TENN      
Subprime and Manufactured Home List (2001)|20002751801|2|0002751801|1|CITIFINANCIAL SERVICES INC-OH 
Subprime and Manufactured Home List (2001)|20002751810|2|0002751810|1|CITIFINANCIAL SERVICES INC-DEL
Subprime and Manufactured Home List (2001)|20002751847|2|0002751847|1|CITIFINANCIAL SERVICES INC-MO 
Subprime and Manufactured Home List (2001)|20002751913|2|0002751913|1|CITIFINANCIAL OF VIRGINIA     
Subprime and Manufactured Home List (2001)|20002751922|2|0002751922|1|CITIFINANCIAL SERVICES INC-GA 
Subprime and Manufactured Home List (2001)|20002751968|2|0002751968|1|CITIFINANCIAL INC - SC        
Subprime and Manufactured Home List (2001)|20002751986|2|0002751986|1|CITIFINANCIAL INC-MD          
Subprime and Manufactured Home List (2001)|20002751995|2|0002751995|1|CITIFINANCIAL EQUITY SER - OK 
Subprime and Manufactured Home List (2001)|20002752013|2|0002752013|1|CITIFINANCIAL SVC KY          
Subprime and Manufactured Home List (2001)|20002752022|2|0002752022|1|CITIFINANCIAL INC - IOWA      
Subprime and Manufactured Home List (2001)|20002752040|2|0002752040|1|CITIFINANCIAL CORP. DELAWARE  
Subprime and Manufactured Home List (2001)|20002752077|2|0002752077|1|CITIFINANCIAL SERVICES INC-CA 
Subprime and Manufactured Home List (2001)|20002752321|2|0002752321|1|CITIFINANCIAL COMPANY         
Subprime and Manufactured Home List (2001)|20002752527|2|0002752527|1|EQUIFIRST CORP                
Subprime and Manufactured Home List (2001)|20002752545|2|0002752545|1|EQUIFIRST MTG CORP            
Subprime and Manufactured Home List (2001)|20002752684|2|0002752684|1|CITIFINANCIAL CORP. COLORADO  
Subprime and Manufactured Home List (2001)|20002817118|2|0002817118|1|CITIFINANCIAL INC - TEXAS     
Subprime and Manufactured Home List (2001)|20002861595|2|0002861595|1|CITIFINANCIAL SERVICES INC-MA 
Subprime and Manufactured Home List (2001)|20002913597|2|0002913597|1|WELLS FARGO FNCL ACCEPT IA    
Subprime and Manufactured Home List (2001)|20002914969|2|0002914969|1|NCS MORTGAGE LENDING CO       
Subprime and Manufactured Home List (2001)|20002939748|2|0002939748|1|EQUIFIRST MTG CORP OF MN      
Subprime and Manufactured Home List (2001)|20002977151|2|0002977151|1|CITIFINANCIAL MORTGAGE        
Subprime and Manufactured Home List (2001)|20002978998|2|0002978998|1|ASSOCIATES FIRST CAPITAL MORTG
Subprime and Manufactured Home List (2001)|30000025653|3|0000025653|1|FREMONT INV & LOAN            
Subprime and Manufactured Home List (2001)|30000025870|3|0000025870|1|FINANCE & THRIFT CO           
Subprime and Manufactured Home List (2001)|30000026363|3|0000026363|1|COMMUNITY CMRC BK             
Subprime and Manufactured Home List (2001)|30000033535|3|0000033535|1|ADVANTA BK CORP               
Subprime and Manufactured Home List (2001)|325-1238830|3|25-1238830|1|PV FINANCIAL SERVICE, INC     
Subprime and Manufactured Home List (2001)|358-2257419|3|58-2257419|1|LENDMARK FINANCIAL SERVICES   
Subprime and Manufactured Home List (2001)|362-1688241|3|62-1688241|1|FB FINANCIAL SERVICES         
Subprime and Manufactured Home List (2001)|363-1131381|3|63-1131381|1|ACCEPTANCE LOAN CO.           
Subprime and Manufactured Home List (2001)|40000004592|4|0000004592|1|OCWEN FED BK FSB              
Subprime and Manufactured Home List (2001)|40000006194|4|0000006194|1|HOUSEHOLD BK FSB              
Subprime and Manufactured Home List (2001)|40000007645|4|0000007645|1|WESTERN FNCL BK               
Subprime and Manufactured Home List (2001)|40000007946|4|0000007946|1|LIFE BK                       
Subprime and Manufactured Home List (2001)|40000008051|4|0000008051|1|BAY FNCL SVG BK FSB           
Subprime and Manufactured Home List (2001)|40000008308|4|0000008308|1|BALTIMORE AMER SVG BK FSB     
Subprime and Manufactured Home List (2001)|40000008566|4|0000008566|1|SUPERIOR BK FSB               
Subprime and Manufactured Home List (2001)|40000008569|4|0000008569|1|APPROVED FSB                  
Subprime and Manufactured Home List (2001)|40000014470|4|0000014470|1|TRAVELERS B&T FSB             
Subprime and Manufactured Home List (2001)|40000014939|4|0000014939|1|AIG FSB
Subprime and Manufactured Home List (2001)|40000017925|4|0000017925|1|SUPERIOR FEDERAL BK           
Subprime and Manufactured Home List (2001)|40341225701|4|0341225701|1|CHARTER ONE CREDIT CORP       
Subprime and Manufactured Home List (2001)|40510356097|4|0510356097|1|WILMINGTON NATIONAL FINANCE   
Subprime and Manufactured Home List (2001)|40760539855|4|0760539855|1|HS MORTGAGE ACCEPTANCE        
Subprime and Manufactured Home List (2001)|70232646780|7|0232646780|1|AMERICAN BUSINESS FINANCIAL   
Subprime and Manufactured Home List (2001)|70330756645|7|0330756645|1|GREATER ACCEPTANCE MORTGAGE CO
Subprime and Manufactured Home List (2001)|70458600405|7|0458600405|1|WMC MORTGAGE CORP.            
Subprime and Manufactured Home List (2001)|705-0402708|7|05-0402708|1|ADVANCED FINANCIAL SERVICES, I
Subprime and Manufactured Home List (2001)|70510312284|7|0510312284|1|MOREQUITY, INC. (NV)          
Subprime and Manufactured Home List (2001)|70912041536|7|0912041536|1|INFINITY FINANCIAL NETWORK    
Subprime and Manufactured Home List (2001)|71003800004|7|1003800004|1|LONG BEACH MORTGAGE COMPANY   
Subprime and Manufactured Home List (2001)|71014100002|7|1014100002|1|FULL SPECTRUM LENDING, INC.   
Subprime and Manufactured Home List (2001)|71059700002|7|1059700002|1|FIRST CONSOLIDATED MORTGAGE   
Subprime and Manufactured Home List (2001)|71061700007|7|1061700007|1|TOWN & COUNTRY CREDIT CORP.   
Subprime and Manufactured Home List (2001)|71075700003|7|1075700003|1|AURORA LOAN SERVICES          
Subprime and Manufactured Home List (2001)|71085800002|7|1085800002|1|SPECIALTY MORTGAGE CORPORATION
Subprime and Manufactured Home List (2001)|71118100001|7|1118100001|1|MORTGAGE LENDERS NETWORK USA  
Subprime and Manufactured Home List (2001)|71126000006|7|1126000006|1|SEBRING CAPITAL CORPORATION   
Subprime and Manufactured Home List (2001)|711-2815564|7|11-2815564|1|EHOMECREDIT CORP.             
Subprime and Manufactured Home List (2001)|71195900005|7|1195900005|1|LOAN FUNDING CORP. OF AMERICA 
Subprime and Manufactured Home List (2001)|71207500004|7|1207500004|1|COURTESY MORTGAGE COMPANY     
Subprime and Manufactured Home List (2001)|71248200000|7|1248200000|1|AMERUS HOME EQUITY, INC.      
Subprime and Manufactured Home List (2001)|71250200008|7|1250200008|1|MONEYONE, INC.                
Subprime and Manufactured Home List (2001)|71254000001|7|1254000001|1|WASHINGTON MORTGAGE COMPANY   
Subprime and Manufactured Home List (2001)|71259600009|7|1259600009|1|SOUTH STAR FUNDING, LLC       
Subprime and Manufactured Home List (2001)|71265700002|7|1265700002|1|DECISION ONE MORTGAGE COMPANY 
Subprime and Manufactured Home List (2001)|71287100006|7|1287100006|1|FIRST CITY FUNDING            
Subprime and Manufactured Home List (2001)|71289800005|7|1289800005|1|MORTGAGE EXPRESS, INC.        
Subprime and Manufactured Home List (2001)|71291700001|7|1291700001|1|HEARTHSIDE LENDING CORP.      
Subprime and Manufactured Home List (2001)|71345300006|7|1345300006|1|THE MORTGAGE OUTLET           
Subprime and Manufactured Home List (2001)|71345700002|7|1345700002|1|BRIDGE CAPITAL CORPORATION    
Subprime and Manufactured Home List (2001)|71394900006|7|1394900006|1|SECURED FUNDING CORPORATION   
Subprime and Manufactured Home List (2001)|71463300003|7|1463300003|1|MOORE FINANCIAL ENTERPRISES, I
Subprime and Manufactured Home List (2001)|71474600000|7|1474600000|1|HOMESTAR MORTGAGE SERVICES    
Subprime and Manufactured Home List (2001)|71483300003|7|1483300003|1|FINANCE AMERICA, LLC          
Subprime and Manufactured Home List (2001)|71512400000|7|1512400000|1|NOVASTAR MORTGAGE INC.        
Subprime and Manufactured Home List (2001)|71534900004|7|1534900004|1|FIRST NLC FINANCIAL SERVICES  
Subprime and Manufactured Home List (2001)|71557900001|7|1557900001|1|PEOPLE'S CHOICE HOME LOAN, INC
Subprime and Manufactured Home List (2001)|71596200005|7|1596200005|1|GMFS, LLC                     
Subprime and Manufactured Home List (2001)|71596800005|7|1596800005|1|FIRST CHOICE FUNDING, INC.    
Subprime and Manufactured Home List (2001)|71606800005|7|1606800005|1|FIRST ALTERNATIVE MORTGAGE COR
Subprime and Manufactured Home List (2001)|71611300007|7|1611300007|1|EQUITY RESOURCES, INC.        
Subprime and Manufactured Home List (2001)|71652400007|7|1652400007|1|FIRST UNITED MORTGAGEBANC, INC
Subprime and Manufactured Home List (2001)|71665100001|7|1665100001|1|PINNACLE DIRECT FUNDING CORP
Subprime and Manufactured Home List (2001)|71665400004|7|1665400004|1|SOFIN INC.                    
Subprime and Manufactured Home List (2001)|71736300009|7|1736300009|1|JLM DIRECT FUNDING, LTD       
Subprime and Manufactured Home List (2001)|71766500005|7|1766500005|1|EBANC FUNDING                 
Subprime and Manufactured Home List (2001)|71809800001|7|1809800001|1|SERVICE FIRST MORTGAGE, L.C.  
Subprime and Manufactured Home List (2001)|722-3397885|7|22-3397885|1|AMERICAP FINANCIAL INC        
Subprime and Manufactured Home List (2001)|723-2434974|7|23-2434974|1|ADVANTA MTG CORP. - MIDWEST   
Subprime and Manufactured Home List (2001)|723-2532654|7|23-2532654|1|ADVANTA MORTGAGE CORP. USA    
Subprime and Manufactured Home List (2001)|723-2772890|7|23-2772890|1|RESIDENTIAL MONEY CENTERS, INC
Subprime and Manufactured Home List (2001)|723-2778991|7|23-2778991|1|ADVANTA FINANCE CORP.         
Subprime and Manufactured Home List (2001)|723-3051009|7|23-3051009|1|OPUS HOME EQUITY SERVICES, INC
Subprime and Manufactured Home List (2001)|733-0515201|7|33-0515201|1|SOUTH SHORE MORTGAGE, INC.    
Subprime and Manufactured Home List (2001)|735-1781299|7|35-1781299|1|CAPITAL FINANCIAL SERVICES INC
Subprime and Manufactured Home List (2001)|735-2088209|7|35-2088209|1|CRESLEIGH FINANCIAL SERVICES  
Subprime and Manufactured Home List (2001)|736-1239445|7|36-1239445|1|HOUSEHOLD FINANCE CORPORATION 
Subprime and Manufactured Home List (2001)|738-3075078|7|38-3075078|1|FRANKLIN MORTGAGE FUNDING     
Subprime and Manufactured Home List (2001)|741-1810165|7|41-1810165|1|LENDSOURCE, INC.              
Subprime and Manufactured Home List (2001)|74893600009|7|4893600009|1|FEDERAL MORTGAGE & INVESTMENT 
Subprime and Manufactured Home List (2001)|751-0003820|7|51-0003820|1|BENEFICIAL CORPORATION        
Subprime and Manufactured Home List (2001)|75221409993|7|5221409993|1|GRAYSTONE MORTGAGE CORPORATION
Subprime and Manufactured Home List (2001)|75535100002|7|5535100002|1|METWEST MORTGAGE SERVICES, INC
Subprime and Manufactured Home List (2001)|758-2291999|7|58-2291999|1|EMERGENT MORTGAGE CORP OF TENN
Subprime and Manufactured Home List (2001)|758-2509828|7|58-2509828|1|CHOICE CAPITAL FUNDING INC.   
Subprime and Manufactured Home List (2001)|759-3324910|7|59-3324910|1|HOMEGOLD INC.                 
Subprime and Manufactured Home List (2001)|759-3679259|7|59-3679259|1|HOMEALLIANCE MORTGAGE COMPANY 
Subprime and Manufactured Home List (2001)|76473909996|7|6473909996|1|FIRST NATIONAL MORTGAGE CO.   
Subprime and Manufactured Home List (2001)|766-0524453|7|66-0524453|1|EASY MONEY - MORTGAGE DIVISION
Subprime and Manufactured Home List (2001)|77042100008|7|7042100008|1|DOLLAR MORTGAGE CORPORATION   
Subprime and Manufactured Home List (2001)|77059200001|7|7059200001|1|PREFERRED FINANCIAL FUNDING, I
Subprime and Manufactured Home List (2001)|77062300004|7|7062300004|1|BUDGET FINANCE COMPANY        
Subprime and Manufactured Home List (2001)|77069000008|7|7069000008|1|DELTA FUNDING CORP            
Subprime and Manufactured Home List (2001)|77086400004|7|7086400004|1|AMERICAN BENEFIT MORTGAGE, INC
Subprime and Manufactured Home List (2001)|77113200004|7|7113200004|1|ADCO FINANCIAL MORTGAGE SERVIC
Subprime and Manufactured Home List (2001)|77152500000|7|7152500000|1|PLATINUM CAPITAL GROUP        
Subprime and Manufactured Home List (2001)|77177000002|7|7177000002|1|MERITAGE MORTGAGE CORPORATION 
Subprime and Manufactured Home List (2001)|77177900003|7|7177900003|1|CHADWICK MORTGAGE, INC.       
Subprime and Manufactured Home List (2001)|77185300006|7|7185300006|1|ACCREDITED HOME LENDERS, INC. 
Subprime and Manufactured Home List (2001)|77240500003|7|7240500003|1|ENTRUST MORTGAGE              
Subprime and Manufactured Home List (2001)|77307200009|7|7307200009|1|HCL FINANCE, INC.             
Subprime and Manufactured Home List (2001)|77323800008|7|7323800008|1|EXPRESS CAPITAL LENDING       
Subprime and Manufactured Home List (2001)|77354400002|7|7354400002|1|ENCORE MORTGAGE SERVICES, INC.
Subprime and Manufactured Home List (2001)|77407100001|7|7407100001|1|FOOTHILL FUNDING GROUP, INC   
Subprime and Manufactured Home List (2001)|77431100008|7|7431100008|1|OAKMONT MORTGAGE              
Subprime and Manufactured Home List (2001)|77464900009|7|7464900009|1|EMC MORTGAGE CORPORATION      
Subprime and Manufactured Home List (2001)|77479800008|7|7479800008|1|CHAPEL MORTGAGE CORPORATION   
Subprime and Manufactured Home List (2001)|77507300007|7|7507300007|1|ALLIED MORTGAGE CAPITAL CORP  
Subprime and Manufactured Home List (2001)|775-1794257|7|75-1794257|1|GREAT WESTERN FINANCAL, INC.  
Subprime and Manufactured Home List (2001)|775-2712433|7|75-2712433|1|CONCORDE ACCEPTANCE CORPORATIO
Subprime and Manufactured Home List (2001)|775-2921540|7|75-2921540|1|CENTEX HOME EQUITY COMPANY LLC
Subprime and Manufactured Home List (2001)|77542800002|7|7542800002|1|MLSG, INC.                    
Subprime and Manufactured Home List (2001)|77568500004|7|7568500004|1|CUSTOM MORTGAGE INC.          
Subprime and Manufactured Home List (2001)|77604800006|7|7604800006|1|OPTION ONE MORTGAGE CORP.     
Subprime and Manufactured Home List (2001)|77619100004|7|7619100004|1|MONEYCORP                     
Subprime and Manufactured Home List (2001)|77621700002|7|7621700002|1|WORLD WIDE FINANCIAL SERVICES 
Subprime and Manufactured Home List (2001)|77634100004|7|7634100004|1|AMERICAN MORTGAGE EXCHANGE    
Subprime and Manufactured Home List (2001)|77642300001|7|7642300001|1|LIBERTY AMERICAN MORTGAGE CORP
Subprime and Manufactured Home List (2001)|77650700000|7|7650700000|1|AMERICA'S MONEYLINE           
Subprime and Manufactured Home List (2001)|77652800004|7|7652800004|1|NATION ONE MORTGAGE CO., INC. 
Subprime and Manufactured Home List (2001)|77662200007|7|7662200007|1|SOUND MORTGAGE CORPORATION    
Subprime and Manufactured Home List (2001)|77665200006|7|7665200006|1|AMERICAN ACCEPTANCE MORTGAGE  
Subprime and Manufactured Home List (2001)|77673400003|7|7673400003|1|INVESTAID CORPORATION         
Subprime and Manufactured Home List (2001)|77718200008|7|7718200008|1|AMERICAN HOME LOANS           
Subprime and Manufactured Home List (2001)|77756300009|7|7756300009|1|AMERICAN EQUITY MORTGAGE, INC 
Subprime and Manufactured Home List (2001)|77756600001|7|7756600001|1|AMERIQUEST MORTGAGE COMPANY   
Subprime and Manufactured Home List (2001)|77770700000|7|7770700000|1|HARBORSIDE FINANCIAL NETWORK
Subprime and Manufactured Home List (2001)|77775100007|7|7775100007|1|MILA, INC.                    
Subprime and Manufactured Home List (2001)|77786700007|7|7786700007|1|COLUMBIA MORTGAGE & FUNDING CO
Subprime and Manufactured Home List (2001)|77840600009|7|7840600009|1|BNC MORTGAGE INC              
Subprime and Manufactured Home List (2001)|77875200001|7|7875200001|1|FIRST GREENSBORO HOME EQUITY  
Subprime and Manufactured Home List (2001)|77885300000|7|7885300000|1|STERLING MORTGAGE & INVESTMENT
Subprime and Manufactured Home List (2001)|77892800004|7|7892800004|1|FIELDSTONE MORTGAGE COMPANY   
Subprime and Manufactured Home List (2001)|77900200006|7|7900200006|1|NEW CENTURY MORTGAGE CORP.    
Subprime and Manufactured Home List (2001)|77927200007|7|7927200007|1|NEW FREEDOM MORTGAGE CORP     
Subprime and Manufactured Home List (2001)|77943800003|7|7943800003|1|SAXON MORTGAGE, INC.          
Subprime and Manufactured Home List (2001)|77967200005|7|7967200005|1|PORTFOLIO MORTGAGE COMPANY, IN
Subprime and Manufactured Home List (2001)|791-1872563|7|91-1872563|1|SEATTLE FUNDING GROUP, LTD.   
Subprime and Manufactured Home List (2001)|795-2622032|7|95-2622032|1|AAMES FUNDING CORPORATION     
Subprime and Manufactured Home List (2001)|123-3004704|1|23-3004704|2|PENN 1ST FINANCIAL            
Subprime and Manufactured Home List (2001)|134-1831194|1|34-1831194|2|MOBILE CONSULTANTS INC        
Subprime and Manufactured Home List (2001)|20000331647|2|0000331647|2|BANK ONE MI                   
Subprime and Manufactured Home List (2001)|20001035401|2|0001035401|2|CIT GROUP/SALES FINANCING     
Subprime and Manufactured Home List (2001)|20002977384|2|0002977384|2|ASSOCIATES HOUSING FINANCE    
Subprime and Manufactured Home List (2001)|30000025726|3|0000025726|2|MURPHY BK                     
Subprime and Manufactured Home List (2001)|30000033792|3|0000033792|2|ASSOCIATES CAP BK             
Subprime and Manufactured Home List (2001)|30000034536|3|0000034536|2|CONSECO BK                    
Subprime and Manufactured Home List (2001)|333-0862379|3|33-0862379|2|GREENPOINT CREDIT LLC         
Subprime and Manufactured Home List (2001)|333-0875033|3|33-0875033|2|GREENPOINT CREDIT OF MS LLC   
Subprime and Manufactured Home List (2001)|40000007705|4|0000007705|2|NORTHEAST BK FSB              
Subprime and Manufactured Home List (2001)|40042590778|4|0042590778|2|FORWARD FINANCIAL             
Subprime and Manufactured Home List (2001)|71118300003|7|1118300003|2|BOMBARDIER CAPITAL INC.       
Subprime and Manufactured Home List (2001)|71673400009|7|1673400009|2|AMWEST FINANCIAL, INC.        
Subprime and Manufactured Home List (2001)|72294709990|7|2294709990|2|CONSECO FINANCE SERVICING CORP
Subprime and Manufactured Home List (2001)|74856500006|7|4856500006|2|VANDERBILT MORTGAGE           
Subprime and Manufactured Home List (2001)|754-1779092|7|54-1779092|2|ORIGEN FINANCIAL, INC         
Subprime and Manufactured Home List (2001)|77162800002|7|7162800002|2|21ST MORTGAGE CORP.           
Subprime and Manufactured Home List (2001)|77245500008|7|7245500008|2|LAND/HOME FINANCIAL SERVICES  
Subprime and Manufactured Home List (2001)|77506600003|7|7506600003|2|OAKWOOD ACCEPTANCE CORPORATION
Subprime and Manufactured Home List (2001)|775-2585326|7|75-2585326|2|COUNTRYPLACE MORTGAGE, LTD.   
Subprime and Manufactured Home List (2002)|10000022908|1|0000022908|1|KEY BK USA NA                 
Subprime and Manufactured Home List (2002)|10000023160|1|0000023160|1|CHASE MANHATTAN BK USA NA     
Subprime and Manufactured Home List (2002)|10000024095|1|0000024095|1|MBNA AMERICA DE NA            
Subprime and Manufactured Home List (2002)|106-1034218|1|06-1034218|1|ASSOCIATES INTL HOLDING CORP  
Subprime and Manufactured Home List (2002)|134-1225701|1|34-1225701|1|CHARTER ONE CREDIT CORP       
Subprime and Manufactured Home List (2002)|136-4114231|1|36-4114231|1|FIRST FRANKLIN FNCL CO        
Subprime and Manufactured Home List (2002)|138-1620418|1|38-1620418|1|FIRST NATIONAL ACCEPTANCE CO. 
Subprime and Manufactured Home List (2002)|138-3360279|1|38-3360279|1|FIRST NATL ACCEPTANCE CO OF NA
Subprime and Manufactured Home List (2002)|152-2113031|1|52-2113031|1|HOMEOWNERS LOAN CORP          
Subprime and Manufactured Home List (2002)|159-2645397|1|59-2645397|1|ALTEGRA CREDIT COMPANY        
Subprime and Manufactured Home List (2002)|166-0593696|1|66-0593696|1|CMFC INC                      
Subprime and Manufactured Home List (2002)|20000612618|2|0000612618|1|PROVIDENT BK                  
Subprime and Manufactured Home List (2002)|20000860473|2|0000860473|1|CITIFINANCIAL INC (OHIO)      
Subprime and Manufactured Home List (2002)|20000902270|2|0000902270|1|CITIFINANCIAL SERVICES INC-PA 
Subprime and Manufactured Home List (2002)|20001035698|2|0001035698|1|CIT GROUP/CONSUMER FNC NY     
Subprime and Manufactured Home List (2002)|20001426027|2|0001426027|1|WELLS FARGO FNCL AZ, INC.     
Subprime and Manufactured Home List (2002)|20001844331|2|0001844331|1|WELLS FARGO FNCL NE, INC.     
Subprime and Manufactured Home List (2002)|20001844827|2|0001844827|1|WELLS FARGO FNCL OK, INC.     
Subprime and Manufactured Home List (2002)|20001844920|2|0001844920|1|WELLS FARGO FNCL MN, INC.     
Subprime and Manufactured Home List (2002)|20001844966|2|0001844966|1|WELLS FARGO FNCL KS. INC.     
Subprime and Manufactured Home List (2002)|20001845011|2|0001845011|1|WELLS FARGO FNCL SD, INC.     
Subprime and Manufactured Home List (2002)|20001845039|2|0001845039|1|WELLS FARGO FNCL GA, INC.     
Subprime and Manufactured Home List (2002)|20001942602|2|0001942602|1|EQUITY ONE, INC               
Subprime and Manufactured Home List (2002)|20001999138|2|0001999138|1|CIT GROUP/SALES FINANCE       
Subprime and Manufactured Home List (2002)|20002039488|2|0002039488|1|WELLS FARGO FNCL AMER         
Subprime and Manufactured Home List (2002)|20002040961|2|0002040961|1|WELLS FARGO FNCL NV 2         
Subprime and Manufactured Home List (2002)|20002134936|2|0002134936|1|WELLS FARGO FNCL SYS FL       
Subprime and Manufactured Home List (2002)|20002418980|2|0002418980|1|WELLS FARGO FNCL ACCEPT AMER  
Subprime and Manufactured Home List (2002)|20002618744|2|0002618744|1|WELLS FARGO FNCL ACCEPT SYS FL
Subprime and Manufactured Home List (2002)|20002721701|2|0002721701|1|CIT GROUP/CONSUMER FNC TN     
Subprime and Manufactured Home List (2002)|20002750242|2|0002750242|1|CITIFINANCIAL SERVICES INC (MN
Subprime and Manufactured Home List (2002)|20002751744|2|0002751744|1|CITIFINANCIAL SERVICES INC-UT 
Subprime and Manufactured Home List (2002)|20002751762|2|0002751762|1|CITIFINANCIAL INC-TN          
Subprime and Manufactured Home List (2002)|20002751801|2|0002751801|1|CITIFINANCIAL SERVICES INC-OH 
Subprime and Manufactured Home List (2002)|20002751810|2|0002751810|1|CITIFINANCIAL SERVICES INC-DE 
Subprime and Manufactured Home List (2002)|20002751847|2|0002751847|1|CITIFINANCIAL SERVICES INC-MO 
Subprime and Manufactured Home List (2002)|20002751913|2|0002751913|1|CITIFINANCIAL OF VIRGINIA     
Subprime and Manufactured Home List (2002)|20002751922|2|0002751922|1|CITIFINANCIAL SERVICES INC-GA 
Subprime and Manufactured Home List (2002)|20002751986|2|0002751986|1|CITIFINANCIAL INC-MD          
Subprime and Manufactured Home List (2002)|20002751995|2|0002751995|1|CITIFINANCIAL SERVICES INC-OK 
Subprime and Manufactured Home List (2002)|20002752013|2|0002752013|1|CITIFINANCIAL SVC KY          
Subprime and Manufactured Home List (2002)|20002752022|2|0002752022|1|CITIFINANCIAL INC - IOWA      
Subprime and Manufactured Home List (2002)|20002752077|2|0002752077|1|CITIFINANCIAL SERVICES INC-CA 
Subprime and Manufactured Home List (2002)|20002752321|2|0002752321|1|CITIFINANCIAL COMPANY         
Subprime and Manufactured Home List (2002)|20002752527|2|0002752527|1|EQUIFIRST CORP                
Subprime and Manufactured Home List (2002)|20002752545|2|0002752545|1|EQUIFIRST MTG CORP            
Subprime and Manufactured Home List (2002)|20002752684|2|0002752684|1|CITIFINANCIAL CORP-CO         
Subprime and Manufactured Home List (2002)|20002817118|2|0002817118|1|CITIFINANCIAL INC-TX CORP     
Subprime and Manufactured Home List (2002)|20002861595|2|0002861595|1|CITIFINANCIAL SERVICES INC-MA 
Subprime and Manufactured Home List (2002)|20002939748|2|0002939748|1|EQUIFIRST MTG CORP OF MINNESOT
Subprime and Manufactured Home List (2002)|20002977151|2|0002977151|1|CITIFINANCIAL MORTGAGE        
Subprime and Manufactured Home List (2002)|20003032664|2|0003032664|1|FULL SPECTRUM LENDING         
Subprime and Manufactured Home List (2002)|20003106181|2|0003106181|1|CITIFINANCIAL CORP LLC-AL     
Subprime and Manufactured Home List (2002)|30000025653|3|0000025653|1|FREMONT INV & LOAN            
Subprime and Manufactured Home List (2002)|30000025870|3|0000025870|1|FINANCE & THRIFT CO           
Subprime and Manufactured Home List (2002)|30000026363|3|0000026363|1|COMMUNITY CMRC BK             
Subprime and Manufactured Home List (2002)|358-2257419|3|58-2257419|1|LENDMARK FINANCIAL SERVICES   
Subprime and Manufactured Home List (2002)|363-1131381|3|63-1131381|1|ACCEPTANCE LOAN CO.           
Subprime and Manufactured Home List (2002)|40000006194|4|0000006194|1|HOUSEHOLD BK FSB              
Subprime and Manufactured Home List (2002)|40000007645|4|0000007645|1|WESTERN FNCL BK               
Subprime and Manufactured Home List (2002)|40000007946|4|0000007946|1|LIFE BK                       
Subprime and Manufactured Home List (2002)|40000008051|4|0000008051|1|BAY FNCL SVG BK FSB           
Subprime and Manufactured Home List (2002)|40000008308|4|0000008308|1|FEDERAL MEDICAL BK FSB        
Subprime and Manufactured Home List (2002)|40000008569|4|0000008569|1|APPROVED FSB                  
Subprime and Manufactured Home List (2002)|40000014470|4|0000014470|1|CITICORP TRUST BANK, FSB      
Subprime and Manufactured Home List (2002)|40000014939|4|0000014939|1|AIG FSB
Subprime and Manufactured Home List (2002)|40510356097|4|0510356097|1|WILMINGTON NATIONAL FINANCE   
Subprime and Manufactured Home List (2002)|40760539855|4|0760539855|1|HS MORTGAGE ACCEPTANCE        
Subprime and Manufactured Home List (2002)|70232646780|7|0232646780|1|AMERICAN BUSINESS FINANCIAL   
Subprime and Manufactured Home List (2002)|70330756645|7|0330756645|1|GREATER ACCEPTANCE MORTGAGE CO
Subprime and Manufactured Home List (2002)|70458600405|7|0458600405|1|WMC MORTGAGE CORP.            
Subprime and Manufactured Home List (2002)|705-0402708|7|05-0402708|1|ADVANCED FINANCIAL SERVICES, I
Subprime and Manufactured Home List (2002)|70912041536|7|0912041536|1|INFINITY FINANCIAL NETWORK    
Subprime and Manufactured Home List (2002)|71003800004|7|1003800004|1|LONG BEACH MORTGAGE CO        
Subprime and Manufactured Home List (2002)|71061700007|7|1061700007|1|TOWN & COUNTRY CREDIT CORP.   
Subprime and Manufactured Home List (2002)|71075700003|7|1075700003|1|AURORA LOAN SERVICES INC      
Subprime and Manufactured Home List (2002)|71085800002|7|1085800002|1|SPECIALTY MORTGAGE CORPORATION
Subprime and Manufactured Home List (2002)|71118100001|7|1118100001|1|MORTGAGE LENDERS NETWORK USA  
Subprime and Manufactured Home List (2002)|71126000006|7|1126000006|1|SEBRING CAPITAL CORPORATION   
Subprime and Manufactured Home List (2002)|711-2815564|7|11-2815564|1|EHOMECREDIT CORP.             
Subprime and Manufactured Home List (2002)|71195900005|7|1195900005|1|LOAN FUNDING CORP. OF AMERICA 
Subprime and Manufactured Home List (2002)|71206600009|7|1206600009|1|ALLIED MORTGAGE & FINANCIAL CO
Subprime and Manufactured Home List (2002)|71207500004|7|1207500004|1|COURTESY MORTGAGE COMPANY     
Subprime and Manufactured Home List (2002)|71248200000|7|1248200000|1|AMERUS HOME LENDING, INC.     
Subprime and Manufactured Home List (2002)|71250200008|7|1250200008|1|MONEYONE, INC.                
Subprime and Manufactured Home List (2002)|71254000001|7|1254000001|1|WASHINGTON MORTGAGE COMPANY   
Subprime and Manufactured Home List (2002)|71259600009|7|1259600009|1|SOUTH STAR FUNDING, LLC       
Subprime and Manufactured Home List (2002)|71265700002|7|1265700002|1|DECISION ONE MORTGAGE         
Subprime and Manufactured Home List (2002)|71287100006|7|1287100006|1|FIRST CITY FUNDING            
Subprime and Manufactured Home List (2002)|71289800005|7|1289800005|1|MORTGAGE EXPRESS, INC.        
Subprime and Manufactured Home List (2002)|71291700001|7|1291700001|1|HEARTHSIDE LENDING CORP.      
Subprime and Manufactured Home List (2002)|71345300006|7|1345300006|1|THE MORTGAGE OUTLET           
Subprime and Manufactured Home List (2002)|71345700002|7|1345700002|1|BRIDGE CAPITAL                
Subprime and Manufactured Home List (2002)|71349000009|7|1349000009|1|STEWARD FINANCIAL, INC        
Subprime and Manufactured Home List (2002)|71390800005|7|1390800005|1|THE MORTGAGE OUTLET, INC.     
Subprime and Manufactured Home List (2002)|71394900006|7|1394900006|1|SECURED FUNDING CORPORATION   
Subprime and Manufactured Home List (2002)|71463300003|7|1463300003|1|MOORE FINANCIAL ENTERPRISES, I
Subprime and Manufactured Home List (2002)|71474600000|7|1474600000|1|HOMESTAR MORTGAGE SERVICES    
Subprime and Manufactured Home List (2002)|71483300003|7|1483300003|1|FINANCE AMERICA, LLC          
Subprime and Manufactured Home List (2002)|71512400000|7|1512400000|1|NOVASTAR MORTGAGE INC.        
Subprime and Manufactured Home List (2002)|71534900004|7|1534900004|1|FIRST NLC FINANCIAL SERVICES  
Subprime and Manufactured Home List (2002)|71549600001|7|1549600001|1|CONCORDE ACCEPTANCE CORPORATIO
Subprime and Manufactured Home List (2002)|71557900001|7|1557900001|1|PEOPLE'S CHOICE HOME LOAN, INC
Subprime and Manufactured Home List (2002)|71596200005|7|1596200005|1|GMFS, LLC                     
Subprime and Manufactured Home List (2002)|71596800005|7|1596800005|1|FIRST CHOICE FUNDING, INC.    
Subprime and Manufactured Home List (2002)|71611300007|7|1611300007|1|EQUITY RESOURCES, INC.        
Subprime and Manufactured Home List (2002)|71665100001|7|1665100001|1|PINNACLE DIRECT FUNDING CORPOR
Subprime and Manufactured Home List (2002)|71665400004|7|1665400004|1|SOFIN INC.                    
Subprime and Manufactured Home List (2002)|71704900007|7|1704900007|1|EASY MONEY - MORTGAGE DIVISION
Subprime and Manufactured Home List (2002)|71718800007|7|1718800007|1|UNIMORTGAGE LLC.              
Subprime and Manufactured Home List (2002)|71736300009|7|1736300009|1|JLM DIRECT FUNDING, LTD.      
Subprime and Manufactured Home List (2002)|71766500005|7|1766500005|1|EBANC FUNDING, LLC.           
Subprime and Manufactured Home List (2002)|71770800008|7|1770800008|1|PEMMTEK MORTGAGE SERVICES LLC
Subprime and Manufactured Home List (2002)|71809800001|7|1809800001|1|SERVICE FIRST MORTGAGE, L.C.  
Subprime and Manufactured Home List (2002)|71830200003|7|1830200003|1|OAK STREET MORTGAGE           
Subprime and Manufactured Home List (2002)|71837800003|7|1837800003|1|NOVELLE FINANCIAL SERVICES    
Subprime and Manufactured Home List (2002)|71851400008|7|1851400008|1|SEBRING CAPITAL PARTNERS, LP  
Subprime and Manufactured Home List (2002)|71864800009|7|1864800009|1|FICORE FUNDING, INC.          
Subprime and Manufactured Home List (2002)|722-3397885|7|22-3397885|1|AMERICAP FINANCIAL INC        
Subprime and Manufactured Home List (2002)|723-3051009|7|23-3051009|1|OPUS HOME EQUITY SERVICES, INC
Subprime and Manufactured Home List (2002)|733-0515201|7|33-0515201|1|SOUTH SHORE MORTGAGE, INC.    
Subprime and Manufactured Home List (2002)|733-0832025|7|33-0832025|1|SILVERSTONE FINANCIAL, INC.   
Subprime and Manufactured Home List (2002)|733-0967630|7|33-0967630|1|EVERGREEN LENDING, INC.       
Subprime and Manufactured Home List (2002)|735-1781299|7|35-1781299|1|CAPITAL FINANCIAL SERVICES INC
Subprime and Manufactured Home List (2002)|736-1239445|7|36-1239445|1|HOUSEHOLD FINANCE CORPORATION 
Subprime and Manufactured Home List (2002)|741-1810165|7|41-1810165|1|LENDSOURCE, INC.              
Subprime and Manufactured Home List (2002)|74893600009|7|4893600009|1|FEDERAL MORTGAGE & INVESTMENT 
Subprime and Manufactured Home List (2002)|751-0003820|7|51-0003820|1|BENEFICIAL CORPORATION        
Subprime and Manufactured Home List (2002)|75535100002|7|5535100002|1|METROPOLITAN MORTGAGE & SECURI
Subprime and Manufactured Home List (2002)|756-2270727|7|56-2270727|1|AMERITRUST MORTGAGE COMPANY LL
Subprime and Manufactured Home List (2002)|758-2291999|7|58-2291999|1|EMERGENT MTG CORP OF TENNESSEE
Subprime and Manufactured Home List (2002)|758-2509828|7|58-2509828|1|CHOICE CAPITAL FUNDING        
Subprime and Manufactured Home List (2002)|759-3324910|7|59-3324910|1|HOMEGOLD, INC.                
Subprime and Manufactured Home List (2002)|76473909996|7|6473909996|1|FIRST NATIONAL MORTGAGE CO.   
Subprime and Manufactured Home List (2002)|77042100008|7|7042100008|1|DOLLAR MORTGAGE CORPORATION   
Subprime and Manufactured Home List (2002)|77059200001|7|7059200001|1|PREFERRED FINANCIAL FUNDING   
Subprime and Manufactured Home List (2002)|77062300004|7|7062300004|1|BUDGET FINANCE COMPANY        
Subprime and Manufactured Home List (2002)|77069000008|7|7069000008|1|DELTA FUNDING CORPORATION     
Subprime and Manufactured Home List (2002)|77086400004|7|7086400004|1|AMERICAN BENEFIT MORTGAGE, INC
Subprime and Manufactured Home List (2002)|77113200004|7|7113200004|1|ADCO FINANCIAL MORTGAGE SERVIC
Subprime and Manufactured Home List (2002)|77152500000|7|7152500000|1|PLATINUM CAPITAL GROUP        
Subprime and Manufactured Home List (2002)|77177000002|7|7177000002|1|MERITAGE MORTGAGE CORPORATION 
Subprime and Manufactured Home List (2002)|77177900003|7|7177900003|1|CHADWICK MORTGAGE, INC.       
Subprime and Manufactured Home List (2002)|77185300006|7|7185300006|1|ACCREDITED HOME LENDERS, INC. 
Subprime and Manufactured Home List (2002)|77307200009|7|7307200009|1|HCL FINANCE, INC              
Subprime and Manufactured Home List (2002)|77323800008|7|7323800008|1|EXPRESS CAPITAL LENDING       
Subprime and Manufactured Home List (2002)|77348200002|7|7348200002|1|AMERICAN PIONEER FINANCIAL SER
Subprime and Manufactured Home List (2002)|77354400002|7|7354400002|1|ENCORE MORTGAGE SERVICES INC. 
Subprime and Manufactured Home List (2002)|77373400006|7|7373400006|1|LIME FINANCIAL SERVICES, LTD  
Subprime and Manufactured Home List (2002)|77407100001|7|7407100001|1|FOOTHILL FUNDING GROUP, INC   
Subprime and Manufactured Home List (2002)|77431100008|7|7431100008|1|OAKMONT MORTGAGE              
Subprime and Manufactured Home List (2002)|77464900009|7|7464900009|1|EMC MORTGAGE CORPORATION      
Subprime and Manufactured Home List (2002)|77479800008|7|7479800008|1|CHAPEL MORTGAGE CO.           
Subprime and Manufactured Home List (2002)|77507300007|7|7507300007|1|ALLIED HOME MORTGAGE CAP CORP.
Subprime and Manufactured Home List (2002)|775-1794257|7|75-1794257|1|GREAT WESTERN LOANS & INVEST  
Subprime and Manufactured Home List (2002)|775-2921540|7|75-2921540|1|CENTEX HOME EQUITY COMPANY LLC
Subprime and Manufactured Home List (2002)|77542800002|7|7542800002|1|MLSG, INC.                    
Subprime and Manufactured Home List (2002)|77568500004|7|7568500004|1|CUSTOM MORTGAGE , INC.        
Subprime and Manufactured Home List (2002)|77604800006|7|7604800006|1|OPTION ONE MORTGAGE CORP.     
Subprime and Manufactured Home List (2002)|77619100004|7|7619100004|1|MONEYCORP                     
Subprime and Manufactured Home List (2002)|77621700002|7|7621700002|1|WORLD WIDE FINANCIAL SERVICES 
Subprime and Manufactured Home List (2002)|77634100004|7|7634100004|1|AMERICAN MORTGAGE EXCHANGE, IN
Subprime and Manufactured Home List (2002)|77642300001|7|7642300001|1|LIBERTY AMERICAN MORTGAGE CORP
Subprime and Manufactured Home List (2002)|77650700000|7|7650700000|1|AMERICA'S MONEYLINE           
Subprime and Manufactured Home List (2002)|77652800004|7|7652800004|1|NATION ONE MORTGAGE CO.,INC.  
Subprime and Manufactured Home List (2002)|77662200007|7|7662200007|1|SOUND MORTGAGE CORPORATION    
Subprime and Manufactured Home List (2002)|77665200006|7|7665200006|1|AMERICAN ACCEPTANCE MORTGAGE, 
Subprime and Manufactured Home List (2002)|77673400003|7|7673400003|1|INVESTAID CORP                
Subprime and Manufactured Home List (2002)|777-0463885|7|77-0463885|1|ALTERNATIVE FINANCING CORP
Subprime and Manufactured Home List (2002)|77718200008|7|7718200008|1|AMERICAN HOME LOANS           
Subprime and Manufactured Home List (2002)|77756300009|7|7756300009|1|AMERICAN EQUITY MORTGAGE, INC.
Subprime and Manufactured Home List (2002)|77756600001|7|7756600001|1|AMERIQUEST MORTGAGE COMPANY   
Subprime and Manufactured Home List (2002)|77770700000|7|7770700000|1|HARBORSIDE FINANCIAL NETWORK
Subprime and Manufactured Home List (2002)|77775100007|7|7775100007|1|MILA, INC.                    
Subprime and Manufactured Home List (2002)|77786700007|7|7786700007|1|COLUMBIA MORTGAGE & FUNDING CO
Subprime and Manufactured Home List (2002)|77840600009|7|7840600009|1|BNC MORTGAGE, INC             
Subprime and Manufactured Home List (2002)|77875200001|7|7875200001|1|FIRST GREENSBORO HOME EQUITY  
Subprime and Manufactured Home List (2002)|77885300000|7|7885300000|1|STERLING MORTGAGE & INVESTMENT
Subprime and Manufactured Home List (2002)|77892800004|7|7892800004|1|FIELDSTONE MORTGAGE COMPANY   
Subprime and Manufactured Home List (2002)|77900200006|7|7900200006|1|NEW CENTURY MORTGAGE CORP.    
Subprime and Manufactured Home List (2002)|77927200007|7|7927200007|1|NEW FREEDOM MORTGAGE CORP     
Subprime and Manufactured Home List (2002)|77943800003|7|7943800003|1|SAXON MORTGAGE, INC.          
Subprime and Manufactured Home List (2002)|791-1872563|7|91-1872563|1|SEATTLE FUNDING GROUP         
Subprime and Manufactured Home List (2002)|795-2622032|7|95-2622032|1|AAMES FINANCIAL CORPORATION   
Subprime and Manufactured Home List (2002)|795-4855230|7|95-4855230|1|EMPIRE MORTGAGE               
Subprime and Manufactured Home List (2002)|123-3004704|1|23-3004704|2|PENN 1ST FINANCIAL            
Subprime and Manufactured Home List (2002)|134-1831194|1|34-1831194|2|MOBILE CONSULTANTS INC        
Subprime and Manufactured Home List (2002)|20001035401|2|0001035401|2|CIT GROUP/SALES FINANCING     
Subprime and Manufactured Home List (2002)|20002977384|2|0002977384|2|ASSOCIATES HOUSING FINANCE    
Subprime and Manufactured Home List (2002)|30000025726|3|0000025726|2|MURPHY BK                     
Subprime and Manufactured Home List (2002)|333-0862379|3|33-0862379|2|GREENPOINT CREDIT LLC         
Subprime and Manufactured Home List (2002)|333-0875033|3|33-0875033|2|GREENPOINT CREDIT OF MS LLC   
Subprime and Manufactured Home List (2002)|40000007705|4|0000007705|2|NORTHEAST BK FSB              
Subprime and Manufactured Home List (2002)|40042590778|4|0042590778|2|FORWARD FINANCIAL             
Subprime and Manufactured Home List (2002)|71118300003|7|1118300003|2|BOMBARDIER CAPITAL INC.       
Subprime and Manufactured Home List (2002)|71538600007|7|1538600007|2|HOMEPRIDE FINANCE CORP        
Subprime and Manufactured Home List (2002)|71673400009|7|1673400009|2|AMWEST FINANCIAL, INC.        
Subprime and Manufactured Home List (2002)|71928200004|7|1928200004|2|HOMEONE CREDIT CORP
Subprime and Manufactured Home List (2002)|72294709990|7|2294709990|2|CONSECO BANK, INC.            
Subprime and Manufactured Home List (2002)|74856500006|7|4856500006|2|VANDERBILT MORTGAGE           
Subprime and Manufactured Home List (2002)|754-1779092|7|54-1779092|2|ORIGEN FINANCIAL, INC         
Subprime and Manufactured Home List (2002)|77162800002|7|7162800002|2|21ST CENTURY MORTGAGE         
Subprime and Manufactured Home List (2002)|77245500008|7|7245500008|2|LAND/HOME FINANCIAL SERVICES, 
Subprime and Manufactured Home List (2002)|77506600003|7|7506600003|2|OAKWOOD ACCEPTANCE CORPORATION
Subprime and Manufactured Home List (2002)|775-2585326|7|75-2585326|2|COUNTRYPLACE MORTGAGE, LTD    
Subprime and Manufactured Home List (2003)|10000022908|1|0000022908|1|KEY BK USA NA
Subprime and Manufactured Home List (2003)|10000024095|1|0000024095|1|MBNA AMERICA DE NA
Subprime and Manufactured Home List (2003)|106-1034218|1|06-1034218|1|ASSOCIATES INTL HOLDING CORP
Subprime and Manufactured Home List (2003)|123-3004704|1|23-3004704|2|PENN 1ST FINANCIAL
Subprime and Manufactured Home List (2003)|136-4114231|1|36-4114231|1|FIRST FRANKLIN FNCL CO
Subprime and Manufactured Home List (2003)|138-1620418|1|38-1620418|1|FIRST NATIONAL ACCEPTANCE CO.
Subprime and Manufactured Home List (2003)|138-3360279|1|38-3360279|1|FIRST NATL ACCEPTANCE CO OF NA
Subprime and Manufactured Home List (2003)|152-2113031|1|52-2113031|1|HOMEOWNERS LOAN CORP
Subprime and Manufactured Home List (2003)|159-2645397|1|59-2645397|1|ALTEGRA CREDIT COMPANY
Subprime and Manufactured Home List (2003)|166-0593696|1|66-0593696|1|CMFC INC
Subprime and Manufactured Home List (2003)|20000523965|2|0000523965|1|CITIFINANCIAL - HI
Subprime and Manufactured Home List (2003)|20000612618|2|0000612618|1|PROVIDENT BK
Subprime and Manufactured Home List (2003)|20000860473|2|0000860473|1|CITIFINANCIAL INC (OHIO)
Subprime and Manufactured Home List (2003)|20000902270|2|0000902270|1|CITIFINANCIAL SERVICES INC-PA
Subprime and Manufactured Home List (2003)|20001035401|2|0001035401|2|CIT GROUP/SALES FINANCING
Subprime and Manufactured Home List (2003)|20001035698|2|0001035698|1|CIT GROUP/CONSUMER FNC NY
Subprime and Manufactured Home List (2003)|20001426027|2|0001426027|1|WELLS FARGO FNCL AZ
Subprime and Manufactured Home List (2003)|20001843606|2|0001843606|1|WELLS FARGO FNCL TX
Subprime and Manufactured Home List (2003)|20001844331|2|0001844331|1|WELLS FARGO FNCL NE
Subprime and Manufactured Home List (2003)|20001844340|2|0001844340|1|WELLS FARGO FNCL WV
Subprime and Manufactured Home List (2003)|20001844359|2|0001844359|1|WELLS FARGO FNCL WI
Subprime and Manufactured Home List (2003)|20001844818|2|0001844818|1|WELLS FARGO FNCL TN
Subprime and Manufactured Home List (2003)|20001844827|2|0001844827|1|WELLS FARGO FNCL OK
Subprime and Manufactured Home List (2003)|20001844836|2|0001844836|1|WELLS FARGO FNCL MT
Subprime and Manufactured Home List (2003)|20001844920|2|0001844920|1|WELLS FARGO FNCL MN
Subprime and Manufactured Home List (2003)|20001844957|2|0001844957|1|WELLS FARGO FNCL KY
Subprime and Manufactured Home List (2003)|20001844966|2|0001844966|1|WELLS FARGO FNCL KS
Subprime and Manufactured Home List (2003)|20001844975|2|0001844975|1|WELLS FARGO FNCL IN
Subprime and Manufactured Home List (2003)|20001844984|2|0001844984|1|WELLS FARGO FNCL MO
Subprime and Manufactured Home List (2003)|20001845002|2|0001845002|1|WELLS FARGO FNCL AK
Subprime and Manufactured Home List (2003)|20001845011|2|0001845011|1|WELLS FARGO FNCL SD
Subprime and Manufactured Home List (2003)|20001845020|2|0001845020|1|WELLS FARGO FNCL IL
Subprime and Manufactured Home List (2003)|20001845039|2|0001845039|1|WELLS FARGO FNCL GA
Subprime and Manufactured Home List (2003)|20001847163|2|0001847163|1|WELLS FARGO FNCL SC
Subprime and Manufactured Home List (2003)|20001847172|2|0001847172|1|WELLS FARGO FNCL RI
Subprime and Manufactured Home List (2003)|20001847275|2|0001847275|1|WELLS FARGO FNCL CA
Subprime and Manufactured Home List (2003)|20001847305|2|0001847305|1|WELLS FARGO FNCL AL
Subprime and Manufactured Home List (2003)|20001847323|2|0001847323|1|WELLS FARGO FNCL ID
Subprime and Manufactured Home List (2003)|20001847369|2|0001847369|1|WELLS FARGO FNCL OR
Subprime and Manufactured Home List (2003)|20001868177|2|0001868177|1|WELLS FARGO FNCL CR SVC NY
Subprime and Manufactured Home List (2003)|20001942602|2|0001942602|1|EQUITY ONE, INC
Subprime and Manufactured Home List (2003)|20001999138|2|0001999138|1|CIT GROUP/CONSUMER FINANCE INC
Subprime and Manufactured Home List (2003)|20002039488|2|0002039488|1|WELLS FARGO FNCL AMER
Subprime and Manufactured Home List (2003)|20002040381|2|0002040381|1|WELLS FARGO FNCL IA 3
Subprime and Manufactured Home List (2003)|20002040402|2|0002040402|1|WELLS FARGO FNCL ME
Subprime and Manufactured Home List (2003)|20002040961|2|0002040961|1|WELLS FARGO FNCL NV 2
Subprime and Manufactured Home List (2003)|20002041007|2|0002041007|1|WELLS FARGO FNCL NC 1
Subprime and Manufactured Home List (2003)|20002041418|2|0002041418|1|WELLS FARGO FNCL MA
Subprime and Manufactured Home List (2003)|20002134936|2|0002134936|1|WELLS FARGO FNCL SYS FL
Subprime and Manufactured Home List (2003)|20002721701|2|0002721701|1|CIT GROUP/CONSUMER FNC TN
Subprime and Manufactured Home List (2003)|20002750242|2|0002750242|1|CITIFINANCIAL SERVICES - MN
Subprime and Manufactured Home List (2003)|20002750532|2|0002750532|1|CITIFINANCIAL INC-MD
Subprime and Manufactured Home List (2003)|20002751762|2|0002751762|1|CITIFINANCIAL INC-TN
Subprime and Manufactured Home List (2003)|20002751801|2|0002751801|1|CITIFINANCIAL SERVICES INC-OH
Subprime and Manufactured Home List (2003)|20002751810|2|0002751810|1|CITIFINANCIAL SERVICES INC-DE
Subprime and Manufactured Home List (2003)|20002751847|2|0002751847|1|CITIFINANCIAL SERVICES INC-MO
Subprime and Manufactured Home List (2003)|20002751913|2|0002751913|1|CITIFINANCIAL OF VIRGINIA
Subprime and Manufactured Home List (2003)|20002751922|2|0002751922|1|CITIFINANCIAL SERVICES INC-GA
Subprime and Manufactured Home List (2003)|20002751968|2|0002751968|1|CITIFINANCIAL INC (SC)
Subprime and Manufactured Home List (2003)|20002751986|2|0002751986|1|CITIFINANCIAL INC-MD
Subprime and Manufactured Home List (2003)|20002751995|2|0002751995|1|CITIFINANCIAL SERVICES INC-OK
Subprime and Manufactured Home List (2003)|20002752013|2|0002752013|1|CITIFINANCIAL SVC KY
Subprime and Manufactured Home List (2003)|20002752022|2|0002752022|1|CITIFINANCIAL INC - IOWA
Subprime and Manufactured Home List (2003)|20002752077|2|0002752077|1|CITIFINANCIAL SERVICES CA
Subprime and Manufactured Home List (2003)|20002752321|2|0002752321|1|CITIFINANCIAL COMPANY
Subprime and Manufactured Home List (2003)|20002752527|2|0002752527|1|EQUIFIRST CORP
Subprime and Manufactured Home List (2003)|20002752684|2|0002752684|1|CITIFINANCIAL CORP CO
Subprime and Manufactured Home List (2003)|20002817118|2|0002817118|1|CITIFINANCIAL INC-TX CORP
Subprime and Manufactured Home List (2003)|20002861595|2|0002861595|1|CITIFINANCIAL SERVICES INC MA
Subprime and Manufactured Home List (2003)|20002977151|2|0002977151|1|CITIFINANCIAL MORTGAGE
Subprime and Manufactured Home List (2003)|20002977384|2|0002977384|2|ASSOCIATE HOUSING FINANCE LLC
Subprime and Manufactured Home List (2003)|20003032664|2|0003032664|1|FULL SPECTRUM LENDING
Subprime and Manufactured Home List (2003)|20003106181|2|0003106181|1|CITIFINANCIAL CORP LLC
Subprime and Manufactured Home List (2003)|20003144576|2|0003144576|1|WELLS FARGO FNCL MISSISSIPPI 2
Subprime and Manufactured Home List (2003)|30000025653|3|0000025653|1|FREMONT INV & LOAN
Subprime and Manufactured Home List (2003)|30000025726|3|0000025726|2|MURPHY BK
Subprime and Manufactured Home List (2003)|30000025870|3|0000025870|1|FINANCE & THRIFT CO
Subprime and Manufactured Home List (2003)|30000026363|3|0000026363|1|COMMUNITY CMRC BK
Subprime and Manufactured Home List (2003)|30000026799|3|0000026799|1|EVABANK                       
Subprime and Manufactured Home List (2003)|333-0862379|3|33-0862379|2|GREENPOINT CREDIT LLC
Subprime and Manufactured Home List (2003)|333-0875033|3|33-0875033|2|GREENPOINT CREDIT OF MS LLC
Subprime and Manufactured Home List (2003)|358-2257419|3|58-2257419|1|LENDMARK FINANCIAL SERVICES
Subprime and Manufactured Home List (2003)|358-2598615|3|58-2598615|1|LENDMARK MORTGAGE AND FINANCE
Subprime and Manufactured Home List (2003)|363-1131381|3|63-1131381|1|ACCEPTANCE LOAN CO.
Subprime and Manufactured Home List (2003)|40000002630|4|0000002630|1|M&I BANK FSB                  
Subprime and Manufactured Home List (2003)|40000006194|4|0000006194|1|HOUSEHOLD BK FSB
Subprime and Manufactured Home List (2003)|40000007645|4|0000007645|1|WESTERN FNCL BK
Subprime and Manufactured Home List (2003)|40000007705|4|0000007705|2|NORTHEAST BK FSB
Subprime and Manufactured Home List (2003)|40000008051|4|0000008051|1|BAY FNCL SVG BK FSB
Subprime and Manufactured Home List (2003)|40000008266|4|0000008266|1|UNITED MIDWEST SAVINGS BANK   
Subprime and Manufactured Home List (2003)|40000008308|4|0000008308|1|FEDERAL MEDICAL BK FSB
Subprime and Manufactured Home List (2003)|40000008569|4|0000008569|1|APPROVED FSB
Subprime and Manufactured Home List (2003)|40000012504|4|0000012504|1|HOME L&IB FSB
Subprime and Manufactured Home List (2003)|40000014470|4|0000014470|1|CITICORP TR BK FSB
Subprime and Manufactured Home List (2003)|40000014939|4|0000014939|1|AIG FSB
Subprime and Manufactured Home List (2003)|40042590778|4|0042590778|2|FORWARD FINANCIAL
Subprime and Manufactured Home List (2003)|40760539855|4|0760539855|1|HS MORTGAGE ACCEPTANCE
Subprime and Manufactured Home List (2003)|70041198897|7|0041198897|1|MARIBELLA MORTGAGE, LLC
Subprime and Manufactured Home List (2003)|702-0560839|7|02-0560839|1|FIRST CONTINENTAL MORTGAGE AND
Subprime and Manufactured Home List (2003)|70232646780|7|0232646780|1|AMERICAN BUSINESS FINANCIAL
Subprime and Manufactured Home List (2003)|70330756645|7|0330756645|1|GREATER ACCEPTANCE MORTGAGE CO
Subprime and Manufactured Home List (2003)|70351887380|7|0351887380|1|HOMELAND MORTGAGE INC.
Subprime and Manufactured Home List (2003)|70458600405|7|0458600405|1|WMC MORTGAGE CORP.
Subprime and Manufactured Home List (2003)|705-0402708|7|05-0402708|1|ADVANCED FINANCIAL SERVICES, I
Subprime and Manufactured Home List (2003)|705-0560686|7|05-0560686|1|SUNSET DIRECT LENDING
Subprime and Manufactured Home List (2003)|70510312284|7|0510312284|1|MOREQUITY, INC. (NV)
Subprime and Manufactured Home List (2003)|70542046140|7|0542046140|1|CALUSA INVESTMENTS, L.L.C.
Subprime and Manufactured Home List (2003)|71003800004|7|1003800004|1|LONG BEACH MORTGAGE CO.
Subprime and Manufactured Home List (2003)|71059700002|7|1059700002|1|FIRST CONSOLIDATED MORTGAGE
Subprime and Manufactured Home List (2003)|71061700007|7|1061700007|1|TOWN & COUNTRY CREDIT CORP
Subprime and Manufactured Home List (2003)|71075700003|7|1075700003|1|AURORA LOAN SERVICES
Subprime and Manufactured Home List (2003)|71085800002|7|1085800002|1|SPECIALTY MORTGAGE CORPORATION
Subprime and Manufactured Home List (2003)|711-2815564|7|11-2815564|1|EHOMECREDIT CORP.
Subprime and Manufactured Home List (2003)|71118100001|7|1118100001|1|MORTGAGE LENDERS NETWORK USA
Subprime and Manufactured Home List (2003)|71206600009|7|1206600009|1|ALLIED MORTGAGE & FINANCIAL CO
Subprime and Manufactured Home List (2003)|71207500004|7|1207500004|1|COURTESY MORTGAGE COMPANY
Subprime and Manufactured Home List (2003)|71248200000|7|1248200000|1|AMERUS HOME LENDING, INC
Subprime and Manufactured Home List (2003)|71250200008|7|1250200008|1|MONEYONE, INC.
Subprime and Manufactured Home List (2003)|71254000001|7|1254000001|1|WASHINGTON MORTGAGE COMPANY
Subprime and Manufactured Home List (2003)|71259600009|7|1259600009|1|SOUTHSTAR FUNDING, LLC.
Subprime and Manufactured Home List (2003)|71281200009|7|1281200009|1|FIRST STATE MORTGAGE CORPORATI
Subprime and Manufactured Home List (2003)|71287100006|7|1287100006|1|FIRST CITY FUNDING
Subprime and Manufactured Home List (2003)|71289800005|7|1289800005|1|PGNF HONE LENDING CORP
Subprime and Manufactured Home List (2003)|71291700001|7|1291700001|1|HEARTHSIDE LENDING CORP.
Subprime and Manufactured Home List (2003)|71345300006|7|1345300006|1|THE MORTGAGE OUTLET
Subprime and Manufactured Home List (2003)|71345700002|7|1345700002|1|BRIDGE CAPITAL CORPORATION
Subprime and Manufactured Home List (2003)|71349000009|7|1349000009|1|STEWARD FINANCIAL, INC.
Subprime and Manufactured Home List (2003)|71390800005|7|1390800005|1|THE MORTGAGE OUTLET, INC.
Subprime and Manufactured Home List (2003)|71394900006|7|1394900006|1|SECURED FUNDING CORPORATION
Subprime and Manufactured Home List (2003)|71463300003|7|1463300003|1|MOORE FINANCIAL ENTERPRISES, I
Subprime and Manufactured Home List (2003)|71474600000|7|1474600000|1|HOMESTAR MORTGAGE SVCS, LLC
Subprime and Manufactured Home List (2003)|71483300003|7|1483300003|1|FINANCE AMERICA, LLC
Subprime and Manufactured Home List (2003)|71512400000|7|1512400000|1|NOVASTAR MORTGAGE INC
Subprime and Manufactured Home List (2003)|71534900004|7|1534900004|1|FIRST NLC FINANCIAL SERVICES
Subprime and Manufactured Home List (2003)|71538600007|7|1538600007|2|CHAMPION ENTERPRISE
Subprime and Manufactured Home List (2003)|71549600001|7|1549600001|1|CONCORDE ACCEPTANCE CORPORATIO
Subprime and Manufactured Home List (2003)|71556900003|7|1556900003|1|THE ANYLOAN COMPANY
Subprime and Manufactured Home List (2003)|71557900001|7|1557900001|1|PEOPLE'S CHOICE HOME LOAN, INC
Subprime and Manufactured Home List (2003)|71596200005|7|1596200005|1|GMFS, LLC
Subprime and Manufactured Home List (2003)|71596800005|7|1596800005|1|FIRST CHOICE FUNDING
Subprime and Manufactured Home List (2003)|71611300007|7|1611300007|1|EQUITY RESOURCES, INC.
Subprime and Manufactured Home List (2003)|71665100001|7|1665100001|1|PINNACLE DIRECT FUNDING CORPOR
Subprime and Manufactured Home List (2003)|71665400004|7|1665400004|1|SOFIN MORTGAGE COMPANY
Subprime and Manufactured Home List (2003)|71673400009|7|1673400009|2|AMWEST FINANCIAL, INC.
Subprime and Manufactured Home List (2003)|71697600003|7|1697600003|1|HOMEFIRST MORTGAGE, INC.
Subprime and Manufactured Home List (2003)|71704900007|7|1704900007|1|EASY MONEY - MORTGAGE DIVISION
Subprime and Manufactured Home List (2003)|71707500002|7|1707500002|1|NOVASTAR HOME MORTGAGE
Subprime and Manufactured Home List (2003)|71718800007|7|1718800007|1|UNIMORTGAGE LLC.
Subprime and Manufactured Home List (2003)|71736300009|7|1736300009|1|JLM DIRECT FUNDING, LTD.
Subprime and Manufactured Home List (2003)|71770800008|7|1770800008|1|PEMM.TEK MORTGAGE SERVICES LLC
Subprime and Manufactured Home List (2003)|71786900005|7|1786900005|1|ESI MORTGAGE, LP
Subprime and Manufactured Home List (2003)|71795300001|7|1795300001|1|SPRINT FUNDING CORPORATION
Subprime and Manufactured Home List (2003)|71809800001|7|1809800001|1|SERVICE FIRST MORTGAGE, L.C.
Subprime and Manufactured Home List (2003)|71809900002|7|1809900002|1|HARBOURTON MORTGAGE INVESTMENT
Subprime and Manufactured Home List (2003)|71830200003|7|1830200003|1|OAK STREET MORTGAGE
Subprime and Manufactured Home List (2003)|71837800003|7|1837800003|1|NOVELLE FINANCIAL SERVICES
Subprime and Manufactured Home List (2003)|71851400008|7|1851400008|1|SEBRING CAPITAL PARTNERS, L.P.
Subprime and Manufactured Home List (2003)|71857500007|7|1857500007|1|ENCORE CREDIT CORP.
Subprime and Manufactured Home List (2003)|71864800009|7|1864800009|1|FICORE FUNDING INC.
Subprime and Manufactured Home List (2003)|71891200009|7|1891200009|1|WILMINGTON FINANCE, INC.
Subprime and Manufactured Home List (2003)|71917700009|7|1917700009|1|ARGENT MORTGAGE COMPANY
Subprime and Manufactured Home List (2003)|71928200004|7|1928200004|2|HOMEONE CREDIT CORP.
Subprime and Manufactured Home List (2003)|71958100003|7|1958100003|1|AEGIS LENDING CORPORATION
Subprime and Manufactured Home List (2003)|71958200004|7|1958200004|1|AEGIS FUNDING CORPORATION
Subprime and Manufactured Home List (2003)|71988200009|7|1988200009|1|PLANET MORTGAGE CORP
Subprime and Manufactured Home List (2003)|71991500005|7|1991500005|1|RES. MORT. ASSIST. ENTERPRISE
Subprime and Manufactured Home List (2003)|72064900008|7|2064900008|1|LENDERS DIRECT CAPITAL CORP.
Subprime and Manufactured Home List (2003)|722-3397885|7|22-3397885|1|AMERICAP FINANCIAL, INC.
Subprime and Manufactured Home List (2003)|72294709990|7|2294709990|2|GREEN TREE SERVICING LLC
Subprime and Manufactured Home List (2003)|723-3051009|7|23-3051009|1|OPUS HOME EQUITY SERVICES, INC
Subprime and Manufactured Home List (2003)|730-0181769|7|30-0181769|1|OPTIMA FUNDING
Subprime and Manufactured Home List (2003)|733-0515201|7|33-0515201|1|SOUTH SHORE MORTGAGE. INC.
Subprime and Manufactured Home List (2003)|733-0832025|7|33-0832025|1|SILVERSTONE FINANCIAL, INC.
Subprime and Manufactured Home List (2003)|733-0967630|7|33-0967630|1|EVERGREEN LENDING, INC.
Subprime and Manufactured Home List (2003)|735-1781299|7|35-1781299|1|CAPITAL FINANCIAL SERVICES
Subprime and Manufactured Home List (2003)|736-1239445|7|36-1239445|1|HOUSEHOLD FINANCE CORPORATION
Subprime and Manufactured Home List (2003)|741-1810165|7|41-1810165|1|LENDSOURCE, INC.
Subprime and Manufactured Home List (2003)|74856500006|7|4856500006|2|VANDERBILT MORTGAGE
Subprime and Manufactured Home List (2003)|74893600009|7|4893600009|1|FEDERAL MORTGAGE & INVESTMENT
Subprime and Manufactured Home List (2003)|751-0003820|7|51-0003820|1|BENEFICIAL
Subprime and Manufactured Home List (2003)|751-0113718|7|51-0113718|1|DECISION ONE MORTGAGE
Subprime and Manufactured Home List (2003)|752-2389729|7|52-2389729|1|EMMCO, LLC
Subprime and Manufactured Home List (2003)|754-1779092|7|54-1779092|2|ORIGEN FINANCIAL
Subprime and Manufactured Home List (2003)|75535100002|7|5535100002|1|METWEST MORTGAGE & SERVICES, I
Subprime and Manufactured Home List (2003)|756-2270727|7|56-2270727|1|AMERITRUST MORTGAGE COMPANY LL
Subprime and Manufactured Home List (2003)|758-2509828|7|58-2509828|1|CHOICE CAPITAL FUNDING
Subprime and Manufactured Home List (2003)|762-1687519|7|62-1687519|1|CROSSROADS MORTGAGE, INC.
Subprime and Manufactured Home List (2003)|76473909996|7|6473909996|1|FIRST NATIONAL MORTGAGE CO.
Subprime and Manufactured Home List (2003)|77042100008|7|7042100008|1|DOLLAR MORTGAGE CORPORATION
Subprime and Manufactured Home List (2003)|77059200001|7|7059200001|1|PREFERRED FINANCIAL FUNDING
Subprime and Manufactured Home List (2003)|77062300004|7|7062300004|1|BUDGET FINANCE COMPANY
Subprime and Manufactured Home List (2003)|77069000008|7|7069000008|1|DELTA FUNDING CORPORATION
Subprime and Manufactured Home List (2003)|77086400004|7|7086400004|1|AMERICAN BENEFIT MORTGAGE, INC
Subprime and Manufactured Home List (2003)|77092200000|7|7092200000|1|CRESTLINE FUNDING CORPORATION
Subprime and Manufactured Home List (2003)|771-0862419|7|71-0862419|1|AMERICAN RESIDENTIAL MORTGAGE
Subprime and Manufactured Home List (2003)|77113200004|7|7113200004|1|ADCO FINANCIAL MORTGAGE SERVIC
Subprime and Manufactured Home List (2003)|77143400005|7|7143400005|2|TAMMAC CORPORATION
Subprime and Manufactured Home List (2003)|77152500000|7|7152500000|1|PLATINUM CAPITAL GROUP
Subprime and Manufactured Home List (2003)|77162800002|7|7162800002|2|21ST MORTGAGE CORP.
Subprime and Manufactured Home List (2003)|77177000002|7|7177000002|1|MERITAGE MORTGAGE CORP
Subprime and Manufactured Home List (2003)|77177900003|7|7177900003|1|CHADWICK MORTGAGE, INC.
Subprime and Manufactured Home List (2003)|77185300006|7|7185300006|1|ACCREDITED HOME LENDERS, INC.
Subprime and Manufactured Home List (2003)|77245500008|7|7245500008|2|LAND HOME FINANCIAL SERVICES
Subprime and Manufactured Home List (2003)|77307200009|7|7307200009|1|HCL FINANCE, INC
Subprime and Manufactured Home List (2003)|77323800008|7|7323800008|1|EXPRESS CAPITAL LENDING
Subprime and Manufactured Home List (2003)|77373400006|7|7373400006|1|LIME FINANCIAL SERVICES, LTD
Subprime and Manufactured Home List (2003)|77407100001|7|7407100001|1|FOOTHILL FUNDING GROUP, INC
Subprime and Manufactured Home List (2003)|77464900009|7|7464900009|1|EMC MORTGAGE CORPORATION
Subprime and Manufactured Home List (2003)|77479800008|7|7479800008|1|CHAPEL MORTGAGE
Subprime and Manufactured Home List (2003)|775-1794257|7|75-1794257|1|GREAT WESTERN LOANS/INVEST LP
Subprime and Manufactured Home List (2003)|775-2585326|7|75-2585326|2|COUNTRYPLACE MORTGAGE, LTD
Subprime and Manufactured Home List (2003)|775-2921540|7|75-2921540|1|CENTEX HOME EQUITY COMPANY, LL
Subprime and Manufactured Home List (2003)|77506600003|7|7506600003|2|OAKWOOD ACCEPTANCE CORPORATION
Subprime and Manufactured Home List (2003)|77507300007|7|7507300007|1|ALLIED HOME MORTGAGE CAPITAL C
Subprime and Manufactured Home List (2003)|77542800002|7|7542800002|1|MLSG, INC.
Subprime and Manufactured Home List (2003)|77568500004|7|7568500004|1|CUSTOM MORTGAGE
Subprime and Manufactured Home List (2003)|77604800006|7|7604800006|1|OPTION ONE MORTGAGE CORP.
Subprime and Manufactured Home List (2003)|77619100004|7|7619100004|1|MONEYCORP (FN)
Subprime and Manufactured Home List (2003)|77621700002|7|7621700002|1|WORLD WIDE FINANCIAL SERVICES
Subprime and Manufactured Home List (2003)|77634100004|7|7634100004|1|AMERICAN MORTGAGE EXCHANGE, IN
Subprime and Manufactured Home List (2003)|77642300001|7|7642300001|1|LIBERTY AMERICAN MORTGAGE CORP
Subprime and Manufactured Home List (2003)|77650700000|7|7650700000|1|AMERICA'S MONEYLINE
Subprime and Manufactured Home List (2003)|77652800004|7|7652800004|1|NATION ONE MORTGAGE CO.,INC
Subprime and Manufactured Home List (2003)|77665200006|7|7665200006|1|AMERICAN ACCEPTANCE MORTGAGE
Subprime and Manufactured Home List (2003)|77673400003|7|7673400003|1|INVESTAID CORPORATION
Subprime and Manufactured Home List (2003)|777-0463885|7|77-0463885|1|ALTERNATIVE FINANCING CORP
Subprime and Manufactured Home List (2003)|77718200008|7|7718200008|1|AMERICAN HOME LOANS
Subprime and Manufactured Home List (2003)|77756300009|7|7756300009|1|AMERICAN EQUITY MORTGAGE
Subprime and Manufactured Home List (2003)|77756600001|7|7756600001|1|AMERIQUEST MORTGAGE COMPANY
Subprime and Manufactured Home List (2003)|77770700000|7|7770700000|1|HARBORSIDE FINANCIAL NETWORK
Subprime and Manufactured Home List (2003)|77771600006|7|7771600006|1|FIRST CAPITAL MORTGAGE
Subprime and Manufactured Home List (2003)|77775100007|7|7775100007|1|MILA, INC.
Subprime and Manufactured Home List (2003)|77786700007|7|7786700007|1|COLUMBIA MORTGAGE & FUNDING CO
Subprime and Manufactured Home List (2003)|77840600009|7|7840600009|1|BNC MORTGAGE
Subprime and Manufactured Home List (2003)|77875200001|7|7875200001|1|FIRST GREENSBORO HOME EQUITY
Subprime and Manufactured Home List (2003)|77885300000|7|7885300000|1|STERLING MORTGAGE & INVESTMENT
Subprime and Manufactured Home List (2003)|77892800004|7|7892800004|1|FIELDSTONE MORTGAGE COMPANY
Subprime and Manufactured Home List (2003)|77900200006|7|7900200006|1|NEW CENTURY MORTGAGE CORP.
Subprime and Manufactured Home List (2003)|77927200007|7|7927200007|1|NEW FREEDOM MORTGAGE CORP
Subprime and Manufactured Home List (2003)|77943800003|7|7943800003|1|SAXON MORTGAGE
Subprime and Manufactured Home List (2003)|791-1872563|7|91-1872563|1|SEATTLE FUNDING GROUP
Subprime and Manufactured Home List (2003)|795-2622032|7|95-2622032|1|AAMES FUNDING CORPORATION
Subprime and Manufactured Home List (2003)|795-4855230|7|95-4855230|1|EMPIRE MORTGAGE CORP
Subprime and Manufactured Home List (2003)|30000000178|3|0000000178|1|TALBOT STATE BANK             
Subprime List (2004)|772-0506617|7|72-0506617|1|UNITED-BILT HOMES, INC.       
Subprime List (2004)|71403800009|7|1403800009|1|INTEGRUS MORTGAGE, LLC        
Subprime List (2004)|20001844818|2|0001844818|1|WELLS FARGO FIN'L TENNESSEE   
Subprime List (2004)|20001844827|2|0001844827|1|WELLS FARGO FIN'L OKLAHOMA,INC
Subprime List (2004)|40000008183|4|0000008183|1|Eastern Savings Bank, FSB     
Subprime List (2004)|152-2113031|1|52-2113031|1|HOMEOWNERS LOAN CORPORATION   
Subprime List (2004)|77884800009|7|7884800009|1|AMERICAN LENDING NETWORK      
Subprime List (2004)|20001843606|2|0001843606|1|WELLS FARGO FIN'L TEXAS, INC  
Subprime List (2004)|20001844845|2|0001844845|1|WELLS FARGO FIN'L NORTH DAKOTA
Subprime List (2004)|20001844966|2|0001844966|1|WELLS FARGO FIN'L KANSAS, INC 
Subprime List (2004)|20001847305|2|0001847305|1|WELLS FARGO FIN'L ALABAMA, INC
Subprime List (2004)|20001847163|2|0001847163|1|WELLS FARGO FIN'L SO CAROLINA 
Subprime List (2004)|20002040989|2|0002040989|1|WELLS FARGO FIN'L NEW MEXICO  
Subprime List (2004)|20003144576|2|0003144576|1|WELLS FARGO FIN'L MISSISSIPPI 
Subprime List (2004)|20002040381|2|0002040381|1|WELLS FARGO FIN'L IOWA 3, INC 
Subprime List (2004)|20002041007|2|0002041007|1|WELLS FARGO FIN'L NO CAROLINA 
Subprime List (2004)|71085800002|7|1085800002|1|SPECIALTY MORTGAGE CORPORATION
Subprime List (2004)|20002817118|2|0002817118|1|CITIFINANCIAL INC             
Subprime List (2004)|20001844265|2|0001844265|1|WELLS FARGO FIN'L WYOMING, INC
Subprime List (2004)|20001844331|2|0001844331|1|WELLS FARGO FIN'L NEBRASKA,INC
Subprime List (2004)|20001844975|2|0001844975|1|WELLS FARGO FIN'L INDIANA, INC
Subprime List (2004)|723-2425397|7|23-2425397|1|AMERICAN GENERAL FIN.SERV.(DE)
Subprime List (2004)|20001847323|2|0001847323|1|WELLS FARGO FIN'L IDAHO, INC  
Subprime List (2004)|20003106181|2|0003106181|1|CITIFINANCIAL CORPORATION, LLC
Subprime List (2004)|20001844359|2|0001844359|1|WELLS FARGO FINL WISCONSIN INC
Subprime List (2004)|20003236677|2|0003236677|1|WASHINGTION MUTUAL FINANCE COR
Subprime List (2004)|20001844957|2|0001844957|1|WELLS FARGO FIN'L KENTUCKY INC
Subprime List (2004)|20001844984|2|0001844984|1|WELLS FARGO FIN'L MISSOURI INC
Subprime List (2004)|20001426027|2|0001426027|1|WELLS FARGO FIN'L ARIZONA, INC
Subprime List (2004)|20001844340|2|0001844340|1|WELLS FARGO FINL WEST VIRGINIA
Subprime List (2004)|20001845011|2|0001845011|1|WELLS FARGO FIN'L SOUTH DAKOTA
Subprime List (2004)|775-2958981|7|75-2958981|1|KELLNER MORTGAGE INVESTMENTS  
Subprime List (2004)|20002750532|2|0002750532|1|CITIFINANCIAL INC             
Subprime List (2004)|10000014740|1|0000014740|1|FIRST NATIONAL BANK OF AMERICA
Subprime List (2004)|77062300004|7|7062300004|1|BUDGET FINANCE COMPANY        
Subprime List (2004)|20001845039|2|0001845039|1|WELLS FARGO FIN'L GEORGIA, INC
Subprime List (2004)|20001844948|2|0001844948|1|WELLS FARGO FIN'L LOUISIANA   
Subprime List (2004)|20002040402|2|0002040402|1|WELLS FARGO FIN'L MAINE, INC  
Subprime List (2004)|20002751762|2|0002751762|1|CITIFINANCIAL INC             
Subprime List (2004)|20002752022|2|0002752022|1|CITIFINANCIAL,  INC           
Subprime List (2004)|20001845002|2|0001845002|1|WELLS FARGO FIN'L ALASKA, INC 
Subprime List (2004)|20002751922|2|0002751922|1|CITIFINANCIAL SERVICES, INC   
Subprime List (2004)|71206600009|7|1206600009|1|ALLIED MORTGAGE & FINANCIAL CO
Subprime List (2004)|20001845020|2|0001845020|1|WELLS FARGO FIN'L ILLINOIS INC
Subprime List (2004)|741-1810165|7|41-1810165|1|LENDSOURCE, INC.              
Subprime List (2004)|20002751968|2|0002751968|1|CITIFINANCIAL , INC           
Subprime List (2004)|72130700003|7|2130700003|1|SPECTRUM FUNDING CORPORATION  
Subprime List (2004)|20002134936|2|0002134936|1|WELLS FARGO FIN'L SYS FLORIDA 
Subprime List (2004)|20002752013|2|0002752013|1|CITIFINANCIAL SERVICES, INC   
Subprime List (2004)|20002751847|2|0002751847|1|CITIFINANCIAL SERVICES, INC   
Subprime List (2004)|20001847378|2|0001847378|1|WELLS FARGO FIN'L PENNSYLVANIA
Subprime List (2004)|20002751995|2|0002751995|1|CITIFINANCIAL EQUITY SERVICES,
Subprime List (2004)|20001844836|2|0001844836|1|WELLS FARGO FIN'L MONTANA, INC
Subprime List (2004)|77624900003|7|7624900003|1|AMERICAN PIONEER FINANCIAL SER
Subprime List (2004)|20002751801|2|0002751801|1|CITIFINANCIAL SERVICES, INC   
Subprime List (2004)|20002041034|2|0002041034|1|WELLS FARGO FIN'L OHIO 1, INC 
Subprime List (2004)|20002751810|2|0002751810|1|CITIFINANCIAL SERVICES, INC   
Subprime List (2004)|20001843624|2|0001843624|1|WELLS FARGO FIN'L UTAH, INC   
Subprime List (2004)|20001844920|2|0001844920|1|WELLS FARGO FIN'L MINNESOTA   
Subprime List (2004)|20000860473|2|0000860473|1|CITIFINANCIAL, INC            
Subprime List (2004)|20002039488|2|0002039488|1|WELLS FARGO FIN'L AMERICA, INC
Subprime List (2004)|722-3887207|7|22-3887207|1|NEW DAY FINANCIAL, LLC.       
Subprime List (2004)|20001844993|2|0001844993|1|WELLS FARGO FIN'L COLORADO INC
Subprime List (2004)|20001844939|2|0001844939|1|WELLS FARGO FIN'L MARYLAND,INC
Subprime List (2004)|358-2257419|3|58-2257419|1|LENDMARK FINANCIAL SERVICES   
Subprime List (2004)|71463300003|7|1463300003|1|MOORE FINANCIAL ENTERPRISES, I
Subprime List (2004)|20000902270|2|0000902270|1|CITIFINANCIAL SERVICES, INC   
Subprime List (2004)|71596800005|7|1596800005|1|FIRST CHOICE FUNDING, INC.    
Subprime List (2004)|20002750242|2|0002750242|1|CITIFINANCIAL SERVICES, INC   
Subprime List (2004)|20002751986|2|0002751986|1|CITIFINANCIAL, INC            
Subprime List (2004)|20002135401|2|0002135401|1|WELLS FARGO FIN'L SYS VIRGINIA
Subprime List (2004)|70542046140|7|0542046140|1|CALUSA INVESTMENTS, L.L.C.    
Subprime List (2004)|756-2270727|7|56-2270727|1|AMERITRUST MORTGAGE COMPANY, L
Subprime List (2004)|20002041098|2|0002041098|1|WELLS FARGO FIN'L WASHINGTON 1
Subprime List (2004)|71549600001|7|1549600001|1|CONCORDE ACCEPTANCE CORPORATIO
Subprime List (2004)|702-0560839|7|02-0560839|1|FIRST CONTINENTAL MORTGAGE    
Subprime List (2004)|20002752321|2|0002752321|1|CITIFINANCIAL COMPANY(DE)     
Subprime List (2004)|20001950308|2|0001950308|1|POPULAR FINANCE, INC.         
Subprime List (2004)|30000025653|3|0000025653|1|FREMONT INVESTMENT & LOAN     
Subprime List (2004)|71059700002|7|1059700002|1|FIRST CONSOLIDATED MORTGAGE   
Subprime List (2004)|762-1717999|7|62-1717999|1|THE CIT GROUP/CONSUMER FINANCE
Subprime List (2004)|20001847369|2|0001847369|1|WELLS FARGO FIN'L OREGON, INC 
Subprime List (2004)|77775100007|7|7775100007|1|MILA INC                      
Subprime List (2004)|77673400003|7|7673400003|1|INVESTAID CORPORATION         
Subprime List (2004)|20001868177|2|0001868177|1|WELLS FARGO FIN'L CRED SERV NY
Subprime List (2004)|72064900008|7|2064900008|1|LENDERS DIRECT CAPITAL CORP   
Subprime List (2004)|20002752684|2|0002752684|1|CITIFINANCIAL CORPORATION     
Subprime List (2004)|20002040961|2|0002040961|1|WELLS FARGO FIN'L NEVADA 2,INC
Subprime List (2004)|77069000008|7|7069000008|1|DELTA FUNDING CORPORATION     
Subprime List (2004)|20001844283|2|0001844283|1|WELLS FARGO FIN'L NEW JERSEY  
Subprime List (2004)|775-2921540|7|75-2921540|1|CENTEX HOME EQUITY COMPANY LLC
Subprime List (2004)|71534900004|7|1534900004|1|FIRST NLC FINANCIAL SERVICES  
Subprime List (2004)|71289800005|7|1289800005|1|PGNF HOME LENDING CORP        
Subprime List (2004)|71394900006|7|1394900006|1|SECURED FUNDING CORPORATION   
Subprime List (2004)|713-2607259|7|13-2607259|1|THE CIT GROUP/CONSUMER FINANCE
Subprime List (2004)|71438500002|7|1438500002|1|FRANKLIN MORTGAGE FUNDING     
Subprime List (2004)|20002752077|2|0002752077|1|CITIFINANCIAL SERVICES, INC   
Subprime List (2004)|77177000002|7|7177000002|1|MERITAGE MORTGAGE CORP.       
Subprime List (2004)|20002041418|2|0002041418|1|WELLS FARGO FINL MASSACHUSETTS
Subprime List (2004)|70232646780|7|0232646780|1|AMERICAN BUSINESS FINANCIAL   
Subprime List (2004)|71851400008|7|1851400008|1|SEBRING CAPITAL PARTNERS, L.P.
Subprime List (2004)|733-0806023|7|33-0806023|1|FLEXPOINT FUNDING CORPORATION 
Subprime List (2004)|20002861595|2|0002861595|1|CITIFINANCIAL SERIVCES, INC   
Subprime List (2004)|77652800004|7|7652800004|1|NATION ONE MORTGAGE CO.,INC   
Subprime List (2004)|722-3191019|7|22-3191019|1|THE CIT GROUP/CONSUMER FINANCE
Subprime List (2004)|71958100003|7|1958100003|1|AEGIS LENDING CORPORATION     
Subprime List (2004)|72033300001|7|2033300001|1|FIRST STREET FINANCIAL, INC.  
Subprime List (2004)|338-3589255|3|38-3589255|1|NPB MORTGAGE LLC              
Subprime List (2004)|20002752527|2|0002752527|1|EQUIFIRST CORPORATION         
Subprime List (2004)|72147800003|7|2147800003|1|HOMEQUEST CAPITAL FUNDING, LLC
Subprime List (2004)|71483300003|7|1483300003|1|FINANCE AMERICA, LLC          
Subprime List (2004)|71999200003|7|1999200003|1|ACOUSTIC HOME LOANS, LLC      
Subprime List (2004)|71958200004|7|1958200004|1|AEGIS FUNDING CORPORATION     
Subprime List (2004)|71770800008|7|1770800008|1|PEMMTEK MORTGAGE SERVICES, LLC
Subprime List (2004)|77885300000|7|7885300000|1|STERLING MORTGAGE & INVESTMENT
Subprime List (2004)|20001942602|2|0001942602|1|EQUITY ONE, INC.              
Subprime List (2004)|705-0560686|7|05-0560686|1|SUNSET DIRECT LENDING, LLC    
Subprime List (2004)|77373400006|7|7373400006|1|LIME FINANCIAL SERVICES, LTD. 
Subprime List (2004)|40000014470|4|0000014470|1|CITICORP TRUST BANK, FSB      
Subprime List (2004)|40640713034|4|0640713034|1|CORINTHIAN MORTGAGE CORP      
Subprime List (2004)|71843200000|7|1843200000|1|BERGIN FINANCIAL, INC         
Subprime List (2004)|77756600001|7|7756600001|1|AMERIQUEST MORTGAGE COMPANY   
Subprime List (2004)|713-2868346|7|13-2868346|1|AMERICAN GENERAL HOME EQU.(DE)
Subprime List (2004)|71512400000|7|1512400000|1|NOVASTAR MORTGAGE INC         
Subprime List (2004)|77642300001|7|7642300001|1|LIBERTY AMERICAN MORTGAGE CORP
Subprime List (2004)|727-0011311|7|27-0011311|1|PREMIUM CAPITAL FUNDING, LLC  
Subprime List (2004)|72007800007|7|2007800007|1|OLYMPUS MORTGAGE COMPANY      
Subprime List (2004)|70458600405|7|0458600405|1|WMC MORTGAGE CORP.            
Subprime List (2004)|704-3697858|7|04-3697858|1|CORESTAR FINANCIAL GROUP, LLC 
Subprime List (2004)|795-2622032|7|95-2622032|1|AAMES FUNDING CORPORATION     
Subprime List (2004)|71830200003|7|1830200003|1|OAK STREET MORTGAGE           
Subprime List (2004)|71611300007|7|1611300007|1|EQUITY RESOURCES INC          
Subprime List (2004)|71281200009|7|1281200009|1|First State Mortgage Corporati
Subprime List (2004)|71917700009|7|1917700009|1|ARGENT MORTGAGE COMPANY       
Subprime List (2004)|71707500002|7|1707500002|1|NOVASTAR HOME MORTGAGE INC    
Subprime List (2004)|751-0113718|7|51-0113718|1|DECISION ONE MORTGAGE         
Subprime List (2004)|71857500007|7|1857500007|1|ENCORE CREDIT CORP.           
Subprime List (2004)|77854200009|7|7854200009|1|BUDGET MORTGAGE BANKERS, LTD. 
Subprime List (2004)|20001847332|2|0001847332|1|WELLS FARGO FIN'L HAWAII, INC 
Subprime List (2004)|71795300001|7|1795300001|1|SPRINT FUNDING CORPORATION    
Subprime List (2004)|71718800007|7|1718800007|1|UNIMORTGAGE LLC.              
Subprime List (2004)|77185300006|7|7185300006|1|ACCREDITED HOME LENDERS, INC. 
Subprime List (2004)|71557900001|7|1557900001|1|PEOPLE'S CHOICE HOME LOAN, INC
Subprime List (2004)|751-0003820|7|51-0003820|1|BENEFICIAL                    
Subprime List (2004)|77083400004|7|7083400004|1|ALLIANCE MORTGAGE BANKING CORP
Subprime List (2004)|705-0402708|7|05-0402708|1|ADVANCED FINANCIAL SERVICES IN
Subprime List (2004)|77650700000|7|7650700000|1|AMERICAS MONEYLINE            
Subprime List (2004)|71809900002|7|1809900002|1|HARBOURTON MORTGAGE INVESTMENT
Subprime List (2004)|20001847275|2|0001847275|1|WELLS FARGO FIN'L CALIFORNIA  
Subprime List (2004)|71259600009|7|1259600009|1|SOUTHSTAR FUNDING             
Subprime List (2004)|40000012504|4|0000012504|1|OCEAN BANK FSB                
Subprime List (2004)|77943800003|7|7943800003|1|SAXON MORTGAGE                
Subprime List (2004)|40061104540|4|0061104540|1|CITIFINANCIAL MORTGAGE CO.,INC
Subprime List (2004)|795-4855230|7|95-4855230|1|EMPIRE MORTGAGE CORPORATION   
Subprime List (2004)|71194900009|7|1194900009|1|HAMILTON MORTGAGE COMPANY     
Subprime List (2004)|77900200006|7|7900200006|1|NEW CENTURY MTG CORPORATION   
Subprime List (2004)|77431100008|7|7431100008|1|OWNIT MORTGAGE SOLUTIONS INC. 
Subprime List (2004)|71061700007|7|1061700007|1|TOWN & COUNTRY CREDIT CORP    
Subprime List (2004)|77479800008|7|7479800008|1|CHAPEL MORTGAGE               
Subprime List (2004)|77604800006|7|7604800006|1|OPTION ONE MORTGAGE CORP.     
Subprime List (2004)|722-3740390|7|22-3740390|1|LANCASTER MORTGAGE BANKERS    
Subprime List (2004)|10000024095|1|0000024095|1|MBNA AMERICA (DELAWARE), N.A. 
Subprime List (2004)|20000612618|2|0000612618|1|Provident Bank                
Subprime List (2004)|71003800004|7|1003800004|1|LONG BEACH MORTGAGE CO.       
Subprime List (2004)|736-1239445|7|36-1239445|1|HFC                           
Subprime List (2004)|71750100005|7|1750100005|1|WALTER MORTGAGE COMPANY       
Subprime List (2004)|71345700002|7|1345700002|1|BRIDGE CAPITAL CORPORATION    
Subprime List (2004)|71349000009|7|1349000009|1|STEWARD FINANCIAL, INC        
Subprime List (2004)|71786900005|7|1786900005|1|ESI MORTGAGE, LP              
Subprime List (2004)|76480209999|7|6480209999|1|MASTER FINANCIAL, INC.        
Subprime List (2004)|20003103489|2|0003103489|1|CITIFINANCIAL MTG. CO.(FL),LLC
Subprime List (2004)|71991500005|7|1991500005|1|RESMAE MORTGAGE CORPORATION   
Subprime List (2004)|77892800004|7|7892800004|1|FIELDSTONE MORTGAGE COMPANY   
Subprime List (2004)|71345300006|7|1345300006|1|THE MORTGAGE OUTLET           
Subprime List (2004)|77718200008|7|7718200008|1|AMERICAN HOME LOANS           
Subprime List (2004)|77935900009|7|7935900009|1|LOAN CENTER OF CALIFORNIA     
Subprime List (2004)|40000014939|4|0000014939|1|AIG FSB                       
Subprime List (2004)|731-1480758|7|31-1480758|1|SELECT MORTGAGE GROUP, LTD.   
Subprime List (2004)|70351887380|7|0351887380|1|HOMELAND MORTGAGE COMPANY     
Subprime List (2004)|70330756645|7|0330756645|1|GREATER ACCEPTANCE MORTGAGE CO
Subprime List (2004)|77621700002|7|7621700002|1|WORLD WIDE FINANCIAL SERVICES 
Subprime List (2004)|733-0668958|7|33-0668958|1|THE LENDING CONNECTION INC    
Subprime List (2004)|77542800002|7|7542800002|1|MLSG, INC.                    
Subprime List (2004)|71864800009|7|1864800009|1|FICORE FUNDING, INC.          
Subprime List (2004)|722-3397885|7|22-3397885|1|AMERICAP FINANCIAL, INC       
Subprime List (2004)|77343000001|7|7343000001|1|IMPAC FUNDING CORP            
Subprime List (2004)|77177900003|7|7177900003|1|RIGHT AWAY MORTGAGE           
Subprime List (2004)|71891200009|7|1891200009|1|WILMINGTON FINANCE, INC       
Subprime List (2004)|71422400005|7|1422400005|1|MERITLENDING.COM              
Subprime List (2004)|20003073694|2|0003073694|1|CITIFINANCIAL MORTGAGE CO.,INC
Subprime List (2004)|71775300005|7|1775300005|1|AMERICAN HOME EQUITY          
Subprime List (2004)|775-1794257|7|75-1794257|1|OAK STREET MORTGAGE/GW        
Subprime List (2004)|77323800008|7|7323800008|1|EXPRESS CAPITAL LENDING       
Subprime List (2004)|71118100001|7|1118100001|1|MORTGAGE LENDERS NETWORK USA  
Subprime List (2004)|733-0967630|7|33-0967630|1|EVERGREEN LENDING, INC.       
Subprime List (2004)|77152500000|7|7152500000|1|PLATINUM CAPITAL GROUP        
Subprime List (2004)|71665100001|7|1665100001|1|PINNACLE DIRECT FUNDING CORPOR
Subprime List (2004)|71736300009|7|1736300009|1|JLM DIRECT FUNDING, LTD       
Subprime List (2004)|71207500004|7|1207500004|1|COURTESY MORTGAGE COMPANY     
Subprime List (2004)|71390800005|7|1390800005|1|THE MORTGAGE OUTLET, INC.     
Subprime List (2004)|71474600000|7|1474600000|1|OPTEUM FINANCIAL SERVICES LLC 
Subprime List (2004)|77439600003|7|7439600003|1|CASA BLANCA MORTGAGE, INC     
Subprime List (2004)|777-0463885|7|77-0463885|1|ALTERNATIVE FINANCING CORP    
Subprime List (2004)|72033000009|7|2033000009|1|BEDFORD HOME LOANS, INC.      
Subprime List (2004)|77786700007|7|7786700007|1|COLUMBIA MORTGAGE & FUNDING CO
Subprime List (2004)|77756300009|7|7756300009|1|AMERICAN EQUITY MORTGAGE      
Subprime List (2004)|71596200005|7|1596200005|1|GMFS,LLC                      
Subprime List (2004)|77770700000|7|7770700000|1|HARBORSIDE FINANCIAL NETWORK  
Subprime List (2004)|705-0527593|7|05-0527593|1|NATIONSFIRST LENDING, INC.    
Subprime List (2004)|711-2815564|7|11-2815564|1|EHOMECREDIT CORP              
Subprime List (2004)|77042100008|7|7042100008|1|DOLLAR MORTGAGE CORPORATION   
Subprime List (2004)|77619100004|7|7619100004|1|MONEY CORP(FN)                
Subprime List (2004)|70041198897|7|0041198897|1|MARIBELLA MORTGAGE, LLC.      
Subprime List (2004)|758-2509828|7|58-2509828|1|CHOICE CAPITAL FUNDING        
Subprime List (2004)|71250200008|7|1250200008|1|MONEYONE, INC                 
Subprime List (2004)|71283400003|7|1283400003|1|ACT LENDING CORPORATION       
Subprime List (2004)|71809800001|7|1809800001|1|SERVICE FIRST MORTGAGE, L.C.  
Subprime List (2004)|70510312284|7|0510312284|1|MOREQUITY,INC.            (NV)
Subprime List (2004)|730-0237185|7|30-0237185|1|ADVANTIX LENDING              
Subprime List (2004)|71291700001|7|1291700001|1|HEARTHSIDE LENDING CORP.      
Subprime List (2004)|77086400004|7|7086400004|1|AMERICAN BENEFIT MORTGAGE, INC
Subprime List (2004)|723-3051009|7|23-3051009|1|OPUS HOME EQUITY SERVICES, INC
Subprime List (2004)|77875200001|7|7875200001|1|FIRST GREENSBORO HOME EQUITY  
Subprime List (2004)|30000026799|3|0000026799|1|EVABANK                       
Subprime List (2004)|40000002630|4|0000002630|1|M&I BANK FSB                  
Subprime List (2004)|40000008266|4|0000008266|1|UNITED MIDWEST SAVINGS BANK   
Subprime List (2004)|72120900003|7|2120900003|1|ADVENT MORTGAGE, LLC          
Subprime List (2004)|30000000178|3|0000000178|1|TALBOT STATE BANK             
Subprime List (2005)|10000014740|1|0000014740|1|FIRST NATIONAL BANK OF AMERICA
Subprime List (2005)|10000024095|1|0000024095|1|MBNA AMERICA (DELAWARE), N.A. 
Subprime List (2005)|152-2113031|1|52-2113031|1|HOMEOWNERS LOAN CORPORATION   
Subprime List (2005)|20000860473|2|0000860473|1|CITIFINANCIAL, INC.           
Subprime List (2005)|20000902270|2|0000902270|1|CITIFINANCIAL SERVICES,  INC. 
Subprime List (2005)|20001426027|2|0001426027|1|WELLS FARGO FIN'L ARIZONA, INC
Subprime List (2005)|20001843606|2|0001843606|1|WELLS FARGO FIN'L TEXAS, INC  
Subprime List (2005)|20001843624|2|0001843624|1|WELLS FARGO FIN'L UTAH, INC   
Subprime List (2005)|20001844265|2|0001844265|1|WELLS FARGO FIN'L WYOMING, INC
Subprime List (2005)|20001844283|2|0001844283|1|WELLS FARGO FIN'L NEW JERSEY  
Subprime List (2005)|20001844331|2|0001844331|1|WELLS FARGO FIN'L NEBRASKA,INC
Subprime List (2005)|20001844340|2|0001844340|1|WELLS FARGO FINL WEST VIRGINIA
Subprime List (2005)|20001844359|2|0001844359|1|WELLS FARGO FINL WISCONSIN INC
Subprime List (2005)|20001844818|2|0001844818|1|WELLS FARGO FIN'L TENNESSEE   
Subprime List (2005)|20001844827|2|0001844827|1|WELLS FARGO FIN'L OKLAHOMA,INC
Subprime List (2005)|20001844836|2|0001844836|1|WELLS FARGO FIN'L MONTANA, INC
Subprime List (2005)|20001844845|2|0001844845|1|WELLS FARGO FIN'L NORTH DAKOTA
Subprime List (2005)|20001844920|2|0001844920|1|WELLS FARGO FIN'L MINNESOTA   
Subprime List (2005)|20001844939|2|0001844939|1|WELLS FARGO FIN'L MARYLAND,INC
Subprime List (2005)|20001844948|2|0001844948|1|WELLS FARGO FIN'L LOUISIANA   
Subprime List (2005)|20001844957|2|0001844957|1|WELLS FARGO FIN'L KENTUCKY INC
Subprime List (2005)|20001844966|2|0001844966|1|WELLS FARGO FIN'L KANSAS, INC 
Subprime List (2005)|20001844975|2|0001844975|1|WELLS FARGO FIN'L INDIANA, INC
Subprime List (2005)|20001844984|2|0001844984|1|WELLS FARGO FIN'L MISSOURI INC
Subprime List (2005)|20001844993|2|0001844993|1|WELLS FARGO FIN'L COLORADO INC
Subprime List (2005)|20001845002|2|0001845002|1|WELLS FARGO FIN'L ALASKA, INC 
Subprime List (2005)|20001845011|2|0001845011|1|WELLS FARGO FIN'L SOUTH DAKOTA
Subprime List (2005)|20001845020|2|0001845020|1|WELLS FARGO FIN'L ILLINOIS INC
Subprime List (2005)|20001845039|2|0001845039|1|WELLS FARGO FIN'L GEORGIA, INC
Subprime List (2005)|20001847163|2|0001847163|1|WELLS FARGO FIN'L SO CAROLINA 
Subprime List (2005)|20001847275|2|0001847275|1|WELLS FARGO FIN'L CALIFORNIA  
Subprime List (2005)|20001847305|2|0001847305|1|WELLS FARGO FIN'L ALABAMA, INC
Subprime List (2005)|20001847323|2|0001847323|1|WELLS FARGO FIN'L IDAHO, INC  
Subprime List (2005)|20001847332|2|0001847332|1|WELLS FARGO FIN'L HAWAII, INC 
Subprime List (2005)|20001847369|2|0001847369|1|WELLS FARGO FIN'L OREGON, INC 
Subprime List (2005)|20001847378|2|0001847378|1|WELLS FARGO FIN'L PENNSYLVANIA
Subprime List (2005)|20001868177|2|0001868177|1|WELLS FARGO FIN'L CRED SERV NY
Subprime List (2005)|20001942602|2|0001942602|1|EQUITY ONE, INC.              
Subprime List (2005)|20001950308|2|0001950308|1|POPULAR FINANCE, INC.         
Subprime List (2005)|20002039488|2|0002039488|1|WELLS FARGO FIN'L AMERICA, INC
Subprime List (2005)|20002040381|2|0002040381|1|WELLS FARGO FIN'L IOWA 3, INC 
Subprime List (2005)|20002040402|2|0002040402|1|WELLS FARGO FIN'L MAINE, INC  
Subprime List (2005)|20002040961|2|0002040961|1|WELLS FARGO FIN'L NEVADA 2,INC
Subprime List (2005)|20002040989|2|0002040989|1|WELLS FARGO FIN'L NEW MEXICO  
Subprime List (2005)|20002041007|2|0002041007|1|WELLS FARGO FIN'L NO CAROLINA 
Subprime List (2005)|20002041034|2|0002041034|1|WELLS FARGO FIN'L OHIO 1, INC 
Subprime List (2005)|20002041098|2|0002041098|1|WELLS FARGO FIN'L WASHINGTON 1
Subprime List (2005)|20002041418|2|0002041418|1|WELLS FARGO FINL MASSACHUSETTS
Subprime List (2005)|20002134936|2|0002134936|1|WELLS FARGO FIN'L SYS FLORIDA 
Subprime List (2005)|20002135401|2|0002135401|1|WELLS FARGO FIN'L SYS VIRGINIA
Subprime List (2005)|20002750242|2|0002750242|1|CITIFINANCIAL SERVICES, INC.  
Subprime List (2005)|20002750532|2|0002750532|1|CITIFINANCIAL, INC.           
Subprime List (2005)|20002751762|2|0002751762|1|CITIFINANCIAL, INC.           
Subprime List (2005)|20002751801|2|0002751801|1|CITIFINANCIAL SERVICES, INC.  
Subprime List (2005)|20002751810|2|0002751810|1|CITIFINANCIAL SERVICES, INC.  
Subprime List (2005)|20002751847|2|0002751847|1|CITIFINANCIAL SERVICES, INC.  
Subprime List (2005)|20002751922|2|0002751922|1|CITIFINANCIAL SERVICES, INC.  
Subprime List (2005)|20002751968|2|0002751968|1|CITIFINANCIAL, INC.           
Subprime List (2005)|20002751986|2|0002751986|1|CITIFINANCIAL, INC.           
Subprime List (2005)|20002751995|2|0002751995|1|CITIFINANCIAL EQUITY SERVICES 
Subprime List (2005)|20002752013|2|0002752013|1|CITIFINANCIAL SERVICES, INC.  
Subprime List (2005)|20002752022|2|0002752022|1|CITIFINANCIAL, INC.           
Subprime List (2005)|20002752077|2|0002752077|1|CITIFINANCIAL SERVICES, INC.  
Subprime List (2005)|20002752321|2|0002752321|1|CITIFINANCIAL COMPANY(DE)     
Subprime List (2005)|20002752527|2|0002752527|1|EQUIFIRST CORPORATION         
Subprime List (2005)|20002752684|2|0002752684|1|CITIFINANCIAL CORPORATION     
Subprime List (2005)|20002817118|2|0002817118|1|CITIFINANCIAL, INC.           
Subprime List (2005)|20002861595|2|0002861595|1|CITIFINANCIAL SERVICES,  INC. 
Subprime List (2005)|20002977601|2|0002977601|1|ASSOCIATES INT'L HOLDING CORP 
Subprime List (2005)|20003073694|2|0003073694|1|CITIFINANCIAL MTG CO, LLC     
Subprime List (2005)|20003103489|2|0003103489|1|CITIFINANCIAL MTG CO (FL, LLC)
Subprime List (2005)|20003106181|2|0003106181|1|CITIFINANCIAL            CORPO
Subprime List (2005)|20003144576|2|0003144576|1|WELLS FARGO FIN'L MISSISSIPPI 
Subprime List (2005)|20003197871|2|0003197871|1|HSBC MORTGAGE SERVICES, INC.  
Subprime List (2005)|30000025653|3|0000025653|1|FREMONT INVESTMENT & LOAN     
Subprime List (2005)|30000026799|3|0000026799|1|EVABANK                       
Subprime List (2005)|338-3589255|3|38-3589255|1|NPB MORTGAGE, LLC             
Subprime List (2005)|358-2257419|3|58-2257419|1|LENDMARK FINANCIAL SERVICES   
Subprime List (2005)|40000002630|4|0000002630|1|M&I BANK FSB                  
Subprime List (2005)|40000008183|4|0000008183|1|EASTERN SAVINGS BANK          
Subprime List (2005)|40000008266|4|0000008266|1|UNITED MIDWEST SAVINGS BANK   
Subprime List (2005)|40000012504|4|0000012504|1|OCEAN BANK FSB                
Subprime List (2005)|40000014470|4|0000014470|1|CITICORP TRUST BANK, FSB      
Subprime List (2005)|40000014939|4|0000014939|1|AIG FEDERAL SAVINGS BANK      
Subprime List (2005)|40061104540|4|0061104540|1|CITIFINANCIAL MTG CO, INC     
Subprime List (2005)|40640713034|4|0640713034|1|CORINTHIAN MORTGAGE CORP      
Subprime List (2005)|70041198897|7|0041198897|1|MARIBELLA MORTGAGE, LLC.      
Subprime List (2005)|702-0560839|7|02-0560839|1|FIRST CONTINENTAL MORTGAGE    
Subprime List (2005)|70351887380|7|0351887380|1|HOMELAND MORTGAGE COMPANY     
Subprime List (2005)|704-3697858|7|04-3697858|1|CORESTAR FINANCIAL GROUP, LLC 
Subprime List (2005)|70458600405|7|0458600405|1|WMC MORTGAGE CORP.            
Subprime List (2005)|705-0402708|7|05-0402708|1|ADVANCED FINANCIAL SERVICES IN
Subprime List (2005)|705-0527593|7|05-0527593|1|NATIONSFIRST LENDING, INC     
Subprime List (2005)|705-0560686|7|05-0560686|1|SUNSET DIRECT LENDING         
Subprime List (2005)|70510312284|7|0510312284|1|MOREQUITY, INC. (NV)          
Subprime List (2005)|70542046140|7|0542046140|1|CALUSA INVESTMENTS, L.L.C.    
Subprime List (2005)|71003800004|7|1003800004|1|LONG BEACH MORTGAGE CO.       
Subprime List (2005)|71012300001|7|1012300001|1|HOME LOAN MORTGAGE CORPORATION
Subprime List (2005)|71059700002|7|1059700002|1|FIRST CONSOLIDATED MORTGAGE   
Subprime List (2005)|71061700007|7|1061700007|1|TOWN & COUNTRY CREDIT CORP    
Subprime List (2005)|711-2815564|7|11-2815564|1|EHOMECREDIT CORP              
Subprime List (2005)|71118100001|7|1118100001|1|MORTGAGE LENDERS NETWORK USA  
Subprime List (2005)|71194900009|7|1194900009|1|HAMILTON MORTGAGE COMPANY     
Subprime List (2005)|71206600009|7|1206600009|1|ALLIED MORTGAGE & FINANCIAL CO
Subprime List (2005)|71207500004|7|1207500004|1|COURTESY MORTGAGE COMPANY     
Subprime List (2005)|71250200008|7|1250200008|1|MONEYONE, INC                 
Subprime List (2005)|71259600009|7|1259600009|1|SOUTHSTAR FUNDING             
Subprime List (2005)|71281200009|7|1281200009|1|First State Mortgage Corporati
Subprime List (2005)|71283400003|7|1283400003|1|ACT LENDING CORPORATION       
Subprime List (2005)|713-2607259|7|13-2607259|1|THE CIT GROUP/CONSUMER FINANCE
Subprime List (2005)|713-2868346|7|13-2868346|1|AMERICAN GENERAL HOME EQU.(DE)
Subprime List (2005)|71345300006|7|1345300006|1|THE MORTGAGE OUTLET           
Subprime List (2005)|71345700002|7|1345700002|1|BRIDGE CAPITAL CORPORATION    
Subprime List (2005)|71349000009|7|1349000009|1|STEWARD FINANCIAL, INC        
Subprime List (2005)|71390800005|7|1390800005|1|THE MORTGAGE OUTLET, INC.     
Subprime List (2005)|71394900006|7|1394900006|1|SECURED FUNDING               
Subprime List (2005)|71422400005|7|1422400005|1|MERITLENDING.COM              
Subprime List (2005)|71512400000|7|1512400000|1|NOVASTAR MORTGAGE, INC.       
Subprime List (2005)|71534900004|7|1534900004|1|FIRST NLC FINANCIAL SERVICES  
Subprime List (2005)|71549600001|7|1549600001|1|CONCORDE ACCEPTANCE CORPORATIO
Subprime List (2005)|71557900001|7|1557900001|1|PEOPLE'S CHOICE FINANCIAL CORP
Subprime List (2005)|71596200005|7|1596200005|1|GMFS, LLC                     
Subprime List (2005)|71596800005|7|1596800005|1|FIRST CHOICE FUNDING          
Subprime List (2005)|71611300007|7|1611300007|1|EQUITY RESOURCES, INC.        
Subprime List (2005)|71665100001|7|1665100001|1|PINNACLE DIRECT FUNDING CORPOR
Subprime List (2005)|71707500002|7|1707500002|1|NOVASTAR HOME MORTGAGE, INC.  
Subprime List (2005)|71718800007|7|1718800007|1|UNIMORTGAGE LLC               
Subprime List (2005)|71736300009|7|1736300009|1|JLM DIRECT FUNDING LTD        
Subprime List (2005)|71750100005|7|1750100005|1|Walter Mortgage Company       
Subprime List (2005)|71770800008|7|1770800008|1|PEMM.TEK MORTGAGE SERVICES    
Subprime List (2005)|71775300005|7|1775300005|1|AMERICAN HOME EQUITY          
Subprime List (2005)|71795300001|7|1795300001|1|SPRINT FUNDING CORPORATION    
Subprime List (2005)|71809900002|7|1809900002|1|HARBOURTON MORTGAGE INVESTMENT
Subprime List (2005)|71830200003|7|1830200003|1|OAK STREET MORTGAGE           
Subprime List (2005)|71843200000|7|1843200000|1|BERGIN FINANCIAL, INC.        
Subprime List (2005)|71851400008|7|1851400008|1|SEBRING CAPITAL PARTNERS, L.P.
Subprime List (2005)|71857500007|7|1857500007|1|ENCORE CREDIT CORP            
Subprime List (2005)|71864800009|7|1864800009|1|FICORE FUNDING, INC.          
Subprime List (2005)|71891200009|7|1891200009|1|WILMINGTON FINANCE, INC.      
Subprime List (2005)|71917700009|7|1917700009|1|ARGENT MORTGAGE COMPANY LLC   
Subprime List (2005)|71958100003|7|1958100003|1|AEGIS LENDING CORPORATION     
Subprime List (2005)|71958200004|7|1958200004|1|AEGIS FUNDING CORPORATION     
Subprime List (2005)|71991500005|7|1991500005|1|RESMAE MORTGAGE CORPORATION   
Subprime List (2005)|71999200003|7|1999200003|1|ACOUSTIC HOME LOANS, LLC      
Subprime List (2005)|72033000009|7|2033000009|1|AMC MORTGAGE SERVICES, INC.   
Subprime List (2005)|72033300001|7|2033300001|1|FIRST STREET FINANCIAL, INC.  
Subprime List (2005)|72064900008|7|2064900008|1|LENDERS DIRECT CAPITAL CORP   
Subprime List (2005)|72130700003|7|2130700003|1|SPECTRUM FUNDING CORPORATION  
Subprime List (2005)|722-3191019|7|22-3191019|1|THE CIT GROUP/CONSUMER FINANCE
Subprime List (2005)|722-3397885|7|22-3397885|1|AMERICAP FINANCIAL INC        
Subprime List (2005)|722-3740390|7|22-3740390|1|LANCASTER MORTGAGE BANKERS    
Subprime List (2005)|722-3887207|7|22-3887207|1|New Day Financial, LLC        
Subprime List (2005)|723-2425397|7|23-2425397|1|AMERICAN GENERAL FIN.SERV.(DE)
Subprime List (2005)|723-3051009|7|23-3051009|1|OPUS HOME EQUITY SERVICES, INC
Subprime List (2005)|727-0011311|7|27-0011311|1|PREMIUM CAPITAL FUNDING       
Subprime List (2005)|730-0237185|7|30-0237185|1|ADVANTIX LENDING, INC.        
Subprime List (2005)|731-1480758|7|31-1480758|1|SELECT MORTGAGE GROUP, LTD.   
Subprime List (2005)|733-0668958|7|33-0668958|1|THE LENDING CONNECTION, INC   
Subprime List (2005)|733-0806023|7|33-0806023|1|FLEXPOINT FUNDING CORPORATION 
Subprime List (2005)|733-0967630|7|33-0967630|1|EVERGREEN LENDING, INC.       
Subprime List (2005)|741-1810165|7|41-1810165|1|LENDSOURCE INC                
Subprime List (2005)|756-2270727|7|56-2270727|1|AMERITRUST MORTGAGE COMPANY LL
Subprime List (2005)|758-2509828|7|58-2509828|1|CHOICE CAPITAL FUNDING        
Subprime List (2005)|762-1717999|7|62-1717999|1|THE CIT GROUP/CONSUMER FINANCE
Subprime List (2005)|76480209999|7|6480209999|1|MASTER FINANCIAL, INC.        
Subprime List (2005)|77042100008|7|7042100008|1|DOLLAR MORTGAGE CORPORATION   
Subprime List (2005)|77062300004|7|7062300004|1|BUDGET FINANCE COMPANY        
Subprime List (2005)|77069000008|7|7069000008|1|DELTA FUNDING CORPORATION     
Subprime List (2005)|77083400004|7|7083400004|1|ALLIANCE MORTGAGE BANKING CORP
Subprime List (2005)|77086400004|7|7086400004|1|AMERICAN BENEFIT MORTGAGE, INC
Subprime List (2005)|77152500000|7|7152500000|1|PLATINUM CAPITAL GROUP        
Subprime List (2005)|77177900003|7|7177900003|1|RIGHT AWAY MORTGAGE, INC      
Subprime List (2005)|77185300006|7|7185300006|1|ACCREDITED HOME LENDERS, INC  
Subprime List (2005)|772-0506617|7|72-0506617|1|UNITED-BILT HOMES, INC.       
Subprime List (2005)|77323800008|7|7323800008|1|EXPRESS CAPITAL LENDING       
Subprime List (2005)|77343000001|7|7343000001|1|IMPAC FUNDING CORP            
Subprime List (2005)|77373400006|7|7373400006|1|LIME FINANCIAL SERVICES, LTD. 
Subprime List (2005)|77431100008|7|7431100008|1|OWNIT MORTGAGE SOLUTIONS, INC 
Subprime List (2005)|77439600003|7|7439600003|1|CASA BLANCA MORTGAGE, INC     
Subprime List (2005)|77479800008|7|7479800008|1|CHAPEL MORTGAGE               
Subprime List (2005)|775-1794257|7|75-1794257|1|OAK STREET MORTGAGE/GW        
Subprime List (2005)|775-2921540|7|75-2921540|1|CENTEX HOME EQUITY COMPANY LLC
Subprime List (2005)|775-2958981|7|75-2958981|1|KELLNER MORTGAGE INVESTMENTS  
Subprime List (2005)|77542800002|7|7542800002|1|MLSG, INC.                    
Subprime List (2005)|77604800006|7|7604800006|1|OPTION ONE MORTGAGE CORP      
Subprime List (2005)|77619100004|7|7619100004|1|MONEY CORP (FN)               
Subprime List (2005)|77624900003|7|7624900003|1|AMERICAN PIONEER FINANCIAL SVC
Subprime List (2005)|77642300001|7|7642300001|1|LIBERTY AMERICAN MORTGAGE CORP
Subprime List (2005)|77652800004|7|7652800004|1|NATION ONE MORTGAGE CO., INC. 
Subprime List (2005)|77673400003|7|7673400003|1|INVESTAID CORPORATION         
Subprime List (2005)|777-0463885|7|77-0463885|1|ALTERNATIVE FINANCING CORP    
Subprime List (2005)|77718200008|7|7718200008|1|AMERICAN HOME LOANS           
Subprime List (2005)|77756300009|7|7756300009|1|AMERICAN EQUITY MORTGAGE, INC.
Subprime List (2005)|77756600001|7|7756600001|1|AMERIQUEST MORTGAGE COMPANY   
Subprime List (2005)|77770700000|7|7770700000|1|HARBORSIDE FINANCIAL NETWORK  
Subprime List (2005)|77775100007|7|7775100007|1|MILA, INC.                    
Subprime List (2005)|77786700007|7|7786700007|1|COLUMBIA MORTGAGE & FUNDING CO
Subprime List (2005)|77854200009|7|7854200009|1|BUDGET MORTGAGE BANKERS       
Subprime List (2005)|77875200001|7|7875200001|1|FIRST GREENSBORO HOME EQUITY  
Subprime List (2005)|77885300000|7|7885300000|1|STERLING MORTGAGE & INVESTMENT
Subprime List (2005)|77892800004|7|7892800004|1|FIELDSTONE MORTGAGE COMPANY   
Subprime List (2005)|77900200006|7|7900200006|1|NEW CENTURY MORTGAGE CORPORATI
Subprime List (2005)|77935900009|7|7935900009|1|LOAN CENTER OF CALIFORNIA, INC
Subprime List (2005)|77943800003|7|7943800003|1|SAXON MORTGAGE                
Subprime List (2005)|795-2622032|7|95-2622032|1|AAMES FUNDING CORPORATION     
Subprime List (2005)|795-4855230|7|95-4855230|1|EMPIRE MORTGAGE CORPORATION   
Subprime List (2005)|154-1927192|1|54-1927192|1|SUMMIT MORTGAGE               
Subprime List (2005)|40000017338|4|0000017338|1|UNION FEDERAL SAVINGS BANK    
Subprime List (2005)|72120900003|7|2120900003|1|ADVENT MORTGAGE, LLC          
Subprime List (2005)|30000000178|3|0000000178|1|TALBOT STATE BANK             
;run;

