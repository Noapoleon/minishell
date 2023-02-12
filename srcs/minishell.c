/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   minishell.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nlegrand <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/01/30 12:00:33 by nlegrand          #+#    #+#             */
/*   Updated: 2023/02/12 10:27:40 by nlegrand         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minishell.h"

// Unimportant function :]
//int	main(int ac, char **av, char **envp)
//{
//	(void)ac;
//	(void)av;
//	(void)envp;
//
//	char	*line;
//
//	ft_printf("best minishell ever!\n");
//	line = readline(MSH_PROMPT); // lmaooo 200K still reachables
//	printf("readline -> %s\n", line);
//	free(line);
//	return (0);
//}

int	main(int ac, char **av, char **envp)
{
	(void)av;
	(void)envp;
	t_msh	msh;

	if (ac != 1)
		return (0);
	msh_setup(&msh);
	printf("Minishell pid: %d\n", msh.pid);
	while (1)
	{
		ft_putstr_fd(MSH_PROMPT, STDOUT_FILENO);
		msh.cmdline = get_next_line(STDIN_FILENO);
		if (msh.cmdline == NULL)
			return (msh_terminate(&msh), 0);
		free(msh.cmdline);
	}
	return (0);
}
