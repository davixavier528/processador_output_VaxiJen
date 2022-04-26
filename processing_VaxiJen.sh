#!/bin/bash

#primeiro passo é contar quantas sequências antigênicas e não antigênicas possuem em todos os arquivos .html, gerando um .txt que armazenas essas informações
grep -c '( Probable <b><font color="#0000FF">ANTIGEN</font></b> )' *.html | cut -d ':' -f2 | paste -sd+ | bc >> num_antigenic.txt

grep -c '( Probable <b><font color="#0000FF">NON-ANTIGEN</font></b> )' *.html | cut -d ':' -f2 | paste -sd+ | bc >> num_non_antigenic.txt

# segundo passo é iniciar um for-loop pra processar todos os arquivos .html, para extrair todos os identificadores não-antigênicos
for f in *.html
do
    grep -B 1 '( Probable <b><font color="#0000FF">NON-ANTIGEN</font></b> )' $f | grep 'tr' | sed 's/&gt;tr|/>tr|/g' | sed 's/              <b>.*<br><br>//' >> ids_non_antigenic.txt
    # o primeiro grep seleciona a linha acima da ocorrência não antigênica
    # o segundo grep isola os identificadores
    # o primeiro e o segundo sed substituem ocorrências estranhas
done

#terceiro passo é remover as sequências não antigênicas
cat ids_non_antigenic.txt proteoma.fasta | seqkit rmdup > seq_antigenic.fasta 

#por últimos, removemos os arquivos residuais
rm ids_non_antigenic.txt proteoma.fasta
