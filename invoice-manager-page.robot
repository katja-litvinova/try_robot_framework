*** Keywords ***
Update Company Name
    [Arguments]    ${company_name}
    Input Text  css:[ng-model="invoiceGet.companyName"]    ${company_name}

Update Type of Work
    [Arguments]    ${type_of_work}
    Input Text  css:[ng-model="invoiceGet.typeOfWork"]    ${type_of_work}

Update Amount
    [Arguments]    ${amount}
    Input Text  css:[ng-model="invoiceGet.price"]    ${amount}

Update Status
    [Arguments]     ${status}
    Select From List By Value   css:[ng-model="invoiceGet.status"]   ${status}

Update Due Date
    [Arguments]     ${due_date}
    Input Text   css:[ng-model="invoiceGet.dueDate"]   ${due_date}

Update Description
    [Arguments]     ${description}
    Input Text   css:[ng-model="invoiceGet.comment"]   ${description}

Save Invoice
    Click Button    saveButton

Cancel Update
    Click Button    Cancel

Update Invoice Details
    [Arguments]    ${invoice}
    Update Invoice Number    ${invoice["id"]}
    Update Company Name  ${invoice["company_name"]}
    Update Type of Work  ${invoice["type_of_work"]}
    Update Status  ${invoice["status"]}
    Update Amount  ${invoice["amount"]}
    Update Due Date  ${invoice["due_date"]}
    Update Description   ${invoice["description"]}

Delete Invoice
    [Arguments]  ${invoice_element}
    Click Link  ${invoice_element}
    Click Button    deleteButton