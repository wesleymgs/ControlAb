# ControlAb
Sistema para controle de abastecimentos. Desenvolvido durante o processo seletivo da Fortes Tecnologia, com o objetivo de demonstrar atender os pré-requisitos técnicos em Delphi.

# Ambiente
O projeto foi desenvolvido utilizando o Delphi 10.3.3 e seus recursos/ferramentas nativos.

# Estrutura
A aplicação VCL batizada de "ControlAb" (Abreviação para: Controle de Abastecimentos) é dividida em 6 formulários sendo eles:

<i>*Formulário Principal</i><br />
<i>*Formulário Base para Cadastros</i><br />
<i>*Cadastro de Tanques de Combustíveis</i><br />
<i>*Bombas pertencentes aos Tanques</i><br />
<i>*Controle de Abastecimentos</i><br />
<i>*Relatório de Abastecimentos</i>

Em suma, é possível controlar os abastecimentos feitos durante cada dia, identificando a bomba utilizada, a quantidade de litros e o valor abastecido. Em cada abastecimento o sistema calcula uma incidencia de 13% do valor abastecido, e essa informação é registrada.
No relatório as informações são agrupadas por Data, nele são exibidos a Data do Abastecimento, o Tanque, a Bomba, o Valor e o Total do referido dia. Além do detalhamento, ao final do relatório pode-se conferir a Soma Total do período informado.
