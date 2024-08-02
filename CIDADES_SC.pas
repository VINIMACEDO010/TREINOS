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
    lista: ptnodo;
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
        writeln('Cidades removido: ', atual^.dado);
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
    conta_elementos := i;
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
                   writeln(conta_elementos(lista), ' cidades'); 
                   readkey;
               end;
        end;
    end;
end.