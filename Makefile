lint: 
	@echo *********************************************** RODANDO ROBOTIDY ***********************************************
	robotidy '$(src)'
	@echo *********************************************** RODANDO TRANSFORM ***********************************************
	robotidy --transform NormalizeSectionHeaderName '$(src)'
	robotidy --configure NormalizeSectionHeaderName:uppercase=True '$(src)'
	robotidy --configure AlignSettingsSection:argument_indent=0 '$(src)'
	robotidy --transform AlignTestCases '$(src)'
	@echo *********************************************** RODANDO TESTE ***********************************************
	robot -d '.\Logs\' '$(src)'	
	@echo *********************************************** RELATORIO FINAL DO ROBOCOP ***********************************************
	robocop '$(src)' --reports all

	
	