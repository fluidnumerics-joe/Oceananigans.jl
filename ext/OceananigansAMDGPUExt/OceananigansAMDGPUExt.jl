module OceananigansAMDGPUExt

using AMDGPU

include("Architectures.jl")
include("Utils.jl")
include("BoundaryConditions.jl")
include("Fields.jl")
include("MultiRegion.jl")
include("Solvers.jl")

using .Architectures
using .Utils
using .BoundaryConditions
using .Fields
using .MultiRegion
using .Solvers

function __init__()
    if AMDGPU.has_rocm_gpu()
        @debug "ROCm-enabled GPU(s) detected:"
        for (id, agent) in enumerate(AMDGPU.devices())
            @debug "$id: $(agent.name)"
        end
    else
        @debug "No ROCm-enabled GPU was found"
    end
end

end # module
