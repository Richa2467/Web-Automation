# LegacyMfaServerTestAutomation

1. Download Java version 8 [Java Download](https://www.java.com/en/download/)   
After the installation, [set JAVA_HOME as environment variable](https://javatutorial.net/set-java-home-windows-10)
Proceed with the installation. Once the installation is done
java -version ---  "1.8.0_271"

2. [Download and Install NodeJS](https://nodejs.org/en/download/)   
Download: Latest LTS Version: 14.15.4 (includes npm 6.14.10)
Run the exe file.   
Check the “Automatically install the necessary checkbox” and proceed with the given steps. 
Once the installation is done  
node -v --- v12.18.4  
npm -v --- 6.14.6

3. Installing Appium
Open the CMD as an administrator and run this command:  
npm install -g appium@1.12.1  
npm install -g appium-doctor  

4. Installing Python > 3.8  
Check python on CMD: python --version  
If python not installed, install it  

5. Download chrome driver.
From : https://chromedriver.storage.googleapis.com/index.html
| Version : 90.0.4430.24
| Download this file : chromedriver_win32.zip | The chrome driver version will depend on the existing installed version of the chrome.
Extract the chromedriver.exe   
Create a folder at an appropriate location [Preferably like Users\{User}\AppData\Local\ChromeDriver\]    
Put the extracted chromedriver exe in the created ChromeDriver folder   
Add the created folder to the Path variable

6. Download Android Studio 
[Andrdoid Studio Download](https://developer.android.com/studio/install)

   Note: Upon given an option platform-tools need to be selected.  
Enter the following command in CMD to set ANDROID_HOME as an Environment variable: 
set ANDROID_HOME=C:\ installation location \android-sdk  
set PATH=%PATH%;%ANDROID_HOME%\tools;%ANDROID_HOME%\platform-tools   
adb --version 
	
7. Installing python libraries  
Run the following commands:  
pip install robotframework==3.2.1  
pip install robotframework-appiumlibrary==1.5.0.6  
pip install robotframework-imaplibrary2==0.3.8  
pip install robotframework-seleniumlibrary==4.4.0  
pip install robotframework-zoomba==2.4.1  
pip install selenium==3.141.0  



## To run the test case, use the following command:
1. To run all the suites from the 'testcases' folder which have given tagname:   
#### python -m robot  -d logs --timestampoutputs -i tagname testcases	

2. To run a particular file from the list of test cases:     
#### python -m robot  -d logs --timestampoutputs testcases/testsuitename.robot  

3. To run all the suites from the 'testcases' folder:   
#### python -m robot  -d logs --timestampoutputs testcases

4. To run a single test case from test suite file:
#### python -m robot -d logs --timestampoutputs -i testcaseid testsuitename.robot	
#### example : python -m robot -d logs --timestampoutputs -i USR_Statistics_002 UserStatisticsTest.robot

5. To run multiple test cases from test suite file:
#### python -m robot -d logs --timestampoutputs -i tagname testsuitename.robot	
#### Example : python -m robot -d logs --timestampoutputs -i SurePassID_M25 UserStatisticsTest.robot

6. To run specific test case from 'testcases' folder(must set path one step back)  
#### python -m robot -d logs --timestampoutputs -i unique_tagname testcases	
#### Example : python -m robot -d logs --timestampoutputs -i SurePassID_M25 testcases

7. To run multiple test suites:  
#### python -m robot -d logs --timestampoutputs testsuitename1.robot testsuitename2.robot	
#### Example : python -m robot -d logs --timestampoutputs UserStatisticsTest.robot UsersFilterTest.robot

Configuration files:
In LoginPageLabel.robot file having two different configuration files.
1. SandboxEnvConfig.robot Sandbox https://sandbox.surepassid.com
2. SandboxDevEnvConfig.robot Sandbox Development https://sandboxdev.surepassid.com

Please uncomment the environment config resource file from LoginPageLabel.robot, on which you want to run execution.

Please enter the appropriate details in SandboxEnvConfig.robot and SandboxDevEnvConfig.robot files.

For that purpose, you need to create three differnt users in the environment on which you want to run execution and provide the user's details in an appropriate config file.

