#import and load 
import glob
load('powers.sage')
load('drop_zeros.sage')
for x in glob.glob('gap_matrices/*.sage'): load(x)

# define f3(a,b)
f1 = y0100000+y0011000+y0001100+y0000110+y0000011
def f3(a,b): return f1+a*y1000000+b*y1010000

# get sequence of powers of f3(a,b) as matrices over ZZ[a,b]
var('a,b')
print ('Computing powers of f3(a,b). This may take a few minutes.') 
p = powers(f3(a,b)) # this command may take some time to execute

# get sequence with zeros dropped
pd = dz(p)

# check the length
print ('length of sequence of powers:')
print (len(pd))

# confirm that, as an element of e7(ZZ[a,b]) this is an element of D6:
print ('ranks of 16th to 18th powers:') 
print ([rank(pd[i]) for i in range(15,18)])

# given that f3(a,b) is in D6, a necessary condition for it to be in the 
# closure of E7(a4) is that the 18th power must vanish
print ('18th power')
print (pd[17])
# visual inspection shows that this occurs iff a=b=0.
