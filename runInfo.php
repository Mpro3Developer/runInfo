<?php

/** 
 * Classe para calculo de tempo de execucao e uso de memoria 
 * @author Matheus Castello
 * http://mpro3.com.br
 */
class runInfo {
	
	public $script_start;
	public $script_end;
	private $elapsed_time;
	private $memo;
	
	/**
	 * construtor
	 */
	function __construct()
	{
		// Iniciamos o "contador"
		list($usec, $sec) = explode(' ', microtime());
		$this->script_start = (float) $sec + (float) $usec;
	}
	
	/**
	 * Ao terminar um processo chame para mostrar tempo </br>
	 * e memoria utilizada
	 * @return string
	 */
	public function endRun()
	{
		list($usec, $sec) = explode(' ', microtime());
		$this->script_end = (float) $sec + (float) $usec;
		$this->elapsed_time = round($this->script_end - $this->script_start, 5);
		$this->memo = memory_get_usage();
		return 'Tempo utilizado: '.$this->elapsed_time. ' secs. Uso de memória: '.$this->memo. ' bytes';
	}
	
	/**
	 * Resgata valor do tempo decorrido do scritp em segundos
	 * @return int
	 */
	public function getElapsedTime()
	{
		return $this->elapsed_time;
	}
	
	/**
	 * Resgata o gasto de memoria em bytes
	 * @return int
	 */
	public function getMemory()
	{
		return $this->memo;
	}
}

?>