/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   minishell.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nlegrand <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/01/30 12:00:33 by nlegrand          #+#    #+#             */
/*   Updated: 2023/03/13 10:42:39 by nlegrand         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minishell.h"

//int	main(int ac, char **av, char **envp)
//{
//	(void)av;
//	(void)envp;
//	t_msh	msh;
//
//	if (ac != 1)
//		return (0);
//	msh_setup(&msh);
//	printf("Minishell pid: %d\n", msh.pid);
//	while (1)
//	{
//		ft_putstr_fd(MSH_PROMPT, STDOUT_FILENO);
//		msh.cmdline = get_next_line(STDIN_FILENO);
//		if (msh.cmdline == NULL)
//			return (msh_terminate(&msh), 0);
//		free(msh.cmdline);
//	}
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
		msh.cmdline = readline(MSH_PROMPT);
		if (msh.cmdline == NULL)
			return (msh_terminate(&msh), 0);
		if (msh.cmdline && *(msh.cmdline))
			add_history(msh.cmdline);
		free(msh.cmdline);
	}
	return (0);
}
