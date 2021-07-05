#import and load 
import glob
load('powers.sage')
load('drop_zeros.sage')
print ('Loading GAP adjoint matrices...')
for x in glob.glob('gap_matrices/*.sage'): load(x)

print ('Declaring variables....')
var('a1000000,a0000010,a0000001,a1010000,a0000110,a1011000,a0001110,a1111000,a1011100,a0101110,a0011110,a1111100,a0111110,a1112100,a0112110,a1122100,a0112210')
# define x
print ('defining x....')
x = a1000000*y1000000+a0000010*y0000010+a0000001*y0000001+a1010000*y1010000+a0000110*y0000110+a1011000*y1011000+a0001110*y0001110+a1111000*y1111000+a1011100*y1011100+a0101110*y0101110+a0011110*y0011110+a1111100*y1111100+a0111110*y0111110+a1112100*y1112100+a0112110*y0112110+a1122100*y1122100+a0112210*y0112210

# get sequence of powers of x as matrices over ZZ[a1000000, ... a0112210]
print ('Computing powers of x. This may take a few minutes.') 
p = powers(x) # this command may take some time to execute

print  ('dropping zeros')
# get sequence with zeros dropped
pd = dz(p)

print ('checking the length')
# check the length
print ('length of sequence of powers:')
print (len(pd))

# the rank sequence A5'' is the only one which is length 10 and ends with [10, 2, 1]. 
print ([rank(pd[i]) for i in range(7,10)])

# an element of the closure of A5'' is in A5'' if and only if its 10th power is nonzero. 
# observe that the nonzero part of the 10th power of x is 1 by 1. 
print (pd[9])
# let q be its unique entry
q = pd[9][0,0]

#factor q for comparison with the polynomial in the paper
factor(q)