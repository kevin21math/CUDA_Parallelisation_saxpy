
using CUDA
using BenchmarkTools

#constants used for calculation

const dim = 100_000_000
const a = 3.1416

x = ones(Float32, dim)

y = ones(Float32, dim)

z = zeros(Float32, dim)

#performing saxy operation on CPU
@btime z .= a .* x .+ y
#record the cpu time for this 

cpu_time =

#GPU Broadcasting with Array abstraction 

x = CUDA.ones(Float32, dim)

y = CUDA.ones(Float32, dim)

z = CUDA.zeros(Float32, dim)


@btime CUDA.@sync z .= a .* x .+ y

#record the gpu time for this

gpu_time = 

# compare performance

broadcast_time = cpu_time / gpu_time