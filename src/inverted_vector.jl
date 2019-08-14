function inverted_vector(vector_in::Array{<:Real, 1})
    num_points = size(vector_in)[1]
    return reshape([vector_in[num_points + 1 - i]
                    for i in 1:num_points], (num_points, ))
end # inverted_vector
