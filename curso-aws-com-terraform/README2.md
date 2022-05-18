# DevOps: AWS com Terraform Automatizando sua infraestrutura

##Terraform 
Principais caracteristicas
- Infraestrutura como codigo 
    - Open source e declarativo
    - Permite versionamento ( evolução da infra e automação)
    - Idempotente - significado = Na matematica e ciencia da computação idempotencia é a propriedade que algumas operações tem de serem aplicadas varias vezes sem que o resultado se altere após a sua aplicação. O terraform sabe quando deve criar, alterar um recurso 
    - Sintaxe high-level e reutilizavel.
    - Paridade de ambiente - o que temos em dev conseguimos replicar para teste e produção.
    - Planos de execução
          - Segurança e previsibilidade
          - Separação de planejamento e aplicação
    - Hibrido 
          - Agnostico - Crio recursos na gcp, aws, azure e afins.
          - permiti deployar para multiplos provedores simultaneamente.

Casos de uso.
- Criar ou provisionar uma nova Infraestrutura
- Gerenciar a infraestrutura existente.
-  Replicar uma infraestrutura         

Como o terraform funciona?

O core do terraform usa duas fontes de entrada:
-  Seus arquivos de configuração (seu estado desejado) = scripts terraform 
-  O estado atual, que é gerenciado pelo Terraform = com o plano, ele sabe exaamente o que precisa ser add , removido ou alterado.

Providers: OS providers expoem recursos, o que possibilita a criação de infraestrutura em todas essas plataformas:
- IaaS: AWS, GCP, Azure
- PaaS: Kubernetes, Heroku, Digital Ocean
- SaaS: New Relic, Datadog

Terraform vs. Outros Softwares
- Terraform é uma ferramenta de alto nivel de orquestração de onfraestrutura. (ou seja , ele não gerencia configuração igual Ansible, Puppet, Chef etc)
- Não é a intensão gerenciar a configuração.
- Provedores podem usar essas ferramentas.
- CloudFormation e outras ferramentas de IaC (dão suporte somente par o vendor especifico)

Principais comandos:

Usage: terraform [global options] <subcommand> [args]

The available commands for execution are listed below.
The primary workflow commands are given first, followed by
less common or more advanced commands.

Main commands:
  init          Prepare your working directory for other commands
  validate      Check whether the configuration is valid
  plan          Show changes required by the current configuration        
  apply         Create or update infrastructure
  destroy       Destroy previously-created infrastructure


All other commands:
  console       Try Terraform expressions at an interactive command prompt
  fmt           Reformat your configuration in the standard style
  force-unlock  Release a stuck lock on the current workspace
  get           Install or upgrade remote Terraform modules
  graph         Generate a Graphviz graph of the steps in an operation
  import        Associate existing infrastructure with a Terraform resource
  login         Obtain and save credentials for a remote host
  logout        Remove locally-stored credentials for a remote host
  output        Show output values from your root module
  providers     Show the providers required for this configuration
  refresh       Update the state to match remote systems
  show          Show the current state or a saved plan
  state         Advanced state management
  taint         Mark a resource instance as not fully functional
  test          Experimental support for module integration testing
  untaint       Remove the 'tainted' state from a resource instance
  version       Show the current Terraform version
  workspace     Workspace management

Global options (use these before the subcommand, if any):
  -chdir=DIR    Switch to a different working directory before executing the
                given subcommand.
  -help         Show this help output, or the help for a specified subcommand.
  -version      An alias for the "version" subcommand.

  ## Terraform init 
  Uso: terraform [opções globais] init [opções]

  Inicialize um diretório de trabalho novo ou existente do Terraform criando
  arquivos iniciais, carregamento de qualquer estado remoto, download de módulos, etc.

  Este é o primeiro comando que deve ser executado para qualquer novo ou existente
  Configuração do Terraform por máquina. Isso configura todos os dados locais
  necessário para executar o Terraform que normalmente não está comprometido com a versão
  ao controle.

  É sempre seguro executar esse comando várias vezes. Embora corridas subsequentes
  pode dar erros, este comando nunca irá deletar sua configuração ou
  Estado. Mesmo assim, se você tiver informações importantes, faça um backup antes
  para executar este comando, apenas no caso.

