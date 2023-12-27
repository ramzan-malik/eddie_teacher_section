*** Settings ***

Documentation       End to End Testing Flow
Library             SeleniumLibrary
Library             Collections             # for "Append to List" keyword
Test Setup         Open Chrome Browser With URL
Test Teardown       Close Browser Session         #it will always run after text execution
Resource            ../PageObjects/GenericPage.robot
#Resource            ../PageObjects/LoginPage.robot



*** Variables ***

${url_to_verify}
${success_block_element_to_verify}              //li[@class='breadcrumb-item active']
${success_block_btn_element_to_verify}          //a[@class='btn btn-success']





*** Test Cases ***

test_teacher_dashboard.py Link

	GenericPage.Enter Email Id and Password to Login              ${username}           ${valid_password}
	Verify User Successfully Logged In
	Verify Link and Success Block Element of the page             https://app-qa.nykey.org/home/teachers              Sun
	Sleep    3


test_teacher_active_courses.py Link

	GenericPage.Enter Email Id and Password to Login              ${username}           ${valid_password}
	Verify User Successfully Logged In
	Verify Link and Success Block Element of the page             https://app-qa.nykey.org/teachers/0/course       Active Courses
	Sleep    3


test_teacher_add_course.py Link

	GenericPage.Enter Email Id and Password to Login              ${username}           ${valid_password}
	Verify User Successfully Logged In
	Verify Link and Success Block Element of the page             https://app-qa.nykey.org/assignments/create           Add Assignment
	Sleep    3


test_teacher_assignments_list.py Link

	GenericPage.Enter Email Id and Password to Login              ${username}           ${valid_password}
	Verify User Successfully Logged In
	Verify Link and Success Block Element of the page             https://app-qa.nykey.org/assignments                  Assignment List
	Sleep    3


test_teacher_feedback.py Link

	GenericPage.Enter Email Id and Password to Login              ${username}           ${valid_password}
	Verify User Successfully Logged In
	Verify Link and Success Block Element of the page             https://app-qa.nykey.org/feedbacks/students/all       Feedback
	Sleep    3


test_teacher_ptm_meeting.py Link

	GenericPage.Enter Email Id and Password to Login              ${username}           ${valid_password}
	Verify User Successfully Logged In
	Verify Link and Success Block Element of the page             https://app-qa.nykey.org/pt_meeting                   Parent & Teacher Meeting
	Sleep    3


test_teacher_reschedule_requests.py Link

	GenericPage.Enter Email Id and Password to Login              ${username}           ${valid_password}
	Verify User Successfully Logged In
	Verify Link and Success Block Element of the page             https://app-qa.nykey.org/teacher/reschedule/requests        Reschedule Requests
	Sleep    3


test_teacher_timesheet.py Link

	GenericPage.Enter Email Id and Password to Login              ${username}           ${valid_password}
	Verify User Successfully Logged In
	Verify Link and Success Block Element of the page             https://app-qa.nykey.org/timesheet                        Timesheet
	Sleep    3


*** Keywords ***

Verify User Successfully Logged In
	${current_url} =        Get Location
	Should Contain          ${current_url}       /home


Verify Link and Success Block Element of the page

	[Arguments]                             ${url_to_verify}                        ${success_block_element_to_verify}
	Go To                                   ${url_to_verify}
	Sleep                                   2
	Wait Until Page Contains                ${success_block_element_to_verify}
	Page Should Contain                     ${success_block_element_to_verify}