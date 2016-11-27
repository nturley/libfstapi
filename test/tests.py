from ctypes import cdll
from glob import glob
from os import path

globbed = glob('*fstapi*')
if len(globbed) < 1:
	raise Exception('cannot find shared lib')

lib = cdll.LoadLibrary(path.abspath(globbed[0]))

def sanity_test():
	lib.test()