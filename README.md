![Badge](https://img.shields.io/github/issues/tgskyline/Linter-Robotframework)  ![Badge](https://img.shields.io/github/forks/tgskyline/Linter-Robotframework)  ![Badge](https://img.shields.io/github/stars/tgskyline/Linter-Robotframework) ![Badge](https://img.shields.io/github/downloads/tgskyline/Linter-Robotframework-with-MakeFile/total)
<h1 align="center"> Linter_Robotframework with <br/> Makefile (Robotidy & Robocop)</h1>

<h2> <p align="center">🤖 Com um comando rode:</p> </h1>

- Linter (Robotidy) 
- Rode seu teste 
- Relatório de Análise do Código Estático (Robocop) 
- Adcione os arquivo na área de Stage do Git.

## Conhecimentos necessários

Antes de iniciar a instalação e criação do arquivo Makefile, leia mais sobre as bibiotecas [Robocop](https://github.com/MarketSquare/robotframework-robocop) , [Robotidy](https://github.com/MarketSquare/robotframework-tidy) e também sobre Makefile.

## Funcionalidades

- `1º` Possibilita utilizar as duas bibliotecas de linting ao mesmos tempo
- `2º` Com somente uma linha de comando é possível rodar várias ações 
- `3º` Você pode criar várias etapas antes e depois de rodar as transformações do código

## Requisitos

Faça download e instalação dos componentes abaixo

### Make for Windows

- http://gnuwin32.sourceforge.net/packages/make.htm

OBS: Insira o caminho da pasta C:\Program Files (x86)\GnuWin32\bin do Make na variável Path

### Robocop

    pip install -U robotframework-robocop

### Robotidy

    pip install -U robotframework-tidy

# Criando o arquivo Makefile

 Para criar o arquivo Makefile rode o comando abaixo em um prompt de comando do PowerShell.

    touch Makefile

# Caracteristicas de usar o Makefile

-   Você poderá rodar várias linhas de comando com somente uma chamada
-   Por default o makefile não avança para o próximo comando a ser executado caso encotre algum erro, erro que pode ser causado por exemplo pela execução do teste. Então se houver algum erro no seu teste ele não rodar os comandos que sucedem ele, no meu exemplo abaixo para o Linter não irá rodar o relatório do Robocop e para o GitAdd não irá rodar o Git Add * para o stage.

# Configurando seu arquivo Makefile

Você pode utilizar como base a configuração abaixo, mas poderá customizar inserindo as linhas de comandos que mais utiliza

	Lint:
		@echo *********************************************** RODANDO ROBOTIDY ***********************************************
		robotidy '$(src)'
		@echo *********************************************** RODANDO TRANSFORM ***********************************************
		robotidy --transform NormalizeSectionHeaderName '$(src)'
		robotidy --transform AlignTestCases '$(src)'
		robotidy --configure AlignSettingsSection:argument_indent=0 '$(src)'
		@echo *********************************************** RODANDO TESTE ***********************************************
		robot -d '.\Results\Api\' '$(src)'
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
		robot -d '.\Results\Api\' '$(src)'
		@echo *********************************************** ADCIONANDO ARQUIVOS NO STAGE ***********************************************
		git add *
		git status

# Variáveis e Constantes no MakeFile

Para rodar o linter basta configurar o caminho que deseja salvar os logs nessa campo do Makefile

	    @echo ******************************** RODANDO TESTE *************************************
	    robot -d './Logs/' '$(src)'	
	    
Para rodar os comandos pelo Makefile há uma variável '$(src)' que você deverá inserir o caminho do arquivo ou diretório que deseja rodar

Exemplos:

    make src=.\testsapi\teste.robot
</d>

    make src=.\testsapi\
# Rodando o Linter

Para rodar somente o Linter utilize o comando 

    make Linter src=.\testsapi\

# Rodando o Linter + Git Add

Para rodar o Linter e ainda adicionar os arquivos na área de Stage utilize o comando

    make GitAdd src=.\testsapi\



