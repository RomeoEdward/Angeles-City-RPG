#include <a_samp>

new PlayerText:Logo[MAX_PLAYERS];
new Text:Logo2;
new Text:Char1;
new Text:Char2;
new Text:Char3;
new PlayerText:Logo3[MAX_PLAYERS];
new Text:CharName1;
new Text:CharName2;
new Text:CharName3;
new Text:textdraw_9;

public OnFilterScriptInit()
{
	Logo2 = TextDrawCreate(541.000000, 209.000000, "Role Play Game");
	TextDrawFont(Logo2, 0);
	TextDrawLetterSize(Logo2, 0.766666, 3.099999);
	TextDrawTextSize(Logo2, 400.000000, 17.000000);
	TextDrawSetOutline(Logo2, 1);
	TextDrawSetShadow(Logo2, 1);
	TextDrawAlignment(Logo2, 2);
	TextDrawColor(Logo2, -16776961);
	TextDrawBackgroundColor(Logo2, -1378294017);
	TextDrawBoxColor(Logo2, 50);
	TextDrawUseBox(Logo2, 0);
	TextDrawSetProportional(Logo2, 1);
	TextDrawSetSelectable(Logo2, 0);

	Char1 = TextDrawCreate(283.000000, 288.000000, "Preview_Model");
	TextDrawFont(Char1, 5);
	TextDrawLetterSize(Char1, 0.600000, 2.000000);
	TextDrawTextSize(Char1, 135.000000, 109.500000);
	TextDrawSetOutline(Char1, 0);
	TextDrawSetShadow(Char1, 0);
	TextDrawAlignment(Char1, 1);
	TextDrawColor(Char1, -1);
	TextDrawBackgroundColor(Char1, -1378294147);
	TextDrawBoxColor(Char1, 255);
	TextDrawUseBox(Char1, 0);
	TextDrawSetProportional(Char1, 1);
	TextDrawSetSelectable(Char1, 0);
	TextDrawSetPreviewModel(Char1, 0);
	TextDrawSetPreviewRot(Char1, -10.000000, 0.000000, -20.000000, 1.000000);
	TextDrawSetPreviewVehCol(Char1, 1, 1);

	Char2 = TextDrawCreate(284.000000, 62.000000, "Preview_Model");
	TextDrawFont(Char2, 5);
	TextDrawLetterSize(Char2, 0.600000, 2.000000);
	TextDrawTextSize(Char2, 135.000000, 109.500000);
	TextDrawSetOutline(Char2, 0);
	TextDrawSetShadow(Char2, 0);
	TextDrawAlignment(Char2, 1);
	TextDrawColor(Char2, -1);
	TextDrawBackgroundColor(Char2, -1378294147);
	TextDrawBoxColor(Char2, 255);
	TextDrawUseBox(Char2, 0);
	TextDrawSetProportional(Char2, 1);
	TextDrawSetSelectable(Char2, 0);
	TextDrawSetPreviewModel(Char2, 0);
	TextDrawSetPreviewRot(Char2, -10.000000, 0.000000, -20.000000, 1.000000);
	TextDrawSetPreviewVehCol(Char2, 1, 1);

	Char3 = TextDrawCreate(283.000000, 175.000000, "Preview_Model");
	TextDrawFont(Char3, 5);
	TextDrawLetterSize(Char3, 0.600000, 2.000000);
	TextDrawTextSize(Char3, 135.000000, 109.500000);
	TextDrawSetOutline(Char3, 0);
	TextDrawSetShadow(Char3, 0);
	TextDrawAlignment(Char3, 1);
	TextDrawColor(Char3, -1);
	TextDrawBackgroundColor(Char3, -1378294147);
	TextDrawBoxColor(Char3, 255);
	TextDrawUseBox(Char3, 0);
	TextDrawSetProportional(Char3, 1);
	TextDrawSetSelectable(Char3, 0);
	TextDrawSetPreviewModel(Char3, 0);
	TextDrawSetPreviewRot(Char3, -10.000000, 0.000000, -20.000000, 1.000000);
	TextDrawSetPreviewVehCol(Char3, 1, 1);

	CharName1 = TextDrawCreate(347.000000, 48.000000, "Char Name");
	TextDrawFont(CharName1, 1);
	TextDrawLetterSize(CharName1, 0.404166, 1.750000);
	TextDrawTextSize(CharName1, -8.500000, 142.500000);
	TextDrawSetOutline(CharName1, 1);
	TextDrawSetShadow(CharName1, 0);
	TextDrawAlignment(CharName1, 2);
	TextDrawColor(CharName1, -1);
	TextDrawBackgroundColor(CharName1, 255);
	TextDrawBoxColor(CharName1, 200);
	TextDrawUseBox(CharName1, 0);
	TextDrawSetProportional(CharName1, 1);
	TextDrawSetSelectable(CharName1, 1);

	CharName2 = TextDrawCreate(350.000000, 168.000000, "Char Name");
	TextDrawFont(CharName2, 1);
	TextDrawLetterSize(CharName2, 0.404166, 1.750000);
	TextDrawTextSize(CharName2, -8.500000, 142.500000);
	TextDrawSetOutline(CharName2, 1);
	TextDrawSetShadow(CharName2, 0);
	TextDrawAlignment(CharName2, 2);
	TextDrawColor(CharName2, -1);
	TextDrawBackgroundColor(CharName2, 255);
	TextDrawBoxColor(CharName2, 200);
	TextDrawUseBox(CharName2, 0);
	TextDrawSetProportional(CharName2, 1);
	TextDrawSetSelectable(CharName2, 1);

	CharName3 = TextDrawCreate(350.000000, 283.000000, "Char Name");
	TextDrawFont(CharName3, 1);
	TextDrawLetterSize(CharName3, 0.404166, 1.750000);
	TextDrawTextSize(CharName3, -8.500000, 142.500000);
	TextDrawSetOutline(CharName3, 1);
	TextDrawSetShadow(CharName3, 0);
	TextDrawAlignment(CharName3, 2);
	TextDrawColor(CharName3, -1);
	TextDrawBackgroundColor(CharName3, 255);
	TextDrawBoxColor(CharName3, 200);
	TextDrawUseBox(CharName3, 0);
	TextDrawSetProportional(CharName3, 1);
	TextDrawSetSelectable(CharName3, 1);

	textdraw_9 = TextDrawCreate(216.000000, 5.000000, "Web:gtaip.com");
	TextDrawFont(textdraw_9, 1);
	TextDrawLetterSize(textdraw_9, 1.054166, 4.099998);
	TextDrawTextSize(textdraw_9, 400.000000, 17.000000);
	TextDrawSetOutline(textdraw_9, 1);
	TextDrawSetShadow(textdraw_9, 0);
	TextDrawAlignment(textdraw_9, 1);
	TextDrawColor(textdraw_9, -16776961);
	TextDrawBackgroundColor(textdraw_9, -1378294017);
	TextDrawBoxColor(textdraw_9, 50);
	TextDrawUseBox(textdraw_9, 0);
	TextDrawSetProportional(textdraw_9, 1);
	TextDrawSetSelectable(textdraw_9, 0);

	return 1;
}

