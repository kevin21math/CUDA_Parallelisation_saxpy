using BenchmarkTools, CUDA
using CUDA.CUBLAS

const dim = 100_000_000
const a = 3.1416

x = CUDA.ones(Float32, dim)
y = CUDA.ones(Float32, dim)
z = CUDA.zeros(Float32, dim)

CUBLAS.axpy!(dim, a, x, y)

@btime CUDA.@sync CUBLAS.axpy!(dim, a, x, y)

# record CUDA Library time
library_time = 

#Check the value of y after using the library
y = 
# compare performance(use values from Saxpy.jl and Kernal.jl)

library_v_cpu = cpu_time / library_time
library_v_broadcast = broadcast_time / library_time
library_v_kernel = kernel_time / library_time