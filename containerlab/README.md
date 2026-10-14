# Containerlab

O Containerlab (ou clab) é uma ferramenta que permite subir e conectar topologias de rede inteiras utilizando containers Docker a partir de um único arquivo de configuração em YAML.

## 1. Instalação

Para colocar seu primeiro laboratório no ar, você precisa ter o Docker instalado no seu Linux.Passo a Passo: Seu Primeiro Lab com Containerlab1.Instalar o Containerlab:Requer acesso root/sudo.Execute o script oficial de instalação no terminal Linux:

```shell
bash -c "$(curl -sL https://get.containerlab.dev)"
```

## 2.Criar o arquivo de topologia (topo.clab.yml):

Configuração em YAML.Crie um arquivo chamado topo.clab.yml no seu computador e cole o conteúdo abaixo. Este exemplo conecta dois roteadores FRRouting (FRR) através de um link direto:

```shell
name: meu-lab

topology:
  nodes:
    roteador1:
      kind: linux
      image: frrouting/frr:latest
    roteador2:
      kind: linux
      image: frrouting/frr:latest

  links:
    - endpoints: ["roteador1:eth1", "roteador2:eth1"]
```

## 3.Subir a topologia:

Criação dos containers e conexões. No mesmo diretório onde salvou o arquivo topo.clab.yml, execute:

```shell
sudo containerlab deploy -t topo.clab.yml
```

O Containerlab baixará a imagem do FRR, criará os dois containers e estabelecerá uma veth pair (cabo virtual) entre roteador1:eth1 e roteador2:eth1.

Para verificar se funcionou: Ao final da execução, o terminal exibirá uma tabela em verde listando os containers ativos, seus nomes e endereços IP de gerenciamento.

## 4.Acessar e testar os roteadores:

Interação via CLI.Para entrar no CLI de roteamento (vtysh) do roteador1:

```shell
sudo docker exec -it clab-meu-lab-roteador1 vtysh
```

Dentro do ambiente do FRR, você pode configurar IPs nas interfaces (eth1), habilitar protocolos como BGP ou OSPF e testar a conectividade.

Para verificar se funcionou: O prompt do terminal mudará para roteador1#. Digite `show interface eth1` para ver se a interface está ativa.

## 5.Destruir o laboratório:Limpeza de recursos.

Quando terminar os testes, você pode remover todos os containers e redes virtuais criadas com um único comando:

```shell
sudo containerlab destroy -t topo.clab.yml
```

Para verificar se funcionou: O comando informará a remoção dos nós e links. Executar `docker ps` confirmará que os containers do lab foram encerrados.
