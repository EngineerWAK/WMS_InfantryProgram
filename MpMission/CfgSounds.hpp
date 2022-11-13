/**
 * CfgSounds.hpp
 *
 * TNA-Community
 * https://discord.gg/Zs23URtjwF
 * © 2021 {|||TNA|||}WAKeupneo
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
class CfgSounds
{
	sounds[] = {};
	class RocketMan
	{
		// how the sound is referred to in the editor (e.g. trigger effects)
		name = "RocketMan";
		// filename, volume, pitch, distance (optional)
		sound[] = {"Custom\Ogg\RocketMan.ogg",1,1,50};
		// subtitle delay in seconds, subtitle text
		titles[] = {};
	};
	/*
	class Radionoise1
	{
		// how the sound is referred to in the editor (e.g. trigger effects)
		name = "Radionoise1";
		// filename, volume, pitch, distance (optional)
		sound[] = {"@a3\dubbing_radio_f\Sfx\radionoise1.ogg",1,1,0};
		// subtitle delay in seconds, subtitle text
		titles[] = {};
	};*/
	class Radionoise1
	{
		name = "Radionoise1";
		// start path to sound file in AddOn with @
		sound[]		= { "@a3\dubbing_radio_f\Sfx\out2b.ogg", 1, 1, 0 };
		titles[]	= { 0, "" };
	};
     class HeliCrash
	{
		name = "HeliCrash";
		sound[] = {"Custom\Ogg\HeliCrash.ogg",1,1,0};
		titles[] = {};
	};
     class radio_morse
	{
		name = "radio_morse";
		sound[] = {"Custom\Ogg\radio_morse.ogg",1,1,0};
		titles[] = {};
	};
     class caralarm
	{
		name = "caralarm";
		sound[] = {"Custom\Ogg\caralarm.ogg",4,1,0};
		titles[] = {};
	};
     class fastTravel
	{
		name = "fasttravel";
		sound[] = {"Custom\Ogg\FastTravel.ogg",8,1,0};
		titles[] = {};
	};
     class GetToTheChoppa
	{
		name = "GetToTheChoppa";
		sound[] = {"Custom\Ogg\GetToTheChoppa.ogg",6,1,0};
		titles[] = {};
	};
     class uswin
	{
		name = "uswin";
		sound[] = {"Custom\Ogg\uswin.ogg",1,1,0};
		titles[] = {};
	};
     class britwin
	{
		name = "britwin";
		sound[] = {"Custom\Ogg\britwin.ogg",1,1,0};
		titles[] = {};
	};
     class germanwin
	{
		name = "germanwin";
		sound[] = {"Custom\Ogg\germanwin.ogg",1,1,0};
		titles[] = {};
	};
     class britareasecure
	{
		name = "britareasecure";
		sound[] = {"Custom\Ogg\britareasecure.ogg",2,1,0};
		titles[] = {};
	};
     class britobjectivesecure
	{
		name = "britobjectivesecure";
		sound[] = {"Custom\Ogg\britobjectivesecure.ogg",2,1,0};
		titles[] = {};
	};
     class britpointcaptured
	{
		name = "britpointcaptured";
		sound[] = {"Custom\Ogg\britpointcaptured.ogg",2,1,0};
		titles[] = {};
	};
     class usareasecure //"usareasecure","usobjectivesecure","uspointcaptured","britareasecure","britobjectivesecure","britpointcaptured"
	{
		name = "usareasecure";
		sound[] = {"Custom\Ogg\usareasecure.ogg",2,1,0};
		titles[] = {};
	};
     class usobjectivesecure
	{
		name = "usobjectivesecure";
		sound[] = {"Custom\Ogg\usobjectivesecure.ogg",2,1,0};
		titles[] = {};
	};
     class uspointcaptured
	{
		name = "uspointcaptured";
		sound[] = {"Custom\Ogg\uspointcaptured.ogg",2,1,0};
		titles[] = {};
	};
     class HelmetShot
	{
		name = "HelmetShot";
		sound[] = {"Custom\Ogg\HelmetShot.ogg",3,1,0};
		titles[] = {};
	};
     class HeadShot
	{
		name = "HeadShot";
		sound[] = {"Custom\Ogg\HeadShot.ogg",0.5,1,0};
		titles[] = {};
	};
};
