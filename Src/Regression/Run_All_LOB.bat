@ECHO ON
tasklist | findstr /I msedgedriver.exe && taskkill /IM msedgedriver.exe /F
cd Run_all_LOBs
del *.png
rmdir /s /q pabot_results
Python Execute_All_LOB.py
rem Python Rerun.py
allure serve allure-report allure-results

rem tasklist | findstr /I msedgedriver.exe && taskkill /IM msedgedriver.exe /F
rem cd ..
rem cd AE
rem py -m pabot.pabot --processes 6 --listener allure_robotframework --rerunfailed output.xml --output rerun.xml *.robot
