# Container
Exemplos de arquivos Dockerfile e docker-compose.yaml

Organização do Projeto
------------

    |
    ├── /docker-composes                   <- Pasta contendo scripts para instanciação de contêineres
    │   ├── .env                           <- Arquivo com variáveis utilizadas nos arquivos yaml
    │   ├── pgdb_pgadmin.yaml              <- Docker compose que inicia um banco postgres com pgadmin
    │   ├── /prom_graf                     <- Pasta que contêm os arquivos necessários para o exemplo de prometheus com grafana
    │   │   ├── docker-compose.yaml        <- Arquivo compose que inicia os serviços prometheus e grafana
    │   │   ├── /grafana
    │   │   │    └── datasource.yaml       <- Configuração de datasource para o grafana, onde buscará dados no prometheus
    │   │   └── /prometheus
    │   │       └── prometheus.yaml        <- Arquivo de configuração do prometheus para coleta de métricas do grafana
    │   └── simple.yaml                    <- Exemplo mais simples de docker-compose
    │
    ├── /dockerfiles                       <- Pasta contendo scrips para criação de imagens
    │   ├── dev_environment                <- Dockerfile que cria um ambiente de desenvolvimento com VSCode para Python
    │   ├── hello.c                        <- Programa simples em C que imprime a mensagem Olá
    │   ├── index.html                     <- Exemplo mínimo de página HTML
    │   ├── minimal                        <- Exemplo mínimo para um Dockerfile
    │   ├── multi_stage                    <- Exemplo de build contendo vários estágios para diminuir o tamanho da imagem
    │   ├── simple                         <- Exemplo simples de dockerfile que instala um programa em linux
    │   ├── simple_cmd                     <- Exemplo simples anterior com execução de comando ao criar o container
    │   ├── simple_entry_cmd               <- Exemplo simples anterior utilizando um combinado de ENTRYPOINT e CMD
    │   └── website                        <- Exemplo de dockerfile que cria uma imagem nginx com uma página personalizada
    └── README.md                          <- Este arquivo leia-me
     
--------

# Quickstart
## Construir as imagens da pasta dockerfiles
Para construir as imagens dockerfiles, segue exemplo:
```
cd dockerfiles
docker build -t minimal -f minimal .
```

Para criar containers, executá-los e removê-los, segue exemplos:
```
docker run --rm -it minimal
docker run --rm simple_entry_cmd
docker run --rm -p 8080:80 website
```

## Instanciar containers por meio dos composes na pasta docker-composes
Para instanciar os containers, segue exemplo:
```
cd docker-composes
docker-compose -f simple.yaml up
```

Para interromper a execução dos containers e remover volumes, segue exemplo:
```
docker-compose -f simple.yaml down -v
```