Opções:

  -backend = true Configure o backend para esta configuração.

  -backend-config = path Este pode ser um caminho para um arquivo HCL com chave / valor
                       atribuições (mesmo formato que terraform.tfvars) ou um
                       formato 'chave = valor'. Isso é mesclado com o que está no
                       arquivo de configuração. Isso pode ser especificado em vários
                       vezes. O tipo de backend deve estar na configuração
                       em si.

  -force-copy Suprime prompts sobre a cópia de dados de estado. Isso é
                       equivalente a fornecer um "sim" a todas as confirmações
                       Comandos.

  -from-module = SOURCE Copia o conteúdo do módulo fornecido para o destino
                       diretório antes da inicialização.

  -get = true Baixe quaisquer módulos para esta configuração.

  -input = true Solicita a entrada, se necessário. Se for falso, ocorrerá um erro se
                       entrada foi necessária.

  -no-color Se especificado, a saída não conterá nenhuma cor.

  -plugin-dir Diretório que contém os binários do plugin. Isso substitui tudo
                       caminhos de pesquisa padrão para plug-ins e evita o
                       instalação automática de plugins. Esta bandeira pode ser usada
                       várias vezes.

  -reconfigure Reconfigure o backend, ignorando qualquer salvo
                       configuração.

  -migrate-state Reconfigure o back-end e tente migrar qualquer
                       Estado existente.

  -upgrade = false Se estiver instalando módulos (-get) ou plug-ins, ignore
                       objetos baixados anteriormente e instale o
                       versão mais recente permitida dentro das restrições configuradas.

  -lockfile = MODE Define um modo de lockfile de dependência.
                       Atualmente, apenas "somente leitura" é válido.

## terraform plan
Uso: terraform [opções globais] plano [opções]

  Gera um plano de execução especulativo, mostrando quais ações do Terraform
  levaria para aplicar a configuração atual. Este comando não vai
  realmente executar as ações planejadas.

  Você pode opcionalmente salvar o plano em um arquivo, que você pode então passar para
  o comando "aplicar" para executar exatamente as ações descritas no plano.

Opções de personalização do plano:

  As opções a seguir personalizam como o Terraform produzirá seu plano. Vocês
  também pode usar essas opções ao executar "aplicação de terraform" sem passar
  é um plano salvo, para poder planejar e aplicar em um único comando.

  -destroy Selecione o modo de planejamento "destruir", que cria um plano
                      para destruir todos os objetos atualmente gerenciados por este
                      Configuração do Terraform em vez do comportamento normal.

  -refresh-only Selecione o modo de planejamento "atualizar apenas", que verifica
                      se os objetos remotos ainda correspondem ao resultado do
                      o Terraform mais recente se aplica, mas não propõe nenhum
                      ações para desfazer quaisquer alterações feitas fora do Terraform.

  -refresh = false Ignora a verificação de alterações externas em objetos remotos
                      ao criar o plano. Isso pode potencialmente fazer
                      planejando mais rápido, mas às custas de possivelmente planejar
                      contra um registro obsoleto do estado do sistema remoto.

  -replace = resource Força a substituição de uma instância de recurso particular usando
                      seu endereço de recurso. Se o plano normalmente
                      produziu uma atualização ou ação sem operação para esta instância,
                      Em vez disso, o Terraform planejará substituí-lo.

  -target = resource Limita a operação de planejamento apenas para o módulo fornecido,
                      recurso, ou instância de recurso e todos os seus
                      dependências. Você pode usar esta opção várias vezes para
                      inclui mais de um objeto. Isto é excepcional
                      usarem apenas.

  -var 'foo = bar' Define um valor para uma das variáveis ​​de entrada na raiz
                      módulo da configuração. Use esta opção mais do que
                      uma vez para definir mais de uma variável.

  -var-file = nome do arquivo Carrega os valores das variáveis ​​do arquivo fornecido, além disso
                      para os arquivos padrão terraform.tfvars e * .auto.tfvars.
                      Use esta opção mais de uma vez para incluir mais de um
                      arquivo de variáveis.

Outras opções:

  -compact-warnings Se o Terraform produzir qualquer aviso que não seja
                      acompanhado de erros, mostra-os de uma forma mais compacta
                      que inclui apenas as mensagens de resumo.

  -detailed-exitcode Retorna códigos de saída detalhados quando o comando sai. Esta
                      mudará o significado dos códigos de saída para:
                      0 - Bem-sucedido, diff está vazio (sem alterações)
                      1 - Errado
                      2 - Sucesso, existe uma diferença

  -input = true Solicita a entrada de variáveis ​​se não forem definidas diretamente.

  -lock = false Não mantém um bloqueio de estado durante a operação. Isso é
                      perigoso se outros podem executar comandos simultaneamente
                      no mesmo espaço de trabalho.

  -lock-timeout = 0s Duração para tentar novamente um bloqueio de estado.

  -no-color Se especificado, a saída não conterá nenhuma cor.

  -out = path Grava um arquivo de plano no caminho fornecido. Isso pode ser usado como
                      entrada para o comando "aplicar".

  -parallelism = n Limita o número de operações simultâneas. O padrão é 10.

  -state = statefile Uma opção legada usada apenas para o back-end local. Veja o
                      documentação do back-end local para mais informações.

