@ECHO OFF

:: ***** Delete Allure-results folder *****
cd Src\Regression
del /q /f /s "allure-results\*.*"

:: ***** Architects, Engineers & Consultants *****

:: Kill existing msedgedriver processes
tasklist | findstr /I msedgedriver.exe && taskkill /IM msedgedriver.exe /F
tasklist | findstr /I msedge.exe && taskkill /IM msedge.exe /F
:: Navigate to AE and run AE_Execution
cd AE
set "target_folder_allure=allure-results"
del /q /f /s "%target_folder_allure%\*.*"
Python AE_Execution.py
tasklist | findstr /I msedgedriver.exe && taskkill /IM msedgedriver.exe /F
tasklist | findstr /I msedge.exe && taskkill /IM msedge.exe /F
:: Set your target folder path here
set "target_folder=output/allure"
del /q /f /s "%target_folder%\*.*"

py -m pabot.pabot --processes 1 --listener allure_robotframework --rerunfailed output.xml --output rerun.xml *.robot

xcopy /s /q "output\allure" ".\allure-results"


:: ***** Builders Risk *****

:: Kill msedgedriver again and clear cache
tasklist | findstr /I msedgedriver.exe && taskkill /IM msedgedriver.exe /F
tasklist | findstr /I msedge.exe && taskkill /IM msedge.exe /F

rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache"

:: Go to BR folder and run BR_Execution
cd ..\BR
set "target_folder_allure=allure-results"
del /q /f /s "%target_folder_allure%\*.*"
Python BR_Execution.py
tasklist | findstr /I msedgedriver.exe && taskkill /IM msedgedriver.exe /F
tasklist | findstr /I msed.ge.exe && taskkill /IM msedge.exe /F
rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache"
:: Set your target folder path here
set "target_folder=output/allure"
del /q /f /s "%target_folder%\*.*"
py -m pabot.pabot --processes 6 --listener allure_robotframework --rerunfailed output.xml --output rerun.xml *.robot
xcopy /s /q "output\allure" ".\allure-results"


:: ***** Contractors Equipment *****

:: Kill msedgedriver again and clear cache
tasklist | findstr /I msedgedriver.exe && taskkill /IM msedgedriver.exe /F
tasklist | findstr /I msedge.exe && taskkill /IM msedge.exe /F

rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache"

:: Go to CE folder and run CE_Execution
cd ..\CE
set "target_folder_allure=allure-results"
del /q /f /s "%target_folder_allure%\*.*"
Python CE_Execution.py
tasklist | findstr /I msedgedriver.exe && taskkill /IM msedgedriver.exe /F
tasklist | findstr /I msed.ge.exe && taskkill /IM msedge.exe /F
rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache"
:: Set your target folder path here
set "target_folder=output/allure"
del /q /f /s "%target_folder%\*.*"
py -m pabot.pabot --processes 6 --listener allure_robotframework --rerunfailed output.xml --output rerun.xml *.robot
xcopy /s /q "output\allure" ".\allure-results"


:: ***** Cyber *****

:: Kill msedgedriver again and clear cache
tasklist | findstr /I msedgedriver.exe && taskkill /IM msedgedriver.exe /F
tasklist | findstr /I msedge.exe && taskkill /IM msedge.exe /F

rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache"

:: Go to Cyber folder and run Cyber_Execution
cd ..\Cyber
set "target_folder_allure=allure-results"
del /q /f /s "%target_folder_allure%\*.*"
Python Cyber_Execution.py
tasklist | findstr /I msedgedriver.exe && taskkill /IM msedgedriver.exe /F
tasklist | findstr /I msed.ge.exe && taskkill /IM msedge.exe /F
rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache"
:: Set your target folder path here
set "target_folder=output/allure"
del /q /f /s "%target_folder%\*.*"
py -m pabot.pabot --processes 6 --listener allure_robotframework --rerunfailed output.xml --output rerun.xml *.robot
xcopy /s /q "output\allure" ".\allure-results"


:: ***** Individual Appraisers *****

:: Kill msedgedriver again and clear cache
tasklist | findstr /I msedgedriver.exe && taskkill /IM msedgedriver.exe /F
tasklist | findstr /I msedge.exe && taskkill /IM msedge.exe /F

rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache"

:: Go to IA folder and run IA_Execution
cd ..\IA
set "target_folder_allure=allure-results"
del /q /f /s "%target_folder_allure%\*.*"
Python IA_Execution.py
tasklist | findstr /I msedgedriver.exe && taskkill /IM msedgedriver.exe /F
tasklist | findstr /I msed.ge.exe && taskkill /IM msedge.exe /F
rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache"
:: Set your target folder path here
set "target_folder=output/allure"
del /q /f /s "%target_folder%\*.*"
py -m pabot.pabot --processes 6 --listener allure_robotframework --rerunfailed output.xml --output rerun.xml *.robot
xcopy /s /q "output\allure" ".\allure-results"


:: ***** KNR *****

:: Kill msedgedriver again and clear cache
tasklist | findstr /I msedgedriver.exe && taskkill /IM msedgedriver.exe /F
tasklist | findstr /I msedge.exe && taskkill /IM msedge.exe /F

rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache"

