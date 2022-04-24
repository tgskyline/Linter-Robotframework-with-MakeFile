Lint: 
	@echo *********************************************** RODANDO ROBOTIDY ***********************************************
	robotidy '$(src)'
	@echo *********************************************** RODANDO TRANSFORM ***********************************************
	robotidy --transform NormalizeSectionHeaderName '$(src)'
	robotidy --configure NormalizeSectionHeaderName:uppercase=True '$(src)'
	robotidy --configure AlignSettingsSection:argument_indent=0 '$(src)'
	robotidy --transform AlignTestCases '$(src)'
	robotidy --transform OrderTags '$(src)'
	@echo *********************************************** RODANDO TESTE ***********************************************
	robot -d '.\Logs\' '$(src)'	
	@echo *********************************************** RELATORIO FINAL DO ROBOCOP ***********************************************
	robocop '$(src)' --reports all

GitAdd:
	@echo *********************************************** RODANDO ROBOTIDY ***********************************************
	robotidy '$(src)'
	@echo *********************************************** RODANDO TRANSFORM ***********************************************
	robotidy --transform AlignTestCases '$(src)'
	robotidy --configure AlignSettingsSection:up_to_column=10 '$(src)'
	robotidy --configure AlignSettingsSection:argument_indent=0 '$(src)'
	robotidy --transform AlignTestCases '$(src)'
	robotidy --transform OrderTags '$(src)'
	robotidy --spacecount 4 '$(src)'
	@echo *********************************************** RODANDO TESTE ***********************************************
	robot -d './Logs/' '$(src)'	
	@echo *********************************************** ADCIONANDO ARQUIVOS NO STAGE ***********************************************
	git add *
	

	
	