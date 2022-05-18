# DevOps: AWS com Terraform Automatizando sua infraestrutura

Variáveis e saídas
A linguagem Terraform inclui alguns tipos de blocos para solicitar ou publicar valores nomeados.

As variáveis de entrada servem como parâmetros para um módulo Terraform, para que os usuários possam personalizar o comportamento sem editar a fonte.

Valores de saída são como valores de retorno para um módulo Terraform.

Valores locais são um recurso conveniente para atribuir um nome abreviado a uma expressão.

## Input Variables
As variáveis de Input permitem que você personalize aspectos dos módulos Terraform sem alterar o código-fonte do próprio módulo. Isso permite que você compartilhe módulos em diferentes configurações do Terraform, tornando seu módulo combinável e reutilizável.

Ao declarar variáveis no módulo raiz de sua configuração, você pode definir seus valores usando opções CLI e variáveis de ambiente. Quando você os declara em módulos filho, o módulo de chamada deve passar valores no bloco de módulo.

Se você estiver familiarizado com as linguagens de programação tradicionais, pode ser útil comparar os módulos do Terraform com as definições de função:

Variáveis de Input são como argumentos de função.
Os valores de saída são como os valores de retorno da função.
Os valores locais são como as variáveis locais temporárias de uma função.

Arguments
Terraform CLI define os seguintes argumentos opcionais para declarações de variáveis:

default - um valor padrão que torna a variável opcional.
type - este argumento especifica quais tipos de valor são aceitos para a variável.
description - especifica a documentação da variável de entrada.
validation - um bloco para definir regras de validação, geralmente além de restrições de tipo.
sensítive - Limita a saída da IU do Terraform quando a variável é usada na configuração.