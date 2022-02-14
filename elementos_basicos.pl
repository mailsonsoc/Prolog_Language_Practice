/*Digite o Programa incluindo as regras que definem as rela��es av� e realize as seguintes consultas: a)quem s�o os filhos de ad�o?b)quem s�o os netos de ad�o? c)quem s�o os tios de Enos?*/
/*pai(ad�o,cain).
pai(ad�o,abel).
pai(ad�o,seth).
pai(seth,enos).
av�(X,Y) :- pai(X,Z), pai(Z,Y).
irm�o(X,Y) :- pai(Z,X), pai(Z,Y), X\=Y.*/
/*a)pai(ad�o,Y).
    Y = cain ;
    Y = abel ;
    Y = seth.
  b)av�(ad�o,Y).
    Y = enos.
  c)pai(X,enos), irm�o(X,Y).
    X = seth,
    Y = cain ;
    X = seth,
    Y = abel ;*/
/*Considere a �rvore geneal�gica a seguir:
a) Usando fatos, defina as rela��es pai e m�e. Em seguida, consulte o
sistema para ver se suas defini��es est�o corretas.
b) Acrescente ao programa os fatos necess�rios para definir as rela��es
homem e mulher. Por exemplo, para estabelecer que Ana � mulher e
Ivo � homem, acrescente os fatos mulher(ana) e homem(ivo).
c) Usando duas regras, defina a rela��o gerou(X,Y) tal que X gerou Y
se X � pai ou m�e de Y. Fa�a consultas para verificar se sua defini��o
est� correta. Por exemplo, para a consulta gerou(X,eva) o sistema
dever� apresentar as respostas X = ana e X = ivo.
d) Usando rela��es j� existentes, crie regras para definir as rela��es filho,
filha, tio, tia, primo, prima, av� e av�. Para cada rela��o,
desenhe o grafo de relacionamentos, codifique a regra correspondente
e fa�a consultas para verificar a corretude.*/
%a)
pai(ivo,eva).
pai(gil,rai).
pai(gil,cl�).
pai(gil,ary).
pai(rai,no�).
pai(ary,gal).
m�e(ana,eva).
m�e(bia,rai).
m�e(bia,cl�).
m�e(bia,ary).
m�e(eva,no�).
m�e(lia,gal).
%b)
mulher(ana).
mulher(eva).
mulher(bia).
mulher(cl�).
mulher(lia).
mulher(gal).
homem(ivo).
homem(gil).
homem(rai).
homem(no�).
homem(ary).
%c)
gerou(X,Y) :- pai(X,Y); m�e(X,Y).
%d)
irm�o(X,Y) :- pai(Z,X), pai(Z,Y), X\=Y, homem(X);m�e(Z,X), m�e(Z,Y), X\=Y, homem(X).
irm�(X,Y) :- pai(Z,X), pai(Z,Y), X\=Y, mulher(X);m�e(Z,X), m�e(Z,Y), X\=Y,mulher(X).
filho(X,Y) :- gerou(Y,X), homem(X).
filha(X,Y) :- gerou(Y,X), mulher(X).
tio(X,Y):- pai(Z,Y),irm�o(Z,X), homem(X);m�e(Z,Y),irm�o(Z,X),homem(X).
tia(X,Y):- m�e(Z,Y),irm�o(Z,X), mulher(X);pai(Z,Y),irm�o(Z,X),mulher(X).
primo(X,Y) :- pai(Z,Y),tio(Z,X),homem(X);m�e(Z,Y),tia(Z,X),homem(X).
prima(X,Y) :- pai(Z,Y),tio(Z,X),mulher(X);m�e(Z,Y),tia(Z,X),mulher(X).
av�(X,Y) :- pai(X,Z), gerou(Z,Y), homem(X).
av�(X,Y) :- m�e(X,Z), gerou(Z,Y), mulher(X).
/*Codifique as regras equivalentes �s seguintes senten�as:
a) Todo mundo que tem filhos � feliz.
b) Um casal � formado por duas pessoas que t�m filhos em comum.*/
%a)
feliz(X):-gerou(X,_).
%b)
casal(X,Y):-pai(X,Z),m�e(Y,Z).
