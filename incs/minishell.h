/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   minishell.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nlegrand <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/01/30 12:01:59 by nlegrand          #+#    #+#             */
/*   Updated: 2023/02/12 09:26:13 by nlegrand         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef MINISHELL_H
# define MINISHELL_H

# include "libft.h"
# include <stdio.h>
# include <signal.h>
# include <unistd.h>
//# include <readline/readline.h>
//# include <readline/history.h>

# define MSH_PROMPT "minishell> " // lame... make it better

typedef struct s_msh		t_msh;
//typedef struct s_cmdline	t_cmdline;
//struct s_cmdline
//{
//	char	*line;
//}
struct s_msh
{
	int		pid;
	char	*cmdline; // might need struct later
};

// setup.c
void	msh_setup(t_msh	*msh);

// utils.c
void	msh_terminate(t_msh *msh);

#endif
