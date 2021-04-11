# -*- coding: utf-8 -*-
"""
Created on Sat Apr 20 06:23:13 2019

@author: Owner
"""

### Fips list is nothing more than the state fips and county fips, i.e. Alabama Autaga County, '01'+'001'
from fips_list import *
import requests
import pandas as pd
from time import sleep
import datetime
import re
import numpy as np

### Fred API key
fred_api={0:'cdbdeab8ec4109a87ccd5b8499f450ce',1:'9a58b35cd6e024c35baf93648c8cf48e'}
### location to save csv files.
out_location=r'F:\6901\data_files\\';

##############################################
##############################################
#---------------------------------------------
# State Abreviation Dictionary, with State FIP...
#---------------------------------------------
##############################################
##############################################

state_abrev={
'AK':'02','AL':'01','AR':'05','AZ':'04',
'CA':'06','CO':'08','CT':'09',
'DC':'11','DE':'10',
'FL':'12','FM':'64',
'GA':'13','GU':'66',
'HI':'15',
'IA':'19','ID':'16','IL':'17','IN':'18',
'KS':'20','KY':'21',
'LA':'22',
'MA':'25','MD':'24','ME':'23','MH':'68','MI':'26','MN':'27','MO':'29','MP':'69','MS':'28','MT':'30',
'NC':'37','ND':'38','NE':'31','NH':'33','NJ':'34','NM':'35','NV':'32','NY':'36',
'OH':'39','OK':'40','OR':'41',
'PA':'42','PR':'72','PW':'70',
'RI':'44',
'SC':'45','SD':'46',
'TN':'47','TX':'48',
'UT':'49',
'VA':'51','VI':'78','VT':'50',
'WA':'53','WI':'55','WV':'54','WY':'56'
}

##############################################
##############################################
#---------------------------------------------
# National information
#---------------------------------------------
##############################################
##############################################

national_dict={
        'CPIHOSSL':'Consumer Price Index for All Urban Consumers:Housing',
        'CUUR0000SEHA':'Consumer Price Index for All Urban Consumers: Rent of primary residence',
        'CPIAUCSL':'Consumer Price Index for All Urban Consumers: All Items',
        'A792RC0A052NBEA':'United States: Personal Income Per Capita',
        'USSTHPI':'All-Transactions House Price Index for the United States',
        'USRVAC':'Rental Vacancy Rate for the United States',
        'USHOWN':'Homeownership Rate for the United States',
        'PEAAUS00000A647NCEN':'Estimate of People of All Ages in Poverty in the United States',
        'PUAAUS00000A647NCEN':'Poverty Universe, All Ages for United States',
        'UNRATENSA':'Civilian Unemployment Rate for United States',
        'MEHOINUSA646N':'Median Household Income in the United States'
};

##############################################
##############################################
#---------------------------------------------
# State Level information
#---------------------------------------------
##############################################
##############################################

state_dict={
'Total Personal Income for State':['OTOT'],# AL+'OTOT'
'Per Capita Personal Income for State':['PCPI'],# 'AL'+PCPI
'HPI Index for State':['STHPI'], # 'AL'+STHPI
'Snap Benefits for State':['BR','A647NCEN'], # BR+'01'+'000'+'AL'+A647NCEN
'Rental Vacancy Rate for State':['RVAC'], # 'AL'+RVAC
'Home Ownership Rates for State':['HOWN'], # 'AL'+HOWN
'Poverty All Ages for State':['PEAA','000A647NCEN'], # PEAA+'AL'+'01'+000A647NCEN
'Total People Used for Poverty Universe All Ages for State':['PUAA','000A647NCEN'], # PUAA+'AL'+'01'+000A647NCEN
'Unemployment for State':['URN'], # 'AL'+URN
'Median Household Income for State':['MHI','000A052NCEN'], # MHI+'AL'+'01'+000A052NCEN
'Poverty Age 0-17 for State':['PUA0T17','000A647NCEN'], # PUA0T17+'AL'+'01'+000A647NCEN
'Poverty Age 5-17 for State':['PE5T17','000A647NCEN'] # PE5T17+'01'+'AL'+000A647NCEN
};

