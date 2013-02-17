unit mpro;

interface

uses
  PsApi, SysUtils,DateUtils, windows;

{
 * Classe para calculo de tempo de execucao e uso de memoria
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
	pmc: TProcessMemoryCounters;
begin
	self._end := Now;
	self.elapsed_time := (MilliSecondsBetween(self._end, self._start)) / 1000.0001;
	GetProcessMemoryInfo(GetCurrentProcess, @pmc, SizeOf(pmc));
	self.memo := pmc.WorkingSetSize;
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