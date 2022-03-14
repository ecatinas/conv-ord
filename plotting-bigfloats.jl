# ver. March 14, 2022
# Julia code for plotting BigFloats, using Gadfly
# the code below run on some previous versions of Gadfly/Julia, but with the current versions does not produce correct results.
# an issue will be initiated on stackexchange


import Pkg; Pkg.add("Gadfly")
using Gadfly # http://gadflyjl.org/stable/tutorial/#Tutorial-1
Pkg.add("Cairo")
Pkg.add("Fontconfig")
using Cairo, Fontconfig

N = 3
setprecision(10^4)
a = BigFloat(2.0)
x = zeros(BigFloat,N)
for i = 1:N
     x[i] = 1/a^(2.0^(2.0^BigFloat(i)))
end
Ng = 3 #pt 10 nu mergea inainte
k = 1:Ng
plot(x=k, y=x[1:Ng], Scale.y_log10(minvalue=(BigFloat(1e-3000)), maxvalue=1e0), #Geom.line,
     Guide.xlabel("k"), Guide.ylabel("yk"),
     color=[colorant"red"],
     #linestyle=[:dash],
     #size=[18pt],
     #color=[colorant"hotpink"],
    )
