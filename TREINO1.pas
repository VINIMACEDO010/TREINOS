Program teste ;
var l,c: integer;
a: array [1..3,1..3] of integer;

Begin
 		for l:= 1 to 3 do
  	for c:= 1 to 3 do
  	a[l,c]:= random (100);
   for l:= 1 to 3 do
    begin
     for c:= 1 to 3 do // gera a matriz
    write(a[l,c]:3);
    writeln;
   end;
   
   writeln ('números impares da matriz: ');
    	for l:= 1 to 3 do
    		begin
    			 for c:= 1 to 3 do
    			 begin
      		if (a[l,c]mod 2) <> 0 then
      		 write(a[l,c]:3);
      		 writeln;
      	end;
      end;
     
		 writeln ('números pares da matriz: ');
		  for l:= 1 to 3 do
			 begin
			  for c:= 1 to 3 do
				 begin
				  if (a[l,c]mod 2) = 0 then
					write (a[l,c]:3);
					writeln;
			 end;
		end; 
      
    
End.