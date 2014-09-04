# Taku Ito
# 09/04/2014

# Save Python object to file using pickle

import cPickle as pickle

def save_object(obj, filename):
	# give filename a '.p' extension if not indicated
	filename=filename+'.p' if filename[-2:] != '.p' else filename
	# write to file
    with open(filename, 'wb') as output:
        pickle.dump(obj, output, -1)

