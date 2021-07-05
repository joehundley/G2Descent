#import and load 
import glob
load('powers.sage')
load('drop_zeros.sage')
for x in glob.glob('gap_matrices/*.sage'): load(x)

# define f2(a,b)
f1 = y0100000+y0011000+y0001100+y0000110+y0000011
def f2(a,b): return f1+a*y1011110+b*y1011111

# get sequence of powers of f2(a,b) as matrices over ZZ[a,b]
var('a,b')
print ('Computing powers of f2(a,b). This may take a few minutes.') 
p = powers(f2(a,b)) # this command may take some time to execute

# get sequence with zeros dropped
pd = dz(p)

# check the length
print ('length of sequence of powers:')
print (len(pd))

# confirm that, as an element of e7(ZZ[a,b]) this is an element of D6(a1):
print ('ranks of 10th to 14th powers:') 
print ([rank(pd[i]) for i in range(9,14)])

# given that f2(a,b) is in D6(a1), a necessary condition for it to be in the 
# closure of E7(a5) is that the 14th power must vanish
print ('14th power')
print (pd[13])
# visual inspection shows that this occurs iff a=b=0.

# given that f2(a,b) is in D6(a1), a necessary condition for it to be in the
# closure of D5 is that the rank of the 11th power must be less than 6.
m=pd[10]



# define relevant blocks of indices
blocks =[[15, 16], [12, 14], [4, 7, 10, 11, 13], [0, 1, 2, 3, 5, 6, 8, 9]]
# a function to get the block matrix corresponding to a pair of blocks of 
# indices
def n(k,l): return matrix([[m[i,j] for j in blocks[l] ] for i in blocks[k]])

# display all nonzero blocks (there are four, no two of which share a row 
# or column)
print ('nonzero blocks in the 11th power:') 
for k in range(4): 
 for l in range(4): 
  if n(k,l) != 0*n(k,l): 
   print (k,l)
   print (n(k,l))
# visual inspection shows that, unless a=b=0, we have blocks of rank 
# 2, 1, 1, and 2, making for a total rank of 6.
