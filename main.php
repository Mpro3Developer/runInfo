<?php
	include "runInfo.php";
	
	$run = new runInfo();
	for($i = 0; $i < 50000; $i++)
	{
		echo "Printa\n";
	}
	echo $run->endRun();
?>