CFLAGS = -std=gnu -O1 -march=native
LIBDIR = full/path/to/SilentBranch/Silent_Branches_Predication/REP_MOVS/rcx_threshold_eval
all: measuret
ifdef RCX
CFLAGS += -DRCX=$(RCX)
endif

libdummy.so: dummy.c
	$(CC) $(CFLAGS) -fPIC -c dummy.c
	$(CC) $(CFLAGS) -shared -o libdummy.so dummy.o

%: %.c libdummy.so
	$(CC) $(CFLAGS)  $< -o $@ -L$(LIBDIR) -ldummy -Wl,-rpath=$(LIBDIR)



clean:
	rm -f measuret dummy.o libdummy.so

