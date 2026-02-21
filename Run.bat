@ECHO OFF
rem pip install -r requirements.txt


:: Kill existing msedgedriver processes
tasklist | findstr /I msedgedriver.exe && taskkill /IM msedgedriver.exe /F
tasklist | findstr /I msedge.exe && taskkill /IM msedge.exe /F
cd Src\Regression\Run_all_LOBs
rem cd Src\Regression\AE
rem robot TC_AE_001.robot
Python Execute_All_LOB.py
allure serve allure-report allure-results
