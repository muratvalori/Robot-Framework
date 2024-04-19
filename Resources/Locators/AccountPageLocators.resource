*** Variables ***

${ACCOUNT_PAGE_HEADER} =                                    xpath=//*[@id="main"]/header[contains(@class, 'page-header')]/h1[normalize-space()='Your account']
${ACCOUNT_PAGE_ADDRESSES_ELEMENT}=                          xpath=//section/div/div/a[2]/span
${ACCOUNT_PAGE_ADD_FIRST_ADDRESS_ELEMENT}=                  xpath=//*[@id="address-link"]/span
${ACCOUNT_PAGE_ORDER_HISTORY_ELEMENT} =                     xpath=//*[@id="history-link"]/span/i

#Fake variables for failing test demonstration
${ACCOUNT_PAGE_FAKE_DELETE_ACCOUNT_ELEMENT} =               id=fake-element
${ACCOUNT_PAGE_FAKE_DELETE_ACCOUNT_BUTTON}=                 id=fake-button
${ACCOUNT_PAGE_FAKE_ARE_YOU_SURE_MESSAGE}=                  id=fake-message
${ACCOUNT_PAGE_FAKE_ACCOUNT_DELETED_MESSAGE}=               id=fake-message
