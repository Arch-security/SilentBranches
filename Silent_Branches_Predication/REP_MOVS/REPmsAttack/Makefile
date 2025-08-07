CFLAGS = -std=gnu -O1 -march=native
LIBDIR = /full/path/to/Silent_Branches_Predication/REP_MOVS/REPmsAttack
all: v1REP

ifdef KEY
CFLAGS += -DKEY=\'$(KEY)\'
endif

libdummy.so: dummy.c
	$(CC) $(CFLAGS) -fPIC -c dummy.c
	$(CC) $(CFLAGS) -shared -o libdummy.so dummy.o

%: %.c libdummy.so
	$(CC) $(CFLAGS)  $< -o $@ -L$(LIBDIR) -ldummy -Wl,-rpath=$(LIBDIR)

clean:
	rm -f v1REP dummy.o libdummy.a

