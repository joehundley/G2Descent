#import and load 
import glob
load('powers.sage')
load('drop_zeros.sage')
print ('Loading 126 matrices of size 133 x 133. This may take a few minutes.')
for x in glob.glob('gap_matrices/*.sage'): load(x)

#define f0 
f0 = y0000001+y1111000+y1011100+y0101110+y0011110
# define f(a1, a2, a3, a4)
def f(a1,a2,a3,a4): return f0+a1*y0100000+a2*y0010000+a3*y0000100+a4*y0001000
# get sequence of powers of f2(a,b) as matrices over ZZ[a,b]
var('a1,a2,a3,a4')
print ('Computing powers of f(a1,a2,a3,a4). This may take a few minutes.') 
p = powers(f(a1,a2,a3,a4)) # this command may take some time to execute

# get sequence with zeros dropped
print ('Dropping zeros...')
pd = dz(p)

# check the length
print ('length of sequence of powers:')
print (len(pd))

# confirm that, as an element of e7(ZZ[a,b]) this is an element of E7(a4):
print ('ranks of 12th to 14th powers:')
print ([rank(pd[i]) for i in range(11,14)])

# observe the 14th power to find conditions for its vanishing
print ('14th power')
print (factor(pd[13]))

# look at the 11th power of f(a1,a2,a3,0)
print ('Set a4 to 0, and look at the nonzero part of the 11th power')
drop_zeros(expand(f(a1, a2, a3, 0)^11))

# look at the 11th power of f(a1, a1, 0, a4)
print ('Set a2=a1 and a3=0, and look at the nonzero part of the 11th power')
drop_zeros(expand(f(a1, a1, 0, a4)^11))

# look at f(2c1a3+c1^2a3, c1a3+c1^2a3, a3, a4)
var('c1')
print ('computing powers...')
p1 = powers(f(2*c1*a3+c1^2*a3, c1*a3+c1^2*a3, a3, a4))
print ('dropping zeros...')
p1d = dz(p1)
# the function "powers" computes powers until it gets a matrix of all zeros.
# a nontrivial representation of zero (e.g., a large polynomial in which all the terms cancel away) may not be immediately 
# recognized as a zero, in which case a few "extra" powers might get computed, and that happens in this case. 
# p1 is length 14, but the last two elements of p1d are empty. 
# The next two computations verify that the highest nonzero power of f(2c1a3+c1^2a3, c1a3+c1^2a3, a3, a4) is the 12th 
# and that, as a matrix over ZZ[a3, a4, c1] it is rank 3.
print ('length of sequence of powers')
print (len(p1d)) 
print ('ranks of the last three powers computed')
print ([rank(p1d[i]) for i in range(11,14)])
print ('12th power:')
print (factor(p1d[11]))
print ('after pulling out a common factor')
print (factor(1/(462*a3^2*a4*(c1 + 1)^2)*p1d[11]))
print ('the last three rows are obviously linearly independent for a4=/=0.')
