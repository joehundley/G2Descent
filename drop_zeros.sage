def drop_zeros(m):
 a=matrix([x for x in m if x!= 0*x])
 b=a.transpose()
 c = matrix([x for x in b if x != 0*x])
 return c.transpose()

def dz(l): return [drop_zeros(expand(x)) for x in l]
