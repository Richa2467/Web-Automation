*** Variables ***

${TotalReqThisWeek}     xpath://*[@id="ctl00_ContentPlaceHolder1_lbl2OTPStats0"]
${SuccessReqThisWeek}   xpath://*[@id="ctl00_ContentPlaceHolder1_lbl2OTPStats1"]
${FailedReqThisWeek}    xpath://*[@id="ctl00_ContentPlaceHolder1_lbl2OTPStats2"]

${TotalReqLastWeek}     xpath://*[@id="ctl00_ContentPlaceHolder1_lbl2OTPStats3"]
${SuccessReqLastWeek}   xpath://*[@id="ctl00_ContentPlaceHolder1_lbl2OTPStats4"]
${FailedReqLastWeek}    xpath://*[@id="ctl00_ContentPlaceHolder1_lbl2OTPStats5"]

${TotalReqThisMonth}     xpath://*[@id="ctl00_ContentPlaceHolder1_lbl2OTPStats6"]
${SuccessReqThisMonth}   xpath://*[@id="ctl00_ContentPlaceHolder1_lbl2OTPStats7"]
${FailedReqThisMonth}    xpath://*[@id="ctl00_ContentPlaceHolder1_lbl2OTPStats8"]

${AuthThisWeek}     xpath://*[@id="ctl00_ContentPlaceHolder1_AuthenticationsDashboardControl_lblThisWeek"]
${AuthThisMonth}    xpath://*[@id="ctl00_ContentPlaceHolder1_AuthenticationsDashboardControl_lblThisMonth"]
${AuthLastWeek}     xpath://*[id="ctl00_ContentPlaceHolder1_AuthenticationsDashboardControl_lblLastWeek"]