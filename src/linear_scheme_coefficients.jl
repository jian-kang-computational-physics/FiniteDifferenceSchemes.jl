function vandermonde_matrix(offsets::Array{Int64, 1})
    num_points = size(offsets)[1]
    ret_matrix = reshape([0 // 1 for i in 1:num_points ^ 2],
                         (num_points, num_points))
    for i in 1:num_points
        ret_matrix[1, i] = 1 // 1
    end
    for i in 2:num_points
        for j in 1:num_points
            ret_matrix[i, j] = ret_matrix[i - 1, j] * offsets[j]
        end
    end
    return ret_matrix
end # vandermonde_matrix

function scheme_coefficients(offsets::Array{Int64, 1})
    num_points = size(offsets)[1]
    coefficient_matrix = vandermonde_matrix(offsets)
    right_vector = reshape([0 // 1 for i in 1:num_points],
                           (num_points, 1))
    right_vector[2, 1] = 1 // 1
    return reshape(coefficient_matrix \ right_vector, (num_points, ))
end # scheme_coefficients

function rational_flux_coefficients(offsets::Array{Int64, 1})
    num_points = size(offsets)[1]
    coeff = scheme_coefficients(offsets)
    ret = [0 // 1 for i in 1:num_points]
    for i in 2:num_points
        ret[i] = ret[i - 1] - coeff[i - 1]
    end
    return ret[2:num_points]
end # rational_flux_coefficients

function float_flux_coefficients(offsets::Array{Int64, 1})
    rational_coeff = rational_flux_coefficients(offsets)
    num_points = size(rational_coeff)[1]
    return [float(rational_coeff[i]) for i in 1:num_points]
end # float_flux_coefficients
