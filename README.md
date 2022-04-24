![Badge](https://img.shields.io/github/issues/tgskyline/Linter-Robotframework)  ![Badge](https://img.shields.io/github/forks/tgskyline/Linter-Robotframework)  ![Badge](https://img.shields.io/github/stars/tgskyline/Linter-Robotframework)
<h1 align="center"> Linter_Robotframework </h1>

</h1>
<p align="center">🚀 Rode o linter, depois seu teste e por fim um relatório de pontos que podem ser ajustados manualmente no seu código seguindo as boas práticas do Robotframework.</p>

## Conhecimentos necessários

Antes de iniciar a instalação e criação do arquivo Makefile, leia mais sobre as bibiotecas [Robocop](https://github.com/MarketSquare/robotframework-robocop) , [Robotidy](https://github.com/MarketSquare/robotframework-tidy) e também sobre Makefile.

## Funcionalidades

- `1º`: Possibilita utilizar as duas bibliotecas de linting ao mesmos tempo
- `2º`: Com somente uma linha de comando é possível rodar várias ações 
- `3º`: Você pode criar várias etapas antes e depois de rodar as transformações do código

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

# Configurando seu arquivo Makefile

Você pode utilizar como base a configuração abaixo, mas poderá customizar inserindo as linhas de comandos que mais utiliza

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
	    @echo *********************************************** RODANDO TESTE ***********************************************
	    robot -d './Logs/' '$(src)'	
	    @echo *********************************************** ADCIONANDO ARQUIVOS NO STAGE ***********************************************
	    git add *

