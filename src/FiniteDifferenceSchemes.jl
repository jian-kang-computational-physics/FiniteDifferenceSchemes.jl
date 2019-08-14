module FiniteDifferenceSchemes
    using LinearAlgebra

    export Weno5, Linear
    export linear_scheme, weno5_js
    export flux_positive_linear
    export flux_positive_weno5
    export flux_negative_function

    abstract type AbstractSchemes{T1<:Integer, T2<:AbstractFloat} end

    struct Weno5{T1<:Integer, T2<:AbstractFloat} <: AbstractSchemes{T1, T2}
        offset_min::T1
        offset_max::T1
        epsilon::T2
    end # weno5

    struct Linear{T1<:Integer, T2<:AbstractFloat} <: AbstractSchemes{T1, T2}
        offset_min::T1
        offset_max::T1
        flux_coefficients::Array{T2, 1}
    end # linear

    include("linear_scheme_coefficients.jl")
    include("inverted_vector.jl")
    include("flux_negative.jl")
    include("linear.jl")
    include("weno.jl")
end # module
