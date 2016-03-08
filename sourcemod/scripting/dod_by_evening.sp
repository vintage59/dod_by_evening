#pragma semicolon 1
#include <sourcemod>
#include <sdktools>

#define PLUGIN_VERSION "1.0"

#define MAXSKIES 5

new random_sky;
new Handle:g_enable = INVALID_HANDLE;

new String:sky_name[][] = 
{
	"sky_borealis01", 
	"sky_dod_09_hdr", 
	"sky_day03_06", 
	"sky_day02_09", 
	"sky_day01_09"
};

public Plugin:myinfo = 
{
	name = "DoDs_by_Evening", 
	author = "vintage", 
	description = "Play DoDs at late time!", 
	version = PLUGIN_VERSION, 
	url = "http://www.dodsplugins.net"
}

public OnPluginStart()
{
	CreateConVar("dod_evening_version", PLUGIN_VERSION, "DoDs_by_Evening (DO NOT CHANGE!)", FCVAR_DONTRECORD | FCVAR_PLUGIN | FCVAR_SPONLY | FCVAR_REPLICATED | FCVAR_NOTIFY);
	SetConVarString(FindConVar("dod_evening_version"), PLUGIN_VERSION);
	g_enable = CreateConVar("dod_evening_enable", "0", "<1/0> = enable/disable DoDs_by_Evening (default: 0)", FCVAR_PLUGIN, true, 0.0, true, 1.0);
}

public OnMapStart()
{
	if (GetConVarInt(g_enable) == 1)
	{
		random_sky = GetRandomInt(0, MAXSKIES - 1);
		ServerCommand("sv_skyname %s", sky_name[random_sky]);
		SetLightStyle(0, "b");
	}
}
