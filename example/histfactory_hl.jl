using HS3
using BenchmarkTools, DensityInterface
using JSON3
using BAT
a = Pair(1, 2)
zip(a[1], a[2])

dict = file_to_dict("./example/rf515_hfJSON.json")
specs = HS3.generate_specs(dict)
analysis = HS3.make_analyses(specs.analyses[1], specs)

logdensityof(analysis.likelihood, (mcstat_bin1 =1, mu=1,  syst3 = 0.0, syst1 =1., syst2 =0, mcstat_bin2 = 1))


[2, 2] .- [1, 1]



r = Dict("a"=> [1.0, 2.0, 3.0], "b" => Dict("c" => 2.0),"c"=> [1.0, 2.0, 3.0], "d" => Dict("c" => 2.0))
collect(Iterators.partition(r, length(keys(r)) ÷ Threads.nthreads()+1))
length(keys(r))
4 / 20
typeof(("a", 2))
length(keys(a)) ÷ Threads.nthreads()

specs.distributions
@benchmark HS3.generate_specs(dict)
using ValueShapes, Distributions
prior = NamedTupleDist((mcstat_bin1 =Normal(1, 1), mu=Uniform(-5, 5),  syst3 = Normal(), syst1 = Normal(), syst2 =Normal(), mcstat_bin2 = Normal(1,1)))
posterior = PosteriorMeasure(analysis.likelihood, prior)
a = bat_sample(posterior)
a.result
bat_findmode(posterior)
logdensityof(analysis.likelihood, (mcstat_bin1 =1, mu=1,  syst3 = 0, syst1_bin1 = 1, syst1_bin2 = 0.5, syst2 =0, mcstat_bin2 = 1))

x = [2.0, 2.2, 2.1, 1.5, -0.1, -0.2, -0.3, -0.4, -0.5, -0.6, -0.7, -0.8, -0.9, -1.0, -1.1, -1.2, 0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 1.1, 1.2]
y = []
for i  in x 
y = push!(y, logdensityof(analysis.likelihood, (mcstat_bin1 =1, mu=1,  syst3 = 0, syst1 = i, syst2 =0, mcstat_bin2 = 1, a=1, b=1)))
end
y
using Plots
root = [21.447233, 21.8672333, 21.6522333, 20.5722333, 16.5444, 16.5958, 16.7019, 16.8853, 17.1633, 17.5399, 18.0017, 18.5219, 19.0736, 19.6513, 20.2824, 20.9782, 16.5292, 16.543459, 16.5934, 16.6970, 16.8764, 17.1487, 17.5180, 17.9708, 18.4808, 19.0213, 19.5869, 20.2046, 20.8856]

vector = [0, 0, 0, 5, 3, 0, 9, 0]
vector[findfirst(x -> x != 0, vector)]

diff = (y.+root)
plot(x, diff, seriestype=:scatter, label="abs. difference")
savefig("histosys_abs_diff.pdf")
plot(x, y, seriestype=:scatter, label="Julia")
plot!(x, -root, seriestype=:scatter, label = "root")
savefig("histosys_is_wrong.pdf")
logdensityof(analysis.likelihood, (mcstat_bin1 =1, mu=1,  syst3 = 0, syst1 = 0.1, syst2 =0, mcstat_bin2 = 1, a=1, b=1))
logdensityof(analysis.likelihood, (mcstat_bin1 =1, mu=1,  syst3 = 0, syst1_bin1 = 2, syst1_bin2 = 2, syst2 =0, mcstat_bin2 = 1, a=1, b=1))
using Distributions
a = Normal() * sqrt(2 * pi)
pdf(a, -0.1) 
HS3._find_variables_in_expression(specs[:functions][2])
a = ((1, 2))
function f(x, y)
    println(x+y)
end
sqrt(2)
f(a...)


typeof(l) <:ComposedFunction
l = HS3.make_functional(specs.functions[1])
l((k1 =2, k2=4))
typeof(l) <: ComposedFunction
logdensityof(analysis.likelihood, (mcstat_bin1 =1, mu=1,  syst3 = 0, syst1 = 0, syst2 =0, mcstat_bin2 = 1, k1 =2 , k2= 4, A1= 3))
supertype(HS3.var"#80#81"{HS3.var"#77#79"{ComposedFunction{typeof(HS3.generate_function), Base.Fix1{typeof(HS3.substitute_variables), HS3.FunctionSpec{:generic_function, NamedTuple{(:expression, :var), Tuple{Expr, Tuple{Val{:k1}, Val{:k2}}}}}}}}})
specs2 = HS3.generate_specs(file_to_dict("./example/simple_signal.json"))
specs2.analyses[1].likelihood
open("my_new_file.json", "w") do io
    JSON3.pretty(io, HS3.specs_to_json_dict(specs))
end
a = (v =1, b = 2)
s = "v"
a[Symbol(s)]
analysis2 = HS3.make_analyses(specs2.analyses[1], specs2)
v = :(a + b)
c = (a= 2, b = 3)

identity(100)
dump(analysis.likelihood)
a = (analysis.likelihood._log_f.likelihood_functions.contents[1].dist)
a2 = (analysis2.likelihood._log_f.likelihood_functions.contents[1].likelihood.dist.funct)
dump(a2)
(HS3.var"#87#89") <: HS3.Function #true
a.likelihood
using Symbolics
using DensityInterface
a =logfuncdensity(
    function(params)
        return logpdf(Normal(params.mu, params.sigma), params.x)
end)
using Distributions
code_lowered(a._log_f, (NamedTuple,))
code_typed(logdensityof(a) , (NamedTuple,))

