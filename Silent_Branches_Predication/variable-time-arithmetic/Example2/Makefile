CFLAGS = -std=gnu -O1 -mno-bmi2 -march=native
LIBDIR = full/path/to/SilentBranch/Silent_Branches_Predication/variable-time-arithmetic/Example2/
all: gadget1_SBB gadget2_CMOVE
libdummy.so: dummy.c
	$(CC) $(CFLAGS) -fPIC -c dummy.c
	$(CC) $(CFLAGS) -shared -o libdummy.so dummy.o

%: %.c libdummy.so
	$(CC) $(CFLAGS) $< -o $@ -L$(LIBDIR) -ldummy -Wl,-rpath=$(LIBDIR)
%: gadget1_SBB gadget2_CMOVE
	objdump -d -M intel -S gadget1_SBB > gadget1_SBB.s
	objdump -d -M intel -S gadget2_CMOVE > gadget2_CMOVE.s


clean:
	rm -f gadget1_SBB gadget2_CMOVE dummy.o libdummy.a  gadget1_SBB.dump gadget2_CMOVE.dump

