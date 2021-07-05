#import and load 
import glob
load('powers.sage')
load('drop_zeros.sage')
for x in glob.glob('gap_matrices/*.sage'): load(x)

# define f4(a,b)
f1 = y0100000+y0001000+y0000100+y0000010+y0000001
def f4(a,b): return f1+a*y0111000+b*y1111000

# get sequence of powers of f4(a,b) as matrices over ZZ[a,b]
var('a,b')
print ('Computing powers of f4(a,b). This may take a few minutes.') 
p = powers(f4(a,b)) # this command may take some time to execute

# get sequence with zeros dropped
pd = dz(p)

# check the length
print ('length of sequence of powers:')
print (len(pd))

# confirm that, as an element of e7(ZZ[a,b]) this is an element of D6(a1):
print ('ranks of 10th to 14th powers:') 
print ([rank(pd[i]) for i in range(9,14)])

# given that f4(a,b) is in D6(a1), a necessary condition for it to be in the 
# closure of E7(a5) is that the 14th power must vanish
print ('14th power')
print (pd[13])
# visual inspection shows that this occurs iff a=b=0.

# given that f4(a,b) is in D6(a1), a necessary condition for it to be in the
# closure of D5 is that the rank of the 11th power must be less than 6.
print (pd[10])
# visual inspection shows that it is of rank 6 unless a=b=0.
