/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_client.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ide-spir <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/07/01 11:39:01 by ide-spir          #+#    #+#             */
/*   Updated: 2022/07/01 13:21:44 by ide-spir         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <signal.h>
#include "libft/libft.h"

void	ft_client(int pid, char *str)
{
	int	zero;

	while (*str)
	{
		zero = 7;
		while (zero >= 0)
		{
			if (*str >> zero & 1)
				kill(pid, SIGUSR1);
			else
				kill(pid, SIGUSR2);
			usleep(100);
			zero--;
		}
		str++;
	}
}

int	main(int args, char **argv)
{
	int	pid;

	if (args == 3)
	{
		pid = ft_atoi(argv[1]);
		ft_client(pid, argv[2]);
	}
	return (0);
}