##############################################
##############################################
#---------------------------------------------
# County Level information
#---------------------------------------------
##############################################
##############################################

county_dict={
'Personal Income for County':['PI'],# <-- PI+'01001'
'Per Capita Personal Income for County':['PCPI'],# PCPI+'01001'
'Equifax Subprime Credit for County':['EQFXSUBPRIME0'], # EQFXSUBPRIME0+'01001'
'HPI Index for County':['ATNHPIUS','A'], # ATNHPIUS+'01001'+A
'Snap Benefits for County':['CBR','A647NCEN'], # CBR+'01001'+'AL'+A647NCEN
'Povery All Ages for County':['PEAA','A647NCEN'], # PEAA+'AL'+'01001'+A647NCEN
'Total People Used for Poverty Universe All Ages for County':['PUAA','A647NCEN'], # PUAA+'AL'+'01001'+A647NCEN
'Unemployment for County':['LAUCN','0000000003A'], # LAUCN+'01001'+0000000003A
'Median Household Income for County':['MHI','A052NCEN'], # MHI+'AL'+'01001'+A052NCEN
'Poverty Age 0-17 for County':['PUA0T17','A647NCEN'], # PUA0T17+'AL'+'01001'+A647NCEN
'Poverty Age 5-17 Related for County':['PUA5T17R','A647NCEN'], # PUA5T17R+'AL'+'01001'+A647NCEN
};

##############################################
##############################################
#---------------------------------------------
# Function to extract FRED series...
#---------------------------------------------
##############################################
##############################################

def SeriesData(mnemonic,stime=4):
    global bad_response;
    series_url='https://api.stlouisfed.org/fred/series/observations?series_id='+str(mnemonic)+'&api_key='+str(fred_api[np.random.randint(2)])+'&file_type=json'
    r=requests.get(series_url)
    data=r.json()
    s_values=pd.DataFrame(columns=['id','date','value','status_code'])
    ### Sleep, might need to be adjusted
    sleep(stime)
    
    if r.status_code==200:
        for v in data['observations']:
            temp_dict={}
            temp_dict['id']=mnemonic
            temp_dict['date']=datetime.datetime.strptime(v['date'],'%Y-%m-%d').date()
            if v['value']=='.':
                temp_dict['value']=None
            else:
                temp_dict['value']=float(v['value'])
            temp_dict['status_code']=r.status_code
            
            s_values=pd.concat([s_values,pd.DataFrame.from_dict(temp_dict,orient='index').T],axis=0,ignore_index=True)
            bad_response=0;

    else:
    
        temp_dict={}
        temp_dict['id']=mnemonic
        temp_dict['date']=None
        temp_dict['value']=None
        temp_dict['status_code']=r.status_code
        
        s_values=pd.concat([s_values,pd.DataFrame.from_dict(temp_dict,orient='index').T],axis=0,ignore_index=True)
        
        bad_response+=1
        
        if bad_response > 5: 
            print('##########################################\n','Sleeping Now\n','##########################################\n')    
            #sleep(60*40);
            bad_response=0;
   
    return s_values
    del series_url,data,s_values,temp_dict,v,r;
    
def bad_status_code_list(df):
    '''
    Input a dataframe post the initial extraction.
    '''
    return df[df['status_code'] != 200].groupby(['id']).count().index.tolist()

##############################################
##############################################
#---------------------------------------------
# Setup Generators.
#---------------------------------------------
##############################################
##############################################

