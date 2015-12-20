colors={}
	colors[1]=Color.Red
	colors[2]=Color.Blue
	colors[3]=Color.Orange
	colors[4]=Color.Pink
	colors[5]=Color.Purple
	colors[6]=Color.Aqua
	colors[7]=Color.Bisque
	colors[8]=Color.DeepPink
	colors[9]=Color.Orchid
	colors[10]=Color.ForestGreen
	colors[11]=Color.Yellow
	colorinp={}
	colorinp[1]="/red"
	colorinp[2]="/blue"
	colorinp[3]="/orange"
	colorinp[4]="/pink"
	colorinp[5]="/purple"
	colorinp[6]="/aqua"
	colorinp[7]="/bisque"
	colorinp[8]="/deep_pink"
	colorinp[9]="/orchid"
	colorinp[10]="/forest_green"
	colorinp[11]="/yellow"
function setColor(args)
	
		for i=1,11 do
			if(args.text==colorinp[i])
				then args.player:SetColor(colors[i])
				Chat:Send(args.player,"Color Set To "..colorinp[i],colors[i])
			end
		end
end
function help(args)
			if(args.text=="/colors")
				then 
				Chat:Send(args.player,"The Default Colors Are:",Color.Chartreuse)
				for j=1,11,1 do
					 Chat:Send(args.player,colorinp[j],colors[j])
				end
			end
end
Events:Subscribe("PlayerChat",setColor)
Events:Subscribe("PlayerChat",help)