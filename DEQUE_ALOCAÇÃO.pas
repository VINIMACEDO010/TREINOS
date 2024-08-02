// Vinicius Policarpo Macedo e Paulo Vitor Ricken

program DEQUE_ALOCACAO;

uses crt;

type
  tipo_inf = string;
  ptnodo = ^novoNo;
  novoNo = record
    dado: tipo_inf;
    prox: ptnodo;
    ant: ptnodo;
  end;

var
  inicio, fim: ptnodo;
  palavra: tipo_inf;
  op, opi: integer;

procedure leitura_nome(var inf: tipo_inf);
begin
  writeln('Digite o nome desejado: ');
  readln(inf);
end;

procedure cria_lista;
begin
  new(inicio);
  new(fim);
  inicio^.prox := fim;
  fim^.ant := inicio;
end;

procedure insere(inf: tipo_inf; inicio_inserir: boolean);
var
  novo: ptnodo;
begin
  new(novo);
  novo^.dado := inf;

  if inicio_inserir then
  begin
    novo^.prox := inicio^.prox;
    novo^.ant := inicio;
    inicio^.prox^.ant := novo;
    inicio^.prox := novo;
  end
  else
  begin
    novo^.prox := fim;
    novo^.ant := fim^.ant;
    fim^.ant^.prox := novo;
    fim^.ant := novo;
  end;
  writeln('Nome adicionado com sucesso!');
  readln;  // Aguarda o usuário pressionar Enter
end;

procedure remove(inicio_inserir: boolean);
var
  aux: ptnodo;
begin
  if inicio^.prox = fim then
  begin
    writeln('Fila vazia');
    readln;  // Aguarda o usuário pressionar Enter
    exit;
  end;

  if inicio_inserir then
  begin
    aux := inicio^.prox;
    writeln('ptnodo removido: ', aux^.dado);
    inicio^.prox := aux^.prox;
    aux^.prox^.ant := inicio;
  end
  else
  begin
    aux := fim^.ant;
    writeln('ptnodo removido: ', aux^.dado);
    fim^.ant := aux^.ant;
    aux^.ant^.prox := fim;
  end;
  dispose(aux);
  readln;  // Aguarda o usuário pressionar Enter
end;

procedure acesso(opi: integer);
var
  aux: ptnodo;
begin
  case opi of
    1:
      if inicio^.prox = fim then
        writeln('Fila vazia')
      else
        writeln('Nome do início: ', inicio^.prox^.dado);
    2:
      if fim^.ant = inicio then
        writeln('Fila vazia')
      else
        writeln('Nome do final: ', fim^.ant^.dado);
    3:
      if inicio^.prox = fim then
        writeln('Fila vazia')
      else
      begin
        aux := inicio^.prox;
        while aux <> fim do
        begin
          writeln('Elemento: ', aux^.dado);
          aux := aux^.prox;
        end;
      end;
  end;
  readln;
end;

begin
  cria_lista;
  op := 1;
  opi := 1;

  while op <> 0 do
  begin
    clrscr;
    writeln('0 - Sair');
    writeln('1 - Inserir');
    writeln('2 - Remover');
    writeln('3 - Consultar');
    readln(op);
    clrscr;

    case op of
      1:
      begin
        writeln('1 - Inserir no início');
        writeln('2 - Inserir no fim');
        readln(opi);
        leitura_nome(palavra);
        if opi = 1 then
          insere(palavra, true)
        else if opi = 2 then
          insere(palavra, false);
      end;
      2:
      begin
        writeln('1 - Remover do início');
        writeln('2 - Remover do fim');
        readln(opi);
        if opi = 1 then
          remove(true)
        else if opi = 2 then
          remove(false);
      end;
      3:
      begin
        writeln('1 - Consultar no início');
        writeln('2 - Consultar no fim');
        writeln('3 - Consultar a fila completa');
        readln(opi);
        acesso(opi);
      end;
    end;
  end;
end.