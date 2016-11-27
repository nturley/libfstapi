from ctypes import cdll
from glob import glob

lib = cdll.LoadLibrary(glob('*fstapi*')[0])

def sanity_test():
	lib.test()