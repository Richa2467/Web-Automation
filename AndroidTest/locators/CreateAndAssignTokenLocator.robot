*** Variables ***
${redTextTknSrNo}                       xpath=//*[@id="ctl00_ContentPlaceHolder1_lblPrinted_Serial_Number"][@style="color:Red;"]
${usrFilterCATkn}                       xpath=//*[@id="ctl00_ContentPlaceHolder1_tbxUserFilter"]
${clickonsearchBar}                     xpath=//*[@id="ctl00_ContentPlaceHolder1_btnFilterUsers"]
${clickOnAssignToUsr}                   xpath=//*[@id="ctl00_ContentPlaceHolder1_tbxAssignedUser"]
#${clickOnAssignToUsr}                   xpath://*[@id="ctl00_ContentPlaceHolder1_ddlAssigned_Partner_User_IdData"]
${selectNoassignedOpt}                  xpath=//*[@id="ctl00_ContentPlaceHolder1_ddlAssigned_Partner_User_IdData"][@value="-1"]
${clickOnCheckAssigBtn}                 xpath=//*[@id="ctl00_ContentPlaceHolder1_btnCheck"]
${clickOnCloseBtn}                      xpath=//*[@id="ctl00_ContentPlaceHolder1_btnActionClose"]
${clickOnEmailTknActivation}            xpath=//*[@id="ctl00_ContentPlaceHolder1_btlEmailTokenActivation"]
${clickOnInstantActivationBtn}          xpath=//*[@id="ctl00_ContentPlaceHolder1_btnShowInstantActivation"]
${calender}                             xpath=//*[@id="_eo_ctl00_ContentPlaceHolder1_dtPickerStart_picker"]
${selectAssignToUsrValue}               xpath=//*[text()="TestUserName_0011 (TestFirstName_0011 TestLastName_0011)"]
${ToastSuccess}                         xpath=//*[@class="jq-toast-heading"]
