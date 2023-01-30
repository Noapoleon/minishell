# Project structure
NAME	=	minishell
INCDIR	=	incs
LIBDIR	=	libs
SRCDIR	=	srcs
OBJDIR	=	objs
LIBFT	=	libft

# Compiler options
CC		=	cc
CWARNS	=	-Wall -Wextra -Werror
CLIBS	=	-L./$(LIBDIR) -lft -lreadline
CINCS	=	-I./$(INCDIR) -I./$(LIBFT)

# Other
RM		=	rm -rf
DEBUG	=	-g3 -gdwarf-4

# Files
SRCS	:=	minishell.c
OBJS	:=	$(SRCS:.c=.o)
SRCS	:=	$(addprefix $(SRCDIR)/, $(SRCS))
OBJS	:=	$(addprefix $(OBJDIR)/, $(OBJS))

all: $(NAME)

bonus: all

$(NAME): $(LIBDIR)/libft.a $(OBJS)
	$(CC) $(DEBUG) $(CWARNS) $(OBJS) $(CLIBS) -o $(NAME)

$(OBJDIR)/%.o: $(SRCDIR)/%.c | $(OBJDIR) $(LIBDIR)
	$(CC) $(DEBUG) $(CWARNS) $(CINCS) -c $< -o $@

$(LIBDIR)/libft.a: | $(LIBDIR)
	make -C $(LIBFT)
	cp $(LIBFT)/libft.a $(LIBDIR)/

$(OBJDIR):
	mkdir -p $(OBJDIR)
$(LIBDIR):
	mkdir -p $(LIBDIR)

clean:
	make clean -C $(LIBFT)
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(LIBFT)/libft.a
	$(RM) $(LIBDIR)/libft.a
	$(RM) $(NAME)

re: fclean all

rebonus: fclean bonus

norm:
	norminette $(SRCS) $(INCDIR) | awk '{if ($$NF == "OK!") { print "\033[0;92m"$$0"\033[0m" } else if ($$NF == "Error!") { print "\033[0;91m"$$0"\033[0m" } else { print }}'
#	norminette $(SRCS_B) $(INCDIR) | awk '{if ($$NF == "OK!") { print "\033[0;92m"$$0"\033[0m" } else if ($$NF == "Error!") { print "\033[0;91m"$$0"\033[0m" } else { print }}'

.PHONY: all bonus clean fclean re rebonus norm
