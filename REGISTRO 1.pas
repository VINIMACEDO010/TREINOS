Program registro_1 ;
type
rfunc = record
  nome: string;
  funcao: string;
  salario: real;
  aumento: real;
end;
var
a: array [1..5] of rfunc;
i: integer;


Begin
  for i:=1 to 5 do
  begin
    writeln ('informe os dados do funcion�rio ', i, ':');
    write ('nome :');
    readln (a[i].nome);
    writeln ('informe a fun��o do funcion�rio ', i, ':');
    write ('fun��o :');
    readln (a[i].funcao);
    writeln ('informe o sal�rio do funcion�rio ', i, ':');
    write ('salario :');
    readln (a[i].salario);
    a[i].aumento:=((a[i].salario *0.1) + a[i].salario);
  end;
  clrscr;
  	for i:= 1 to 5 do
  		begin
  	 	 	writeln;
    		writeln ('Dados do funcion�rio ',i, ':');
   			writeln ('Nome: ', a[i].nome);
   			writeln ('fun��o: ', a[i].funcao);
    		writeln ('sal�rio antigo: R$', a[i].salario);
    		writeln ('sal�rio com reajuste de 10%: R$',	a[i].aumento);
  		end;  
End.