# Taku Ito
# 09/12/2014

# Generic Data Object that encapsulates data parameters and results into a single object.
import save
import numpy as numpy
import scipy.io


class Data(object):
	""" On the fly object to store all results for ease of access when running parallel analyses"""
	def __init__(self, **kwargs):
		for key in kwargs:
			setattr(self, key, kwargs[key])

	def add(self, **kwargs):
		""" To add new results to the object post-instantiation """
		for key in kwargs:
			setattr(self, key, kwargs[key])

	def save(self, filename):
		""" save object to a pickled file """
		save.save_object(self, filename)

	def saveAsMatLab(self, filename):
		""" save object as a matlab struct """
		# must first convert to dict
		dic = self.__dict__	
		filename=filename+'.mat' if filename[-4:] != '.mat' else filname
		scipy.io.savemat(filename, dic)
