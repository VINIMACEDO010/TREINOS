program pilha;

uses
  crt;

type 
    tipo_inf = integer;
    ptnodo = ^elemento;
    elemento = record
        dado: tipo_inf;
        prox: ptnodo
    end;

var 
    topo: ptnodo;
    num: tipo_inf;
    op: byte;

procedure leitura(var inf: tipo_inf);
begin
    clrscr;
    writeln('Digite o número: ');
    readln(inf);
end;

procedure cria_pilha(var pilha: ptnodo);
begin
    pilha := nil;
end;

procedure empilha(var pilha: ptnodo; inf: tipo_inf);
var
    novoNo: ptnodo;
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
        novoNo^.prox := pilha;
        pilha := novoNo;
    end;
end;

procedure desempilha(var pilha: ptnodo);
var
    aux: ptnodo;
begin
    if pilha = nil then 
    begin
        writeln('Pilha vazia');
        readkey;
    end
    else
    begin                                                                  
        aux := pilha;                                                                                                                 
        writeln('Elemento removido: ', aux^.dado);
        pilha := aux^.prox;
        dispose(aux);
        readkey;
    end;
end;

function conta_elementos(pilha: ptnodo): byte;   
var
    aux: ptnodo;
    i: byte;
begin
    if pilha = nil then
        i := 0
    else
    begin
        i := 0;
        aux := pilha;
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
    cria_pilha(topo);
    while op <> 0 do
    begin
        clrscr;
        writeln('0 - Sair');
        writeln('1 - Empilhar');
        writeln('2 - Desempilhar');
        writeln('3 - Contar Elementos');
        readln(op);
       
        writeln;
        case op of
            1: begin
                   leitura(num);
                   empilha(topo, num);
               end;
            2: begin
                   desempilha(topo);
               end;
            3: begin
                   writeln(conta_elementos(topo), ' elementos');
                   readkey;
               end;
        end;
    end;
end.
