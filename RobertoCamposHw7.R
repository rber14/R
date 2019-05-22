#1)
#a
D <- matrix(c(2, 3, 10, 5, -1, 8, 10, -3, 50), nrow = 3, byrow = 3)

b = c(5, 1.2, 11)

d.det = det(D)
d.det
Nx = D
Nx[,1] = b
x = det(Nx)
x = x/d.det

Ny = D
Ny[,2] = b
y = det(Ny)
y = y/d.det

Nz = D
Nz[,3] = b
z = det(Nz)
z = z/d.det
#x=-.045 y = .77, z=.275 
#(b) Another way to solve this system is to use a linear algebra result which states that the solution is D−1 matrix multiplied by the vector b. 
#    Solve using this method and compare your results to part (a).

Dinv = solve(D)
result <- Dinv %*% b
#result = -.045, .7778, .2758

#(c) Verify that your solution works using arithmetic in R, i.e. just plug your solutions back into the 3 original equations. 
#     Note, there may be some rounding error.
a = (2*x) + (3*y) + (10*z) 
b = (5*x) - y + (8*z)
c = (10*x) - (3*y) + (50*z)

#(d) Thispartisjustpracticewithsomematrixarithmeticandcommands
#i. Find the standard deviation of each column of D.
apply(D , 1, sd)

#ii. Construct another matrix, named E with 3 rows and 3 columns filled columnwise by the values 2,4,6,8,...18. Multiply D and E using elementwise multiplication.
E = matrix(c(2,4,6,8,10,12,14,16,18), nrow = 3, byrow = 3)
mult = D * E

#iii Put the matrices D and E together by column binding them.
cbind(D,E)
