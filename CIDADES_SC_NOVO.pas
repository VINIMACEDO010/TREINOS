program cidades_sc;

uses
crt;

type
tipo_inf = string;
ptnodo = ^elemento;
elemento = record
  dado: tipo_inf;
  prox: ptnodo
end;

var
inicio: ptnodo;
palavra: tipo_inf;
op: byte;

procedure leitura(var inf: tipo_inf);
begin
  clrscr;
  writeln('Digite a cidade de Santa Catarina: ');
  readln(inf);
end;

procedure cria_lista(var lista: ptnodo);
begin
  lista := nil;
end;

procedure insere(var lista: ptnodo; inf: tipo_inf);
var
novoNo, atual, anterior: ptnodo;
begin
  new(novoNo);
  if novoNo = nil then
  begin
    writeln('Memória cheia');
    readkey;
  end
  else
  begin
    novoNo^.dado := inf;
    atual := lista;
    anterior := nil;
    
    while (atual <> nil) and (inf > atual^.dado) do
    begin
      anterior := atual;
      atual := atual^.prox;
    end;
    
    if anterior = nil then //início da lista
    begin
      novoNo^.prox := lista;
      lista := novoNo;
    end
    else //meio ou final da lista
    begin
      novoNo^.prox := atual;
      anterior^.prox := novoNo;
    end;
  end;
end;

procedure remove_elemento(var lista: ptnodo; num: integer);
var
atual, anterior: ptnodo;
i: integer;
begin
  atual := lista;
  anterior := nil;
  i := 1;
  
  while (atual <> nil) and (i <> num) do
  begin
    anterior := atual;
    atual := atual^.prox;
    i := i + 1;
  end;
  
  if atual = nil then
  begin
    writeln('Número de cidade não encontrado na lista');
    readkey;
  end
  else
  begin
    if anterior = nil then
    lista := atual^.prox
    else
    anterior^.prox := atual^.prox;
    writeln('Cidade removida: ', atual^.dado);
    dispose(atual);
    readkey;
  end;
end;

function conta_elementos(lista: ptnodo): byte;
var
aux: ptnodo;
i: byte;
begin
  if lista = nil then
  i := 0
  else
  begin
    i := 0;
    aux := lista;
    while aux <> nil do
    begin
      i := i + 1;
      writeln(i, ' - ', aux^.dado);
      aux := aux^.prox;
    end;
  end;
  writeln;
  conta_elementos := i;
end;

begin
  op := 1;
  cria_lista(inicio);
  while op <> 0 do
  begin
    clrscr;
    writeln('0 - Sair');
    writeln('1 - Insira Cidade');
    writeln('2 - Remova Cidade');
    writeln('3 - Contar Cidades');
    writeln;
    write('Insira a opção desejada: ');
    readln(op);
    
    case op of
      1: begin
        leitura(palavra);
        insere(inicio, palavra);
      end;
      2: begin
        clrscr;
        writeln(conta_elementos(inicio), ' Cidades');
        writeln;
        writeln('Digite o número da cidade a ser removida: ');
        readln(op);
        remove_elemento(inicio, op);
      end;
      3: begin
        clrscr;
        writeln(conta_elementos(inicio), ' Cidades');
      
        readkey;
      end;
    end;
  end;
end.