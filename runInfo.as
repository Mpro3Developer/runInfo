/**
 * Classe para calculo de tempo de execucao e uso de memoria
 * @author Matheus Castello
 * http://mpro3.com.br
 */

package mpro
{
	import flash.system.System;
	
	public class runInfo
	{
		public var _start:Number;
		public var _end:Number;
		private var elapsed_time:Number;
		private var memo:int;
		
		/**
		 * Construtor
		 * */
		public function runInfo()
		{
			this._start = (new Date()).milliseconds / 1000.0001;
		}
		
		/**
		 * Ao terminar um processo chame para mostrar tempo </br>
		 * e memoria utilizada
		 * */
		public function endRun():String
		{
			this._end = (new Date()).milliseconds / 1000.0001;
			this.elapsed_time = this._end - this._start;
			this.memo = System.totalMemory;
			return "Tempo utilizado: " + this.elapsed_time + " secs. Uso de memória: " + this.memo + " bytes";
		}
		
		/**
		 * Resgata valor do tempo decorrido do scritp em segundos
		 * */
		public function getElapsedTime():Number
		{
			return this.elapsed_time;
		}
		
		/**
		 * Resgata o gasto de memoria em bytes
		 * */
		public function getMemory():int
		{
			return this.memo;
		}
	}
}