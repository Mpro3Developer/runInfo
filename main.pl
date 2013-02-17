
# importa a "classe"
use runInfo;

$r = runInfo->new();

#codigo a ser benmarcado
for($i = 0; $i < 5000; $i++)
{
	print "printa\n";
}

print $r->endRun()."\n";