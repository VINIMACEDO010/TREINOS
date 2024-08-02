program Pzim;

var
i, j, Tam, MenorDado, aux: integer;
a: array[1..100] of integer;

begin
  writeln('Informe a quantidade de elementos do vetor');
  readln(Tam);
  
  writeln('Vetor gerado:');
  for i := 1 to tam do
  begin
    a[i] := random(100);
    write(a[i]:4);
  end;
  
  // Algoritmo Selection Sort para ordenar o vetor
  for i := 1 to Tam - 1 do
  begin
    MenorDado := i;
    for j := i + 1 to Tam do
    begin
      if a[j] < a[MenorDado] then
      MenorDado := j;
    end;
    
    // Troca o menor elemento encontrado com o primeiro elemento da sublista não ordenada
    if MenorDado <> i then
    begin
      aux := a[i];
      a[i] := a[MenorDado];
      a[MenorDado] := aux;
    end;
  end;
  
  writeln;
  writeln('Vetor Ordenado:');
  
  for i := 1 to Tam do
  write(a[i]:4);
  Writeln;
  writeln;
  Write ('Clique qualquer tecla para sair');
  Readln;
end.