unit mpro;

interface

uses
  SysUtils,DateUtils;

{
 * Classe para calculo de tempo de execucao e uso de memoria
 * Free Pascall Linux
 * @author Matheus Castello
 * http://mpro3.com.br
 }
type runInfo = Object
	private
		elapsed_time:Double;
		memo:Cardinal;
	public
		_start:TDateTime;
		_end:TDateTime;
		constructor new;
		function endRun():string;
		function getElapsedTime():Double;
		function getMemory():Cardinal;
end;

implementation

{**
 * construtor
 *}
constructor runInfo.new;
begin
	self._start := Now;
end;

{**
 * Ao terminar um processo chame para mostrar tempo </br>
 * e memoria utilizada
 *}
function runInfo.endRun():string;
var
	_file:Text;
 	_str:String;
 	_strs:String;
 	_tmp:String;
 	i, p, r:integer;
begin
	self._end := Now;
	self.elapsed_time := (MilliSecondsBetween(self._end, self._start)) / 1000.0001;
	
	Assign(_file, '/proc/self/status');
 	Reset(_file);
 	while not EOF(_file) do
 	begin
 		Readln(_file, _strs);
 		_str := _str + _strs + '\n';
 		if Pos('VmSize:', _strs) > 0 then
 		begin
 			i := length(_strs);
 			r := 1;
 			for p := 1 to i do
 			begin
 				if (Ord(_strs[p]) >= 48) and (Ord(_strs[p]) <= 57) then
 				begin
					_tmp[r] := _strs[p];
					inc(r);
				end;
 			end;
 			_tmp[0] := chr(r);
			val(_tmp, i);
 			break;
		end;
 	end;
 	Close(_file);
 	self.memo := i * 1024;
 	
	endRun := 'Tempo utilizado: ' + FloatToStr(self.elapsed_time) + ' secs. Uso de memoria: ' + IntToStr(self.memo) + ' bytes ';
end;

{**
 * Resgata valor do tempo decorrido do script em segundos
 *}
function runInfo.getElapsedTime():Double;
begin
	getElapsedTime := self.elapsed_time;
end;

{**
 * Resgata o gasto de memoria em bytes
 * @return int
 *}
function runInfo.getMemory():Cardinal;
begin
	getMemory := self.memo;
end;

end.
