#import and load 
import glob
load('powers.sage')
load('drop_zeros.sage')
for x in glob.glob('gap_matrices/*.sage'): load(x)

# define fa(a)
f1 = y0100000+y0001000+y0000100+y0000010+y0000001
def f2(a): return f1+a*y1122210

# get sequence of powers of f2(a) as matrices over ZZ[a]
var('a')
print ('Computing powers of f2(a). This may take a few minutes.') 
p = powers(f2(a)) # this command may take some time to execute

# get sequence with zeros dropped
pd = dz(p)

# check the length
print ('length of sequence of powers:')
print (len(pd))

# confirm that, as an element of e7(ZZ[a]) this is an element of D6(a1):
print ('ranks of 10th to 14th powers:') 
print ([rank(pd[i]) for i in range(9,14)])

# given that f2(a) is in D6(a1), a necessary condition for it to be in the 
# closure of E7(a5) is that the 14th power must vanish
print ('14th power')
print (pd[13])
# visual inspection shows that this occurs iff a=0.

# given that f2(a) is in D6(a1), a necessary condition for it to be in the
# closure of D5 is that the rank of the 11th power must be less than 6.
print (pd[10])
# visual inspection shows that the rank is 6 unless a=0.
