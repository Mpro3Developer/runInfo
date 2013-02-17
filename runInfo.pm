##
# Classe para calculo de tempo de execucao e uso de memoria 
# @author Matheus Castello
# http://mpro3.com.br
##

# "Classe"
package runInfo;

use strict vars;
use warnings;
use Time::HiRes qw( time );
#use Memory::Usage;

# variaveis
my $script_start;
my $script_end;

##
# Construtor
##
sub new
{
	my $class = shift;
	my $self = { };
	# propiedades privadas
	$self->{ELAPSED_TIME} = undef;
	$self->{MEMO} = undef;
	# emcapsulamento
	bless($self, $class);
	# iniciamos o "contaodor"
	$script_start = time();

	return $self;
}

##
# Ao terminar um processo chame para mostrar tempo </br>
# e memoria utilizada
# @return string
##
sub endRun
{
	my $self = shift;
	$script_end = time();
	$self->{ELAPSED_TIME} = $script_end - $script_start;
	# memoria
	
	if(!($^O eq "MSWin32"))
	{
		require "Proc/ProcessTable.pm";
		Proc::ProcessTable->import();
		my $t = Proc::ProcessTable->new;
		foreach my $got ( @{$t->table} ) 
		{
			next if not $got->pid eq $$;
			$self->{MEMO}  = $got->size;
		}
	}
	else
	{
		require "Win32/Process/Info.pm";
		Win32::Process::Info->import();
		my $t = Win32::Process::Info->new;
		my @i = $t->GetProcInfo( $$ );
		$self->{MEMO} = $i[0]->{"VirtualSize"};
	}
	
	return "Tempo utilizado ".$self->{ELAPSED_TIME}." secs. Uso de memoria ".$self->{MEMO}." bytes."
}

##
# Resgata valor do tempo decorrido do scritp em segundos
# @return double
##
sub getElapsedTime
{
	my $self = shift;
	return $self->{ELAPSED_TIME};
}

##
# Resgata o gasto de memoria em bytes
# @return int
##
sub getMemory
{
	my $self = shift;
	return $self->{MEMO};
}

1;
