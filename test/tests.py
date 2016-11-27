from ctypes import cdll

lib = cdll.LoadLibrary('bin/libfstapi.so')

def sanity_test():
	lib.test()