--you can make your own custom colors with custom names just change the values of "colors" to Either Color.Premade Or Color(Red,Green,Blue) 
--change the corresponding colors names to you chosen name Example:"barf_green"  (Dont put spaces in you color names!Use underscores instead)
--setting up the color values for use with premade colors
colors={}
	colors[1]=Color.Red
	colors[2]=Color.Blue
	colors[3]=Color.Orange
	colors[4]=Color.Pink
	colors[5]=Color.Purple
	colors[6]=Color.Aqua
	colors[7]=Color.White
	colors[8]=Color.DeepPink
	colors[9]=Color.ForestGreen
	colors[10]=Color.Yellow
	colors[11]=Color.Red
	colors[12]=Color.Green
	colors[13]=Color.Blue
--setting the list of inputs for colors
	colorinp={}
	colorinp[1]="red"
	colorinp[2]="blue"
	colorinp[3]="orange"
	colorinp[4]="pink"
	colorinp[5]="purple"
	colorinp[6]="aqua"
	colorinp[7]="white"
	colorinp[8]="deep_pink"
	colorinp[9]="forest_green"
	colorinp[10]="yellow"
	colorinp[11]="custom (red value) (green value) (blue value)"
	--[WARNING] Dont edit this area unless you know what your doing
	--tells player the sript is installed when they join
function informPlayer(args)
Chat:Send(args.player,"This server has ColorChoice installed do /colors to view the colors you can choose from(your chosen color will be your wingsuit color)",Color.Chartreuse)
end
--when a player chats it cycles through the commands to check for and sets the color accordingly
function setColor(args)
	PlayerInp=args.text:split(" ")
	if(PlayerInp[1]=="/color")
		then
			for i=1,10 do
				if(PlayerInp[2]==colorinp[i])
				then args.player:SetColor(colors[i])
				Chat:Send(args.player,"Color Set To:"..colorinp[i],colors[i])
				end
			end
		end
end
--prints all the commands when /colors is used
function help(args)
			if(args.text=="/colors")
				then 
				Chat:Send(args.player,"Use /color with these colors to set your name color",Color.Chartreuse)
				for j=1,11,1 do
					 Chat:Send(args.player,colorinp[j],colors[j])
				end
			end
end
--allows player to insert r g b values for their name
--has saftey for dumb players wont try to set their color if they cont use the command correctly "PlayerInp[5]~=nil
function customC(args)
PlayerInp=args.text:split(" ")

	if(PlayerInp[1]=="/color" and PlayerInp[2]=="custom" and PlayerInp[5]~=nil)
		then args.player:SetColor(Color(tonumber(PlayerInp[3]),tonumber(PlayerInp[4]),tonumber(PlayerInp[5])))
		Chat:Send(args.player,"Color Set To:Custom Color",Color(tonumber(PlayerInp[3]),tonumber(PlayerInp[4]),tonumber(PlayerInp[5])))
	end	
end
Events:Subscribe("PlayerChat",setColor)
Events:Subscribe("PlayerChat",customC)
Events:Subscribe("PlayerChat",help)
Events:Subscribe("PlayerJoin",informPlayer)
