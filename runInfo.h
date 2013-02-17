/**
 * Classe para calculo de tempo de execucao e uso de memoria
 * @author Matheus Castello
 * http://mpro3.com.br
 */

#pragma once
#include <iostream>
#include <string>
#include <sstream>

using namespace std;

#ifdef WIN32
#include <windows.h>
#include "psapi.h"
#pragma comment(lib, "psapi.lib")
#else
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>
#include <sys/resource.h>
#include "sys/types.h"
#include "sys/sysinfo.h"
#endif

class runInfo
{
private:
    int memo;
    double elapsed_time;
    double microtime();
    int parseLine(char*);
public:
    double script_start;
    double script_end;
    runInfo();
    string endRun();
    double getElapsedTime();
    int getMemory();
};
