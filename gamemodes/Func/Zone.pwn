forward CreateZone(Float:maxx,Float:maxy,Float:maxz,Float:minx,Float:miny,Float:minz,Float:x,Float:y,Float:z);//创建地盘
public CreateZone(Float:maxx,Float:maxy,Float:maxz,Float:minx,Float:miny,Float:minz,Float:x,Float:y,Float:z)
{
	new file[256],Owner = 0;
	for(new i = 0; i < MAX_ZONES; i ++)
	{
		format(file, sizeof(file), "地盘数据/%d.ini", i);
		if(!dini_Exists(file))
		{
			dini_Create(file);
			dini_IntSet(file, "zoneOwner", 0);
			dini_Set(file, "zoneText", "暂无描述");
			dini_FloatSet(file, "zoneMaxx", maxx);
			dini_FloatSet(file, "zoneMaxy", maxy);
			dini_FloatSet(file, "zoneMaxz", maxz);
			dini_FloatSet(file, "zoneMinx", minx);
			dini_FloatSet(file, "zoneMiny", miny);
			dini_FloatSet(file, "zoneMinz", minz);
			dini_FloatSet(file, "zonePosx", x);
			dini_FloatSet(file, "zonePosy", y);
			dini_FloatSet(file, "zonePosz", z);
			dini_IntSet(file, "zoneMoney", 0);
			dini_IntSet(file, "zoneGun", 0);
			//SaveZone();
			LoadZone();
		}
		return 1;
	}
	return 1;
}

//stock SaveZone() //保存地盘
stock LoadZone() //读取地盘
{
    new file[256], string[256];
    for(new i = 0; i < MAX_ZONES; i ++)
	{
		format(file, sizeof(file), "地盘数据/%d.ini", i);
		if(dini_Exists(file))
       	{
       		ZoneData[i][zoneOwner] = dini_Int(file, "zoneOwner");
       		ZoneData[i][zoneText] = dini_Get(file, "zoneText");
       		ZoneData[i][zoneMoney] = dini_Int(file, "zoneMoney");
       		ZoneData[i][zoneGun] = dini_Int(file, "zoneGun");
       		ZoneData[i][zoneMaxx] = dini_Float(file, "zoneMaxx");
       		ZoneData[i][zoneMaxy] = dini_Float(file, "zoneMaxy");
       		ZoneData[i][zoneMaxz] = dini_Float(file, "zoneMaxz");
       		ZoneData[i][zoneMinx] = dini_Float(file, "zoneMinx");
       		ZoneData[i][zoneMiny] = dini_Float(file, "zoneMiny");
       		ZoneData[i][zoneMinz] = dini_Float(file, "zoneMinz");
       		ZoneData[i][zoneID] = GangZoneCreate(ZoneData[i][zoneMinx], ZoneData[i][zoneMiny], ZoneData[i][zoneMinz], ZoneData[i][zoneMaxx], ZoneData[i][zoneMaxy], ZoneData[i][zoneMaxz]);
       		format(string, sizeof(string), "地盘信息\n地盘主人: %s\n地盘金库: %d$\n地盘武器: %d把", FactionData[ZoneData[i][zoneOwner]][factionName], ZoneData[i][zoneMoney], ZoneData[i][zoneGun]);
       		ZoneData[i][zone3D] = CreateDynamic3DTextLabel(string, COLOR_DEPARTMENT, ZoneData[i][Posx], ZoneData[i][Posy], ZoneData[i][Posz], 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0);
       	}
       	return 1;
    }
    return 1;
}

stock DeleteZone(playerid, idx) //删除地盘
{
	new file[256];
	format(file, sizeof(file, "地盘数据/%d.ini", idx);
	if(!dini_Exists(file)
	{
		SendErrorMessage(playerid, "地盘不存在!");
	{
	else
	{
		dini_Remove(file);
		SendServerMessage(playerid, "成功删除地盘!");
	}
	return 1;
}
