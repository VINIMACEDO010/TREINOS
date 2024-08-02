// ALUNOS: VINICIUS POLICARPO MACEDO E MISAEL SARDÁ

program Sistema_Impressora;

uses
  crt;

type
  tipo_inf = string;
  tipo_prioridade = byte;
  ptnodo = ^elemento;
  elemento = record
    dado: tipo_inf;
    prioridade: tipo_prioridade;
    num_copias: integer;
    prox: ptnodo;
    ant: ptnodo;
  end;
  copias_pessoas = record
    copias: integer;
    pessoas: integer;
  end;

var
  lista_mono, lista_color, lista_plotter, fim_mono, fim_color, fim_plotter: ptnodo;
  palavra: tipo_inf;
  num_copias, op, opi: integer;
  total_mono, total_color, total_plotter: copias_pessoas;

procedure leitura_nome(var inf: tipo_inf);
begin
  clrscr;
  writeln('Digite o nome do cliente desejado: ');
  readln(inf);
end;

procedure leitura_copias(var num_copias: integer);
begin
  writeln('Quantas cópias você precisa?');
  readln(num_copias);
end;

procedure cria_lista(var lista, fim: ptnodo);
begin
  lista := nil;
  fim := nil;
end;

procedure insere(var lista, fim: ptnodo; inf: tipo_inf; num_copias, prioridade: integer);
var
  novoNo: ptnodo;
begin
  new(novoNo);
  if novoNo = nil then
  begin
    writeln('Memória cheia. Não é possível adicionar mais elementos.');
    readkey;
  end
  else
  begin
    novoNo^.dado := inf;
    novoNo^.prioridade := prioridade;
    novoNo^.num_copias := num_copias;
    novoNo^.prox := nil;
    novoNo^.ant := fim;
    
    if lista = nil then
      lista := novoNo
    else
      fim^.prox := novoNo;    
    fim := novoNo;

    writeln('Impressão adicionada com sucesso!');
    readkey;
  end;
end;

procedure remove(var lista, fim: ptnodo);
var
  aux: ptnodo;
begin
  if lista = nil then
  begin
    writeln('Fila vazia');
    readkey;
  end
  else
  begin
    aux := lista;
    writeln('Impressão removida: ', aux^.dado);
    lista := lista^.prox;
    if lista <> nil then
      lista^.ant := nil
    else
      fim := nil;
    dispose(aux);
    readkey;
  end;
end;

procedure mostra_listas(lista: ptnodo; fim: ptnodo);
var
  aux_ord, aux_des: ptnodo;
begin
  clrscr;
  writeln('Impressão ordenada   |   Impressão desordenada');
  writeln;  
  aux_ord := lista;
  aux_des := fim;
  while (aux_ord <> nil) or (aux_des <> nil) do
  begin
    if aux_ord <> nil then
    begin
      write(aux_ord^.dado, '   |   ');
      aux_ord := aux_ord^.prox;
    end
    else
      write('          |   ');
    
    if aux_des <> nil then
    begin
      writeln(aux_des^.dado);
      aux_des := aux_des^.ant;
    end
    else
      writeln;
  end;
end;

procedure prioridade(var lista, fim: ptnodo; inf: tipo_inf; nova_prioridade: integer);
var
  atual, anterior, primeiro_priorizado, ultimo_priorizado: ptnodo;
begin
  atual := lista;
  anterior := nil;
  primeiro_priorizado := nil;
  ultimo_priorizado := nil;

  // Identifica o primeiro e o último elemento com prioridade 1
  while (atual <> nil) do
  begin
    if (atual^.prioridade = 1) then
    begin
      if (primeiro_priorizado = nil) then
        primeiro_priorizado := atual;
      ultimo_priorizado := atual;
    end;

    if atual^.dado = inf then
    begin
      // Remove o elemento da lista atual
      if anterior <> nil then
        anterior^.prox := atual^.prox
      else
        lista := atual^.prox;

      if atual^.prox <> nil then
        atual^.prox^.ant := anterior;

      // Adiciona o elemento na posição correta
      if ultimo_priorizado <> nil then
      begin
        // Insere após o último elemento com prioridade 1
        atual^.prox := ultimo_priorizado^.prox;
        atual^.ant := ultimo_priorizado;
        if ultimo_priorizado^.prox <> nil then
          ultimo_priorizado^.prox^.ant := atual;
        ultimo_priorizado^.prox := atual;
      end
      else
      begin
        // Insere no início da lista se não há elementos com prioridade 1
        atual^.prox := lista;
        atual^.ant := nil;
        if lista <> nil then
          lista^.ant := atual;
        lista := atual;
      end;
      atual^.prioridade := nova_prioridade;
    end;
    anterior := atual;
    atual := atual^.prox;
  end;

  // Atualiza o ponteiro para o fim da lista
  atual := lista;
  while (atual <> nil) and (atual^.prox <> nil) do
    atual := atual^.prox;
  fim := atual;
