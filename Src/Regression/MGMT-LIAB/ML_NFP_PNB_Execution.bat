@ECHO ON
tasklist | findstr /I msedgedriver.exe && taskkill /IM msedgedriver.exe /F
del *.png
rmdir /s /q pabot_results
Python ML_NFP_PNB_Execution.py
allure serve allure-report allure-results


rem tasklist | findstr /I msedgedriver.exe && taskkill /IM msedgedriver.exe /F

rem py -m pabot.pabot --processes 6 --listener allure_robotframework --rerunfailed output.xml --output rerun.xml *.robot
