program pilha_simples;

const tam= 3;

type
vet = array[1..tam] of integer;

var pilha: vet;
op,elem,topo:integer;

procedure inicializa(var pos:integer);
begin
  pos:=0;
end;

procedure ler_elemento(var el:integer);
begin
  writeln('Digite o elemento');
  readln(el);
end;

function cheia (p:vet;posi,max:integer):boolean;
begin
  if posi<max then
  cheia:=false
  else
  cheia:=true;
end;

procedure push(var p:vet; var posi,el:integer);
begin
  if not cheia(p,posi,tam) then
  begin
    p[posi+1]:=el;
    posi:=posi+1
  end
  else begin
    writeln('Pilha cheia. Elemento não inserido');
    readkey
  end
end;

function vazia (p:vet;posi:integer):boolean;
begin
  if posi=0 then
  vazia:=true
  else
  vazia:=false;
end;

procedure pop(var p:vet;var posi:integer);
begin
  if not vazia (p,posi) then
  begin
    writeln('Elemento retirado: ', p[posi]);
    posi:=posi-1;
  end
  else
  writeln('Pilha vazia');
  readkey
end;

procedure cons_pilha(p:vet;posi:integer);
begin
  if not vazia (p,posi) then
  writeln('Próximo Elemento a ser retirado: ', p[posi])
  else
  writeln('Pilha vazia');
  readkey
end;

procedure escreve_pilha(p:vet;posi:integer);
var i:integer;
begin
  if not vazia (p,posi) then
  for I:=1 to posi do
  write (p[i],' ')
  else
  writeln('Pilha vazia');
  readkey;
end;

{Programa Principal}

begin
  clrscr;
  inicializa(topo);
  op:=0;
  while op<> 5 do
  begin
    clrscr;
    writeln ('    MENU    ');
    writeln ('------------');
    writeln;
    writeln (' 1-Inserir  ');
    writeln (' 2-Remover  ');
    writeln (' 3-Consultar');
    writeln (' 4-Escrever ');
    writeln (' 5-Sair     ');
    writeln;
    write('    ==> ');
    readln (op);
    clrscr;
    if op =1 then begin
      ler_elemento(elem);
      push(pilha,topo,elem);
    end
    else if op =2 then
    pop(pilha,topo)
    else if op=3 then
    cons_pilha(pilha,topo)
    else if op=4 then
    escreve_pilha(pilha,topo);
  end;
end.