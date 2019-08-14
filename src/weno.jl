function weno5_js(epsilon)
       return Weno5(-2, 2, epsilon)
end

function flux_positive_weno5(scheme::Weno5,
                             vector_in::Array{<:AbstractFloat, 1})
    is_w1 = 13. / 12
    is_w2 = 0.25
    tmp1 = [1.; -2.;  1.]
    tmp2 = [1.; -4.;  3.]
    tmp3 = [1.;  0.; -1.]
    tmp4 = [3.; -4.;  1.]
    is_0 = is_w1 * (dot(tmp1, vector_in[1:3])) ^ 2 +
           is_w2 * (dot(tmp2, vector_in[1:3])) ^ 2
    is_1 = is_w1 * (dot(tmp1, vector_in[2:4])) ^ 2 +
           is_w2 * (dot(tmp3, vector_in[2:4])) ^ 2
    is_2 = is_w1 * (dot(tmp1, vector_in[3:5])) ^ 2 +
           is_w2 * (dot(tmp4, vector_in[3:5])) ^ 2
    a_0 = 0.1 / (scheme.epsilon + is_0)
    a_1 = 0.6 / (scheme.epsilon + is_1)
    a_2 = 0.3 / (scheme.epsilon + is_2)
    f_0 = (vector_in[1] * 2 - vector_in[2] * 7 + vector_in[3] * 11) / 6
    f_1 = (- vector_in[2] + vector_in[3] * 5 + vector_in[4] * 2) / 6
    f_2 = (vector_in[3] * 2 + vector_in[4] * 5 - vector_in[5]) / 6
    return (a_0 * f_0 + a_1 * f_1 + a_2 * f_2) / (a_0 + a_1 + a_2)
end # flux_positive_weno5
