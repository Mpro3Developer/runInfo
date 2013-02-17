#include <iostream>
#include "runInfo.h"
#include "runInfo.cpp"

using namespace std;

int main(void)
{
	int i;
	runInfo* run = new runInfo();

	// chamada
	for(i = 0; i < 50000; i++)
		cout << "printa" << endl;

	cout << run->endRun() << endl;

	return 0;
}
