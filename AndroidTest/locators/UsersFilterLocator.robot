*** Variables ***
${UserFilterText}           xpath=//*[@id="ctl00_ContentPlaceHolder1_tbxUserFilter"]
${UserFilterDropDown}       xpath=//*[@id="ctl00_ContentPlaceHolder1_ddlFilterComparator"]
${SearchIcon}               xpath=//*[@id="ctl00_ContentPlaceHolder1_btnFilterUsers"]
${UserFilterName}           xpath=//*[text()= "${inputFirstName}${SPACE}${inputLastName}"]/parent::div//parent::div//*[@src="images/icons-mini/edit.png"]
${DeleteUserConfirmBtn}     xpath=//*[@id="ctl00_ContentPlaceHolder1_Dialog1_ctl01_btnConfirm"]
${UserDeleteLink}           xpath=//*[text()= "${inputFirstName}${SPACE}${inputLastName}"]/parent::div//parent::div//*[@src="images/icons-mini/trash_black_white.png"]
${RowsToDisplayDropDown}    xpath=//*[@id="ctl00_ContentPlaceHolder1_ddlPageSize"]
${UserPagesCount}           xpath=//*[@id="ctl00_ContentPlaceHolder1_Grid1_pr_ctl01"]
${UserRoleAdmin}		    xpath=//*[@selected="selected" and text()="Help desk "]
${UserRoleHelpdesk}		    xpath=//*[@title="Helpdesk"]
${UpdateProgress}           xpath=//*[@id="ctl00_ContentPlaceHolder1_imgUpdateProgress"]


