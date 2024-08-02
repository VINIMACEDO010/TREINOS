program conjunto;
uses crt;
const max=12;
type
  vetor=array[1..max] of integer;
  tstr30=string[30];

var
  a,b,c,d,e:vetor;
  lin,n,m,tc,td,te:integer;


procedure desenha(lin:integer);
var d_i:integer;

begin
    {desenha vetor}
    gotoxy(1,lin);
    for d_i:=1 to (max*4-3) do
         write(chr(196));
    gotoxy(1,lin+1);
    for d_i:=1 to max do
         write(chr(179),'   ');
    gotoxy(1,lin+2);
    for d_i:=1 to (max*4-3) do
         write(chr(196));
end;

procedure cabec(msg:tstr30;linha:integer);

begin
     gotoxy (1,linha-1);
		 writeln(msg);
     desenha(linha);
end;


procedure le_vetor(var v:vetor;tam,lin:integer);
var d_i:integer;
begin
    for d_i:=1 to tam do
    begin
        gotoxy(3*(d_i)+d_i-1,lin);
        read(v[d_i])
    end;
end;

procedure esc_vetor(v:vetor;tam,lin:integer);
var d_i:integer;
begin
    for d_i:=1 to tam do
    begin
        gotoxy(3*(d_i)+d_i-1,lin);
        write(v[d_i]);
    end;

end;


function pertence(elem:integer; vet_proc: vetor; tvet_proc:integer): boolean;
var i:integer;

begin
    pertence:=false;
    for i:=1 to tvet_proc do
         if elem=vet_proc[i] then
            pertence:=true;
end;

procedure uniao(v1,v2:vetor;tv1,tv2:integer;var vu:vetor;var tvu:integer);

var i,j:integer;
begin
    for i:=1 to tv1 do
        vu[i]:=v1[i];
    tvu:=tv1;
    for j:=1 to tv2 do
    begin
       if not pertence(v2[j],vu,tvu) then
       begin
          tvu:=tvu+1;
          vu[tvu]:=v2[j]
       end;
    end;
end;

procedure inters(v1,v2:vetor;tv1,tv2:integer; var vi:vetor;var tvi:integer);
var j:integer;

begin
    tvi:=0;
    for j:=1 to tv2 do
    begin
       if pertence(v2[j],v1,tv1) then
       begin
          tvi:=tvi+1;
          vi[tvi]:=b[j]
       end;
    end;
end;

procedure difer(v1,v2:vetor;tv1,tv2:integer;var vd:vetor;var tvd:integer);
var i:integer;

begin
    tvd:=0;
    for i:=1 to tv1 do
    begin
       if not pertence(v1[i],v2,tv2) then
       begin
          tvd:=tvd+1;
          vd[tvd]:=a[i]
       end;
    end;
end;


begin
    clrscr;
    writeln('Digite N e M');
    repeat
        readln(n,m)
    until (n<=max) and (m<=max);
    clrscr;
    {leitura do vetor A}
    cabec('VALORES DE A',2);
    le_vetor(a,n,3);
		writeln;

    {leitura do vetor B}
    cabec('VALORES DE B',6);
    le_vetor(b,m,7);
    writeln;

    {UNIAO}
    uniao(a,b,n,m,c,tc);
    cabec('CONJUNTO UNIAO',11);
    esc_vetor(c,tc,12);
    writeln;

    {INTERSECCAO}
    inters(a,b,n,m,d,td);
    cabec('CONJUNTO INTERSECCAO',15);
    esc_vetor(d,td,16);
    writeln;

    {DIFERENCA}
    difer(a,b,n,m,e,te);
    cabec('CONJUNTO DIFERENCA',19);
    esc_vetor(e,te,20);
    readkey;
end.

