### A Pluto.jl notebook ###
# v0.11.14

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 6a65913e-2745-11eb-2b15-9f16d977a8e3
begin
	import Pkg
	#Pkg.activate(mktempdir())
	Pkg.activate(".")
 	Pkg.add(["PlutoUI","Plots"])
	using PlutoUI
	using Plots
	plotly()
end

# ╔═╡ 0ba73c90-26a9-11eb-152d-9bbf1422ced7
html"<button onclick=present()>Present</button>"

# ╔═╡ 1a2960de-26a9-11eb-121b-2d0e2f2ec64c
md"""## யாதும் ஊரே யாவறும் கேளிர்!
### To us all towns are our own, everyone our kin!"""

# ╔═╡ 26a15d50-26a9-11eb-0da8-bb8870bbae00
  md"""### 1. கிடைத்தளத்தில் எறிதல்"""

# ╔═╡ 872b74c0-26aa-11eb-3c2e-8125dd5fdb85
md""" ###### 'u' திசைவேகத்தில் 't' நேரத்தில் எறிபொருள் கடந்த தொலைவு 'x' 
      ###### எனில்.    x= ut or t=x/u"""

# ╔═╡ 10302340-26ad-11eb-1055-cf1e5bf798de
 md"""##### y= (1/2)gt^2.
      y=(1/2)g*(x/u)^2 """


# ╔═╡ 07545bf2-2753-11eb-17e3-5b7f80ce3107
begin
	md"""
	 கிடைத்தள திசைவேகம்:
	$(@bind u PlutoUI.Slider(1:9,default=2, show_value=true))
	 உயரம்:
	$(@bind H1 PlutoUI.Slider(100:100:1000,default=2, show_value=true))"""
	
end

# ╔═╡ 7ec82f3e-2744-11eb-07a1-df646ddeb880
begin
#u=10; # 10 m/s	
g= 1.62;
md"""*ஆரம்ப உயரம்--> $H1*  &	 *ஈர்ப்பு விசை--> $g (m/s)*
	"""
end

# ╔═╡ 27d2d830-2748-11eb-3308-d3a8dca46f75
let
	x1=1:100;
	y=@. H1-(1/2)*g*(x1/u)^2
	indexArray = findall( x -> x <= 0, y );
	if(length(findall( x -> x <= 0, y )) ==0)
		indexArray=x1[end]	
	end
	y[isless.(y, 0)] .=0
	#x1[isless.(y, 0)] .=0
	plot(x1,y,xlims=(0,x1[indexArray[1]]+10),c=:green,leg=:false)
	scatter!(x1,y)
	xaxis!("நெடுக்கம்")
	yaxis!("உயரம்")
	
end

# ╔═╡ 30d5c7c0-276c-11eb-0bcb-ad29cd883af7
md""" #### கணக்குகள்
"""

# ╔═╡ a7440c90-274a-11eb-3976-47e25458fac4
begin
md""" ##### வெவ்வேறு கோள்கள் ஈர்ப்பு விசை கொண்டு நெடுக்கத்தை கணக்கீடுக ????"""
end

# ╔═╡ 03205060-276d-11eb-1d73-2de0b39d7a70
HTML("""<img src="https://upload.wikimedia.org/wikipedia/commons/b/b7/Solar_System_size_to_scale_tamil.svg">""")

# ╔═╡ Cell order:
# ╟─0ba73c90-26a9-11eb-152d-9bbf1422ced7
# ╠═1a2960de-26a9-11eb-121b-2d0e2f2ec64c
# ╟─6a65913e-2745-11eb-2b15-9f16d977a8e3
# ╟─26a15d50-26a9-11eb-0da8-bb8870bbae00
# ╟─872b74c0-26aa-11eb-3c2e-8125dd5fdb85
# ╟─10302340-26ad-11eb-1055-cf1e5bf798de
# ╠═7ec82f3e-2744-11eb-07a1-df646ddeb880
# ╟─07545bf2-2753-11eb-17e3-5b7f80ce3107
# ╠═27d2d830-2748-11eb-3308-d3a8dca46f75
# ╟─30d5c7c0-276c-11eb-0bcb-ad29cd883af7
# ╟─a7440c90-274a-11eb-3976-47e25458fac4
# ╠═03205060-276d-11eb-1d73-2de0b39d7a70
