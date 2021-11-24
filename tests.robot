*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  RequestsLibrary
Library  String
Library  Collections

Resource    resources.robot
Resource    invoice-details-page.robot
Resource    navigation.robot
Resource    system.robot
Resource    data.robot

Suite Setup  Run Keywords   Initialize Test Data    Configure Selenium   Navigate To Homepage
Suite Teardown  Exit Selenium

*** Test Cases ***
Check invoice manager page
    Comment    Checking that we're on the invoice manager page
    Page Should Contain     Invoice Manager

Create An Invoice
    ${invoice}=     Get Dummy Invoice   first_invoice
    Navigate To Add Invoice
    Fill Out Invoice Details    ${invoice}
    Submit Invoice Form
    ${invoice_id}=   Get Invoice Id     ${invoice}
    Page Should Contain     ${invoice_id}

Create another Invoice
    ${invoice}=     Get Dummy Invoice   second_invoice
    Navigate To Add Invoice
    Fill Out Invoice Details    ${invoice}
    Submit Invoice Form
    ${invoice_id}=   Get Invoice Id     ${invoice}
    Create Session	invoice-manager     http://34.197.198.114:8081
    ${resp}=  GET On Session    invoice-manager    /invoices/${invoice_id}
    Should Be Equal As Strings  ${resp.status_code}	 200
    Dictionary Should Contain Value	 ${resp.json()}	 ${invoice_id}
    ${resp}=  DELETE On Session    invoice-manager    /invoices/${invoice_id}
    Status Should Be    200    ${resp}
