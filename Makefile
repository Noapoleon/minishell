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
# Colors
BAK_FRT	=	\033[44;97;1m
BAK_SDW	=	\033[40;97;1m
COL_RST	=	\033[0m
COL_OK	=	\033[0;92m
COL_ERR	=	\033[41;97;5;1m

# Files
SRCS	:=	minishell.c \
			setup.c \
			utils.c
OBJS	:=	$(SRCS:.c=.o)
SRCS	:=	$(addprefix $(SRCDIR)/, $(SRCS))
OBJS	:=	$(addprefix $(OBJDIR)/, $(OBJS))

all: $(NAME)

bonus: all

$(NAME): $(LIBDIR)/libft.a $(OBJS)
	$(CC) $(CWARNS) $(OBJS) $(CLIBS) -o $(NAME)

$(OBJDIR)/%.o: $(SRCDIR)/%.c | $(OBJDIR) $(LIBDIR)
	$(CC) $(CWARNS) $(CINCS) -c $< -o $@

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
	@echo "$(BAK_FRT)               $(COL_RST)"
	@echo "$(BAK_FRT)  LIBFT NORM:  $(BAK_SDW)  $(COL_RST)"
	@echo "$(BAK_FRT)               $(BAK_SDW)  $(COL_RST)"
	@echo " $(BAK_SDW)                $(COL_RST)"
	@norminette $(LIBFT) | awk '{if ($$NF == "OK!") { print "$(COL_OK)"$$0"$(COL_RST)" } else if ($$NF == "Error!") { print "$(COL_ERR)"$$0"$(COL_RST)" } else { print }}'
	@echo "\n"
	@echo "$(BAK_FRT)                 $(COL_RST)"
	@echo "$(BAK_FRT)  SOURCES NORM:  $(BAK_SDW)  $(COL_RST)"
	@echo "$(BAK_FRT)                 $(BAK_SDW)  $(COL_RST)"
	@echo " $(BAK_SDW)                  $(COL_RST)"
	@norminette $(SRCDIR) | awk '{if ($$NF == "OK!") { print "$(COL_OK)"$$0"$(COL_RST)" } else if ($$NF == "Error!") { print "$(COL_ERR)"$$0"$(COL_RST)" } else { print }}'
	@echo "\n"
	@echo "$(BAK_FRT)                  $(COL_RST)"
	@echo "$(BAK_FRT)  INCLUDES NORM:  $(BAK_SDW)  $(COL_RST)"
	@echo "$(BAK_FRT)                  $(BAK_SDW)  $(COL_RST)"
	@echo " $(BAK_SDW)                   $(COL_RST)"
	@norminette $(INCDIR) | awk '{if ($$NF == "OK!") { print "$(COL_OK)"$$0"$(COL_RST)" } else if ($$NF == "Error!") { print "$(COL_ERR)"$$0"$(COL_RST)" } else { print }}'

.PHONY: all bonus clean fclean re rebonus norm
