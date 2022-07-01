/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_server.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ide-spir <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/07/01 13:04:22 by ide-spir          #+#    #+#             */
/*   Updated: 2022/07/01 13:19:04 by ide-spir         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <signal.h>
#include <stdio.h>
#include "libft/libft.h"

void	ft_server(int sig)
{
	static unsigned char	x;
	static int				i;

	if (sig == SIGUSR1)
		x = x | 1;
	i++;
	if (i == 8)
	{
		ft_putchar_fd(x, 1);
		x = 0;
		i = 0;
	}
	x = x << 1;
}

int	main(void)
{
	ft_putstr_fd("Server PID:", 1);
	ft_putnbr_fd(getpid(), 1);
	ft_putchar_fd('\n', 1);
	signal(SIGUSR1, ft_server);
	signal(SIGUSR2, ft_server);
	while (1)
		pause();
	return (0);
}
