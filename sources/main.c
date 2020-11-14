#include "ft_select.h"

void 	ft_signals(int signal_no)
{
	ft_dprintf(2, "\n\e[1;31msignal_no \e[1;33m[%d]\e[m\n", signal_no);
}

int		main(int argc, char **argv)
{
	if (argc < 2)
	{
		ft_printf("less args %s\n", argv[0]);
	}
	else
	{
		ft_printf("ok!\n");
		signal(SIGINT, ft_signals);
	}
	sleep(10000);
	return (0);
}
