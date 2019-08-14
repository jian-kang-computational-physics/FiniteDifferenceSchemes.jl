using FiniteDifferenceSchemes
using Test

@testset "LinearSchemes" begin
    upwind_3 = linear_scheme(-1, 1)
    vector_in = [1., 2., 3.]
    flux_negative_linear = flux_negative_function(flux_positive_linear,
                                                  upwind_3)
    @test flux_positive_linear(upwind_3, vector_in) ≈ 2.5
    @test flux_negative_linear(upwind_3, vector_in) ≈ 1.5
end

@testset "Weno5-JS" begin
    weno5 = weno5_js(1.e-8)
    vector_in = [1., 2., 3., 4., 5.]
    flux_negative_weno5 = flux_negative_function(flux_positive_weno5,
                                                 weno5)
    @test flux_positive_weno5(weno5, vector_in) ≈ 3.5
    @test flux_negative_weno5(weno5, vector_in) ≈ 2.5
end