Data Sources
Comportamento do recurso de dados
Se os argumentos de restrição de consulta para um recurso de dados se referem apenas a valores constantes ou valores já conhecidos, o recurso de dados será lido e seu estado atualizado durante a fase de "atualização" do Terraform, que é executada antes da criação de um plano. Isso garante que os dados recuperados estejam disponíveis para uso durante o planejamento e, assim, o plano do Terraform mostrará os valores reais obtidos.

Os argumentos de restrição de consulta podem referir-se a valores que não podem ser determinados até que a configuração seja aplicada, como a id de um recurso gerenciado que ainda não foi criado. Nesse caso, a leitura da fonte de dados é adiada até a fase de aplicação e quaisquer referências aos resultados do recurso de dados em outro lugar na configuração serão desconhecidas até depois que a configuração for aplicada.           

Data Sources somente locais
Embora muitas fontes de dados correspondam a um tipo de objeto de infraestrutura que é acessado por meio de uma API de rede remota, algumas fontes de dados especializadas operam apenas dentro do próprio Terraform, calculando alguns resultados e os expondo para uso em outro lugar.
Por exemplo, existem fontes de dados apenas locais para renderizar modelos, ler arquivos locais e renderizar políticas AWS IAM.
O comportamento de fontes de dados apenas locais é o mesmo de todas as outras fontes de dados, mas seus dados de resultado existem apenas temporariamente durante uma operação do Terraform e são recalculados sempre que um novo plano é criado.

Dependências de Data Sources
Os Data Sources têm o mesmo comportamento de resolução de dependência definido para recursos gerenciados. Definir o meta-argumento depends_on dentro de blocos de dados adia a leitura da fonte de dados até que todas as mudanças nas dependências tenham sido aplicadas.

Para garantir que as fontes de dados acessem as informações mais atualizadas possíveis em uma ampla variedade de casos de uso, os argumentos que fazem referência direta aos recursos gerenciados são tratados da mesma forma como se o recurso estivesse listado em depends_on. Esse comportamento pode ser evitado quando desejado, referenciando indiretamente os valores dos recursos gerenciados por meio de um valor local.

NOTA: No Terraform 0.12 e anteriores, devido ao comportamento do recurso de dados de adiar a leitura até a fase de aplicação, quando dependendo de valores que ainda não são conhecidos, o uso de depends_on com recursos de dados forçará a leitura a sempre ser adiada para a fase de aplicação, e, portanto, uma configuração que usa depends_on com um recurso de dados nunca pode convergir. Devido a esse comportamento, não recomendamos o uso de depends_on com recursos de dados.


Instâncias de recursos múltiplos
Os recursos de dados suportam contagem e for_each meta-argumentos conforme definido para recursos gerenciados, com a mesma sintaxe e comportamento.
Assim como acontece com os recursos gerenciados, quando count ou for_each estiver presente, é importante distinguir o próprio recurso das múltiplas instâncias de recursos que ele cria. Cada instância lerá separadamente de sua fonte de dados com sua própria variante dos argumentos de restrição, produzindo um resultado indexado.

Ciclo de vida da Data Source
Se os argumentos de uma instância de dados não contiverem referências a valores calculados, como atributos de recursos que ainda não foram criados, a instância de dados será lida e seu estado atualizado durante a fase de "atualização" do Terraform, que por padrão é executada antes de criando um plano. Isso garante que os dados recuperados estejam disponíveis para uso durante o planejamento e o diff mostrará os valores reais obtidos.

Os argumentos da instância de dados podem referir-se a valores calculados, caso em que os atributos da própria instância não podem ser resolvidos até que todos os seus argumentos sejam definidos. Nesse caso, a atualização da instância de dados será adiada até a fase de "aplicação" e todas as interpolações dos atributos da instância de dados serão mostradas como "computadas" no plano, uma vez que os valores ainda não são conhecidos.