using Beagle, Test

if !isfile("tmp/df_example.csv")
	include("generate_examples.jl")
end

@testset "Transforms Goodness of fit" begin
	trans_df = TransformGoF(df.x,df.y_linear)
	@test typeof(trans_df) == DataFrame
	@test typeof(trans_df.AIC) == Array{Float64,1}
	@test typeof(trans_df.r2) == Array{Float64,1}
	@test typeof(trans_df.transforms) == Array{String,1}
	@test typeof(trans_df.coef[1]) == Array{Float64,1}
end
