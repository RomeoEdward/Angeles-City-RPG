#include <a_samp>
public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print(" 伤害显示系统加载成功...");
	print("--------------------------------------\n");
	return 1;
}

public OnFilterScriptExit()
{
	for(new i = 0; i != MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    new Text3D:hitbar = Text3D:(GetPVarInt(i, "hidbar_HitBar") - 1);
		    if(_:hitbar != -1)
			{
				Delete3DTextLabel(hitbar);
				DeletePVar(i, "hidbar_HitBar");
			}
		}
	}
}

public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid)
{
	new str[4];
	new Float:Pos[3];
	GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
	format(str, 4, "-%.1f", amount);
	new Text3D:hitbar = Create3DTextLabel(str, 0xFF0000FF, Pos[0], Pos[1], Pos[2] + 0.6, 30.0, 0);
	SetTimerEx("UpdateHitBar", 66, 0, "iffffii", playerid, amount, Pos[0], Pos[1], Pos[2] + 0.8, 16, 0xFF0000FF);
	SetPVarInt(playerid, "hidbar_HitBar", _:hitbar + 1);
	return 1;
}

forward UpdateHitBar(playerid, Float:hp, Float:x, Float:y, Float:z, update_no, color);
public UpdateHitBar(playerid, Float:hp, Float:x, Float:y, Float:z, update_no, color)
{
	new Text3D:hitbar = Text3D:(GetPVarInt(playerid, "hidbar_HitBar") - 1);
    Delete3DTextLabel(hitbar);
    update_no--;
    if(!update_no)
	{
	    DeletePVar(playerid, "hidbar_HitBar");
		return;
	}

    new string[4];
    z += 0.05;
    color -= 12;
    format(string, sizeof string, "-%.1f", hp);
    hitbar = Create3DTextLabel(string, color, x, y, z, 30.0, 0);
    SetTimerEx("UpdateHitBar", 66, 0, "iffffii", playerid, hp, x, y, z, update_no, color);
   	SetPVarInt(playerid, "hidbar_HitBar", _:hitbar + 1);
}
