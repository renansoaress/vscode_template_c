# Defina o nome do binário aqui
BIN_NAME := template_c

# Restante do Makefile
CC := gcc
CFLAGS := -g -Iinclude
SRCDIR := src
OBJDIR := obj
BINDIR := bin
TARGET := $(BINDIR)/$(BIN_NAME)

SRC := $(wildcard $(SRCDIR)/*.c)
OBJ := $(SRC:$(SRCDIR)/%.c=$(OBJDIR)/%.o)

all: $(TARGET)

$(TARGET): $(OBJ)
	@if not exist $(BINDIR) mkdir $(BINDIR)
	$(CC) $(OBJ) -o $@

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	@if not exist $(OBJDIR) mkdir $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	@if exist $(OBJDIR) rmdir /s /q $(OBJDIR)
	@if exist $(BINDIR) rmdir /s /q $(BINDIR)

.PHONY: all clean
