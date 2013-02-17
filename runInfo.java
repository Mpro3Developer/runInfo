/**
 * Classe para calculo de tempo de execucao e uso de memoria
 * @author Matheus Castello
 * http://mpro3.com.br
 */
 
package mpro;

public class runInfo 
{
    public double _start;
    public double _end;
    private double _elapsed_time = 0.0;
    private long _memo;
    
    /**
     * Construtor
     * Pega tempo atual
     */
    public runInfo()
    {
        this._start = ((double)System.currentTimeMillis()) / 1000;
    }
    
    /**
     * Ao terminar um processo chame para mostrar tempo </br>
     * e memoria utilizada
     */
    public String endRun()
    {
        this._end = ((double)System.currentTimeMillis()) / 1000;
        this._elapsed_time = (double)(this._end - this._start);
        Runtime rm = Runtime.getRuntime();
        this._memo = rm.totalMemory();
        return "Tempo utilizado: " + this._elapsed_time + " secs. Uso de memória: " + this._memo + " bytes";
    }
    
    /**
     * Resgata valor do tempo decorrido do scritp em segundos
     */
    public double getElapsedTime()
    {
        return this._elapsed_time;
    }
    
    /**
     * Resgata o gasto de memoria em bytes
     */
    public long getMemory()
    {
        return this._memo;
    }
}
