*** Settings ***
Test Template    Dummy
Suite Setup         Start Session
...                     host=${IPADDRESS}
...                     user=${USERNAME}
...                     password=${PASSWORD}
Suite Teardown      Close Session
Library    RequestsLibrary   WITH NAME  name
Library    Collections   ${1}  ${2}  ${3}

Documentation     Example using the space separated format.
...  and this documentation is multiline
...  where this line should go I wonder?

*** Variables ***
${VAR}  1
${LONGER_NAME}  2
&{MULTILINE}  a=b
...  b=c
${VARIABLE 1}  10  # comment
@{LIST}  a  b  c  d
${LONGER_NAME_THAT_GOES_AND_GOES}    longer value that goes and goes

           &{MULTILINE}  a=b
...  b=c
...         d=1

*** Test Cases ***
Test1    ARG1
    [Tags]    sanity
    [Documentation]  Validate Test1
Test2    ARG2
    [Tags]    smoke
    [Documentation]  Validate Test2