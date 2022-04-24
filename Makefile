Lint: 
	@echo *********************************************** RODANDO ROBOTIDY ***********************************************
	robotidy '$(src)'
	@echo *********************************************** RODANDO TRANSFORM ***********************************************
	robotidy --transform NormalizeSectionHeaderName '$(src)'
	robotidy --transform AlignTestCases '$(src)'
	robotidy --configure AlignSettingsSection:argument_indent=0 '$(src)'
	@echo *********************************************** RODANDO TESTE ***********************************************
	robot -d '.\Logs\' '$(src)'	
	@echo *********************************************** RELATORIO FINAL DO ROBOCOP ***********************************************
	robocop '$(src)' --reports all

GitAdd:
	@echo *********************************************** RODANDO ROBOTIDY ***********************************************
	robotidy '$(src)'
	@echo *********************************************** RODANDO TRANSFORM ***********************************************
	robotidy --transform NormalizeSectionHeaderName '$(src)'
	robotidy --transform AlignTestCases '$(src)'
	robotidy --configure AlignSettingsSection:argument_indent=0 '$(src)'
	@echo *********************************************** RODANDO TESTE ***********************************************
	robot -d './Logs/' '$(src)'	
	@echo *********************************************** ADCIONANDO ARQUIVOS NO STAGE ***********************************************
	git add *
	
                              
	
	