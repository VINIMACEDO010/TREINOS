Program atividade_01 ;

const
max1=100;
max2=100;

var a:array[1..max1] of integer;
b:array[1..max2] of integer;


function uniao(a,b:integer):integer;
procedure inters(a,b:integer);
procedure diferenca(a,b:integer);
procedure lervetor(a,b:integer);
procedure escrever(a,b:integer);
procedure pertence(a,b:integer);

var u, i, d, l, e, p, t1, t2, i1, i2: integer;
Begin
  writeln ('escreva o tamanho do vetor 1');
  for a:= 1 to m1 do
  readln (t1[i1]);
  begin
    writeln ('escreva o tamanho do vetor 2');
    for b:= 1 to m2 do
    readln (t2[i2]);
  end;
  for uniao:= 1 to t1 do
  begin
    for uniao:= 1 to t2 do
    if pertence = a and b then
    u:= a=b and a>b and b>a;
    return;
  end;
   for inters:= 1 to t1 do
  begin
    for inters:= 1 to t2 do
    if pertence = a[i1] and b[i2] then
    i:= a=b;
  end;
  for diferenca:= 1 to t1 do
  begin
    for diferenca:= 1 to t2 do
    if not pertence = a[i1] and b[i2] then
    d:= a[i1] and b[i2];   
  end;
  begin
  	writeln('União dos conjuntos:');
  Escrever(Uniao(a, b, t1, t2), t1 + t2);
  
  writeln('Interseção dos conjuntos:');
  Escrever(Intersecao(a, b, t1, t2), t1);

  writeln('Diferença do primeiro conjunto em relação ao segundo:');
  Escrever(Diferenca(a, b, t1, t2), t1);
  end; 
End.