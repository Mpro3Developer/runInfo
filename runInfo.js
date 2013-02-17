/**
 * Classe para calculo de tempo de execucao e uso de memoria
 * @author Matheus Castello
 * http://mpro3.com.br
 */
 
 /**
  * Construtor
 **/
 function runInfo()
 {
	this._start = 0.0;
	this._end = 0.0;
	var elapsed_time = 0.0;
	var memo = 0;
	
	this._start = (new Date()).getMilliseconds() / 1000.0001;
	
	/**
	  * Ao terminar um processo chame para mostrar tempo </br>
           * e memoria utilizada
           * */
	this.endRun = function()
	{
		this._end = (new Date()).getMilliseconds() / 1000.0001;
		elapsed_time = this._end - this._start;
		/*
		 * Roda no Chrome com o flag --enable-memory-info
		 */
		memo = window.performance.memory.usedJSHeapSize;
		return "Tempo utilizado: " + elapsed_time + " secs. Uso de memória: " + memo + " bytes";
	};
	
	/**
	 * Resgata valor do tempo decorrido do scritp em segundos
	 * */
	this.getElapsedTime = function()
	{
		return elapsed_time;
	}
	
	/**
	 * Resgata o gasto de memoria em bytes
	 * */
	this.getMemory = function()
	{
		return memo;
	}
 }