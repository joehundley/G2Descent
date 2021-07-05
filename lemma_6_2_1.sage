#import and load 
import glob
load('powers.sage')
print ('Loading GAP adjoint matrices...')
for x in glob.glob('gap_matrices/*.sage'): load(x)

var('a,b')
# define e0
print ('defining e0....')
e0 = y1122100+y1112110+y1111111+y0112210+y0112111

# Define one parameter subgroups. 
## we need the matrix exp, the one built into sage will not serve our purposes.
## (it throws an error)
## we use an ad hoc definition: 
print (len(powers(x1000000)))
# that is for x = x1000000 -- and hence for all other nilpotent elements of our Chevalley basis -- the second power is nonzero but the third power 
# is zero, whence exp( a*x) = x^0 + a*x+a^2/2*x^2
def exp(u): return u^0+u+1/2*u^2 

def xalpha(a): return exp(a*x1000000)*exp(-a^2*x0001100)*exp(2*a*x0000100)*exp(a*x0001000)*exp(-a*x0000001)
def xbeta(b): return exp(b*x0010000)*exp(b*x0000010)
def yalpha(a): return exp(a*y1000000)*exp(a^2*y0001100)*exp(a*y0000100)*exp(2*a*y0001000)*exp(-a*y0000001)
def ybeta(b): return exp(b*y0010000)*exp(b*y0000010)

print (xalpha(a)*e0*xalpha(-a)==e0)
print (xbeta(b)*e0*xbeta(-b)==e0)
print (yalpha(a)*e0*yalpha(-a)==e0)
print (ybeta(b)*e0*ybeta(-b)==e0)
