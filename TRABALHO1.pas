program RestauranteBuffet;

uses
  crt;

type
  Cliente = record
    tipo: string;
    valorConta: real;
    formaPagamento: string;
  end;

  Fila = array[1..100] of Cliente;
  Lista = array[1..100] of integer;

var
  filaAtendimento: Fila;
  totalAtendidos: integer;

function filaVazia(f: Fila): boolean;
begin
  filaVazia := totalAtendidos = 0;
end;

procedure enfileira(var f: Fila; var totalAtendidos: integer; c: Cliente);
begin
  totalAtendidos := totalAtendidos + 1;
  f[totalAtendidos] := c;
end;

function desenfileira(var f: Fila; var totalAtendidos: integer): Cliente;
var
  i: integer;
  temp: Cliente;
begin
  if totalAtendidos > 0 then
  begin
    temp := f[1];
    for i := 1 to totalAtendidos - 1 do
      f[i] := f[i + 1];
    totalAtendidos := totalAtendidos - 1;
    desenfileira := temp;
  end
  else
  begin
    // Retorna um cliente vazio se a fila estiver vazia
    temp.tipo := '';
    temp.valorConta := 0;
    temp.formaPagamento := '';
    desenfileira := temp;
  end;
end;

procedure lerElemento(var elem: Cliente);
begin
  writeln('Digite o tipo do cliente (VIP, preferencial ou outros): ');
  readln(elem.tipo);
  writeln('Digite o valor da conta: ');
  readln(elem.valorConta);
  writeln('Digite a forma de pagamento (dinheiro ou cartao): ');
  readln(elem.formaPagamento);
end;

procedure escreveFila(fila: Fila; totalAtendidos: integer);
var
  i: integer;
begin
  writeln('Fila de atendimento:');
  for i := 1 to totalAtendidos do
  begin
    writeln('Cliente ', i, ':');
    writeln('  Tipo: ', fila[i].tipo);
    writeln('  Valor da conta: ', fila[i].valorConta:0:2);
    writeln('  Forma de pagamento: ', fila[i].formaPagamento);
  end;
end;

procedure removerFila(var fila: Fila; var totalAtendidos: integer);
begin
  if not filaVazia(fila) then
    desenfileira(fila, totalAtendidos)
  else
    writeln('Fila vazia!');
end;

procedure consultarFila(var fila: Fila; totalAtendidos: integer);
begin
  escreveFila(fila, totalAtendidos);
end;

procedure inserirCliente(var fila: Fila; var totalAtendidos: integer);
var
  elem: Cliente;
begin
  lerElemento(elem);
  enfileira(fila, totalAtendidos, elem);
end;

var
  opcao: integer;

begin
  totalAtendidos := 0;

  repeat
    clrscr;
    writeln('    MENU    ');
    writeln('------------');
    writeln;
    writeln(' 1. Inserir cliente');
    writeln(' 2. Remover cliente da fila');
    writeln(' 3. Consultar fila de atendimento');
    writeln(' 4. Mostrar fila de atendimento');
    writeln(' 5. Sair');
    writeln;
    write(' ==> ');
    readln(opcao);
    writeln;

    case opcao of
      1: inserirCliente(filaAtendimento, totalAtendidos);
      2: removerFila(filaAtendimento, totalAtendidos);
      3: consultarFila(filaAtendimento, totalAtendidos); // Corrigido aqui
      4: escreveFila(filaAtendimento, totalAtendidos);
    end;

    writeln;
    writeln('Pressione qualquer tecla para continuar...');
    readkey;
  until opcao = 5;
end.
