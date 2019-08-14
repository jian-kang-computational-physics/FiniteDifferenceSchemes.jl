function linear_scheme(offset_min::Int64, offset_max::Int64)
    float_coeff = float_flux_coefficients(
                      [i for i in offset_min - 1: offset_max])
    return Linear(offset_min,
                  offset_max,
                  float_coeff)
end

function flux_positive_linear(scheme::Linear,
                              vector_in::Array{<:AbstractFloat, 1})
    return dot(scheme.flux_coefficients, vector_in)
end # flux_positive_linear
