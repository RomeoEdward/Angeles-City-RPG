#include <a_samp>
#if !defined IsValidVehicle
    native IsValidVehicle(vehicleid);
#endif
#include <dini>
#define COLOR_ERROR 0xA40000FF
#define COLOR_GREEN 0x00D500FF
#define COLOR_WHITE 0xFFFFFFFF
#define COLOR_RED 0xFF0000FF
#define MAX_GARAGES 50
enum gInfo
{
	Float:ExtX,
	Float:ExtY,
	Float:ExtZ,
	Float:ExtA,
	Float:IntX,
	Float:IntY,
	Float:IntZ,
	Float:IntA,
	Price,
	IntID,
	vWorld,
	Status,
	ForSale,
	IntPickup,
	Text3D:IntLabel,
	Pickup,
	Text3D:Label
}
new GarageInfo[MAX_GARAGES][gInfo];
new IsGarageVehicle[MAX_GARAGES][MAX_VEHICLES];
public OnFilterScriptInit()
{
    CreateObject(8378, 608.30280, -75.59090, 996.99127,   0.00000, 0.00000, 90.00000);
	CreateObject(8378, 608.34052, -137.51871, 996.99127,   0.00000, 0.00000, 90.00000);
	CreateObject(8378, 603.00000, -0.42970, 1003.21918,   0.00000, 0.00000, 90.00000);
	for(new g = 0; g <= MAX_GARAGES; g++)
	{
	    new string[256], LoadString[256], GarageInterior[128], GarageLocked[128], GarageOwner[MAX_PLAYER_NAME];
	    format(LoadString, sizeof(LoadString), "/Garages/%d.dini.save", g);
	    if(dini_Exists(LoadString))
		{
		    LoadGarages(g);
			IsGarageVehicle[g][5] = 0;
		    format(GarageOwner, MAX_PLAYER_NAME, dini_Get(LoadString, "Owner"));
		    if(GarageInfo[g][IntID] == 0) GarageInterior = "{FFFF00}小型";
			if(GarageInfo[g][IntID] == 2) GarageInterior = "{00FF00}中型";
			if(GarageInfo[g][IntID] == 3) GarageInterior = "{00FF00}中型";
			if(GarageInfo[g][IntID] == 1) GarageInterior = "{FF0000}大型";
			if(GarageInfo[g][Status] == 0) GarageLocked = "{00FF00}未锁";
			if(GarageInfo[g][Status] == 1) GarageLocked = "{FF0000}锁住";
			if(GarageInfo[g][Price] == 0) format(string,sizeof(string),"拥有人: {FF0000}%s\n{FFFFFF}价格: {00FF00}免费\n{FFFFFF}状态: %s\n{FFFFFF}内饰: %s", GarageOwner, GarageLocked, GarageInterior);
			else format(string,sizeof(string),"拥有人: {FF0000}%s\n{FFFFFF}价格: {FF0000}%d\n{FFFFFF}状态: %s\n{FFFFFF}内饰: %s", GarageOwner, GarageInfo[g][Price], GarageLocked, GarageInterior);
			GarageInfo[g][Label] = Create3DTextLabel(string, COLOR_WHITE, GarageInfo[g][ExtX], GarageInfo[g][ExtY], GarageInfo[g][ExtZ]+0.8, 10.0, 0, 0);
			GarageInfo[g][Pickup] = CreatePickup(1318, 1, GarageInfo[g][ExtX], GarageInfo[g][ExtY], GarageInfo[g][ExtZ]);
			format(string, sizeof(string), "{FFFF00}输入[/g exit]退出车库");
			GarageInfo[g][IntLabel] = Create3DTextLabel(string, COLOR_WHITE, GarageInfo[g][IntX], GarageInfo[g][IntY], GarageInfo[g][IntZ]+0.8, 10.0, 0, 0);
			GarageInfo[g][IntPickup] = CreatePickup(1318, 1, GarageInfo[g][IntX], GarageInfo[g][IntY], GarageInfo[g][IntZ]);
		}
	}
	return 1;
}
public OnFilterScriptExit()
{
    for(new g = 0; g <= MAX_GARAGES; g++)
	{
	    new UnloadString[256];
	    format(UnloadString, sizeof(UnloadString), "/Garages/%d.dini.save", g);
	    if(dini_Exists(UnloadString))
		{
	    	Delete3DTextLabel(GarageInfo[g][Label]);
			DestroyPickup(GarageInfo[g][Pickup]);
		}
	}
	return 1;
}
public OnPlayerDisconnect(playerid, reason)
{
	new SaveString[256];
	format(SaveString,sizeof(SaveString),"/MoneySave/%d.dini.save",PlayerName(playerid));
    if(!dini_Exists(SaveString))
    {
    	dini_Create(SaveString);
    	dini_IntSet(SaveString, "Money", GetPlayerMoney(playerid));
	}
	else
	{
	    dini_IntSet(SaveString, "Money", GetPlayerMoney(playerid));
	}
	return 1;
}
public OnPlayerCommandText(playerid, cmdtext[])
{
	new string[256], SaveString[256];
   	if(strfind(cmdtext, "/g create", true) == 0)
    {
	    if(IsPlayerAdmin(playerid))
	    {
	        new gID = ReturnNextUnusedGarageID();
			format(SaveString,sizeof(SaveString),"/Garages/%d.dini.save",gID);
		    if(!dini_Exists(SaveString))
		    {
		        new where = -1;
			    if(strlen(cmdtext) > 10 && (where = strfind(cmdtext, " ", true, 10)) != -1)
            	{
					new Garage[32];
     				strmid(Garage, cmdtext, 10, where);
					if(strcmp(Garage, "Small", true) == 0)
					{
					    new GarageOwner[MAX_PLAYER_NAME];
						format(GarageOwner, MAX_PLAYER_NAME, "No");
						new StringPrice[24];
		                strmid(StringPrice, cmdtext, where, strlen(cmdtext));
		                GarageInfo[gID][Price] = strval(StringPrice);
						GetPlayerPos(playerid, GarageInfo[gID][ExtX], GarageInfo[gID][ExtY], GarageInfo[gID][ExtZ]);
						GetPlayerFacingAngle(playerid,GarageInfo[gID][ExtA]);
						GarageInfo[gID][vWorld] = ReturnNextUnusedVirtualWorld();
						GarageInfo[gID][IntID] = 0;
						GarageInfo[gID][Status] = 0;
						GarageInfo[gID][ForSale] = 1;
						GarageInfo[gID][IntX] = 1643.6659;
						GarageInfo[gID][IntY] = -1517.0594;
						GarageInfo[gID][IntZ] = 13.5688;
						GarageInfo[gID][IntA] = 0.0000;
						GarageInfo[gID][Pickup] = CreatePickup(1318, 1, GarageInfo[gID][ExtX], GarageInfo[gID][ExtY], GarageInfo[gID][ExtZ]);
						if(GarageInfo[gID][Price] == 0) format(string,sizeof(string),"拥有人: {FF0000}无\n{FFFFFF}价格: {00FF00}免费\n{FFFFFF}状态: {00FF00}未锁\n{FFFFFF}内饰: {FFFF00}小型");
						else format(string,sizeof(string),"拥有人: {FF0000}无\n{FFFFFF}价格: {FF0000}%d\n{FFFFFF}状态: {00FF00}未锁\n{FFFFFF}内饰: {FFFF00}小型", GarageInfo[gID][Price]);
						GarageInfo[gID][Label] = Create3DTextLabel(string, COLOR_WHITE, GarageInfo[gID][ExtX], GarageInfo[gID][ExtY], GarageInfo[gID][ExtZ]+0.8, 10.0, 0, 0);
						
						format(string, sizeof(string), "{FFFF00}输入[/g exit]退出车库");
						GarageInfo[gID][IntLabel] = Create3DTextLabel(string, COLOR_WHITE, GarageInfo[gID][IntX], GarageInfo[gID][IntY], GarageInfo[gID][IntZ]+0.8, 10.0, 0, 0);
						GarageInfo[gID][IntPickup] = CreatePickup(1318, 1, GarageInfo[gID][IntX], GarageInfo[gID][IntY], GarageInfo[gID][IntZ]);

						//Saving garage
				        dini_Create(SaveString);
				        dini_Set(SaveString, "\nOwner", GarageOwner);
				        dini_FloatSet(SaveString,"Ext:X", GarageInfo[gID][ExtX]);
				  		dini_FloatSet(SaveString,"Ext:Y", GarageInfo[gID][ExtY]);
				    	dini_FloatSet(SaveString,"Ext:Z", GarageInfo[gID][ExtZ]);
				    	dini_FloatSet(SaveString,"Ext:A", GarageInfo[gID][ExtA]);
				    	dini_FloatSet(SaveString,"Int:X", GarageInfo[gID][IntX]);
				  		dini_FloatSet(SaveString,"Int:Y", GarageInfo[gID][IntY]);
				    	dini_FloatSet(SaveString,"Int:Z", GarageInfo[gID][IntZ]);
				    	dini_FloatSet(SaveString,"Int:A", GarageInfo[gID][IntA]);
		                dini_IntSet(SaveString, "VirtualWorld", GarageInfo[gID][vWorld]);
		                dini_IntSet(SaveString, "Interior", GarageInfo[gID][IntID]);
		                dini_IntSet(SaveString, "Status", GarageInfo[gID][Status]);
		                dini_IntSet(SaveString, "ForSale", GarageInfo[gID][ForSale]);
		                dini_IntSet(SaveString, "Price", GarageInfo[gID][Price]);
		                for(new v = 0; v <= MAX_VEHICLES; v++)
						{
						    if(IsValidVehicle(v))
						    {
								IsGarageVehicle[gID][v] = 0;
							}
						}
		                //Message
				        SendClientMessage(playerid,COLOR_GREEN,"车库创建成功!");
					    return 1;
					}
					else if(strcmp(Garage, "Medium1", true) == 0)
					{
					    new GarageOwner[MAX_PLAYER_NAME];
						format(GarageOwner, MAX_PLAYER_NAME, "No");
						new StringPrice[24];
		                strmid(StringPrice, cmdtext, where, strlen(cmdtext));
		                GarageInfo[gID][Price] = strval(StringPrice);
						GetPlayerPos(playerid, GarageInfo[gID][ExtX], GarageInfo[gID][ExtY], GarageInfo[gID][ExtZ]);
						GetPlayerFacingAngle(playerid,GarageInfo[gID][ExtA]);
						GarageInfo[gID][vWorld] = ReturnNextUnusedVirtualWorld();
						GarageInfo[gID][IntID] = 2;
						GarageInfo[gID][Status] = 0;
						GarageInfo[gID][ForSale] = 1;
						GarageInfo[gID][IntX] = 612.4073;
						GarageInfo[gID][IntY] = -76.4425;
						GarageInfo[gID][IntZ] = 997.9922;
						GarageInfo[gID][IntA] = 270.0000;
						GarageInfo[gID][Pickup] = CreatePickup(1318, 1, GarageInfo[gID][ExtX], GarageInfo[gID][ExtY], GarageInfo[gID][ExtZ]);
						if(GarageInfo[gID][Price] == 0) format(string,sizeof(string),"拥有人: {FF0000}无\n{FFFFFF}价格: {00FF00}免费\n{FFFFFF}状态: {00FF00}未锁\n{FFFFFF}内饰: {00FF00}中型");
						else format(string,sizeof(string),"拥有人: {FF0000}无\n{FFFFFF}价格: {FF0000}%d\n{FFFFFF}状态: {00FF00}未锁\n{FFFFFF}内饰: {00FF00}中型", GarageInfo[gID][Price]);
						GarageInfo[gID][Label] = Create3DTextLabel(string, COLOR_WHITE, GarageInfo[gID][ExtX], GarageInfo[gID][ExtY], GarageInfo[gID][ExtZ]+0.8, 10.0, 0, 0);
						
						format(string, sizeof(string), "{FFFF00}输入[/g exit]退出车库");
						GarageInfo[gID][IntLabel] = Create3DTextLabel(string, COLOR_WHITE, GarageInfo[gID][IntX], GarageInfo[gID][IntY], GarageInfo[gID][IntZ]+0.8, 10.0, 0, 0);
						GarageInfo[gID][IntPickup] = CreatePickup(1318, 1, GarageInfo[gID][IntX], GarageInfo[gID][IntY], GarageInfo[gID][IntZ]);
						//Saving garage
				        dini_Create(SaveString);
				        dini_Set(SaveString, "\nOwner", GarageOwner);
				        dini_FloatSet(SaveString,"Ext:X", GarageInfo[gID][ExtX]);
				  		dini_FloatSet(SaveString,"Ext:Y", GarageInfo[gID][ExtY]);
				    	dini_FloatSet(SaveString,"Ext:Z", GarageInfo[gID][ExtZ]);
				    	dini_FloatSet(SaveString,"Ext:A", GarageInfo[gID][ExtA]);
				    	dini_FloatSet(SaveString,"Int:X", GarageInfo[gID][IntX]);
				  		dini_FloatSet(SaveString,"Int:Y", GarageInfo[gID][IntY]);
				    	dini_FloatSet(SaveString,"Int:Z", GarageInfo[gID][IntZ]);
				    	dini_FloatSet(SaveString,"Int:A", GarageInfo[gID][IntA]);
		                dini_IntSet(SaveString, "VirtualWorld", GarageInfo[gID][vWorld]);
		                dini_IntSet(SaveString, "Interior", GarageInfo[gID][IntID]);
		                dini_IntSet(SaveString, "Status", GarageInfo[gID][Status]);
		                dini_IntSet(SaveString, "ForSale", GarageInfo[gID][ForSale]);
		                dini_IntSet(SaveString, "Price", GarageInfo[gID][Price]);
		                for(new v = 0; v <= MAX_VEHICLES; v++)
						{
						    if(IsValidVehicle(v))
						    {
								IsGarageVehicle[gID][v] = 0;
							}
						}
		                //Message
				        SendClientMessage(playerid,COLOR_GREEN,"成功创建车库!");
					    return 1;
					}
					else if(strcmp(Garage, "Medium2", true) == 0)
					{
	                    new GarageOwner[MAX_PLAYER_NAME];
						format(GarageOwner, MAX_PLAYER_NAME, "No");
						new StringPrice[24];
		                strmid(StringPrice, cmdtext, where, strlen(cmdtext));
		                GarageInfo[gID][Price] = strval(StringPrice);
						GetPlayerPos(playerid, GarageInfo[gID][ExtX], GarageInfo[gID][ExtY], GarageInfo[gID][ExtZ]);
						GetPlayerFacingAngle(playerid,GarageInfo[gID][ExtA]);
						GarageInfo[gID][vWorld] = ReturnNextUnusedVirtualWorld();
						GarageInfo[gID][IntID] = 3;
						GarageInfo[gID][Status] = 0;
						GarageInfo[gID][ForSale] = 1;
						GarageInfo[gID][IntX] = 613.3256;
						GarageInfo[gID][IntY] = -125.1266;
						GarageInfo[gID][IntZ] = 997.9922;
						GarageInfo[gID][IntA] = 270.0000;
						GarageInfo[gID][Pickup] = CreatePickup(1318, 1, GarageInfo[gID][ExtX], GarageInfo[gID][ExtY], GarageInfo[gID][ExtZ]);
						if(GarageInfo[gID][Price] == 0) format(string,sizeof(string),"拥有人: {FF0000}无\n{FFFFFF}价格: {00FF00}免费\n{FFFFFF}状态: {00FF00}未锁\n{FFFFFF}内饰: {00FF00}中型");
						else format(string,sizeof(string),"拥有人: {FF0000}无\n{FFFFFF}价格: {FF0000}%d\n{FFFFFF}状态: {00FF00}未锁\n{FFFFFF}内饰: {00FF00}中型", GarageInfo[gID][Price]);
						GarageInfo[gID][Label] = Create3DTextLabel(string, COLOR_WHITE, GarageInfo[gID][ExtX], GarageInfo[gID][ExtY], GarageInfo[gID][ExtZ]+0.8, 10.0, 0, 0);
						
						format(string, sizeof(string), "{FFFF00}输入[/g exit]退出车库");
						GarageInfo[gID][IntLabel] = Create3DTextLabel(string, COLOR_WHITE, GarageInfo[gID][IntX], GarageInfo[gID][IntY], GarageInfo[gID][IntZ]+0.8, 10.0, 0, 0);
						GarageInfo[gID][IntPickup] = CreatePickup(1318, 1, GarageInfo[gID][IntX], GarageInfo[gID][IntY], GarageInfo[gID][IntZ]);
						//Saving garage
				        dini_Create(SaveString);
				        dini_Set(SaveString, "\nOwner", GarageOwner);
				        dini_FloatSet(SaveString,"Ext:X", GarageInfo[gID][ExtX]);
				  		dini_FloatSet(SaveString,"Ext:Y", GarageInfo[gID][ExtY]);
				    	dini_FloatSet(SaveString,"Ext:Z", GarageInfo[gID][ExtZ]);
				    	dini_FloatSet(SaveString,"Ext:A", GarageInfo[gID][ExtA]);
				    	dini_FloatSet(SaveString,"Int:X", GarageInfo[gID][IntX]);
				  		dini_FloatSet(SaveString,"Int:Y", GarageInfo[gID][IntY]);
				    	dini_FloatSet(SaveString,"Int:Z", GarageInfo[gID][IntZ]);
				    	dini_FloatSet(SaveString,"Int:A", GarageInfo[gID][IntA]);
		                dini_IntSet(SaveString, "VirtualWorld", GarageInfo[gID][vWorld]);
		                dini_IntSet(SaveString, "Interior", GarageInfo[gID][IntID]);
		                dini_IntSet(SaveString, "Status", GarageInfo[gID][Status]);
		                dini_IntSet(SaveString, "ForSale", GarageInfo[gID][ForSale]);
		                dini_IntSet(SaveString, "Price", GarageInfo[gID][Price]);
		                for(new v = 0; v <= MAX_VEHICLES; v++)
						{
						    if(IsValidVehicle(v))
						    {
								IsGarageVehicle[gID][v] = 0;
							}
						}
		                //Message
				        SendClientMessage(playerid,COLOR_GREEN,"车库创建成功!");
					    return 1;
					}
					else if(strcmp(Garage, "Big", true) == 0)
					{
					    new GarageOwner[MAX_PLAYER_NAME];
						format(GarageOwner, MAX_PLAYER_NAME, "No");
						new StringPrice[24];
		                strmid(StringPrice, cmdtext, where, strlen(cmdtext));
		                GarageInfo[gID][Price] = strval(StringPrice);
						GetPlayerPos(playerid, GarageInfo[gID][ExtX], GarageInfo[gID][ExtY], GarageInfo[gID][ExtZ]);
						GetPlayerFacingAngle(playerid,GarageInfo[gID][ExtA]);
						GarageInfo[gID][vWorld] = ReturnNextUnusedVirtualWorld();
						GarageInfo[gID][IntID] = 1;
						GarageInfo[gID][Status] = 0;
						GarageInfo[gID][ForSale] = 1;
						GarageInfo[gID][IntX] = 608.6567;
						GarageInfo[gID][IntY] = -10.2052;
						GarageInfo[gID][IntZ] = 1000.9206;
						GarageInfo[gID][IntA] = 270.0000;
						GarageInfo[gID][Pickup] = CreatePickup(1318, 1, GarageInfo[gID][ExtX], GarageInfo[gID][ExtY], GarageInfo[gID][ExtZ]);
						if(GarageInfo[gID][Price] == 0) format(string,sizeof(string),"拥有人: {FF0000}无\n{FFFFFF}价格: {00FF00}免费\n{FFFFFF}状态: {00FF00}未锁\n{FFFFFF}内饰: {00FF00}大型");
						else format(string,sizeof(string),"拥有人: {FF0000}无\n{FFFFFF}价格: {FF0000}%d\n{FFFFFF}状态: {00FF00}未锁\n{FFFFFF}内饰: {00FF00}大型", GarageInfo[gID][Price]);
						GarageInfo[gID][Label] = Create3DTextLabel(string, COLOR_WHITE, GarageInfo[gID][ExtX], GarageInfo[gID][ExtY], GarageInfo[gID][ExtZ]+0.8, 10.0, 0, 0);
						
						format(string, sizeof(string), "{FFFF00}输入[/g exit]退出车库");
						GarageInfo[gID][IntLabel] = Create3DTextLabel(string, COLOR_WHITE, GarageInfo[gID][IntX], GarageInfo[gID][IntY], GarageInfo[gID][IntZ]+0.8, 10.0, 0, 0);
						GarageInfo[gID][IntPickup] = CreatePickup(1318, 1, GarageInfo[gID][IntX], GarageInfo[gID][IntY], GarageInfo[gID][IntZ]);
						//Saving garage
				        dini_Create(SaveString);
				        dini_Set(SaveString, "\nOwner", GarageOwner);
				        dini_FloatSet(SaveString,"Ext:X", GarageInfo[gID][ExtX]);
				  		dini_FloatSet(SaveString,"Ext:Y", GarageInfo[gID][ExtY]);
				    	dini_FloatSet(SaveString,"Ext:Z", GarageInfo[gID][ExtZ]);
				    	dini_FloatSet(SaveString,"Ext:A", GarageInfo[gID][ExtA]);
				    	dini_FloatSet(SaveString,"Int:X", GarageInfo[gID][IntX]);
				  		dini_FloatSet(SaveString,"Int:Y", GarageInfo[gID][IntY]);
				    	dini_FloatSet(SaveString,"Int:Z", GarageInfo[gID][IntZ]);
				    	dini_FloatSet(SaveString,"Int:A", GarageInfo[gID][IntA]);
		                dini_IntSet(SaveString, "VirtualWorld", GarageInfo[gID][vWorld]);
		                dini_IntSet(SaveString, "Interior", GarageInfo[gID][IntID]);
		                dini_IntSet(SaveString, "Status", GarageInfo[gID][Status]);
		                dini_IntSet(SaveString, "ForSale", GarageInfo[gID][ForSale]);
		                dini_IntSet(SaveString, "Price", GarageInfo[gID][Price]);
		                for(new v = 0; v <= MAX_VEHICLES; v++)
						{
						    if(IsValidVehicle(v))
						    {
								IsGarageVehicle[gID][v] = 0;
							}
						}
		                //Message
				        SendClientMessage(playerid,COLOR_GREEN,"车库创建成功!");
					    return 1;
					}
					else SendClientMessage(playerid, COLOR_ERROR, "错误内饰.");
				} else SendClientMessage(playerid, COLOR_WHITE, "帮助: /g create [内饰型号] [价格]");
		    } 
		} else SendClientMessage(playerid, COLOR_ERROR, "你需要登录RCON.");
		return 1;
	}
	if(strcmp(cmdtext, "/g delete", true) == 0)
	{
	    if(IsPlayerAdmin(playerid))
	    {
		    for(new g = 0; g <= MAX_GARAGES; g++)
			{
			    new Garage[64];
		        format(Garage, sizeof(Garage), "/Garages/%d.dini.save", g);
		    	if(dini_Exists(Garage))
				{
				    LoadGarages(g);
		    		if(IsPlayerInRangeOfPoint(playerid, 3.0, GarageInfo[g][ExtX], GarageInfo[g][ExtY], GarageInfo[g][ExtZ]))
		    		{
				        format(Garage, sizeof(Garage), "/Garages/%d.dini.save", g);
				    	if(dini_Exists(Garage))
						{
						    Delete3DTextLabel(GarageInfo[g][Label]);
						    Delete3DTextLabel(GarageInfo[g][IntLabel]);
						    DestroyPickup(GarageInfo[g][IntPickup]);
						    DestroyPickup(GarageInfo[g][IntPickup]);
						    DestroyPickup(GarageInfo[g][IntPickup]);
						    DestroyPickup(GarageInfo[g][Pickup]);
						    DestroyPickup(GarageInfo[g][Pickup]);
						    DestroyPickup(GarageInfo[g][Pickup]);
						    dini_Remove(Garage);
						    SendClientMessage(playerid,COLOR_GREEN,"车路成功删除!");
						}
					}
				}
			}
		} else SendClientMessage(playerid, COLOR_ERROR, "你需要登录RCON.");
		return 1;
	}
	if(strcmp(cmdtext, "/g enter", true) == 0)
	{
	    for(new g = 0; g <= MAX_GARAGES; g++)
		{
		    new Garage[64];
	        format(Garage, sizeof(Garage), "/Garages/%d.dini.save", g);
	    	if(dini_Exists(Garage))
			{
       			LoadGarages(g);
	    		if(IsPlayerInRangeOfPoint(playerid, 3.0, GarageInfo[g][ExtX], GarageInfo[g][ExtY], GarageInfo[g][ExtZ]))
	    		{
			    	if(dini_Exists(Garage))
					{
		    		    if(GarageInfo[g][Status] == 0)
		    		    {
		    		        if(!IsPlayerInAnyVehicle(playerid))
		    		        {
				    		    SetPlayerPos(playerid,GarageInfo[g][IntX],GarageInfo[g][IntY],GarageInfo[g][IntZ]);
				    		    SetPlayerInterior(playerid,GarageInfo[g][IntID]);
				    		    SetPlayerVirtualWorld(playerid,GarageInfo[g][vWorld]);
				    		    SetPlayerFacingAngle(playerid,GarageInfo[g][IntA]);
				    		    SetCameraBehindPlayer(playerid);
							}
							if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		    		        {
		    		            new vehicleid = GetPlayerVehicleID(playerid);
	                            SetPlayerPos(playerid,GarageInfo[g][IntX],GarageInfo[g][IntY],GarageInfo[g][IntZ]);
				    		    SetPlayerInterior(playerid,GarageInfo[g][IntID]);
				    		    SetPlayerVirtualWorld(playerid,GarageInfo[g][vWorld]);
				    		    SetPlayerFacingAngle(playerid,GarageInfo[g][IntA]);
				    		    SetVehiclePos(vehicleid, GarageInfo[g][IntX],GarageInfo[g][IntY],GarageInfo[g][IntZ]);
				    		    SetVehicleVirtualWorld(vehicleid,GarageInfo[g][vWorld]);
				    		    LinkVehicleToInterior(vehicleid,GarageInfo[g][IntID]);
				    		    SetVehicleZAngle(vehicleid,GarageInfo[g][IntA]);
								PutPlayerInVehicle(playerid,vehicleid,0);
								IsGarageVehicle[g][vehicleid] = 1;
				    		    SetCameraBehindPlayer(playerid);
				    		    for(new i = 0; i < MAX_PLAYERS; i++)
								{
									if(IsPlayerInVehicle(i, vehicleid) && GetPlayerVehicleSeat(i) == 1)
									{
									    SetPlayerPos(i,GarageInfo[g][IntX],GarageInfo[g][IntY],GarageInfo[g][IntZ]);
						    		    SetPlayerInterior(i,GarageInfo[g][IntID]);
						    		    SetPlayerVirtualWorld(i,GarageInfo[g][vWorld]);
						    		    SetPlayerFacingAngle(i,GarageInfo[g][IntA]);
										PutPlayerInVehicle(i,vehicleid,1);
						    		    SetCameraBehindPlayer(i);
									}
									if(IsPlayerInVehicle(i, vehicleid) && GetPlayerVehicleSeat(i) == 2)
									{
									    SetPlayerPos(i,GarageInfo[g][IntX],GarageInfo[g][IntY],GarageInfo[g][IntZ]);
						    		    SetPlayerInterior(i,GarageInfo[g][IntID]);
						    		    SetPlayerVirtualWorld(i,GarageInfo[g][vWorld]);
						    		    SetPlayerFacingAngle(i,GarageInfo[g][IntA]);
										PutPlayerInVehicle(i,vehicleid,2);
						    		    SetCameraBehindPlayer(i);
									}
									if(IsPlayerInVehicle(i, vehicleid) && GetPlayerVehicleSeat(i) == 3)
									{
									    SetPlayerPos(i,GarageInfo[g][IntX],GarageInfo[g][IntY],GarageInfo[g][IntZ]);
						    		    SetPlayerInterior(i,GarageInfo[g][IntID]);
						    		    SetPlayerVirtualWorld(i,GarageInfo[g][vWorld]);
						    		    SetPlayerFacingAngle(i,GarageInfo[g][IntA]);
										PutPlayerInVehicle(i,vehicleid,3);
						    		    SetCameraBehindPlayer(i);
									}
								}
		    		        }
						} else GameTextForPlayer(playerid, "~r~LOCKED", 600, 1);
		    		}
				}
			}
	    }
		return 1;
	}
    if(strcmp(cmdtext, "/g exit", true) == 0)
	{
	    for(new g = 0; g <= MAX_GARAGES; g++)
		{
		    new Garage[64];
		    format(Garage, sizeof(Garage), "/Garages/%d.dini.save", g);
			if(dini_Exists(Garage))
			{
			    LoadGarages(g);
				if(IsPlayerInRangeOfPoint(playerid, 3.0, GarageInfo[g][IntX], GarageInfo[g][IntY], GarageInfo[g][IntZ]) && GetPlayerVirtualWorld(playerid) == GarageInfo[g][vWorld])
				{
	    		    if(GarageInfo[g][Status] == 0)
	    		    {
	    		        if(!IsPlayerInAnyVehicle(playerid))
	    		        {
			    		    SetPlayerPos(playerid,GarageInfo[g][ExtX],GarageInfo[g][ExtY],GarageInfo[g][ExtZ]);
			    		    SetPlayerInterior(playerid,0);
			    		    SetPlayerVirtualWorld(playerid,0);
			    		    SetPlayerFacingAngle(playerid,GarageInfo[g][ExtA]);
			    		    SetCameraBehindPlayer(playerid);
			    		    return 1;
						}
						if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	    		        {
	    		            new vehicleid = GetPlayerVehicleID(playerid);
                            SetPlayerPos(playerid,GarageInfo[g][ExtX],GarageInfo[g][ExtY],GarageInfo[g][ExtZ]);
			    		    SetPlayerInterior(playerid,0);
			    		    SetPlayerVirtualWorld(playerid,0);
			    		    SetPlayerFacingAngle(playerid,GarageInfo[g][ExtA]);
			    		    SetVehiclePos(vehicleid, GarageInfo[g][ExtX],GarageInfo[g][ExtY],GarageInfo[g][ExtZ]);
			    		    SetVehicleVirtualWorld(vehicleid,0);
			    		    LinkVehicleToInterior(vehicleid,0);
			    		    SetVehicleZAngle(vehicleid,GarageInfo[g][ExtA]);
							PutPlayerInVehicle(playerid,vehicleid,0);
							IsGarageVehicle[g][vehicleid] = 0;
			    		    SetCameraBehindPlayer(playerid);
			    		    for(new i = 0; i < MAX_PLAYERS; i++)
							{
								if(IsPlayerInVehicle(i, vehicleid) && GetPlayerVehicleSeat(i) == 1)
								{
								    SetPlayerPos(playerid,GarageInfo[g][ExtX],GarageInfo[g][ExtY],GarageInfo[g][ExtZ]);
					    		    SetPlayerInterior(playerid,0);
					    		    SetPlayerVirtualWorld(playerid,0);
			    		    		SetPlayerFacingAngle(playerid,GarageInfo[g][ExtA]);
									PutPlayerInVehicle(i,vehicleid,1);
					    		    SetCameraBehindPlayer(i);
								}
								if(IsPlayerInVehicle(i, vehicleid) && GetPlayerVehicleSeat(i) == 2)
								{
								    SetPlayerPos(playerid,GarageInfo[g][ExtX],GarageInfo[g][ExtY],GarageInfo[g][ExtZ]);
					    		    SetPlayerInterior(playerid,0);
					    		    SetPlayerVirtualWorld(playerid,0);
			    		    		SetPlayerFacingAngle(playerid,GarageInfo[g][ExtA]);
									PutPlayerInVehicle(i,vehicleid,2);
					    		    SetCameraBehindPlayer(i);
								}
								if(IsPlayerInVehicle(i, vehicleid) && GetPlayerVehicleSeat(i) == 3)
								{
								    SetPlayerPos(playerid,GarageInfo[g][ExtX],GarageInfo[g][ExtY],GarageInfo[g][ExtZ]);
					    		    SetPlayerInterior(playerid,0);
					    		    SetPlayerVirtualWorld(playerid,0);
			    		    		SetPlayerFacingAngle(playerid,GarageInfo[g][ExtA]);
									PutPlayerInVehicle(i,vehicleid,3);
					    		    SetCameraBehindPlayer(i);
								}
							}
							return 1;
	    		        }
					} else GameTextForPlayer(playerid, "~r~LOCKED", 600, 1);
	    		}
			}
	    }
		return 1;
	}
	if(strcmp(cmdtext, "/g", true) == 0)
	{
	    if(IsPlayerAdmin(playerid))
	    {
	    	SendClientMessage(playerid,0xFFFF00FF,"All Garage Commands:");
	    	SendClientMessage(playerid,COLOR_WHITE,"    Only for RCON ADMINS: /g create | /g delete | /g changeowner | /g changeinterior");
	    	SendClientMessage(playerid,COLOR_WHITE,"    Only for garages owners: /g sell | /g lock");
	    	SendClientMessage(playerid,COLOR_WHITE,"    For all players: /g enter | /g exit | /g buy");
		}
		else
		{
		    SendClientMessage(playerid,0xFFFF00FF,"车库帮助:");
	    	SendClientMessage(playerid,COLOR_WHITE,"    业主使用: /g sell | /g lock");
	    	SendClientMessage(playerid,COLOR_WHITE,"    所有玩家: /g enter | /g exit | /g buy");
		}
	    return 1;
	}
	if(strfind(cmdtext, "/g changeowner", true) == 0)
    {
        if(IsPlayerAdmin(playerid))
        {
            for(new g = 0; g <= MAX_GARAGES; g++)
			{
			    new Garage[64];
		        format(Garage, sizeof(Garage), "/Garages/%d.dini.save", g);
		    	if(dini_Exists(Garage))
				{
	       			LoadGarages(g);
		    		if(IsPlayerInRangeOfPoint(playerid, 3.0, GarageInfo[g][ExtX], GarageInfo[g][ExtY], GarageInfo[g][ExtZ]))
		    		{
		    		    new GarageOwner[MAX_PLAYER_NAME], GarageLocked[128], GarageInterior[128], Garage2[64];
					    format(Garage2, sizeof(Garage2), "/Garages/%d.dini.save", g);
						if(dini_Exists(Garage2))
						{
						    if(strlen(cmdtext) > 15)
	    					{
	                   			strmid(GarageOwner, cmdtext, 15, strlen(cmdtext));
	                   			if(GarageInfo[g][IntID] == 0) GarageInterior = "{FFFF00}小型";
								if(GarageInfo[g][IntID] == 2) GarageInterior = "{00FF00}中型";
								if(GarageInfo[g][IntID] == 3) GarageInterior = "{00FF00}中型";
								if(GarageInfo[g][IntID] == 1) GarageInterior = "{FF0000}大型";
								if(GarageInfo[g][Status] == 0) GarageLocked = "{00FF00}未锁";
								if(GarageInfo[g][Status] == 1) GarageLocked = "{FF0000}锁住";
								if(GarageInfo[g][Price] == 0) format(string,sizeof(string),"拥有人: {FF0000}%s\n{FFFFFF}价格: {00FF00}免费\n{FFFFFF}状态: %s\n{FFFFFF}内饰: %s", GarageOwner, GarageLocked, GarageInterior);
								else format(string,sizeof(string),"拥有人: {FF0000}%s\n{FFFFFF}价格: {FF0000}%d\n{FFFFFF}状态: %s\n{FFFFFF}内饰: %s", GarageOwner, GarageInfo[g][Price], GarageLocked, GarageInterior);
								Update3DTextLabelText(GarageInfo[g][Label], COLOR_WHITE, string);
                    			dini_Set(Garage2,"Owner", GarageOwner);
				                dini_IntSet(Garage2, "ForSale", 0);
				                SendClientMessage(playerid,COLOR_GREEN,"成功修改拥有人!");
							} else SendClientMessage(playerid, COLOR_WHITE, "帮助: /g changeowner [Owner]");
						}
					}
				}
			}

        } else SendClientMessage(playerid, COLOR_ERROR, "你需要登录RCON.");
        return 1;
    }
    if(strfind(cmdtext, "/g changeinterior", true) == 0)
    {
	    if(IsPlayerAdmin(playerid))
	    {
	        for(new g = 0; g <= MAX_GARAGES; g++)
			{
			    new Garage[64], GarageLocked[64];
		        format(Garage, sizeof(Garage), "/Garages/%d.dini.save", g);
		    	if(dini_Exists(Garage))
				{
          			LoadGarages(g);
		    		if(IsPlayerInRangeOfPoint(playerid, 3.0, GarageInfo[g][ExtX], GarageInfo[g][ExtY], GarageInfo[g][ExtZ]))
		    		{
					    if(strlen(cmdtext) > 18)
		            	{
							new Garages[32];
		     				strmid(Garages, cmdtext, 18, strlen(cmdtext));
							if(strcmp(Garages, "Small", true) == 0)
							{
							    if(GarageInfo[g][IntID] != 0)
								{
								    GarageInfo[g][IntID] = 0;
								    GarageInfo[g][IntX] = 1643.6659;
									GarageInfo[g][IntY] = -1517.0594;
									GarageInfo[g][IntZ] = 13.5688;
									GarageInfo[g][IntA] = 0.0000;
								    dini_IntSet(Garage, "Interior", GarageInfo[g][IntID]);
								    dini_FloatSet(Garage,"Int:X", GarageInfo[g][IntX]);
							  		dini_FloatSet(Garage,"Int:Y", GarageInfo[g][IntY]);
							    	dini_FloatSet(Garage,"Int:Z", GarageInfo[g][IntZ]);
							    	dini_FloatSet(Garage,"Int:A", GarageInfo[g][IntA]);
								    if(GarageInfo[g][Status] == 0) GarageLocked = "{00FF00}未锁";
									if(GarageInfo[g][Status] == 1) GarageLocked = "{FF0000}锁住";
									if(GarageInfo[g][Price] == 0) format(string,sizeof(string),"拥有人: {FF0000}%s\n{FFFFFF}价格: {00FF00}免费\n{FFFFFF}状态: %s\n{FFFFFF}内饰: {FFFF00}小型", dini_Get(Garage, "Owner"), GarageLocked);
									else format(string,sizeof(string),"拥有人: {FF0000}%s\n{FFFFFF}价格: {FF0000}%d\n{FFFFFF}状态: %s\n{FFFFFF}内饰: {FFFF00}小型", dini_Get(Garage, "Owner"), GarageInfo[g][Price], GarageLocked);
									Update3DTextLabelText(GarageInfo[g][Label], COLOR_WHITE, string);
								    SendClientMessage(playerid,COLOR_GREEN,"成功修改车库内饰!");
       					 		} else SendClientMessage(playerid, COLOR_ERROR, "车库已经是这个内饰了.");
							}
							else if(strcmp(Garages, "Medium1", true) == 0)
							{
							    if(GarageInfo[g][IntID] != 2)
								{
								    GarageInfo[g][IntID] = 2;
								    GarageInfo[g][IntX] = 612.4073;
									GarageInfo[g][IntY] = -76.4425;
									GarageInfo[g][IntZ] = 997.9922;
									GarageInfo[g][IntA] = 270.0000;
								    dini_IntSet(Garage, "Interior", GarageInfo[g][IntID]);
								    dini_FloatSet(Garage,"Int:X", GarageInfo[g][IntX]);
							  		dini_FloatSet(Garage,"Int:Y", GarageInfo[g][IntY]);
							    	dini_FloatSet(Garage,"Int:Z", GarageInfo[g][IntZ]);
							    	dini_FloatSet(Garage,"Int:A", GarageInfo[g][IntA]);
								    if(GarageInfo[g][Status] == 0) GarageLocked = "{00FF00}未锁";
									if(GarageInfo[g][Status] == 1) GarageLocked = "{FF0000}锁住";
									if(GarageInfo[g][Price] == 0) format(string,sizeof(string),"拥有人: {FF0000}%s\n{FFFFFF}价格: {00FF00}免费\n{FFFFFF}状态: %s\n{FFFFFF}内饰: {FFFF00}中型", dini_Get(Garage, "Owner"), GarageLocked);
									else format(string,sizeof(string),"拥有人: {FF0000}%s\n{FFFFFF}价格: {FF0000}%d\n{FFFFFF}状态: %s\n{FFFFFF}内饰: {FFFF00}中型", dini_Get(Garage, "Owner"), GarageInfo[g][Price], GarageLocked);
									Update3DTextLabelText(GarageInfo[g][Label], COLOR_WHITE, string);
								    SendClientMessage(playerid,COLOR_GREEN,"成功修改车库内饰!");
       					 		} else SendClientMessage(playerid, COLOR_ERROR, "车库已经是这个内饰了.");
							}
							else if(strcmp(Garages, "Medium2", true) == 0)
							{
							    if(GarageInfo[g][IntID] != 3)
								{
								    GarageInfo[g][IntID] = 3;
								    GarageInfo[g][IntX] = 613.3256;
									GarageInfo[g][IntY] = -125.1266;
									GarageInfo[g][IntZ] = 997.9922;
									GarageInfo[g][IntA] = 270.0000;
								    dini_IntSet(Garage, "Interior", GarageInfo[g][IntID]);
								    dini_FloatSet(Garage,"Int:X", GarageInfo[g][IntX]);
							  		dini_FloatSet(Garage,"Int:Y", GarageInfo[g][IntY]);
							    	dini_FloatSet(Garage,"Int:Z", GarageInfo[g][IntZ]);
							    	dini_FloatSet(Garage,"Int:A", GarageInfo[g][IntA]);
								    if(GarageInfo[g][Status] == 0) GarageLocked = "{00FF00}未锁";
									if(GarageInfo[g][Status] == 1) GarageLocked = "{FF0000}锁住";
									if(GarageInfo[g][Price] == 0) format(string,sizeof(string),"拥有人: {FF0000}%s\n{FFFFFF}价格: {00FF00}免费\n{FFFFFF}状态: %s\n{FFFFFF}内饰: {FFFF00}中型", dini_Get(Garage, "Owner"), GarageLocked);
									else format(string,sizeof(string),"拥有人: {FF0000}%s\n{FFFFFF}价格: {FF0000}%d\n{FFFFFF}状态: %s\n{FFFFFF}内饰: {FFFF00}中型", dini_Get(Garage, "Owner"), GarageInfo[g][Price], GarageLocked);
									Update3DTextLabelText(GarageInfo[g][Label], COLOR_WHITE, string);
								    SendClientMessage(playerid,COLOR_GREEN,"成功修改车库内饰!");
       					 		} else SendClientMessage(playerid, COLOR_ERROR, "车库已经是这个内饰了.");
							}
							else if(strcmp(Garages, "Big", true) == 0)
							{
							    if(GarageInfo[g][IntID] != 1)
								{
								    GarageInfo[g][IntID] = 1;
								    GarageInfo[g][IntX] = 608.6567;
									GarageInfo[g][IntY] = -10.2052;
									GarageInfo[g][IntZ] = 1000.9206;
									GarageInfo[g][IntA] = 270.0000;
								    dini_IntSet(Garage, "Interior", GarageInfo[g][IntID]);
								    dini_FloatSet(Garage,"Int:X", GarageInfo[g][IntX]);
							  		dini_FloatSet(Garage,"Int:Y", GarageInfo[g][IntY]);
							    	dini_FloatSet(Garage,"Int:Z", GarageInfo[g][IntZ]);
							    	dini_FloatSet(Garage,"Int:A", GarageInfo[g][IntA]);
								    if(GarageInfo[g][Status] == 0) GarageLocked = "{00FF00}未锁";
									if(GarageInfo[g][Status] == 1) GarageLocked = "{FF0000}锁住";
									if(GarageInfo[g][Price] == 0) format(string,sizeof(string),"拥有人: {FF0000}%s\n{FFFFFF}价格: {00FF00}免费\n{FFFFFF}状态: %s\n{FFFFFF}内饰: {FFFF00}大型", dini_Get(Garage, "Owner"), GarageLocked);
									else format(string,sizeof(string),"拥有人: {FF0000}%s\n{FFFFFF}价格: {FF0000}%d\n{FFFFFF}状态: %s\n{FFFFFF}内饰: {FFFF00}大型", dini_Get(Garage, "Owner"), GarageInfo[g][Price], GarageLocked);
									Update3DTextLabelText(GarageInfo[g][Label], COLOR_WHITE, string);
								    SendClientMessage(playerid,COLOR_GREEN,"成功修改车库内饰!");
       					 		} else SendClientMessage(playerid, COLOR_ERROR, "车库已经是这个内饰了.");
							}
							else SendClientMessage(playerid, COLOR_ERROR, "错误车库内饰.");
						} else SendClientMessage(playerid, COLOR_WHITE, "帮助: /g changeinterior [InteriorType]");
		    		}
				}
			}
	    } else SendClientMessage(playerid, COLOR_ERROR, "你需要登录RCON.");
	    return 1;
	}
	if(strcmp(cmdtext, "/g buy", true) == 0)
	{
	    new Garage2[64], GarageOwner[MAX_PLAYER_NAME], GarageInterior[128], GarageLocked[128];
	    for(new g = 0; g <= MAX_GARAGES; g++)
		{
		    format(Garage2, sizeof(Garage2), "/Garages/%d.dini.save", g);
			if(dini_Exists(Garage2))
			{
	        	LoadGarages(g);
	    		if(IsPlayerInRangeOfPoint(playerid, 3.0, GarageInfo[g][ExtX], GarageInfo[g][ExtY], GarageInfo[g][ExtZ]))
	    		{
				    if(strcmp(dini_Get(Garage2, "Owner"),PlayerName(playerid), false) == 1)
					{
					    if(GarageInfo[g][ForSale] == 1)
					    {
					        if(GetPlayerMoney(playerid) >= GarageInfo[g][Price])
					        {
						        if(GarageInfo[g][IntID] == 0) GarageInterior = "{FFFF00}小型";
								if(GarageInfo[g][IntID] == 2) GarageInterior = "{00FF00}中型";
								if(GarageInfo[g][IntID] == 3) GarageInterior = "{00FF00}中型";
								if(GarageInfo[g][IntID] == 1) GarageInterior = "{FF0000}大型";
								if(GarageInfo[g][Status] == 0) GarageLocked = "{00FF00}未锁";
								if(GarageInfo[g][Status] == 1) GarageLocked = "{FF0000}锁住";
						        GarageInfo[g][ForSale] = 0;
						        format(GarageOwner, MAX_PLAYER_NAME, "%s", PlayerName(playerid));
				                dini_Set(Garage2,"Owner", GarageOwner);
				                GivePlayerMoney(playerid,-GarageInfo[g][Price]);
				                dini_IntSet(Garage2, "ForSale", GarageInfo[g][ForSale]);
						        if(GarageInfo[g][Price] == 0) format(string,sizeof(string),"拥有人: {FF0000}%s\n{FFFFFF}价格: {00FF00}免费\n{FFFFFF}状态: %s\n{FFFFFF}内饰: %s", dini_Get(Garage2, "Owner"), GarageLocked, GarageInterior);
						        else format(string,sizeof(string),"拥有人: {FF0000}%s\n{FFFFFF}价格: {FF0000}%d\n{FFFFFF}状态: %s\n{FFFFFF}内饰: %s", dini_Get(Garage2, "Owner"), GarageInfo[g][Price], GarageLocked, GarageInterior);
								Update3DTextLabelText(GarageInfo[g][Label], COLOR_WHITE, string);
						        SendClientMessage(playerid, COLOR_GREEN, "恭喜你购买了一个车库!");
							} else SendClientMessage(playerid, COLOR_ERROR, "你没有足够的钱!");
					    } else SendClientMessage(playerid, COLOR_ERROR, "该车库没有出售中!");
					} else SendClientMessage(playerid, COLOR_ERROR, "该车库已经有拥有人了!");
				}
			}
		}
		return 1;
	}
	if(strcmp(cmdtext, "/g sell", true) == 0)
	{
	    new Garage[64], Garage2[64], GarageOwner[MAX_PLAYER_NAME], GarageInterior[128], GarageLocked[128];
	    for(new g = 0; g <= MAX_GARAGES; g++)
		{
	        format(Garage, sizeof(Garage), "/Garages/%d.dini.save", g);
	    	if(dini_Exists(Garage))
			{
       			LoadGarages(g);
	    		if(IsPlayerInRangeOfPoint(playerid, 3.0, GarageInfo[g][ExtX], GarageInfo[g][ExtY], GarageInfo[g][ExtZ]))
	    		{
	    		    format(Garage2, sizeof(Garage2), "/Garages/%d.dini.save", g);
					if(dini_Exists(Garage2))
					{
					    if(strcmp(dini_Get(Garage2, "Owner"),PlayerName(playerid), false) == 0)
			 			{
					        if(GarageInfo[g][IntID] == 0) GarageInterior = "{FFFF00}小型";
							if(GarageInfo[g][IntID] == 2) GarageInterior = "{00FF00}中型";
							if(GarageInfo[g][IntID] == 3) GarageInterior = "{00FF00}中型";
							if(GarageInfo[g][IntID] == 1) GarageInterior = "{FF0000}大型";
							if(GarageInfo[g][Status] == 0) GarageLocked = "{00FF00}未锁";
							if(GarageInfo[g][Status] == 1) GarageLocked = "{FF0000}锁住";
					        GarageInfo[g][ForSale] = 1;
					        format(GarageOwner, MAX_PLAYER_NAME, "No");
			                dini_Set(Garage2,"Owner", GarageOwner);
			                GivePlayerMoney(playerid,GarageInfo[g][Price]);
			                dini_IntSet(Garage2, "ForSale", GarageInfo[g][ForSale]);
							if(GarageInfo[g][Price] == 0) format(string,sizeof(string),"拥有人: {FF0000}%s\n{FFFFFF}价格: {00FF00}免费\n{FFFFFF}状态: %s\n{FFFFFF}内饰: %s", dini_Get(Garage2, "Owner"), GarageLocked, GarageInterior);
					        else format(string,sizeof(string),"拥有人: {FF0000}%s\n{FFFFFF}价格: {FF0000}%d\n{FFFFFF}状态: %s\n{FFFFFF}内饰: %s", dini_Get(Garage2, "Owner"), GarageInfo[g][Price], GarageLocked, GarageInterior);
							Update3DTextLabelText(GarageInfo[g][Label], COLOR_WHITE, string);
					        SendClientMessage(playerid, COLOR_GREEN, "你成功出售了你的车库!");
						} else SendClientMessage(playerid, COLOR_ERROR, "这个车库不是你的!");
					}
				}
			}
		}
		return 1;
	}
    if(strcmp(cmdtext, "/g lock", true) == 0)
	{
	    new GarageOwner[MAX_PLAYER_NAME], GarageInterior[64], Garage2[64];
	    for(new g = 0; g <= MAX_GARAGES; g++)
		{
		    new Garage[64];
	        format(Garage, sizeof(Garage), "/Garages/%d.dini.save", g);
	    	if(dini_Exists(Garage))
			{
          		LoadGarages(g);
       			if(IsPlayerInRangeOfPoint(playerid, 3.0, GarageInfo[g][ExtX], GarageInfo[g][ExtY], GarageInfo[g][ExtZ]) || IsPlayerInRangeOfPoint(playerid, 3.0, GarageInfo[g][IntX], GarageInfo[g][IntY], GarageInfo[g][IntZ]) && GetPlayerVirtualWorld(playerid) == GarageInfo[g][vWorld])
	    		{
	          		format(Garage2, sizeof(Garage2), "/Garages/%d.dini.save", g);
					if(dini_Exists(Garage2))
					{
				    	format(GarageOwner, MAX_PLAYER_NAME, dini_Get(Garage2, "Owner"));
				        if(strcmp(GarageOwner,PlayerName(playerid), false) == 0 && GarageInfo[g][ForSale] != 1)
						{
							if(GarageInfo[g][Status] == 0)
							{
							    if(GarageInfo[g][IntID] == 0) GarageInterior = "{FFFF00}小型";
								if(GarageInfo[g][IntID] == 2) GarageInterior = "{00FF00}中型";
								if(GarageInfo[g][IntID] == 3) GarageInterior = "{00FF00}中型";
								if(GarageInfo[g][IntID] == 1) GarageInterior = "{FF0000}大型";
							    GarageInfo[g][Status] = 1;
							    if(GarageInfo[g][Price] == 0) format(string,sizeof(string),"拥有人: {FF0000}%s\n{FFFFFF}价格: {00FF00}免费\n{FFFFFF}状态: {FF0000}锁住\n{FFFFFF}内饰: %s", dini_Get(Garage, "Owner"), GarageInterior);
							    else format(string,sizeof(string),"拥有人: {FF0000}%s\n{FFFFFF}价格: {FFFF00}%d\n{FFFFFF}状态: {FF0000}锁住\n{FFFFFF}内饰: %s", dini_Get(Garage, "Owner"), GarageInfo[g][Price], GarageInterior);
							    Update3DTextLabelText(GarageInfo[g][Label], COLOR_WHITE, string);
							    GameTextForPlayer(playerid, "~w~GARAGE ~r~LOCKED", 1500, 4);
							    dini_IntSet(Garage2, "Status", GarageInfo[g][Status]);
							}
							else if(GarageInfo[g][Status] == 1)
							{
							    if(GarageInfo[g][IntID] == 0) GarageInterior = "{FFFF00}小型";
								if(GarageInfo[g][IntID] == 2) GarageInterior = "{00FF00}中型";
								if(GarageInfo[g][IntID] == 3) GarageInterior = "{00FF00}中型";
								if(GarageInfo[g][IntID] == 1) GarageInterior = "{FF0000}大型";
							    GarageInfo[g][Status] = 0;
							    if(GarageInfo[g][Price] == 0) format(string,sizeof(string),"拥有人: {FF0000}%s\n{FFFFFF}价格: {00FF00}免费\n{FFFFFF}状态: {00FF00}未锁\n{FFFFFF}内饰: %s", dini_Get(Garage, "Owner"), GarageInterior);
							    else format(string,sizeof(string),"拥有人: {FF0000}%s\n{FFFFFF}价格: {FFFF00}%d\n{FFFFFF}状态: {00FF00}未锁\n{FFFFFF}内饰: %s", dini_Get(Garage, "Owner"), GarageInfo[g][Price], GarageInterior);
							    Update3DTextLabelText(GarageInfo[g][Label], COLOR_WHITE, string);
							    GameTextForPlayer(playerid, "~w~GARAGE ~g~UNLOCKED", 1500, 4);
							    dini_IntSet(Garage2, "Status", GarageInfo[g][Status]);
							}

						} else SendClientMessage(playerid, COLOR_ERROR, "这个车库不是你的.");
	    			}
				}
			}
		}
	    return 1;
	}
	return 0;
}
forward LoadGarages(gID);
public LoadGarages(gID)
{
    new LoadString[256];
    format(LoadString, sizeof(LoadString), "/Garages/%d.dini.save", gID);
    if(dini_Exists(LoadString))
	{
        GarageInfo[gID][ExtX] = dini_Float(LoadString,"Ext:X");
  		GarageInfo[gID][ExtY] = dini_Float(LoadString,"Ext:Y");
    	GarageInfo[gID][ExtZ] = dini_Float(LoadString,"Ext:Z");
    	GarageInfo[gID][ExtA] = dini_Float(LoadString,"Ext:A");
    	GarageInfo[gID][IntX] = dini_Float(LoadString,"Int:X");
  		GarageInfo[gID][IntY] = dini_Float(LoadString,"Int:Y");
    	GarageInfo[gID][IntZ] = dini_Float(LoadString,"Int:Z");
    	GarageInfo[gID][IntA] = dini_Float(LoadString,"Int:A");
        GarageInfo[gID][vWorld] = dini_Int(LoadString, "VirtualWorld");
        GarageInfo[gID][IntID] = dini_Int(LoadString, "Interior");
        GarageInfo[gID][Status] = dini_Int(LoadString, "Status");
        GarageInfo[gID][ForSale] = dini_Int(LoadString, "ForSale");
        GarageInfo[gID][Price] = dini_Int(LoadString, "Price");
	}
	return 1;
}
//Stocks
stock ReturnNextUnusedGarageID()
{
    new Garages[64];
 	for(new g = 0; g <= MAX_GARAGES; g++)
	{
		format(Garages, sizeof(Garages), "/Garages/%d.dini.save", g);
		if(!dini_Exists(Garages)) return g;
	}
	return 1;
}
stock ReturnNextUnusedVirtualWorld()
{
    new Garages[64];
	format(Garages, sizeof(Garages), "/Garages/%d.dini.save", ReturnNextUnusedGarageID()-1);
	return dini_Int(Garages, "VirtualWorld")+1;
}
stock PlayerName(playerid)
{
    new name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, name, sizeof(name));
    return name;
}
