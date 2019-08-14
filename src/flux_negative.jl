function flux_negative_function(flux_positive_function, scheme)
    func(scheme, vector_in::Array{<:Real, 1}) = flux_positive_function(scheme,
                                                inverted_vector(vector_in))
    return func
end # flux_negative_function
