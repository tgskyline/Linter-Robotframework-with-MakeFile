*** Settings ***
Documentation       Example using the space separated format.
...                 and this documentation is multiline
...                 where this line should go I wonder?

Library             RequestsLibrary    WITH NAME    name
Library             Collections    ${1}    ${2}    ${3}

Suite Setup         Start Session
...                 host=${IPADDRESS}
...                 user=${USERNAME}
...                 password=${PASSWORD}
Suite Teardown      Close Session
Test Template       Dummy


*** Variables ***
${VAR}                                  1
${LONGER_NAME}                          2
&{MULTILINE}                            a=b
...                                     b=c
${VARIABLE 1}                           10    # comment
@{LIST}                                 a    b    c    d
${LONGER_NAME_THAT_GOES_AND_GOES}       longer value that goes and goes

&{MULTILINE}                            a=b
...                                     b=c
...                                     d=1


*** Test Cases ***
Test1                   [Documentation]     Validate Test1
                        [Tags]              sanity
                        ARG1
Test2                   [Documentation]     Validate Test2
                        [Tags]              smoke
                        ARG2
# some comment
test1                   hi                  hello
test2 long test name    asdfasdf            asdsdfgsdfg
