/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   setup.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nlegrand <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/02/12 06:25:47 by nlegrand          #+#    #+#             */
/*   Updated: 2023/02/12 07:19:04 by nlegrand         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minishell.h"

void	msh_init_vars(t_msh *msh)
{
	msh->pid = -2;
	msh->cmdline = NULL;
}

void	msh_setup(t_msh *msh)
{
	msh_init_vars(msh);
	msh->pid = getpid();
	//create_handles(msh);
}
