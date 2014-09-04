# Taku Ito
# 09/04/2014

# Logging tool

import logging
from datetime import datetime
import sys

# Instantiate and return a logger that prints to console and writes out to file.
def createLogger(logname=None):

	# Set up Log file
	time = datetime.now()
	datestr = str(time.month) + '-' + str(time.day) + '-' + str(time.year) + '_' + str(time.hour) + ':' + str(time.minute)
	
	# Instantiate log file name
	# Make sure logger creates log file AND prints to console
	
	# logname
	if logname == None:
		logname = datestr + '_rand_walk_btwn_cent.log'
	else:
		logname = logname

	log = logging.getLogger(logname)			# instantiate logger
	handler = logging.FileHandler(logname)		# construct file handler (output file)
	log.setLevel(logging.INFO)					# set log level
	ch = logging.StreamHandler(sys.stdout)		# make sure log outputs to console as well
	ch.setLevel(logging.INFO)
	
	# add both handlers, i.e., to file and console.
	log.addHandler(ch)
	log.addHandler(handler)

	return log