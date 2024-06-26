*** Variables ***
${TotalUsersCounter}            xpath://*[@id="ctl00_ContentPlaceHolder1_lbl2UserStats0"]
${NewUsersThisWeekCounter}      xpath://*[@id="ctl00_ContentPlaceHolder1_lbl2UserStats1"]
${NewUsersLastWeekCounter}      xpath://*[@id="ctl00_ContentPlaceHolder1_lbl2UserStats2"]
${NewUsersThisMonthCounter}     xpath://*[@id="ctl00_ContentPlaceHolder1_lbl2UserStats3"]
${TotalDisabledUsersCounter}    xpath://*[@id="ctl00_ContentPlaceHolder1_lbl2UserStats4"]
${DisUsersThisWeekCounter}      xpath://*[@id="ctl00_ContentPlaceHolder1_lbl2UserStats5"]
${DisUsersLastWeekCounter}      xpath://*[@id="ctl00_ContentPlaceHolder1_lbl2UserStats6"]
${DisUsersThisMonthCounter}     xpath://*[@id="ctl00_ContentPlaceHolder1_lbl2UserStats7"]
${TokenButton}                  xpath://*[@id="tab_Tokenslink"]
${NewTokenButton}               xpath://*[@id="ctl00_ContentPlaceHolder1_hplNew"]
${tokenusername}                xpath://*[@id="ctl00_ContentPlaceHolder1_tbxAssignedUser"]
${token_name}                   xpath://*[@id="ctl00_ContentPlaceHolder1_tbxToken_Alias"]
${Add_button}                   xpath://*[@id="ctl00_ContentPlaceHolder1_btnAction"]
${NewUserThisWeek}              xpath://*[@id="ctl00_ContentPlaceHolder1_UsersDashboardControl_lblNewUsersThisWeek"]
${NewUserThisMonth}             xpath://*[@id="ctl00_ContentPlaceHolder1_UsersDashboardControl_lblNewUsersThisMonth"]

${DeleteImage}                  xpath://*[text()= ${inputUserName}]/parent::div//parent::div//*[@src="images/icons-mini/trash_black_white.png"]
${ConfirmButton}                xpath://*[@id="ctl00_ContentPlaceHolder1_Dialog1_ctl01_btnConfirm"]
${NewUserAlltime}               xpath://*[@id="ctl00_ContentPlaceHolder1_UsersDashboardControl_lblNewUsersCount"]
${DisableThisWeek}              xpath://*[@id="ctl00_ContentPlaceHolder1_UsersDashboardControl_lblDisabledUsersThisWeek"]
${DisableThismonth}             xpath://*[@id="ctl00_ContentPlaceHolder1_UsersDashboardControl_lblDisabledUsersThisMonth"]
${DisableAllTime}               xpath://*[@id="ctl00_ContentPlaceHolder1_UsersDashboardControl_lblDisabledUsersCount"]
${DisableStatus}                xpath://*[@id="ctl00_ContentPlaceHolder1_ddlStatus"]
${UsrPanelBar}                  xpath://*[@name="ctl00$ContentPlaceHolder1$UsersDashboardControl$ddlUsersChartType"]
${ImportUser}                   xpath://*[@id="submenu_line"]/a[2]
${UserName}                     xpath://*[@id="ctl00_ContentPlaceHolder1_Grid1_c4_i"]
${AdministratorRole}            xpath://*[@id="ctl00_ContentPlaceHolder1_radioUserRole_1"]
${Logout}                       xpath://*[@id="ctl00_lnkbtnLogout"]
${importbutton}                 xpath://*[@id="ctl00_ContentPlaceHolder1_btnAction"]
${NewUsertooltip}               xpath://*[@id="ctl00_ContentPlaceHolder1_UsersDashboardControl_imgNewUsersThisWeek"][@title="New Users"]
${AddUserButton}                xpath://*[@id="ctl00_ContentPlaceHolder1_btnAction"]

${UserPanelThisWeek}            xpath://*[@id='ctl00_ContentPlaceHolder1_UsersDashboardControl_lblThisWeek']
${UserPanelLastWeek}            xpath://*[@id="ctl00_ContentPlaceHolder1_UsersDashboardControl_lblLastWeek"]
${UserPanelThisMonth}           xpath://*[@id='ctl00_ContentPlaceHolder1_UsersDashboardControl_lblThisMonth']
${UserPanelTotalCount}          xpath://*[@id='ctl00_ContentPlaceHolder1_UsersDashboardControl_lblTotalCount']
${UserPanelGridFormat}          xpath://*[@id="ctl00_ContentPlaceHolder1_UsersDashboardControl_divUsersClassic"]//table
${UserPanelBarFormat}           xpath://*[@id="ctl00_ContentPlaceHolder1_UsersDashboardControl_divUsersChart"]