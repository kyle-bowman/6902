# -*- coding: utf-8 -*-
"""
Created on Wed Jan 30 08:23:33 2019

@author: Owner
"""

from selenium import webdriver
from selenium.webdriver.support.select import Select
import pandas as pd
from time import sleep
import numpy as np
from selenium.common.exceptions import StaleElementReferenceException

path=r'E:\6901\secondary_market_risk\external_files'

driver=webdriver.Chrome(executable_path='F:\Python36\PyCharm Community Edition 2017.1.3\chromedriver\chromedriver_win32\chromedriver.exe')

driver.get('https://www.ffiec.gov/hmdaadwebreport/DisHomeOffice.aspx?ParmCatalog=Hmda')

year_list=['2016', '2015', '2014', '2013', '2012', '2011', '2010', '2009', '2008', '2007','2006','2005','2004','2003','2002','2001','2000','1999']
states_list=['01 - ALABAMA (AL)', '02 - ALASKA (AK)', '04 - ARIZONA (AZ)', '05 - ARKANSAS (AR)', 
             '06 - CALIFORNIA (CA)', '08 - COLORADO (CO)', '09 - CONNECTICUT (CT)', 
             '10 - DELAWARE (DE)', '11 - DISTRICT OF COLUMBIA (DC)', 
             '12 - FLORIDA (FL)', '13 - GEORGIA (GA)', 
             '15 - HAWAII (HI)', 
             '16 - IDAHO (ID)', '17 - ILLINOIS (IL)', '18 - INDIANA (IN)', '19 - IOWA (IA)', 
             '20 - KANSAS (KS)', '21 - KENTUCKY (KY)', 
             '22 - LOUISIANA (LA)', '23 - MAINE (ME)', 
             '24 - MARYLAND (MD)', '25 - MASSACHUSETTS (MA)', '26 - MICHIGAN (MI)', '27 - MINNESOTA (MN)', '28 - MISSISSIPPI (MS)', '29 - MISSOURI (MO)', '30 - MONTANA (MT)', 
             '31 - NEBRASKA (NE)', '32 - NEVADA (NV)', '33 - NEW HAMPSHIRE (NH)', '34 - NEW JERSEY (NJ)', '35 - NEW MEXICO (NM)', '36 - NEW YORK (NY)', '37 - NORTH CAROLINA (NC)', '38 - NORTH DAKOTA (ND)', 
             '39 - OHIO (OH)', '40 - OKLAHOMA (OK)', '41 - OREGON (OR)', 
             '42 - PENNSYLVANIA (PA)', 
             '44 - RHODE ISLAND (RI)', 
             '45 - SOUTH CAROLINA (SC)', '46 - SOUTH DAKOTA (SD)', 
             '47 - TENNESSEE (TN)', '48 - TEXAS (TX)', 
             '49 - UTAH (UT)', 
             '50 - VERMONT (VT)', '51 - VIRGINIA (VA)', 
             '53 - WASHINGTON (WA)', '54 - WEST VIRGINIA (WV)', '55 - WISCONSIN (WI)', '56 - WYOMING (WY)', 
             #'72 - PUERTO RICO (PR)'
             ]

year=year_list
states=states_list

institution_list=pd.DataFrame(columns=['asofdate','state','string'])
for y in range(len(year)):
    try:
        sleep(np.random.uniform(30,60))
        sel_year=Select(driver.find_element_by_xpath('//*[@id="uclYearCityState_ddlAsYear"]'))
    except:
        pass
    
    sleep(1)
    try:
        sel_year.select_by_visible_text(year[y])
    except StaleElementReferenceException:
        print('Standard, cannot find the element, check screen.')
        print('trying again...')
        try:
            sel_year.select_by_visible_text(year[y])
        except:
            print('failed...',str(year[y]),'|',states[s])
            pass
        
    sleep(1)
    
    for s in range(len(states)):
        try:
            sleep(np.random.uniform(4,6))
            resp_id=Select(driver.find_element_by_xpath('//*[@id="uclYearCityState_ddlState"]')).select_by_visible_text(states[s])
        except:
            pass
        
        print(str(year[y])+'|'+states[s])
        
        sleep(np.random.uniform(4,6))
        driver.find_element_by_xpath('//*[@id="BtRetrieve"]').click()
        
        sleep(np.random.uniform(4,6))
        tbody=driver.find_element_by_xpath('/html/body/form/table[1]/tbody/tr[2]/td[2]/table[2]/tbody/tr/td[2]/table/tbody/tr[5]/td[2]')
        sleep(np.random.uniform(4,6))
        trow=tbody.find_elements_by_tag_name('option')
                
        temp_df=pd.DataFrame(columns=['string'])

        for t in range(len(trow)):
            temp_df=pd.concat([temp_df,
                               pd.DataFrame([trow[t].get_attribute('textContent')],columns=['string'])],axis=0,ignore_index=True)          
    
        temp_df['asofdate']=year[y]
        temp_df['state']=states[s]
        
        institution_list=pd.concat([institution_list,temp_df],ignore_index=True,axis=0,sort=False)        
        
        ### now, select back button to start over...
        sleep(np.random.uniform(4,6))
        driver.back()
                
driver.quit()      

np.savetxt(path+'\instituion_list.txt',institution_list.values,delimiter='|')
institution_list.to_csv(path+'\instituion_list.txt',index=False)