end;

begin
  op := 1;
  opi := 1;
  cria_lista(lista_mono, fim_mono);
  cria_lista(lista_color, fim_color);
  cria_lista(lista_plotter, fim_plotter);

  //Contadores
  total_mono.pessoas := 0;
  total_mono.copias := 0;
  total_color.pessoas := 0;
  total_color.copias := 0;
  total_plotter.pessoas := 0;
  total_plotter.copias := 0;

  while op <> 0 do
  begin
    clrscr;
    writeln('0 - Sair');
    writeln('1 - Adicionar Cliente na fila de impressão');
    writeln('2 - Remover impressão');
    writeln('3 - Mostrar fila de impressões');
    writeln('4 - Colocar prioridade em Impressão');
    readln(op);
    writeln;

    case op of
      1:
      begin
        opi := 1;
        while opi <> 0 do
        begin
          clrscr;
          writeln('0 - Voltar');
          writeln('1 - Impressora Mono');
          writeln('2 - Impressora Color');
          writeln('3 - Impressora Plotter');
          readln(opi);
          writeln;

          case opi of
            1:
            begin
              leitura_nome(palavra);
              leitura_copias(num_copias);
              insere(lista_mono, fim_mono, palavra, num_copias, 0);
              total_mono.pessoas := total_mono.pessoas + 1;
              total_mono.copias := total_mono.copias + num_copias;
            end;
            2:
            begin
              leitura_nome(palavra);
              leitura_copias(num_copias);
              insere(lista_color, fim_color, palavra, num_copias, 0);
              total_color.pessoas := total_color.pessoas + 1;
              total_color.copias := total_color.copias + num_copias;
            end;
            3:
            begin
              leitura_nome(palavra);
              leitura_copias(num_copias);
              insere(lista_plotter, fim_plotter, palavra, num_copias, 0);
              total_plotter.pessoas := total_plotter.pessoas + 1;
              total_plotter.copias := total_plotter.copias + num_copias;
            end;
          end;
          if opi <> 0 then
            opi := 1;
        end;
      end;
      2:
      begin
        clrscr;
        writeln('1 - Impressora Mono');
        writeln('2 - Impressora Color');
        writeln('3 - Impressora Plotter');
        readln(opi);
        writeln;

        case opi of
          1: remove(lista_mono, fim_mono);
          2: remove(lista_color, fim_color);
          3: remove(lista_plotter, fim_plotter);
        end;
      end;
      3:
      begin
        clrscr;
        writeln('0 - Voltar');
        writeln('1 - Impressora Mono');
        writeln('2 - Impressora Color');
        writeln('3 - Impressora Plotter');
        readln(opi);
        writeln;

        case opi of
          1:
          begin
            mostra_listas(lista_mono, fim_mono);
            writeln('Total de pessoas e cópias:');
            writeln('Pessoas: ', total_mono.pessoas, ' | Total de cópias: ', total_mono.copias);
            readkey;
          end;
          2:
          begin
            mostra_listas(lista_color, fim_color);
            writeln('Total de pessoas e cópias:');
            writeln('Pessoas: ', total_color.pessoas, ' | Total de cópias: ', total_color.copias);
            readkey;
          end;
          3:
          begin
            mostra_listas(lista_plotter, fim_plotter);
            writeln('Total de pessoas e cópias:');
            writeln('Pessoas: ', total_plotter.pessoas, ' | Total de cópias: ', total_plotter.copias);
            readkey;
          end;
        end;
      end;
      4:
      begin
        clrscr;
        writeln('0 - Voltar');
        writeln('1 - Impressora Mono');
        writeln('2 - Impressora Color');
        writeln('3 - Impressora Plotter');
        readln(opi);
        writeln;

        case opi of
          1:
          begin
            leitura_nome(palavra);
            prioridade(lista_mono, fim_mono, palavra, 1);
          end;
          2:
          begin
            leitura_nome(palavra);
            prioridade(lista_color, fim_color, palavra, 1);
          end;
          3:
          begin
            leitura_nome(palavra);
            prioridade(lista_plotter, fim_plotter, palavra, 1);
          end;
        end;
      end;
    end;
  end;
end.