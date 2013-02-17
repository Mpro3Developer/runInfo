/**
 * Classe para calculo de tempo de execucao e uso de memoria
 * @author Matheus Castello
 * http://mpro3.com.br
 */
 
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mpro
{
    public class runInfo
    {
        public double _start;
        public double _end;
        private double _elapsed_time = 0.0;
        private long _memo;
        private static readonly DateTime jan1970 = new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc);

        /**
         * Construtor
         * */
        public runInfo()
        {
            this._start = (DateTime.UtcNow - jan1970).TotalMilliseconds / 1000;
        }

        /**
         * Ao terminar um processo chame para mostrar tempo </br>
         * e memoria utilizada
         * */
        public string endRun()
        {
            this._end = (DateTime.UtcNow - jan1970).TotalMilliseconds / 1000;
            this._elapsed_time = (double)(this._end - this._start);
            this._elapsed_time = Math.Round(this._elapsed_time, 5);
            this._memo = GC.GetTotalMemory(false);
            return "Tempo utilizado: " + this._elapsed_time + " secs. Uso de memória: " + this._memo + " bytes";
        }

        /**
         * Resgata valor do tempo decorrido do scritp em segundos
         * */
        public double getElapsedTime()
        {
            return this._elapsed_time;
        }

        /**
         * Resgata o gasto de memoria em bytes
         * */
        public long getMemory()
        {
            return this._memo;
        }
    }
}