public OnPlayerConnect(playerid)
{
	Logo[playerid] = CreatePlayerTextDraw(playerid, 424.000000, 163.000000, "Angeles City");
	PlayerTextDrawFont(playerid, Logo[playerid], 0);
	PlayerTextDrawLetterSize(playerid, Logo[playerid], 1.516667, 4.599997);
	PlayerTextDrawTextSize(playerid, Logo[playerid], 299.000000, 27.000000);
	PlayerTextDrawSetOutline(playerid, Logo[playerid], 1);
	PlayerTextDrawSetShadow(playerid, Logo[playerid], 0);
	PlayerTextDrawAlignment(playerid, Logo[playerid], 1);
	PlayerTextDrawColor(playerid, Logo[playerid], -16776961);
	PlayerTextDrawBackgroundColor(playerid, Logo[playerid], -1378294017);
	PlayerTextDrawBoxColor(playerid, Logo[playerid], 50);
	PlayerTextDrawUseBox(playerid, Logo[playerid], 0);
	PlayerTextDrawSetProportional(playerid, Logo[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, Logo[playerid], 0);

	Logo3[playerid] = CreatePlayerTextDraw(playerid, 178.000000, 149.000000, "Character Menu");
	PlayerTextDrawFont(playerid, Logo3[playerid], 1);
	PlayerTextDrawLetterSize(playerid, Logo3[playerid], 1.304166, 6.499999);
	PlayerTextDrawTextSize(playerid, Logo3[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Logo3[playerid], 1);
	PlayerTextDrawSetShadow(playerid, Logo3[playerid], 0);
	PlayerTextDrawAlignment(playerid, Logo3[playerid], 2);
	PlayerTextDrawColor(playerid, Logo3[playerid], -16776961);
	PlayerTextDrawBackgroundColor(playerid, Logo3[playerid], -1378294017);
	PlayerTextDrawBoxColor(playerid, Logo3[playerid], 50);
	PlayerTextDrawUseBox(playerid, Logo3[playerid], 0);
	PlayerTextDrawSetProportional(playerid, Logo3[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, Logo3[playerid], 0);

	return 1;
}

public OnPlayerDisconnect(playerid)
{
	PlayerTextDrawDestroy(playerid, Logo[playerid]);
	PlayerTextDrawDestroy(playerid, Logo3[playerid]);
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if(!strcmp(cmdtext, "/tdtest", true))
	{
		PlayerTextDrawShow(playerid, Logo[playerid]);
		TextDrawShowForPlayer(playerid, Logo2);
		TextDrawShowForPlayer(playerid, Char1);
		TextDrawShowForPlayer(playerid, Char2);
		TextDrawShowForPlayer(playerid, Char3);
		PlayerTextDrawShow(playerid, Logo3[playerid]);
		TextDrawShowForPlayer(playerid, CharName1);
		TextDrawShowForPlayer(playerid, CharName2);
		TextDrawShowForPlayer(playerid, CharName3);
		TextDrawShowForPlayer(playerid, textdraw_9);
		SelectTextDraw(playerid, 0xFF0000FF);
		return 1;
	}
	return 0;
}
