program DEQUE_VETOR;

uses crt;

const
  MAX = 5;  // Capacidade máxima do deque

type
  tipo_inf = string;
  elemento = record
    dado: tipo_inf;
  end;

var
  deque: array[1..MAX] of elemento;
  inicio, fim: integer;
  palavra: tipo_inf;
  op, opi: integer;
  num_elementos: integer; // Contador de elementos no deque

procedure leitura_nome(var inf: tipo_inf);
begin
  writeln('Digite o nome do cliente desejado: ');
  readln(inf);
end;

procedure cria_lista;
var
  i: integer;
begin
  inicio := 1;
  fim := 0;
  num_elementos := 0;
  // Inicializa todos os elementos do vetor como vazios
  for i := 1 to MAX do
    deque[i].dado := '';
end;

procedure insere(inf: tipo_inf; inicio_flag: boolean);
begin
  if num_elementos = MAX then
    writeln('Memória cheia. Não é possível adicionar mais elementos.')
  else
  begin
    if inicio_flag then
    begin
      if inicio = 1 then
        inicio := MAX
      else
        inicio := inicio - 1;
      deque[inicio].dado := inf;
    end
    else
    begin
      if fim = MAX then
        fim := 1
      else
        fim := fim + 1;
      deque[fim].dado := inf;
    end;
    num_elementos := num_elementos + 1;
    writeln('Elemento adicionado com sucesso!');
  end;
end;

procedure remove(inicio_flag: boolean);
begin
  if num_elementos = 0 then
    writeln('Fila vazia')
  else
  begin
    if inicio_flag then
    begin
      writeln('Elemento removido: ', deque[inicio].dado);
      deque[inicio].dado := ''; // Marca o elemento como vazio
      if inicio = MAX then
        inicio := 1
      else
        inicio := inicio + 1;
    end
    else
    begin
      writeln('Elemento removido: ', deque[fim].dado);
      deque[fim].dado := ''; // Marca o elemento como vazio
      if fim = 1 then
        fim := MAX
      else
        fim := fim - 1;
    end;
    num_elementos := num_elementos - 1;
  end;
end;

procedure acesso(opi: integer);
var
  i, pos: integer;
begin
  case opi of
    1:
      if num_elementos = 0 then
        writeln('Fila vazia')
      else
        writeln('Elemento no início: ', deque[inicio].dado);
    2:
      if num_elementos = 0 then
        writeln('Fila vazia')
      else
        writeln('Elemento no final: ', deque[fim].dado);
    3:
      if num_elementos = 0 then
        writeln('Fila vazia')
      else
      begin
        pos := inicio;
        for i := 1 to num_elementos do
        begin
          writeln('Elemento : ', deque[pos].dado);
          if pos = MAX then
            pos := 1
          else
            pos := pos + 1;
        end;
      end;
  end;
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
        readln; // Espera o usuário apertar Enter para continuar
      end;
    end;
  end;
end.