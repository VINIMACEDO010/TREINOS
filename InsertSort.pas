program Pzim;

var
  i, j, Tam, Caixa: integer;
  a: array[1..100] of integer;

begin
  writeln('Informe a quantidade de elementos do vetor');
  readln(Tam);
  
  // Inicializa o gerador de números aleatórios
  randomize;

  writeln('Vetor gerado:');
  for i := 1 to Tam do
  begin
    a[i] := random(100);
    write(a[i]:4);
  end;

  // Algoritmo Insertion Sort para ordenar o vetor
  for i := 2 to Tam do
  begin
    Caixa := a[i];
    j := i - 1;

    // Move os elementos de a[1..i-1], que são maiores que a[i], para uma posição à frente
    while (j > 0) and (a[j] > caixa) do
    begin
      a[j + 1] := a[j];
      j := j - 1;
    end;
    a[j + 1] := caixa;
  end;

  writeln;
  writeln('Vetor Ordenado:');

  for i := 1 to Tam do
    write(a[i]:4);
  writeln;

  writeln;
  write('Clique qualquer tecla para sair');
  readln;
end.