
using BenchmarkTools, CUDA

# define constants

const dim = 100_000_000
const a = 3.1416


#Take these from Saxpy.jl and complete the code in Kernal.jl:
cpu_time = 
broadcast_time = 

x = CUDA.ones(Float32, dim)
y = CUDA.ones(Float32, dim)
z = CUDA.zeros(Float32, dim)

nthreads = CUDA.attribute(device(),CUDA.DEVICE_ATTRIBUTE_MAX_THREADS_PER_BLOCK)
#or set nthreads = 1024 or 256
nblocks = cld(dim, nthreads)

# define CUDA Kernel
function saxpy_gpu_kernel!(z, a, x, y)  
    index = (blockIdx().x - 1) * blockDim().x + threadIdx().x
    # calculate SAXPY
    if index <= length(z)
        @inbounds z[i] = a * x[i] + y[i]
    end
    return nothing
end

# launch CUDA Kernel

@btime CUDA.@sync @cuda(threads = nthreads,blocks = nblocks,saxpy_gpu_kernel!(z, a, x, y))

# record CUDA Kernel time
kernel_time = 

#Compare performance
kernel_v_cpu = cpu_time / kernel_time
kernel_v_broadcast = broadcast_time / kernel_time