a._log_f
code = code_typed(h, (Any,))
for (i, line) in enumerate(code)
    if line[1] == :ll
        println("Definition of ll at line $i: ")
        println(line)
        break
    end
end
@code_lowered
f(params) = params.a + params.b
func_expr = Base.uncompressed_ast(f)
h(a, b) = sum(a + b)
dump(h) 

f(params) = params.a + params.b + params.c - params.d / params.e
@show f
dump(f)
# Open a file for writing
log_file = open("function_log.txt", "w")
code_typed(f).code
# Write the function definition to the file
write(log_file, string(@show f))
func_code = Revise.show_code(f)
# Close the file
close(log_file)
macro expanded_code(expr)
    return esc(expr)
end
@macroexpand @expanded_code f(params)
show(MIME"text/plain"(), last(ans).args[1])
code_string(typeof(f))
method = methodswith(typeof(f))[1]
string(method.def)

dump(code[5])
param_names = []
operation = []
code[1].args[3]
f(params) = Normal(2, params.s)


param_names
operation
func_str = string(@eval(f($params)))
func_def = Base.uncompressed_ast(@which f)
@showall f
println(@show f)
# Parse the function definition into a symbolic expression
value_names = []
for arg in expr.args
    push!(value_names, arg.args[1])
end
dump(g)
expr = :(h(params))
expr.args[2][1]
eval(expr.args[2])
operation = expr.args
dump(expr)
operation = expr.args[2]
dump(operation)
# Extract the operation
operation = op(expr)

# Extract the value names
value_names = [str(val) for val in vals(expr)]

@code_lowered 
getfield(a._log_f, :mu)
varinfo(a, r"")

analysis = HS3.make_analyses(specs.analyses[1], specs)
mu_1 = logdensityof(analysis.likelihood, (mcstat_bin1 =1, mu=1,  syst3 = 0, syst1 = 0, syst2 =0, mcstat_bin2 = 1, ))
mu_0 = logdensityof(analysis.likelihood, (mu=0, syst2 =0, mcstat_bin2 = 1, syst1 = 0, syst3 = 0,  mcstat_bin1 =1))
mu_2 = logdensityof(analysis.likelihood, (mu = 2, syst2 =0, mcstat_bin2 = 1, syst1 = 0, syst3 = 0, mcstat_bin1 = 1))
mu_n1 = logdensityof(analysis.likelihood, (mcstat_bin1 =1, mu=-1,  syst3 = 0, syst1 = 0, syst2 =0, mcstat_bin2 = 1, ))
mu_3 = logdensityof(analysis.likelihood, (mu=3, syst2 =0, mcstat_bin2 = 1, syst1 = 0, syst3 = 0,  mcstat_bin1 =1))
mu_n2 = logdensityof(analysis.likelihood, (mu = -2, syst2 =0, mcstat_bin2 = 1, syst1 = 0, syst3 = 0, mcstat_bin1 = 1))
mu_n3 = logdensityof(analysis.likelihood, (mu=-3, syst2 =0, mcstat_bin2 = 1, syst1 = 0, syst3 = 0,  mcstat_bin1 =1))
analysis.likelihood
map(x -> x in [1,2,4,5,8,9,10,11] ,[1,3,5,7,9,4])
[x in [1,2,4,5,8,9,10,11]  for x = [1,3,5,7,9,4]]

mu = [-3, -2, -1, 0, 1, 2, 3]
jul = [mu_n3, mu_n2, mu_n1, mu_0, mu_1, mu_2, mu_3]
root = [81.182296, 46.760037 , 28.471124, 19.447233, 16.529263, 17.977606, 22.721993]
jul ./root
[jul .+ root]

HS3.BinnedDataSpec{3} <: HS3.BinnedDataSpec
mu = [0, 1, 2]
root = [16.529, 19.4472, 17.97606]



using LiteHF
using Plots
plot(mu, jul, label="Julia LL", linestyle=:solid)
plot!(mu, root, label="Root LL")
plot!(mu, -root, label="negative Root LL", linestyle=:dash)
plot!(mu, abs.(jul+root), label="Abs Diff Julia & Neg. Root")
xlabel!("mu")
ylabel!("LL")
savefig("LogLikelihoods1.pdf")
abs(a - b)

using BAT, ValueShapes, Distributions
posterior = PosteriorMeasure(analysis.likelihood, NamedTupleDist(mu=Uniform(-3, 5),   mcstat_bin1 = Uniform(0, 2), mcstat_bin2 = Uniform(0, 2), syst1 = Uniform(-5, 5), syst2 = Uniform(-5, 5), syst3 = Uniform(-5, 5)))
bat_findmode(posterior).result
using Plots
plot(samples)
#make analysis directly from file
@benchmark HS3.make_analyses("./example/histfactory_hl.json", "primary_analysis")





a = HS3.specs_to_json_dict(specs, true)
println(a)
JSON3.write(a)
nt = (data = (data1 = s,),)
open("my_new_file.json", "w") do io
    JSON3.pretty(io, a)
end

using Distributions
using DensityInterface

a = Normal()
likelihood = DensityInterface.logfuncdensity(
    params -> pdf(a, params.x)
)
dump(likelihood._log_f)