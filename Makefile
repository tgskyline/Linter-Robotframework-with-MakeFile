lint: 
	@echo *********************************************** RODANDO ROBOTIDY ***********************************************
	robotidy '$(src)'
	@echo *********************************************** RODANDO TRANSFORM ***********************************************
	robotidy --transform AlignTestCases '$(src)'
	robotidy --configure AlignSettingsSection:up_to_column=3 '$(src)'
	robotidy --configure AlignSettingsSection:argument_indent=0 '$(src)'
	robotidy --transform OrderTags '$(src)'
	robotidy --startline 5 --endline 17 --configure AlignVariablesSection:up_to_column=3 '$(src)'
	@echo *********************************************** RODANDO TESTE ***********************************************
	robot '$(src)'	
	@echo *********************************************** RELATORIO FINAL DO ROBOCOP ***********************************************
	robocop '$(src)' --reports all
	