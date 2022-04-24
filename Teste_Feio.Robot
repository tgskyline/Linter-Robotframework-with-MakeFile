*** SETTings ***


Library     RequestsLibrary    WITH NAME    name
Library                 Collections            ${1}        ${2}       ${3}
Library     OperatingSystem

Suite Setup         Start Session
...     host=${IPADDRESS}
...              user=${USERNAME}
...     password=${PASSWORD}
Suite Teardown      Close Session
Test Template       Dummy


Documentation       Example using the space separated format.
...                 and this documentation is multiline
...                 where this line should go I wonder?

*** VaRIABLES ***
${VAR}                    1
${LONGER_NAME}                   2
&{MULTILINE}                                            a=b
...                               b=c
${VARIABLE 1}                           10    # comment
@{LIST}            a    b    c    d
${LONGER_NAME_THAT_GOES_AND_GOES}    longer value that goes and goes

&{MULTILINE}                                        a=b
...    b=c
...    d=1


*** Test CASES***
Test1
                [Documentation]                Validate Test
    [Tags]                sanity
                ARG1
                    Teste do caminho feliz
Test2
            [Documentation]    Validate Test2
                [Tags]    smoke
        ARG2
                            Teste do caminho triste
# some comment
test1            hi            hello
test2 long test name            asdfasdf    asdsdfgsdfg
test
            Key01
            Key02


*** kEYWORDs ***
Key01
        ${VAR01}                Create Dictionary
    ...    a=1
        ...        b=2
    ...                    c=3

Key02
    Create Session        alias        url
    POST On Session                ${ARG}
    ...                        name=${testname}
    ...                                        sobrenome=${testsobrenome}
