# Processador de output do VaxiJen
* Executável para processar arquivos .html gerados pelo VaxiJen
---

# Contexto
Quando falamos de vacinologia reversa, a predição de antigenicidade das sequências proteicas é um passo essencial no processo. Uma ferramenta que faz isso com muita propriedade é o VaxiJen, uma plataforma web que pode ser acessada nesse [link](http://www.ddg-pharmfac.net/vaxijen/VaxiJen/VaxiJen.html). Apesar de amplamente usada e possuir uma eficiência considerável, a limitação dos servidores compartilhados nos impede de fazer submissões superiores a 100 sequências proteicas. O executável processa todos os arquivos .html e remover as sequências não antigênicas dado um proteoma de referência.

# Requisitos
* Interface da linha de comando Unix-like
* Todos os seguites arquivos dentro de um diretório:

    proteoma.fasta # todas suas sequências proteicas em um único arquivo
    
    proteoma_particionado_1.fasta # proteoma particionado para submeter ao VaxiJen 
    
    proteoma_particionado_2.fasta # proteoma particionado para submeter ao VaxiJen
    
    proteoma_particionado_1.html # resultado VaxiJen do 'proteoma_particionado_1.fasta'
    
    proteoma_particionado_2.html # resultado VaxiJen do 'proteoma_particionado_2.fasta'

# Utilização
## Linux & MacOs & Windows
* Vá até o diretório onde o arquivo .sh se encontra
* Abra a interface da linha de comando e rode o seguinte:
* `./processing_VaxiJen.sh`
* Depois, remova as linhas iniciais que contém os identificadores vazios. Dica:
* `sed '1,40d' seq_antigenic.fasta`
