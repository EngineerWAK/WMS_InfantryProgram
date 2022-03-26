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

//[_killer] call WMS_fnc_DynAI_baseATK_Reinforce;
if (WMS_DynAI_LOGs) then {diag_log format ["[DYNAI BASEATK REINFORCE]|WAK|TNA|WMS| _this = %1", _this]};
private [];
params[
	"_killer"
];
//_triggType = "BaseATKreinforcement";