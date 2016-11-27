# I miss the simpler times when makefiles were uncomplicated

bin/libfstapi.so : obj/lz4.o obj/fastlz.o obj/fstapi.o bin
	clang -shared -o bin/libfstapi.so obj/lz4.o obj/fastlz.o obj/fstapi.o -lz

obj/lz4.o : src/lz4.c src/lz4.h obj
	clang -c -Wall -Werror -fpic src/lz4.c -o obj/lz4.o

obj/fastlz.o : src/fastlz.c src/fastlz.h obj
	clang -c -Wall -Werror -fpic src/fastlz.c -o obj/fastlz.o

obj/fstapi.o : src/fstapi.c src/fstapi.h src/fastlz.h src/lz4.h obj
	clang -c -Wall -Werror -fpic src/fstapi.c -o obj/fstapi.o

pytests : bin/libfstapi.so
	nosetests test/tests.py

obj :
	@mkdir -p obj

bin :
	@mkdir -p bin

clean :
	-rm obj/*.o bin/*.so test/*.pyc