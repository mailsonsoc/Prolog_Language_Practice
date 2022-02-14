/*Digite o Programa incluindo as regras que definem as relações avô e realize as seguintes consultas: a)quem são os filhos de adão?
b)quem são os netos de adão? c)quem são os tios de Enos?*/
pai(adão,cain).
pai(adão,abel).
pai(adão,seth).
pai(seth,enos).

avô(X,Y) :- pai(X,Z), pai(Z,Y).
irmão(X,Y) :- pai(Z,X), pai(Z,Y), X\=Y.
/*a)pai(adão,Y).
    Y = cain ;
    Y = abel ;
    Y = seth.
  b)avô(adão,Y).
    Y = enos.
  c)pai(X,enos), irmão(X,Y).
    X = seth,
    Y = cain ;
    X = seth,
    Y = abel ;*/
/*Considere a árvore genealógica a seguir:
a) Usando fatos, defina as relações pai e mãe. Em seguida, consulte o
sistema para ver se suas definições estão corretas.
b) Acrescente ao programa os fatos necessários para definir as relações
homem e mulher. Por exemplo, para estabelecer que Ana é mulher e
Ivo é homem, acrescente os fatos mulher(ana) e homem(ivo).
c) Usando duas regras, defina a relação gerou(X,Y) tal que X gerou Y
se X é pai ou mãe de Y. Faça consultas para verificar se sua definição
está correta. Por exemplo, para a consulta gerou(X,eva) o sistema
deverá apresentar as respostas X = ana e X = ivo.
d) Usando relações já existentes, crie regras para definir as relações filho,
filha, tio, tia, primo, prima, avô e avó. Para cada relação,
desenhe o grafo de relacionamentos, codifique a regra correspondente
e faça consultas para verificar a corretude.*/
%a)
pai(ivo,eva).
pai(gil,rai).
pai(gil,clô).
pai(gil,ary).
pai(rai,noé).
pai(ary,gal).
mãe(ana,eva).
mãe(bia,rai).
mãe(bia,clô).
mãe(bia,ary).
mãe(eva,noé).
mãe(lia,gal).
%b)
mulher(ana).
mulher(eva).
mulher(bia).
mulher(clô).
mulher(lia).
mulher(gal).
homem(ivo).
homem(gil).
homem(rai).
homem(noé).
homem(ary).
%c)
gerou(X,Y) :- pai(X,Y); mãe(X,Y).
%d)
