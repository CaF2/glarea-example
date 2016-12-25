
CC = gcc 
PKGCONFIG = $(shell which pkg-config)
CFLAGS = $(shell $(PKGCONFIG) --cflags gio-2.0 gtk+-3.0 epoxy) -std=c99
LIBS = $(shell $(PKGCONFIG) --libs gio-2.0 gtk+-3.0 epoxy) -lm 

SRC = main.c
BIN = glarea

ALL = $(GEN) $(SRC)
OBJS = $(ALL:.c=.o)

all: $(BIN)

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

$(BIN): $(OBJS)
	$(CC) -o $(@F) $(LIBS) $(OBJS)

run: all
	./$(BIN)

clean:
	@rm -f $(GEN) $(OBJS) $(BIN)