def mnemonic_generator(input_dict):
    """
    Four Inputs
    Inputs:
        input_dict: This is the dictionary we want to extract from, really County and State
        S: is a list to associate to the State Abreviation, Example: 'AL'
        SF: is a list to associate the State Abreviation then the State FIP, Example: 'AL01'
        SC: is a list to associate the State FIP then the County FIP, Example: '01001'
    """
    return_list=[]
        
    for k,v in input_dict.items():
        
        ###################################################
        #--------------------------------------------------
        # State Mnemonics
        #--------------------------------------------------
        ###################################################        
        
        if k=='Total Personal Income for State':
            # AL+'OTOT'
            # key=AL, v[0]=OTOT
            temp_list=[key+v[0] for key in list(state_abrev.keys())]
        elif k=='Per Capita Personal Income for State':
            # 'AL'+PCPI
            # key=AL, v[0]=PCPI
            temp_list=[key+v[0] for key in list(state_abrev.keys())]
        elif k=='HPI Index for State':
            # 'AL'+STHPI
            # key=AL, v[0]=STHPI
            temp_list=[key+v[0] for key in list(state_abrev.keys())]
        elif k=='Snap Benefits for State':
            # BR+'01'+'000'+'AL'+A647NCEN
            #v[0]=BR, val=01, key=AL, v[1]=A647NCEN
            temp_list=[v[0]+val+'000'+key+v[1] for key,val in state_abrev.items()]
        elif k=='Rental Vacancy Rate for State':
            # 'AL'+RVAC
            # key=AL, v[0]=RVAC
            temp_list=[key+v[0] for key in list(state_abrev.keys())]
        elif k=='Home Ownership Rates for State':
            # 'AL'+HOWN
            # key=AL, v[0]=HOWN         
            temp_list=[key+v[0] for key in list(state_abrev.keys())]
        elif k=='Poverty All Ages for State':
            # PEAA+'AL'+'01'+000A647NCEN
            # v[0]=PEAA, key=AL, val=01, v[1]=000A647NCEN
            temp_list=[v[0]+key+val+v[1] for key,val in state_abrev.items()]
        elif k=='Total People Used for Poverty Universe All Ages for State':
            # PEAA+'AL'+'01'+000A647NCEN
            # v[0]=PEAA, key=AL, val=01, v[1]=000A647NCEN
            temp_list=[v[0]+key+val+v[1] for key,val in state_abrev.items()]
        elif k=='Unemployment for State':
            # 'AL'+URN
            # key=AL, v[0]=URN        
            temp_list=[key+v[0] for key in list(state_abrev.keys())]
        elif k=='Median Household Income for State':
            # MHI+'AL'+'01'+000A647NCEN
            # v[0]=PEAA, key=AL, val=01, v[1]=000A052NCEN
            temp_list=[v[0]+key+val+v[1] for key,val in state_abrev.items()]
        elif k=='Poverty Age 0-17 for State':
            # PUA0T17+'AL'+'01'+000A647NCEN 
            # v[0]=PUA0T17, key=AL, val=01, v[1]=000A647NCEN
            temp_list=[v[0]+key+val+v[1] for key,val in state_abrev.items()]
        elif k=='Poverty Age 5-17 for State':
            # PE5T17+'AL'+'01'+000A647NCEN 
            # v[0]=PE5T17, key=AL, val=01, v[1]=000A647NCEN
            temp_list=[v[0]+key+val+v[1] for key,val in state_abrev.items()]          
        ###################################################
        #--------------------------------------------------
        # County Mnemonics
        #--------------------------------------------------
        ###################################################        
        elif k=='Personal Income for County':
            # PI+'01001'
            # v[0]=PI, l=01001
            temp_list=[v[0]+l for l in fips_list]
        elif k=='Per Capita Personal Income for County':
            # PCPI+'01001'
            # v[0]=PCPI, l=01001
            temp_list=[v[0]+l for l in fips_list]   
        elif k=='Equifax Subprime Credit for County':
            # EQFXSUBPRIME0+'01001'
            # v[0]=EQFXSUBPRIME0, l=01001
            temp_list=[v[0]+l for l in fips_list]
        elif k=='HPI Index for County':
            # ATNHPIUS+'01001'+A
            # v[0]=ATNHPIUS, l=01001
            temp_list=[v[0]+l+'A' for l in fips_list] 
        elif k=='Snap Benefits for County':
            # CBR+'01001'+'AL'+A647NCEN
            # v[0]=CBR, l=01001, junk=AL, v[1]=A647NCEN
            temp_list=[v[0]+l+list(state_abrev.keys())[list(state_abrev.values()).index(l[0:2])]+v[1] for l in fips_list]
        elif k=='Total People Used for Poverty Universe All Ages for County':
            # PUAA+'AL'+'01001'+A647NCEN
            # v[0]=PUAA, l=01001, junk=AL, v[1]=A647NCEN
            temp_list=[v[0]+list(state_abrev.keys())[list(state_abrev.values()).index(l[0:2])]+l+v[1] for l in fips_list]
        elif k=='Unemployment for County':
            # LAUCN+'01001'+0000000003A
            # v[0]=LAUCN, l=01001, v[1]=0000000003A
            temp_list=[v[0]+l+v[1] for l in fips_list]
        elif k=='Povery All Ages for County':
            # PEAA+'AL'+'01001'+A647NCEN
            # v[0]=PEAA, l=01001, junk=AL, v[1]=A647NCEN
            temp_list=[v[0]+list(state_abrev.keys())[list(state_abrev.values()).index(l[0:2])]+l+v[1] for l in fips_list]
        elif k=='Median Household Income for County':
            # MHI+'AL'+'01001'+A052NCEN
            # v[0]=MHIA, junk=AL l=01001, v[1]=A052NCEN
            temp_list=[v[0]+list(state_abrev.keys())[list(state_abrev.values()).index(l[0:2])]+l+v[1] for l in fips_list]
        elif k=='Poverty Age 0-17 for County':
            # PUA0T17+'AL'+'01001'+A647NCEN
            # v[0]=PUA0T17, l=01001, junk=AL, v[1]=A647NCEN
            temp_list=[v[0]+list(state_abrev.keys())[list(state_abrev.values()).index(l[0:2])]+l+v[1] for l in fips_list]
        elif k=='Poverty Age 5-17 Related for County':
            # PUA5T17R+'AL'+'01001'+A647NCEN
            # v[0]=PUA5T17R, l=01001, junk=AL, v[1]=A647NCEN
            temp_list=[v[0]+list(state_abrev.keys())[list(state_abrev.values()).index(l[0:2])]+l+v[1] for l in fips_list]                    
        else:
            pass
        
        return_list=return_list+temp_list
        
    return return_list