:: Go to KNR folder and run KNR_Execution
cd ..\KNR
set "target_folder_allure=allure-results"
del /q /f /s "%target_folder_allure%\*.*"
Python KNR_Execution.py
tasklist | findstr /I msedgedriver.exe && taskkill /IM msedgedriver.exe /F
tasklist | findstr /I msed.ge.exe && taskkill /IM msedge.exe /F
rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache"
:: Set your target folder path here
set "target_folder=output/allure"
del /q /f /s "%target_folder%\*.*"
py -m pabot.pabot --processes 6 --listener allure_robotframework --rerunfailed output.xml --output rerun.xml *.robot
xcopy /s /q "output\allure" ".\allure-results"


:: ***** Raven *****

:: Kill msedgedriver again and clear cache
tasklist | findstr /I msedgedriver.exe && taskkill /IM msedgedriver.exe /F
tasklist | findstr /I msedge.exe && taskkill /IM msedge.exe /F

rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache"

:: Go to Raven folder and run Raven_Execution
cd ..\Raven
set "target_folder_allure=allure-results"
del /q /f /s "%target_folder_allure%\*.*"
Python Raven_Execution.py
tasklist | findstr /I msedgedriver.exe && taskkill /IM msedgedriver.exe /F
tasklist | findstr /I msed.ge.exe && taskkill /IM msedge.exe /F
rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache"
:: Set your target folder path here
set "target_folder=output/allure"
del /q /f /s "%target_folder%\*.*"
py -m pabot.pabot --processes 6 --listener allure_robotframework --rerunfailed output.xml --output rerun.xml *.robot
xcopy /s /q "output\allure" ".\allure-results"


:: ***** Private Management Liability *****

:: Kill msedgedriver again and clear cache
tasklist | findstr /I msedgedriver.exe && taskkill /IM msedgedriver.exe /F
tasklist | findstr /I msedge.exe && taskkill /IM msedge.exe /F

rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache"

:: Go to ML-PRIVATE folder and run ML-PRIVATE_Execution
cd ..\ML-PRIVATE
set "target_folder_allure=allure-results"
del /q /f /s "%target_folder_allure%\*.*"
Python ML-PRIVATE_Execution.py
tasklist | findstr /I msedgedriver.exe && taskkill /IM msedgedriver.exe /F
tasklist | findstr /I msed.ge.exe && taskkill /IM msedge.exe /F
rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache"
:: Set your target folder path here
set "target_folder=output/allure"
del /q /f /s "%target_folder%\*.*"
py -m pabot.pabot --processes 6 --listener allure_robotframework --rerunfailed output.xml --output rerun.xml *.robot
xcopy /s /q "output\allure" ".\allure-results"


:: ***** Non Profit Management Liability *****

:: Kill msedgedriver again and clear cache
tasklist | findstr /I msedgedriver.exe && taskkill /IM msedgedriver.exe /F
tasklist | findstr /I msedge.exe && taskkill /IM msedge.exe /F

rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache"

:: Go to  ML_NFP_PNB folder and run ML_NFP_PNB_Execution
cd ..\MGMT-LIAB\ML_NFP_PNB
set "target_folder_allure=allure-results"
del /q /f /s "%target_folder_allure%\*.*"
Python ML_NFP_PNB_Execution.py
tasklist | findstr /I msedgedriver.exe && taskkill /IM msedgedriver.exe /F
tasklist | findstr /I msed.ge.exe && taskkill /IM msedge.exe /F
rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache"
:: Set your target folder path here
set "target_folder=output/allure"
del /q /f /s "%target_folder%\*.*"
py -m pabot.pabot --processes 6 --listener allure_robotframework --rerunfailed output.xml --output rerun.xml *.robot
xcopy /s /q "output\allure" ".\allure-results"


:: ***** Real Estate *****

:: Kill msedgedriver again and clear cache
tasklist | findstr /I msedgedriver.exe && taskkill /IM msedgedriver.exe /F
tasklist | findstr /I msedge.exe && taskkill /IM msedge.exe /F

rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache"

:: Go to  RE folder and run RE_Execution
cd ..\..\RE
set "target_folder_allure=allure-results"
del /q /f /s "%target_folder_allure%\*.*"
Python Real_Estate_Execution.py
tasklist | findstr /I msedgedriver.exe && taskkill /IM msedgedriver.exe /F
tasklist | findstr /I msed.ge.exe && taskkill /IM msedge.exe /F
rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache"
:: Set your target folder path here
set "target_folder=output/allure"
del /q /f /s "%target_folder%\*.*"
py -m pabot.pabot --processes 6 --listener allure_robotframework --rerunfailed output.xml --output rerun.xml *.robot
xcopy /s /q "output\allure" ".\allure-results"


:: ***** Generate Allure Result for All LOBs *****

:: Kill msedgedriver again and clear cache
tasklist | findstr /I msedgedriver.exe && taskkill /IM msedgedriver.exe /F
tasklist | findstr /I msedge.exe && taskkill /IM msedge.exe /F

cd ..\AE
xcopy /s /q "allure-results" "..\allure-results"
cd ..\BR
xcopy /s /q "allure-results" "..\allure-results"
cd ..\CE
xcopy /s /q "allure-results" "..\allure-results"
cd ..\Cyber
xcopy /s /q "allure-results" "..\allure-results"
cd ..\IA
xcopy /s /q "allure-results" "..\allure-results"
cd ..\KNR
xcopy /s /q "allure-results" "..\allure-results"
cd ..\Raven
xcopy /s /q "allure-results" "..\allure-results"
cd ..\ML-PRIVATE
xcopy /s /q "allure-results" "..\allure-results"
cd ..\MGMT-LIAB\ML_NFP_PNB
xcopy /s /q "allure-results" "..\..\allure-results"
cd ..\..\RE
xcopy /s /q "allure-results" "..\allure-results"