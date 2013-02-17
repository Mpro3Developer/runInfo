Program MainProgram;

Uses 
	mpro;

Var 
	i:Cardinal;
	run:runInfo;
	
Begin
	run.New;
	For i := 0 To 5000 do
	begin
		writeln('printa');
	end;
	writeln(run.endRun());
End.