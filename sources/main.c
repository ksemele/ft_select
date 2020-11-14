#include "ft_select.h"

void 	ft_signals(int signal_no)
{
	ft_dprintf(2, "\n\e[1;31msignal_no \e[1;33m[%d]\e[m\n", signal_no);
}

void	ft_print_usage(void)
{
	ft_printf("USAGE:\n\t./ft_select [-r | --real] arg1 [arg2...]\n" \
				"\t(args - any files/directories/text labels)\n");
}

void	ft_print_args(int argc, char **argv)
{
	int		args;
	int		i;
	
	i = 1;
	args = argc - 1;
	while (args > 0)
	{
		ft_printf("%s\n", argv[i]);
		args--;
		i++;
	}
	//ft_printf("\n");
}

int		main(int argc, char **argv)
{
	ft_printf("\e[8;50;80t");
	if (argc < 2 || (argc == 2 && STRINGS_EQU == ft_strequ(argv[1], "-help")))
	{
		ft_printf("less args %s\n", argv[0]);
		ft_print_usage();
	}
	else
	{
		ft_printf("ok!\nigetenv name [%s]\n", getenv("TERM"));
		ft_printf("%d \n",ttyslot());
		ft_print_args(argc, argv);	
		signal(SIGINT, ft_signals);
	}
	sleep(10000);
	return (0);
}
