PROGRAM lista_um;

CONST
    max = 99999;

TYPE
    vet = array[1..max] of integer;

VAR
    lista: vet;
    escolha, tamanho, limite, valor: integer;

PROCEDURE inserir_na_fila(VAR pLista: vet; VAR valor, pTamanho: integer);
BEGIN
    Inc(pTamanho);
    Inc(valor);
    pLista[pTamanho] := valor;
END;

PROCEDURE desenfileirar(VAR pLista: vet; VAR pTamanho, valor: integer);
VAR
    indice: integer;
BEGIN  
    for indice := 2 to pTamanho do
        pLista[indice - 1] := pLista[indice];
    pTamanho := pTamanho - 1;                         
END;

PROCEDURE consultar_primeiro(pLista: vet);
BEGIN
    clrscr;
    writeln('O primeiro número é = [', pLista[1], ']');
END;

PROCEDURE escrever_fila(pLista: vet; pTamanho: integer);
VAR
    indice: integer;
BEGIN
    clrscr;
    writeln('A fila = ');
    for indice := 1 to pTamanho do
        write('[', pLista[indice], ']');
    writeln;
END;

BEGIN
    writeln('Digite o tamanho da sua fila = '); 
    readln(limite);
    tamanho := 0; // Inicializa o tamanho da fila como zero

    repeat
        writeln('Selecione a operação que deseja realizar =');
        writeln('[1] Enfileirar');
        writeln('[2] Desenfileirar');
        writeln('[3] Consultar o primeiro da fila');
        writeln('[4] Escrever a fila');
        writeln('[5] Sair');
        readln(escolha);
        clrscr;

        case escolha of
            1: begin
                   if tamanho >= limite then
                   begin
                       writeln('A fila está cheia!!');
                       readkey;
                   end
                   else
                       inserir_na_fila(lista, valor, tamanho);
               end;
            2: desenfileirar(lista, tamanho, valor);
            3: consultar_primeiro(lista);
            4: escrever_fila(lista, tamanho);
        end;
    until escolha = 5; // Sai do loop quando a opção 5 é escolhida
END.
