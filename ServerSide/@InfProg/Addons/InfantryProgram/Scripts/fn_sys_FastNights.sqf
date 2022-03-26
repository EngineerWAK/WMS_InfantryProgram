/**
* InfantryProgram
*
* TNA-Community
* https://discord.gg/Zs23URtjwF
* © 2021 {|||TNA|||}WAKeupneo
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
* Do Not Re-Upload
*/

if (daytime >= 1 && {daytime < WMS_FastNight_Morning}) then   // Night time
{
	setTimeMultiplier WMS_FastNight_Night;
	60 setOvercast 0;
	//60 setFog 0;
} else {
	if (daytime >= WMS_FastNight_Morning && {daytime < WMS_FastNight_Morning+1}) then   // Morning
	{
		setTimeMultiplier WMS_FastNight_Morn_Even;
		//30 setRain 0;
	} else {		
		if (daytime >= WMS_FastNight_Morning+1 && {daytime < WMS_FastNight_Evening}) then   // Day
		{
			setTimeMultiplier WMS_FastNight_Day;
			//180 setRain 0;
		} else {	
			if (daytime >= WMS_FastNight_Evening && {daytime < WMS_FastNight_Evening+1}) then   // Evening
			{
				setTimeMultiplier WMS_FastNight_Morn_Even;
				//30 setRain 0;      
			} else {
				if (daytime >= WMS_FastNight_Evening+1 && {daytime < 23}) then   // Night time
				{
					setTimeMultiplier WMS_FastNight_Night;
					60 setOvercast 0;
					60 setFog 0;
				};
			};
		};
	};
};
if (fog > 0.4) then {
	setWind [0, 0, false];
	10 setGusts 0;
};