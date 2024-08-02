program registro_2;

type
  ralunos = record
    nome: string;
    cpf: string;
    curso: string;
    media_aluno: real;
  end;

var
  a: array[1..10] of ralunos;
  i, contador: integer;
  aux, soma_media_turma: real;

begin
  contador := 0;
  soma_media_turma := 0;

  for i := 1 to 10 do
  begin
    writeln('Informe o nome do aluno ', i, ':');
    write('Nome: ');
    readln(a[i].nome);

    writeln('Informe o CPF do aluno ', i, ':');
    write('CPF: ');
    readln(a[i].cpf);

    writeln('Informe o curso do aluno ', i, ':');
    write('Curso: ');
    readln(a[i].curso);

    writeln('Informe a m�dia do aluno ', i, ':');
    write('M�dia do aluno: ');
    readln(a[i].media_aluno);

    soma_media_turma := soma_media_turma + a[i].media_aluno;
		clrscr;
    writeln; 
  end;

  aux := soma_media_turma / 10;

  writeln('Dados dos alunos:');
  for i := 1 to 10 do
  begin
    writeln('Aluno ', i, ':');
    writeln('Nome: ', a[i].nome);
    writeln('CPF: ', a[i].cpf);
    writeln('Curso: ', a[i].curso);
    writeln('M�dia do aluno: ', a[i].media_aluno);

    if a[i].media_aluno > aux then
    begin
      writeln('O aluno ', i, ' ultrapassou a m�dia da turma!');
      contador := contador + 1;
    end
    else
      writeln('O aluno ', i, ' n�o ultrapassou a m�dia da turma!');

    writeln; 
  end;

  writeln('O total de alunos que possuem m�dia superior � m�dia da turma �: ', contador);
  writeln('A m�dia final da turma �: ', aux);
end.