k='Povery All Ages for County'
v=county_dict['Povery All Ages for County']
temp_list=[v[0]+list(state_abrev.keys())[list(state_abrev.values()).index(l[0:2])]+l+v[1] for l in fips_list]
del k,v,temp_list;

##############################################
##############################################
#---------------------------------------------
# Extraction.
#---------------------------------------------
##############################################
##############################################

### Define State and County Mnemonics
state_mnemonics=mnemonic_generator(state_dict)
county_mnemonics=mnemonic_generator(county_dict)

### Initialize Dataframes
state_values=pd.DataFrame(columns=['id','date','value','status_code'])
county_values=pd.DataFrame(columns=['id','date','value','status_code'])

### Extract State Level FRED data
len_state=len(state_mnemonics);
for i,s in enumerate(state_mnemonics):
    print('% Complete: ','{0:.4f}%'.format(i/len_state*100),' ID: ',str(i),' Total: ',len_state,' Time: ',datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'))    
    state_values=pd.concat([state_values,SeriesData(s)],axis=0,ignore_index=True)

### Save as CSV
state_values.to_csv(out_location+'fred_state.csv',index=False)

### Extract County Level FRED data

### Personal Income
pi_county_values=pd.DataFrame(columns=['id','date','value','status_code'])
#pi=[i for i in county_mnemonics if len(re.findall('^PI\d{5}',i))==1]
pi=bad_status_code_list(pi_county_values)
len_pi=len(pi);
for i,c in enumerate(pi):
    print('% Complete: ','{0:.4f}%'.format(i/len_pi*100),' ID: ',str(i),' Total: ',len_pi,' Time: ',datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
    pi_county_values=pd.concat([pi_county_values,SeriesData(c,stime=15)],axis=0,ignore_index=True)
pi_county_values.to_csv(out_location+'pi_county_values.csv',index=False)

### Per capita Personal Income
pcpi_county_values=pd.DataFrame(columns=['id','date','value','status_code'])
#pcpi=[i for i in county_mnemonics if len(re.findall('^PCPI\d{5}',i))==1]
pcpi=bad_status_code_list(pcpi_county_values)   
len_pcpi=len(pcpi);
for i,c in enumerate(pcpi):
    print('% Complete: ','{0:.4f}%'.format(i/len_pcpi*100),' ID: ',str(i),' Total: ',len_pcpi,' Time: ',datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
    pcpi_county_values=pd.concat([pcpi_county_values,SeriesData(c,stime=15)],axis=0,ignore_index=True)
pcpi_county_values.to_csv(out_location+'pcpi_county_values.csv',index=False)

### Equifax
equifax_county_values=pd.DataFrame(columns=['id','date','value','status_code'])
#equifax=[i for i in county_mnemonics if len(re.findall('^EQFXSUBPRIME0',i))==1]
equifax=bad_status_code_list(equifax_county_values)   
len_equifax=len(equifax);
for i,c in enumerate(equifax):
    print('% Complete: ','{0:.4f}%'.format(i/len_equifax*100),' ID: ',str(i),' Total: ',len_equifax,' Time: ',datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
    equifax_county_values=pd.concat([equifax_county_values,SeriesData(c,stime=15)],axis=0,ignore_index=True)
equifax_county_values.to_csv(out_location+'equifax_county_values.csv',index=False)

### HPI
hpi_county_values=pd.DataFrame(columns=['id','date','value','status_code'])
hpi=[i for i in county_mnemonics if len(re.findall('^ATNHPIUS',i))==1]
hpi=bad_status_code_list(hpi_county_values)   
len_hpi=len(hpi);
for i,c in enumerate(hpi):
    print('% Complete: ','{0:.4f}%'.format(i/len_hpi*100),' ID: ',str(i),' Total: ',len_hpi,' Time: ',datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
    hpi_county_values=pd.concat([hpi_county_values,SeriesData(c,stime=15)],axis=0,ignore_index=True)
hpi_county_values.to_csv(out_location+'hpi_county_values.csv',index=False)

#Snap Benefits
snap_county_values=pd.DataFrame(columns=['id','date','value','status_code'])
snap=[i for i in county_mnemonics if len(re.findall('^CBR\d{5}',i))==1]
snap=bad_status_code_list(snap_county_values)   
len_snap=len(snap);
for i,c in enumerate(snap):
    print('% Complete: ','{0:.4f}%'.format(i/len_snap*100),' ID: ',str(i),' Total: ',len_snap,' Time: ',datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
    snap_county_values=pd.concat([snap_county_values,SeriesData(c,stime=15)],axis=0,ignore_index=True)
snap_county_values.to_csv(out_location+'snap_county_values.csv',index=False)

#Poverty all ages
peaa_county_values=pd.DataFrame(columns=['id','date','value','status_code'])
peaa=[i for i in county_mnemonics if len(re.findall('^PEAA',i))==1]
#peaa=bad_status_code_list(peaa_county_values)   
len_peaa=len(peaa);
for i,c in enumerate(peaa):
    print('% Complete: ','{0:.4f}%'.format(i/len_peaa*100),' ID: ',str(i),' Total: ',len_peaa,' Time: ',datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
    peaa_county_values=pd.concat([peaa_county_values,SeriesData(c,stime=15)],axis=0,ignore_index=True)
peaa_county_values.to_csv(out_location+'peaa_county_values.csv',index=False)

# Total People Used for Poverty
puaa_county_values=pd.DataFrame(columns=['id','date','value','status_code'])
puaa=[i for i in county_mnemonics if len(re.findall('^PUAA',i))==1]
#peaa=bad_status_code_list(peaa_county_values)   
len_puaa=len(puaa);
for i,c in enumerate(puaa):
    print('% Complete: ','{0:.4f}%'.format(i/len_puaa*100),' ID: ',str(i),' Total: ',len_puaa,' Time: ',datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
    puaa_county_values=pd.concat([puaa_county_values,SeriesData(c,stime=15)],axis=0,ignore_index=True)
puaa_county_values.to_csv(out_location+'puaa_county_values.csv',index=False)

#Unemployment
ruc_county_values=pd.DataFrame(columns=['id','date','value','status_code'])
ruc=[i for i in county_mnemonics if len(re.findall('^LAUCN',i))==1]
#ruc=bad_status_code_list(ruc_county_values)   
len_ruc=len(ruc);
for i,c in enumerate(ruc):
    print('% Complete: ','{0:.4f}%'.format(i/len_ruc*100),' ID: ',str(i),' Total: ',len_ruc,' Time: ',datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
    ruc_county_values=pd.concat([ruc_county_values,SeriesData(c,stime=15)],axis=0,ignore_index=True)
ruc_county_values.to_csv(out_location+'ruc_county_values.csv',index=False)

# Median Household Income for County
mhi_county_values=pd.DataFrame(columns=['id','date','value','status_code'])
mhi=[i for i in county_mnemonics if len(re.findall('^MHI',i))==1]
#peaa=bad_status_code_list(peaa_county_values)   
len_mhi=len(mhi);
for i,c in enumerate(mhi):
    print('% Complete: ','{0:.4f}%'.format(i/len_mhi*100),' ID: ',str(i),' Total: ',len_mhi,' Time: ',datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
    mhi_county_values=pd.concat([mhi_county_values,SeriesData(c,stime=15)],axis=0,ignore_index=True)
mhi_county_values.to_csv(out_location+'mhi_county_values.csv',index=False)

# Poverty Age 0-17 for County
pua0t17_county_values=pd.DataFrame(columns=['id','date','value','status_code'])
pua0t17=[i for i in county_mnemonics if len(re.findall('^PUA0T17',i))==1]
#peaa=bad_status_code_list(peaa_county_values)   
len_pua0t17=len(pua0t17);
for i,c in enumerate(pua0t17):
    print('% Complete: ','{0:.4f}%'.format(i/len_pua0t17*100),' ID: ',str(i),' Total: ',len_pua0t17,' Time: ',datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
    pua0t17_county_values=pd.concat([pua0t17_county_values,SeriesData(c,stime=15)],axis=0,ignore_index=True)
pua0t17_county_values.to_csv(out_location+'pua0t17_county_values.csv',index=False)

# Poverty Age 5-17 for County
pua5t17_county_values=pd.DataFrame(columns=['id','date','value','status_code'])
pua5t17=[i for i in county_mnemonics if len(re.findall('^PUA5T17',i))==1]
#peaa=bad_status_code_list(peaa_county_values)   
len_pua5t17=len(pua5t17);
for i,c in enumerate(pua5t17):
    print('% Complete: ','{0:.4f}%'.format(i/len_pua5t17*100),' ID: ',str(i),' Total: ',len_pua5t17,' Time: ',datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
    pua5t17_county_values=pd.concat([pua5t17_county_values,SeriesData(c,stime=15)],axis=0,ignore_index=True)
pua5t17_county_values.to_csv(out_location+'pua5t17_county_values.csv',index=False)

### National...

national_values=pd.DataFrame(columns=['id','date','value','status_code'])
for k,v in national_dict.items():
    national_values=pd.concat([national_values,SeriesData(k,stime=5)],axis=0,ignore_index=True)
national_values.to_csv(out_location+'national_values.csv',index=False)    
