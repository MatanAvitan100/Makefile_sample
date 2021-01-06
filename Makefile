# Makefile

IDIR = include
CC = gcc
CFLAGS = -I$(IDIR)

SDIR = src
ODIR = obj
LDIR = lib
OBIN = bin
LIBS = -lm

_DEPS = hellomake.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = hellomake.o hellofunc.o
__OBJ = $(patsubst %,$(SDIR)/%,$(_OBJ))
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: $(SDIR)/%.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

hellomake: $(OBJ)
	$(CC) -o $(OBIN)/$@ $^ $(CFLAGS) $(LIBS)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~ $(OBIN)/*

