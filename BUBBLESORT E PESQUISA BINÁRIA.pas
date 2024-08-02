program Pzim;

var
  i, n, aux, troca, chave, inicio, fim, meio: integer;
  a: array[1..100] of integer;

begin
  writeln('Informe a quantidade de elementos do vetor');
  readln(n);

  writeln('Vetor gerado:');
  for i := 1 to n do
  begin
    a[i] := random(100);
    write(a[i]:4);
  end;

  troca := 1;

  while troca > 0 do
  begin
    troca := 0;

    for i := 1 to n - 1 do
    begin
      if a[i] > a[i + 1] then
      begin
        aux := a[i];
        a[i] := a[i + 1];
        a[i + 1] := aux;
        troca := 1;
      end;
    end;
  end;

  writeln;
  writeln('Vetor Ordenado:');

  for i := 1 to n do
    write(a[i]:4);
  writeln;
		// até aqui é bubblesort 
		
		//aqui para baixo inicia pesquisa binária
		
		//adicionado as váriaveis - inicio, meio, fim, chave
  writeln('Informe a chave que deseja buscar no vetor:');
  readln(chave);

  inicio := 1;
  fim := n;
  meio := (inicio + fim) div 2;

  while (a[meio] <> chave) and (inicio <= fim) do
  begin
    if a[meio] < chave then
      inicio := meio + 1
    else if a[meio] > chave then
      fim := meio - 1;
    meio := (inicio + fim) div 2;
  end;

  if a[meio] = chave then
    writeln(chave, ' encontrado na posição ', meio)
  else
    writeln(chave, ' não encontrado no vetor');
end.

   