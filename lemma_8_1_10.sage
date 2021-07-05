#import and load 
import glob
load('powers.sage')
load('drop_zeros.sage')
print ('Loading 126 matrices of size 133 x 133. This may take a few minutes.')
for x in glob.glob('gap_matrices/*.sage'): load(x)

#define x(a)
def x(a1,a3, a4, a5, a6, a7): return y1010000+y0000111+y0011110+y0101110+y0111100+a7*y0001110+a4*y0011100+a1*y0101100+a6*y0111000+a3*y0000011+a5*y1000000

# get sequence of powers of x(a) as matrices over ZZ[a]
var('a1,a3,a4,a5,a6,a7')
print ('Computing powers ....') 
p = powers(x(a1,a3, a4, a5, a6, a7)) # this command may take some time to execute

# get sequence with zeros dropped
print ('Dropping zeros...')
pd = dz(p)
len(pd) 

# verify that for a1 .. a7 in general position we have an element of E7(a4)
# a sufficient condition for X to be in E7(a4) is rank ad X^k = 4,2,1 for k = 12,13,14
print ([rank(pd[i] )for i in range(11,14)])

# print the polynomial whose vanishing is equivalent to membership in the closure of A6
# and compare to the left hand side of equation (8.1.11)
print(factor(pd[13]))

# specialize to the case a5=0 and compute the sequence of powers
p1 = powers(x(a1,a3, a4, 0, a6, a7)) # this command may take some time to execute
# drop any rows and columns that consist of all zeros to obtain denser matrices of equal rank
p1d = dz(p1)
# print the length of the sequence of powers
print(len(p1d))
# verify that the final element is rank three if a1 a3 a4 a6 a7 =/= 0 and rank 0 otherwise.
print(p1d[11])

# Define one parameter subgroups. 
## we need the matrix exp, the one built into sage will not serve our purposes.
## (it throws an error)
## we use an ad hoc definition: 
def exp(u): return u^0+u+1/2*u^2  # see lemma621 for justification

# define the matrix which conjugates X_{a'} to X'_{a'}.
def u(b1, b2, b3, b4,b5): return exp(b1*y0100000)*exp(b2*y0010000)*exp(b3*y0000100)*exp(b4*y0000110)*exp(b5*y0000010)

# define X'_{a'}. 
def xp(a1,a3,a4,a6,a7): return y1010000+a3*y0000011+a6*y0111000+a1*y0101100+a4*y0011100+a7*y0001110

# compute the conjugate
uu = u(-1/2*(a7*(a6/a3 - a1/a7 - a4/a7 + 1)/a4 + 2)/a7,
 -1/2*(a7*(a6/a3 - a1/a7 - a4/a7 + 1)/a1 + 2)/a7,
 -1/a3,
 -1/4*(2/a1 + 2/a4 - a1/(a4*a7) - a4/(a1*a7) + 2/a7 - a7/(a1*a4) + a6^2*a7/(a1*a3^2*a4))/a6,
 -1/2*a7*(a6/a3 - a1/a7 - a4/a7 + 1)/(a1*a4))

# verify that the conjugate of X_{a'} is indeed X'_{a'}.
print(expand(uu*x(a1,a3,a4,0,a6,a7)*uu.inverse())==xp(a1, a3, a4, a6, a7))
 

