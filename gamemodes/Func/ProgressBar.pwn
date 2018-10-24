//============================================//
stock AddPlayerTag(playerid, msg[])
{
    strmid(PlayerData[playerid][pTagMsg], msg, 0, strlen(msg), 255);
    SetPVarInt(playerid, "TagUse", 1);
	return true;
}
//============================================//
stock RemovePlayerTag(playerid)
{
	DeletePVar(playerid, "TagUse");
	return 1;
}
//============================================//
forward ProgressBar(playerid, title[], time, number);
forward ProgressBarEx(playerid, time, number);
forward OnProgressEnd(playerid, number);

new PlayerText:PGBar[4][MAX_PLAYERS];
//============================================//
public ProgressBar(playerid, title[], time, number)
{
	new string[128];
	switch(GetPVarInt(playerid, "PBUse"))
	{
	    case 0:
	    {
	        SetPVarInt(playerid, "PBUse", 1);
	        PGBar[0][playerid] = CreatePlayerTextDraw(playerid,262.000000, 295.000000, "I");
	        PlayerTextDrawBackgroundColor(playerid, PGBar[0][playerid], 0);
	        PlayerTextDrawFont(playerid, PGBar[0][playerid], 1);
	        PlayerTextDrawLetterSize(playerid, PGBar[0][playerid], 0.500000, 1.199999);
	        PlayerTextDrawColor(playerid, PGBar[0][playerid], 150994944);
	        PlayerTextDrawSetOutline(playerid, PGBar[0][playerid], 0);
	        PlayerTextDrawSetProportional(playerid, PGBar[0][playerid], 1);
	        PlayerTextDrawSetShadow(playerid, PGBar[0][playerid], 1);
	        PlayerTextDrawUseBox(playerid, PGBar[0][playerid], 1);
	        PlayerTextDrawBoxColor(playerid, PGBar[0][playerid], 255);
	        PlayerTextDrawTextSize(playerid, PGBar[0][playerid], 364.000000, 0.000000);
	        PGBar[1][playerid] = CreatePlayerTextDraw(playerid,266.000000, 298.000000, "I");
	        PlayerTextDrawBackgroundColor(playerid, PGBar[1][playerid], 0);
	        PlayerTextDrawFont(playerid, PGBar[1][playerid], 1);
	        PlayerTextDrawLetterSize(playerid, PGBar[1][playerid], 0.500000, 0.599999);
	        PlayerTextDrawColor(playerid, PGBar[1][playerid], 0);
	        PlayerTextDrawSetOutline(playerid, PGBar[1][playerid], 0);
	        PlayerTextDrawSetProportional(playerid, PGBar[1][playerid], 1);
	        PlayerTextDrawSetShadow(playerid, PGBar[1][playerid], 1);
	        PlayerTextDrawUseBox(playerid, PGBar[1][playerid], 1);
	        PlayerTextDrawBoxColor(playerid, PGBar[1][playerid], 2038004223);
	        PlayerTextDrawTextSize(playerid, PGBar[1][playerid], 360.000000, 0.000000);
	        PGBar[2][playerid] = CreatePlayerTextDraw(playerid,266.000000, 298.000000, "I");
	        PlayerTextDrawBackgroundColor(playerid, PGBar[2][playerid], 0);
	        PlayerTextDrawFont(playerid, PGBar[2][playerid], 1);
	        PlayerTextDrawLetterSize(playerid, PGBar[2][playerid], 0.500000, 0.599999);
	        PlayerTextDrawColor(playerid, PGBar[2][playerid], 0);
	        PlayerTextDrawSetOutline(playerid, PGBar[2][playerid], 0);
	        PlayerTextDrawSetProportional(playerid, PGBar[2][playerid], 1);
	        PlayerTextDrawSetShadow(playerid, PGBar[2][playerid], 1);
	        PlayerTextDrawUseBox(playerid, PGBar[2][playerid], 1);
	        PlayerTextDrawBoxColor(playerid, PGBar[2][playerid], -1);
	        PlayerTextDrawTextSize(playerid, PGBar[2][playerid], 261.000000, 0.000000);
	        PGBar[3][playerid] = CreatePlayerTextDraw(playerid,261.000000, 280.000000, " ");
	        PlayerTextDrawBackgroundColor(playerid, PGBar[3][playerid], 255);
	        PlayerTextDrawFont(playerid, PGBar[3][playerid], 2);
	        PlayerTextDrawLetterSize(playerid, PGBar[3][playerid], 0.240000, 1.399999);
	        PlayerTextDrawColor(playerid, PGBar[3][playerid], -1);
	        PlayerTextDrawSetOutline(playerid, PGBar[3][playerid], 0);
	        PlayerTextDrawSetProportional(playerid, PGBar[3][playerid], 1);
	        PlayerTextDrawSetShadow(playerid, PGBar[3][playerid], 1);
	        for(new o = 0; o < 4; o++)
	        {
	            PlayerTextDrawShow(playerid, PGBar[o][playerid]);
	        }
	        format(string, 128, "~w~%s", title);
	        PlayerTextDrawSetString(playerid, PGBar[3][playerid], string);
	        SetPVarFloat(playerid, "PBNum", 261.0);
	        CallRemoteFunction("ProgressBarEx","iii", playerid, time, number);
	    }
	}
    return true;
}
//============================================//
public ProgressBarEx(playerid, time, number)
{
	new Float:amount;
	switch(GetPVarInt(playerid, "PBUse"))
	{
	    case 1:
	    {
			if(GetPVarFloat(playerid,"PBNum") < 360.0)
			{
				new Float:timeex = float(time);
			    amount = 100.0 / timeex;
			    amount = amount / 2.0;
			    SetPVarFloat(playerid, "PBNum", GetPVarFloat(playerid,"PBNum")+amount);
			    PlayerTextDrawTextSize(playerid, PGBar[2][playerid], 0.0+GetPVarFloat(playerid,"PBNum"), 0.0);
			    //==========//
			    PlayerTextDrawHide(playerid, PGBar[2][playerid]);
			    PlayerTextDrawShow(playerid, PGBar[2][playerid]);
			    //==========//
			    SetTimerEx("ProgressBarEx", 500, false, "iii", playerid, time, number);
			}
			else
			{
			    for(new o = 0; o < 4; o++)
	            {
	                PlayerTextDrawHide(playerid, PGBar[o][playerid]);
	                PlayerTextDrawDestroy(playerid, PGBar[o][playerid]);
	            }
			    SetPVarInt(playerid, "PBUse", 0);
			    CallRemoteFunction("OnProgressEnd","ii", playerid, number);
			}
	    }
	}
    return true;
}
//============================================//
public OnProgressEnd(playerid, number)
{
	//new string[128];
    RemovePlayerTag(playerid);
	switch(number)
	{
	    case 0:
	    {
	        TogglePlayerControllable(playerid, true);
	    }
	    case 3:
	    {
            new factionid = PlayerData[playerid][pFaction];
            new ram = random(99999) + 10000;
            FactionData[factionid][factionmoney] += ram;
	        TogglePlayerControllable(playerid, true);
	        SetVehicleHealth(ReCar[playerid], 1000.0);
	        RepairVehicle(ReCar[playerid]);
	        
	        ReCar[playerid] = 0;

	        //PlayerData[playerid][pRepairTime] = gettime() + 60;
	        SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s �ɹ������˳���.", ReturnName(playerid, 0));
	    }
	    case 6:
	    {
	        TogglePlayerControllable(playerid, true);
	        ZBGJ[playerid] = 2;
	        SendServerMessage(playerid, "�����Ѿ�׼������,����ȥ��������!");
		}
	    case 4:
	    {
	        TogglePlayerControllable(playerid, true);
	        ZBGJ[playerid] = 1;
	        SendServerMessage(playerid, "�����Ѿ�׼������,����ȥ��װ������!");
		}
		case 5:
		{
	        TogglePlayerControllable(playerid, true);
	        ZBGJ[playerid] = 0;
	        new ram = random(6);
	        new factionid = PlayerData[playerid][pFaction];
	        switch(ram)
	        {
	            case 1:
	            {
	                FactionData[factionid][factionmoney] += 10000;
	                SendServerMessage(playerid, "�����������!��˾ӯ��: 10000$");
	            }
	            case 2:
	            {
	                FactionData[factionid][factionmoney] += 15000;
	                SendServerMessage(playerid, "�����������!��˾ӯ��: 13000$");
	            }
	            case 3:
	            {
	                FactionData[factionid][factionmoney] += 8000;
	                SendServerMessage(playerid, "�����������!��˾ӯ��: 8000$");
	            }
                case 4:
	            {
	                FactionData[factionid][factionmoney] += 5000;
	                SendServerMessage(playerid, "�����������!��˾ӯ��: 5000$");
	            }
	            case 5:
	            {
	                FactionData[factionid][factionmoney] += 13000;
	                SendServerMessage(playerid, "�����������!��˾ӯ��: 13000$");
	            }
	            default:
	            {
	                FactionData[factionid][factionmoney] += 3000;
	                SendServerMessage(playerid, "�����������!��˾ӯ��: 3000$");
	            }
	        }
	        //FactionData[factionid][factionmoney] += ram;
	        GiveMoney(playerid, 1000);
	        SendServerMessage(playerid, "��� 1000$ ����");
            Faction_Save(factionid);
			OtherData[car]++;
	        SendServerMessage(playerid, "�����������!��ǰ�������: %d", OtherData[car]);
	        SendServerMessage(playerid, "ӯ���ʽ��Ѿ����뵽��˾�˻�");
		}
		case 7:
		{
			SendClientMessage(playerid, -1, "{FFFFFF}�������� ˵: ���������,Ǯ�Ҵ�����ǹ�˾�˻���.����,���Ǹ����С��.");
			new ram = random(2000);
	        new factionid = PlayerData[playerid][pFaction];
			GiveMoney(playerid, ram);
			FactionData[factionid][factionmoney] += 3000;
			TogglePlayerControllable(playerid, true);
		}
		case 8:
		{
			new carid = GetPlayerVehicleID(playerid);
			CarMats[carid] += 200;
			SendClientMessage(playerid, -1, "{FFFFFF}װ����Ա ˵: ��װ����,������ѻ��͵��������������.");
			Waypoint_Set(playerid, "Black Shop", 1483.102, -1725.421, 6.744);
			TogglePlayerControllable(playerid, true);
		}
	}
	return true;
}
//============================================//
stock StopProgress(playerid)
{
    if(GetPVarInt(playerid, "PBUse") > 0)
    {
        for(new o = 0; o < 4; o++)
	    {
	        PlayerTextDrawHide(playerid, PGBar[o][playerid]);
	        PlayerTextDrawDestroy(playerid, PGBar[o][playerid]);
	    }
		SetPVarInt(playerid, "PBUse", 0);
    }
    RemovePlayerTag(playerid);
	return true;
}
//============================================//
stock IsInProgress(playerid)
{
	if(GetPVarInt(playerid, "PBUse") > 0)
	{
	    return true;
	}
	return false;
}
