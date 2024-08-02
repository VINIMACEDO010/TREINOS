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
    writeln ('informe os dados do funcionário ', i, ':');
    write ('nome :');
    readln (a[i].nome);
    writeln ('informe a função do funcionário ', i, ':');
    write ('função :');
    readln (a[i].funcao);
    writeln ('informe o salário do funcionário ', i, ':');
    write ('salario :');
    readln (a[i].salario);
    a[i].aumento:=((a[i].salario *0.1) + a[i].salario);
  end;
  clrscr;
  	for i:= 1 to 5 do
  		begin
  	 	 	writeln;
    		writeln ('Dados do funcionário ',i, ':');
   			writeln ('Nome: ', a[i].nome);
   			writeln ('função: ', a[i].funcao);
    		writeln ('salário antigo: R$', a[i].salario);
    		writeln ('salário com reajuste de 10%: R$',	a[i].aumento);
  		end;  
End.