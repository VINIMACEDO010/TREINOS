program cidades_sc;

uses
  crt;

type 
    tipo_inf = string; 
    ptnodo = ^elemento;
    elemento = record
        dado: tipo_inf;
        prox: ptnodo;
        ant: ptnodo;
    end;

var 
    lista, fim: ptnodo;
    palavra: tipo_inf; 
    op: byte;

procedure leitura(var inf: tipo_inf);
begin
    clrscr;
    writeln('Digite a cidade de Santa Catarina em letra minuscula: ');
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

        if anterior = nil then // início da lista
        begin
            novoNo^.prox := lista;
            novoNo^.ant := nil; // o novo nó será o primeiro, então o anterior dele é nil
            if lista <> nil then
                lista^.ant := novoNo; // atualiza o ponteiro anterior do nó atual para o novo nó
            lista := novoNo;
        end
        else // meio ou final da lista
        begin
            novoNo^.prox := atual;
            novoNo^.ant := anterior;
            anterior^.prox := novoNo;
            if atual <> nil then
                atual^.ant := novoNo;
        end;

        // Atualiza a variável 'fim'
        if novoNo^.prox = nil then
            fim := novoNo
        else if novoNo^.prox = lista then
            fim := novoNo;
    end;
end;


procedure remove_elemento(var lista: ptnodo; inf: tipo_inf);
var
    atual, anterior: ptnodo;
begin
    atual := lista;
    anterior := nil;

    while (atual <> nil) and (atual^.dado <> inf) do
    begin
        anterior := atual;
        atual := atual^.prox;
    end;

    if atual = nil then
    begin
        writeln('Cidade não encontrada na lista');
        readkey;
    end
    else
    begin
        if anterior = nil then
            lista := atual^.prox
        else
            anterior^.prox := atual^.prox;
        if atual^.prox <> nil then
            atual^.prox^.ant := anterior;
        writeln('Cidades removido: ', atual^.dado);
        dispose(atual);
        readkey;
    end;
end;


function conta_ordenado(lista: ptnodo): byte;   
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
    conta_ordenado := i;
end;


function conta_desordenado(lista: ptnodo): byte;
var
    aux: ptnodo;
    i: byte;
begin
    if lista = nil then
        i := 0
    else
    begin
        i := 0;
        aux := fim; // Começa do final da lista
        // Percorre de trás para frente imprimindo as cidades
        while aux <> nil do
        begin
            i := i + 1;
            writeln(i, ' - ', aux^.dado);
            aux := aux^.ant; 
        end;
    end;
    conta_desordenado := i;
end;
begin
    op := 1;
    cria_lista(lista);
    while op <> 0 do
    begin
        clrscr;
        writeln('0 - Sair');
        writeln('1 - Insira Cidade');
        writeln('2 - Remova Cidade');
        writeln('3 - Contar Cidades');
        readln(op);
       
        writeln;
        
        case op of
            1: begin
                   leitura(palavra);
                   insere(lista, palavra);
               end;
            2: begin
                   leitura(palavra);
                   remove_elemento(lista, palavra);
               end;
            3: begin
            			 writeln('Cidades ordenadas');
            			 writeln;
                   writeln(conta_ordenado(lista), ' cidades');
                   writeln;
                   writeln('Cidades desordenadas');
                   writeln(conta_desordenado(fim), ' cidades');
                   readkey;
               end;
        end;
    end;
end.
