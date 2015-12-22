--you can make your own custom colors with custom names just change the values of "colors" to Either Color.Premade Or Color(Red,Green,Blue) 
--change the corresponding colors names to you chosen name Example:"barf_green"  (Dont put spaces in you color names!Use underscores instead)
--setting up the color values for use with premade colors
colorsValue={}
	colorsValue[1]=Color.Red
	colorsValue[2]=Color.Blue
	colorsValue[3]=Color.Orange
	colorsValue[4]=Color.Pink
	colorsValue[5]=Color.Purple
	colorsValue[6]=Color.Aqua
	colorsValue[7]=Color.White
	colorsValue[8]=Color.DeepPink
	colorsValue[9]=Color.ForestGreen
	colorsValue[10]=Color.Yellow
	colorsValue[11]=Color.Red
	colorsValue[12]=Color.Green
	colorsValue[13]=Color.Blue
--setting the list of inputs for colors
	colorsNames={}
	colorsNames[1]="red"
	colorsNames[2]="blue"
	colorsNames[3]="orange"
	colorsNames[4]="pink"
	colorsNames[5]="purple"
	colorsNames[6]="aqua"
	colorsNames[7]="white"
	colorsNames[8]="deep_pink"
	colorsNames[9]="forest_green"
	colorsNames[10]="yellow"
	colorsNames[11]="custom (red value) (green value) (blue value)"
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
				if(PlayerInp[2]==colorsNames[i])
				then args.player:SetColor(colorsValue[i])
				Chat:Send(args.player,"Color Set To:"..colorsNames[i],colorsValue[i])
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
					 Chat:Send(args.player,colorsNames[j],colorsValue[j])
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
