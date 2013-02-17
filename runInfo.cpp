/**
 * Classe para calculo de tempo de execucao e uso de memoria
 * @author Matheus Castello
 * http://mpro3.com.br
 */

#include "runInfo.h"

/**
 * construtor
 */
runInfo::runInfo()
{
    // iniciamos o "contador"
    this->script_start = this->microtime();
}

/**
 * Retorna o tempo com precisao
 * @return double
 */
double runInfo::microtime()
{
    #ifdef WIN32
    LARGE_INTEGER t, f;
    QueryPerformanceCounter(&t);
    QueryPerformanceFrequency(&f);
    return (double)t.QuadPart/(double)f.QuadPart;
    #else
    struct timeval t;
    struct timezone tzp;
    gettimeofday(&t, &tzp);
    return t.tv_sec + t.tv_usec * 1e-6;
    #endif
}

/**
 * Retorna
 * @return int
 */
int runInfo::parseLine(char* line)
{
        int i = strlen(line);
        while (*line < '0' || *line > '9') line++;
        line[i-3] = '\0';
        i = atoi(line) * 1024;
        return i;
}

/**
 * Ao terminar um processo chame para mostrar tempo </br>
 * e memoria utilizada
 * @return string
 */
string runInfo::endRun()
{
    this->script_end = this->microtime();
    this->elapsed_time = (double)(this->script_end - this->script_start);
    ostringstream m, t;
    #ifdef WIN32
    PROCESS_MEMORY_COUNTERS pmc;
    GetProcessMemoryInfo(GetCurrentProcess(), &pmc, sizeof(pmc));
    SIZE_T virtualMemUsedByMe = pmc.WorkingSetSize;
    this->memo = virtualMemUsedByMe;
    m << this->memo; t << this->elapsed_time;
    return "Tempo utilizado: " + t.str() + " secs. Uso de memoria: " + m.str() + " bytes";
    #else
    struct sysinfo memInfo;
    FILE* file = fopen("/proc/self/status", "r");
    int result = -1;
    char line[128];
    while (fgets(line, 128, file) != NULL)
    {
	if (strncmp(line, "VmSize:", 7) == 0)
	{
		result = parseLine(line);
		break;
	}
    }
    fclose(file);
    this->memo = result;
    m << this->memo; t << this->elapsed_time;
    return "Tempo utilizado: " + t.str() + " secs. Uso de memoria: " + m.str() + " bytes";
    #endif
}

/**
 * Resgata valor do tempo decorrido do script em segundos
 * @return double
 */
double runInfo::getElapsedTime()
{
    return this->elapsed_time;
}

/**
 * Resgata o gasto de memoria em bytes
 * @return int
 */
int runInfo::getMemory()
{
    return this->memo;
}
