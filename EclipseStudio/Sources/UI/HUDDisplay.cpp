#include "r3dPCH.h"
#include "r3dProtect.h"

#include "HUDDisplay.h"

#include "ObjectsCode/Gameplay/BasePlayerSpawnPoint.h"
#include "../multiplayer/clientgamelogic.h"
#include "../ObjectsCode/ai/AI_Player.H"
#include "../ObjectsCode/weapons/Weapon.h"
#include "../ObjectsCode/weapons/WeaponArmory.h"
#include "../multiplayer/MasterServerLogic.h"

#include "HUDPause.h"

extern HUDPause*	hudPause;

struct NameHashFunc_T
{
	inline int operator () ( const char * szKey )
	{
		return r3dHash::MakeHash( szKey );
	}
};
static HashTableDynamic<const char*, FixedString256, NameHashFunc_T, 1024> dictionaryHash_;


HUDDisplay :: HUDDisplay()
{
	Inited = false;
	chatVisible = false;
	chatInputActive = false;
	chatVisibleUntilTime = 0;
	lastChatMessageSent = 0;
	playersListVisible = false;
	bloodAlpha = 0.0f;
	writeNoteSavedSlotIDFrom = 0;
	timeoutForNotes = 0;
	timeoutNoteReadAbuseReportedHideUI = 0;
	RangeFinderUIVisible = false;

	if(dictionaryHash_.Size() == 0)
	{
		r3dFile* f = r3d_open( "Data/LangPack/dictionary.txt", "rb" );
		char tmpStr[256];
		while(fgets(tmpStr, 256, f) != NULL)
		{
			size_t len = strlen(tmpStr);
			for(size_t i=0; i<len; ++i)
			{
				if(tmpStr[i]==13 || tmpStr[i]==10)
					tmpStr[i]=0;
			}
			dictionaryHash_.Add(tmpStr, tmpStr);	
		}
		fclose(f);
	}
}

HUDDisplay :: ~HUDDisplay()
{
	dictionaryHash_.Clear();
}

bool HUDDisplay::Init()
{
	if(!gfxHUD.Load("Data\\Menu\\WarZ_HUD.swf", true)) 
		return false;
	if(!gfxBloodStreak.Load("Data\\Menu\\WarZ_BloodStreak.swf", false))
		return false;
	if(!gfxRangeFinder.Load("Data\\Menu\\WarZ_HUD_RangeFinder.swf", false))
		return false;

	gfxHUD.SetCurentRTViewport( Scaleform::GFx::Movie::SM_ExactFit );
	gfxBloodStreak.SetCurentRTViewport(Scaleform::GFx::Movie::SM_ExactFit);
	gfxRangeFinder.SetCurentRTViewport(Scaleform::GFx::Movie::SM_ExactFit);

#define MAKE_CALLBACK(FUNC) new r3dScaleformMovie::TGFxEICallback<HUDDisplay>(this, &HUDDisplay::FUNC)
	gfxHUD.RegisterEventHandler("eventChatMessage", MAKE_CALLBACK(eventChatMessage));
	gfxHUD.RegisterEventHandler("eventNoteWritePost", MAKE_CALLBACK(eventNoteWritePost));
	gfxHUD.RegisterEventHandler("eventNoteClosed", MAKE_CALLBACK(eventNoteClosed));
	gfxHUD.RegisterEventHandler("eventNoteReportAbuse", MAKE_CALLBACK(eventNoteReportAbuse));
	gfxHUD.RegisterEventHandler("eventShowPlayerListContextMenu", MAKE_CALLBACK(eventShowPlayerListContextMenu));
	gfxHUD.RegisterEventHandler("eventPlayerListAction", MAKE_CALLBACK(eventPlayerListAction));

	{
		Scaleform::GFx::Value var[4];
		var[0].SetInt(0);
		var[1].SetString("PROXIMITY");
		var[2].SetBoolean(true);
		var[3].SetBoolean(true);
		gfxHUD.Invoke("_root.api.setChatTab", var, 4);
 		var[0].SetInt(1);
		var[1].SetString("GLOBAL");
		var[2].SetBoolean(false);
		var[3].SetBoolean(true);
		gfxHUD.Invoke("_root.api.setChatTab", var, 4);
		var[0].SetInt(2);
		var[1].SetString("CLAN");
		var[2].SetBoolean(false);
		var[3].SetBoolean(false);
		gfxHUD.Invoke("_root.api.setChatTab", var, 4);
		var[0].SetInt(3);
		var[1].SetString("");
		var[2].SetBoolean(false);
		var[3].SetBoolean(false);
		gfxHUD.Invoke("_root.api.setChatTab", var, 4);

		currentChatChannel = 0;
		var[0].SetInt(0);
		gfxHUD.Invoke("_root.api.setChatTabActive", var, 1);
	}

	setChatTransparency(R3D_CLAMP(g_ui_chat_alpha->GetFloat()/100.0f, 0.0f, 1.0f));

	Inited = true;

	weaponInfoVisible = -1;
	SafeZoneWarningVisible = false;

	
	int numGames = (int)gMasterServerLogic.games_.size();
	for(int i=0; i<numGames; i++) 
    {
        const GBPKT_M2C_GameData_s& gd = gMasterServerLogic.games_[i];
        const GBGameInfo& ginfo = gd.info;

		if (gClientLogic().m_gameInfo.gameServerId == ginfo.gameServerId)
		{
		
		//r3dOutToLog("######## ginfo.MapSettings %d\n",ginfo.MapSettings);
	if (strcmp(ginfo.MapSettings,"6") == 0)
    {
        addChatMessage(0,"<SYSTEM>","You have joined private server",0);
	/*	if (ginfo.enableCrosshair)
			addChatMessage(0,"<SYSTEM>","The Crosshair is Enabled on this server",0);
		else
			addChatMessage(0,"<SYSTEM>","The Crosshair is disabled on this server",0);*/
		if (ginfo.enableSnipers)
			addChatMessage(0,"<SYSTEM>","The Snipers is Enabled on this server",0);
		else
			addChatMessage(0,"<SYSTEM>","The Snipers is disabled on this server",0);
	
		return true;
    }
    else if (strcmp(ginfo.MapSettings,"0") == 0)
    {
        addChatMessage(0,"<SYSTEM>","You have joined officials server",0);
		
/*	    if (ginfo.enableCrosshair)
			addChatMessage(0,"<SYSTEM>","The Crosshair is Enabled on this server",0);
		else
			addChatMessage(0,"<SYSTEM>","The Crosshair is disabled on this server",0);*/
		if (ginfo.enableSnipers)
			addChatMessage(0,"<SYSTEM>","The Snipers is Enabled on this server",0);
		else
			addChatMessage(0,"<SYSTEM>","The Snipers is disabled on this server",0);
		

		return true;
    }
    else if (strcmp(ginfo.MapSettings,"2") == 0)
    {
        addChatMessage(0,"<SYSTEM>","You have joined Premium server",0);
		
/*	    if (ginfo.enableCrosshair)
			addChatMessage(0,"<SYSTEM>","The Crosshair is Enabled on this server",0);
		else
			addChatMessage(0,"<SYSTEM>","The Crosshair is disabled on this server",0);*/
		if (ginfo.enableSnipers)
			addChatMessage(0,"<SYSTEM>","The Snipers is Enabled on this server",0);
		else
			addChatMessage(0,"<SYSTEM>","The Snipers is disabled on this server",0);
		
		return true;
    }
    else if (strcmp(ginfo.MapSettings,"1") == 0)
    {
        addChatMessage(0,"<SYSTEM>","You have joined Public server",0);
		
/*	    if (ginfo.enableCrosshair)
			addChatMessage(0,"<SYSTEM>","The Crosshair is Enabled on this server",0);
		else
			addChatMessage(0,"<SYSTEM>","The Crosshair is disabled on this server",0);*/
		if (ginfo.enableSnipers)
			addChatMessage(0,"<SYSTEM>","The Snipers is Enabled on this server",0);
		else
			addChatMessage(0,"<SYSTEM>","The Snipers is disabled on this server",0);
		
		return true;
    }
    else if (strcmp(ginfo.MapSettings,"4") == 0)
    {
        addChatMessage(0,"<SYSTEM>","You have joined StrongHolds server",0);
		
/*	    if (ginfo.enableCrosshair)
			addChatMessage(0,"<SYSTEM>","The Crosshair is Enabled on this server",0);
		else
			addChatMessage(0,"<SYSTEM>","The Crosshair is disabled on this server",0);*/
		if (ginfo.enableSnipers)
			addChatMessage(0,"<SYSTEM>","The Snipers is Enabled on this server",0);
		else
			addChatMessage(0,"<SYSTEM>","The Snipers is disabled on this server",0);
		
		return true;
    }
	else if (strcmp(ginfo.MapSettings,"5") == 0)
    {
        addChatMessage(0,"<SYSTEM>","You have joined Veteran server",0);
		
/*	    if (ginfo.enableCrosshair)
			addChatMessage(0,"<SYSTEM>","The Crosshair is Enabled on this server",0);
		else
			addChatMessage(0,"<SYSTEM>","The Crosshair is disabled on this server",0);*/
		if (ginfo.enableSnipers)
			addChatMessage(0,"<SYSTEM>","The Snipers is Enabled on this server",0);
		else
			addChatMessage(0,"<SYSTEM>","The Snipers is disabled on this server",0);
		
		return true;
    }
	else if (strcmp(ginfo.MapSettings,"3") == 0)
    {
        addChatMessage(0,"<SYSTEM>","You have joined Trial server",0);
		
	   /*if (ginfo.enableCrosshair)
			addChatMessage(0,"<SYSTEM>","The Crosshair is Enabled on this server",0);
		else
			addChatMessage(0,"<SYSTEM>","The Crosshair is disabled on this server",0);*/
		if (ginfo.enableSnipers)
			addChatMessage(0,"<SYSTEM>","The Snipers is Enabled on this server",0);
		else
			addChatMessage(0,"<SYSTEM>","The Snipers is disabled on this server",0);
		
		return true;
    }
		}
	}

	return true;
}

bool HUDDisplay::Unload()
{
	gfxHUD.Unload();
	gfxBloodStreak.Unload();
	gfxRangeFinder.Unload();

	Inited = false;
	return true;
}

void HUDDisplay::enableClanChannel()
{
	Scaleform::GFx::Value var[4];
	var[0].SetInt(2);
	var[1].SetString("CLAN");
	var[2].SetBoolean(false);
	var[3].SetBoolean(true);
	gfxHUD.Invoke("_root.api.setChatTab", var, 4);
}

int HUDDisplay::Update()
{
	if(!Inited)
		return 1;
		
	const ClientGameLogic& CGL = gClientLogic();

	if(r3dGetTime() > chatVisibleUntilTime && chatVisible && !chatInputActive)
	{
		showChat(false);
	}

	if(r3dGetTime() > timeoutNoteReadAbuseReportedHideUI && timeoutNoteReadAbuseReportedHideUI != 0)
	{
		r3dMouse::Hide();
		writeNoteSavedSlotIDFrom = 0;
		timeoutNoteReadAbuseReportedHideUI = 0;
		timeoutForNotes = r3dGetTime() + 0.5f;
		Scaleform::GFx::Value var[2];
		var[0].SetBoolean(false);
		var[1].SetString("");
		gfxHUD.Invoke("_root.api.showNoteRead", var, 2);
	}

	if(RangeFinderUIVisible)
	{
		r3dPoint3D dir;
		r3dScreenTo3D(r3dRenderer->ScreenW2, r3dRenderer->ScreenH2, &dir);

		PxRaycastHit hit;
		PhysicsCallbackObject* target = NULL;
		PxSceneQueryFilterData filter(PxFilterData(COLLIDABLE_STATIC_MASK|(1<<PHYSCOLL_NETWORKPLAYER), 0, 0, 0), PxSceneQueryFilterFlag::eSTATIC|PxSceneQueryFilterFlag::eDYNAMIC);
		g_pPhysicsWorld->raycastSingle(PxVec3(gCam.x, gCam.y, gCam.z), PxVec3(dir.x, dir.y, dir.z), 2000.0f, PxSceneQueryFlag::eDISTANCE, hit, filter);

		float distance = -1;
		if(hit.shape)
		{
			// sergey's design (range finder shows not real distance... have no idea what it actually shows)
			distance = hit.distance * (1.0f + R3D_MIN(1.0f, (R3D_MAX(0.0f, (hit.distance-200.0f)/1800.0f)))*0.35f);
		}
		gfxRangeFinder.Invoke("_root.Main.Distance.gotoAndStop", distance!=-1?"on":"off");	
		char tmpStr[16];
		sprintf(tmpStr, "%.1f", distance);
		gfxRangeFinder.SetVariable("_root.Main.Distance.Distance.Distance.text", tmpStr);

		const ClientGameLogic& CGL = gClientLogic();
		float compass = atan2f(CGL.localPlayer_->m_vVision.z, CGL.localPlayer_->m_vVision.x)/R3D_PI;
		compass = R3D_CLAMP(compass, -1.0f, 1.0f);

		float cmpVal = -(compass * 820);
		gfxRangeFinder.SetVariable("_root.Main.compass.right.x", cmpVal);
		gfxRangeFinder.SetVariable("_root.Main.compass.left.x", cmpVal-1632);

		if(!CGL.localPlayer_->m_isAiming)
			showRangeFinderUI(false); // in case if player switched weapon or anything happened
	}

	return 1;
}


int HUDDisplay::Draw()
{
	if(!Inited)
		return 1;
	{
		R3DPROFILE_FUNCTION("gfxBloodStreak.UpdateAndDraw");
		if(bloodAlpha > 0.0f)
			gfxBloodStreak.UpdateAndDraw();
	}
	{
		R3DPROFILE_FUNCTION("gfxRangeFinder.UpdateAndDraw");
		if(RangeFinderUIVisible)
			gfxRangeFinder.UpdateAndDraw();
	}
	{
		R3DPROFILE_FUNCTION("gfxHUD.UpdateAndDraw");
#ifndef FINAL_BUILD
		gfxHUD.UpdateAndDraw(d_disable_render_hud->GetBool());
#else
		gfxHUD.UpdateAndDraw();
#endif
	}

	return 1;
}

void HUDDisplay::setBloodAlpha(float alpha)
{
	if(!Inited) return;
	if(R3D_ABS(bloodAlpha-alpha)<0.01f) return;

	bloodAlpha = alpha;
	gfxBloodStreak.SetVariable("_root.blood.alpha", alpha);
}

void HUDDisplay::eventShowPlayerListContextMenu(r3dScaleformMovie* pMove, const Scaleform::GFx::Value* args, unsigned argCount)
{
    int isDev = gUserProfile.ProfileData.isDevAccount;
	Scaleform::GFx::Value var[3];

	if(isDev){
		var[0].SetInt(1);
		var[1].SetString("");
		var[2].SetInt(0);
		gfxHUD.Invoke("_root.api.setPlayerListContextMenuButton", var, 3);

		var[0].SetInt(2);
		var[1].SetString("GOTO");
		var[2].SetInt(2);
		gfxHUD.Invoke("_root.api.setPlayerListContextMenuButton", var, 3);

		var[0].SetInt(3);
		var[1].SetString("TOME");
		var[2].SetInt(3);
		gfxHUD.Invoke("_root.api.setPlayerListContextMenuButton", var, 3);

		var[0].SetInt(4);
		var[1].SetString("KICK");
		var[2].SetInt(4);
		gfxHUD.Invoke("_root.api.setPlayerListContextMenuButton", var, 3);

		var[0].SetInt(5);
		var[1].SetString("BAN");
		var[2].SetInt(5);
		gfxHUD.Invoke("_root.api.setPlayerListContextMenuButton", var, 3);

		var[0].SetInt(6);
		var[1].SetString("VERIFICAR");
		var[2].SetInt(6);
		gfxHUD.Invoke("_root.api.setPlayerListContextMenuButton", var, 3);
		
		
		var[0].SetInt(7);
		var[1].SetString("");
		var[2].SetInt(0);
		gfxHUD.Invoke("_root.api.setPlayerListContextMenuButton", var, 3);

	}else{
		//ViruZ Group
		
				
		var[0].SetInt(1);
		var[1].SetString("$HUD_PlayerAction_Report");
		var[2].SetInt(1);
		gfxHUD.Invoke("_root.api.setPlayerListContextMenuButton", var, 3);

		var[0].SetInt(2);
		var[1].SetString("INVITE FRIEND");
		var[2].SetInt(2);
		gfxHUD.Invoke("_root.api.setPlayerListContextMenuButton", var, 3);
		
		var[0].SetInt(3);
		var[1].SetString("ACCEPT INVITE");
		var[2].SetInt(3);
		gfxHUD.Invoke("_root.api.setPlayerListContextMenuButton", var, 3);
		
		var[0].SetInt(4);
		var[1].SetString("DECLINE INVITE");
		var[2].SetInt(4);
		gfxHUD.Invoke("_root.api.setPlayerListContextMenuButton", var, 3);
	
		var[0].SetInt(5);
		var[1].SetString("");
		var[2].SetInt(0);
		gfxHUD.Invoke("_root.api.setPlayerListContextMenuButton", var, 3);

		var[0].SetInt(6);
		var[1].SetString("");
		var[2].SetInt(0);
		gfxHUD.Invoke("_root.api.setPlayerListContextMenuButton", var, 3);
		
		//MENUS ADICIONAIS LISTA PLAYER
		/*var[0].SetInt(7);
		var[1].SetString("");
		var[2].SetInt(0);
		gfxHUD.Invoke("_root.api.setPlayerListContextMenuButton", var, 3);*/
	}

	gfxHUD.Invoke("_root.api.showPlayerListContextMenu", "");
}

void HUDDisplay::eventPlayerListAction(r3dScaleformMovie* pMove, const Scaleform::GFx::Value* args, unsigned argCount)
{
	int action = args[0].GetInt();
	const char* pName = args[1].GetString();

	int isDev = gUserProfile.ProfileData.isDevAccount;
	if(isDev){
    if(action == 2)
    {
        showChatInput();


        char cmGoto[128];
        sprintf(cmGoto, "/goto %s ", pName);
        //gfxHUD.Invoke("_root.api.setChatActive", ffReport);


        chatVisible = true;
        Scaleform::GFx::Value var[3];
        var[0].SetBoolean(true);
        var[1].SetBoolean(true);
        var[2].SetString(cmGoto);
        gfxHUD.Invoke("_root.api.showChat", var, 3);
        chatVisibleUntilTime = r3dGetTime() + 20.0f;
    }
	 if(action == 3)
    {
        showChatInput();


        char cmGoto[128];
        sprintf(cmGoto, "/tome %s ", pName);
        //gfxHUD.Invoke("_root.api.setChatActive", ffReport);


        chatVisible = true;
        Scaleform::GFx::Value var[3];
        var[0].SetBoolean(true);
        var[1].SetBoolean(true);
        var[2].SetString(cmGoto);
        gfxHUD.Invoke("_root.api.showChat", var, 3);
        chatVisibleUntilTime = r3dGetTime() + 20.0f;
    }
    if(action == 4)
    {
        showChatInput();


        char cmKick[128];
        sprintf(cmKick, "/kick %s ", pName);
        //gfxHUD.Invoke("_root.api.setChatActive", ffReport);


        chatVisible = true;
        Scaleform::GFx::Value var[3];
        var[0].SetBoolean(true);
        var[1].SetBoolean(true);
        var[2].SetString(cmKick);
        gfxHUD.Invoke("_root.api.showChat", var, 3);
        chatVisibleUntilTime = r3dGetTime() + 20.0f;
    }
    if(action == 5)
    {
        showChatInput();


        char cmBan[128];
        sprintf(cmBan, "/ban %s ", pName);
        //gfxHUD.Invoke("_root.api.setChatActive", ffReport);


        chatVisible = true;
        Scaleform::GFx::Value var[3];
        var[0].SetBoolean(true);
        var[1].SetBoolean(true);
        var[2].SetString(cmBan);
        gfxHUD.Invoke("_root.api.showChat", var, 3);
        chatVisibleUntilTime = r3dGetTime() + 20.0f;
    }
	if(action == 6)
    {
        showChatInput();


        char cmverificar[128];
        sprintf(cmverificar, "/verificar %s ", pName);
        //gfxHUD.Invoke("_root.api.setChatActive", ffReport);


        chatVisible = true;
        Scaleform::GFx::Value var[3];
        var[0].SetBoolean(true);
        var[1].SetBoolean(true);
        var[2].SetString(cmverificar);
        gfxHUD.Invoke("_root.api.showChat", var, 3);
        chatVisibleUntilTime = r3dGetTime() + 20.0f;
    }
	}
	
}

void HUDDisplay::eventChatMessage(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount)
{
	chatInputActive = false;
	lastChatMessageSent = r3dGetTime();

	static char s_chatMsg[2048];
	int currentTabIndex = args[0].GetInt();
	r3dscpy(s_chatMsg, args[1].GetString());

	bool has_anything = false;

	size_t start_text=0;
	size_t argLen = strlen(s_chatMsg);
	if(argLen < 3)
		return;
		
#ifndef FINAL_BUILD		
	if(strncmp(s_chatMsg, "/stime", 6) == NULL)
	{
		char buf[256];
		int hour, min;
		if(3 != sscanf(s_chatMsg, "%s %d %d", buf, &hour, &min))
		{
			addChatMessage(0, "<system>", "/stime {hour} {min}", 0);
			return;
		}

		__int64 gameUtcTime = gClientLogic().GetServerGameTime();
		struct tm* tm = _gmtime64(&gameUtcTime);
		r3d_assert(tm);
		
		// adjust server time to match supplied hour
		gClientLogic().gameStartUtcTime_ -= tm->tm_sec;
		gClientLogic().gameStartUtcTime_ -= (tm->tm_min) * 60;
		gClientLogic().gameStartUtcTime_ += (hour - tm->tm_hour) * 60 * 60;
		gClientLogic().gameStartUtcTime_ += (min) * 60;
		gClientLogic().lastShadowCacheReset_ = -1;
		
		addChatMessage(0, "<system>", "time changed", 0);
		return;
	}
#endif

	char userName[64];
	gClientLogic().localPlayer_->GetUserName(userName);

	{
		PKT_C2C_ChatMessage_s n;
		n.userFlag = 0; // server will init it for others
		n.msgChannel = currentTabIndex;
		r3dscpy(n.msg, &s_chatMsg[start_text]);
		r3dscpy(n.gamertag, userName);
		p2pSendToHost(gClientLogic().localPlayer_, &n, sizeof(n));
	}

	uint32_t flags = 0;
	if(gUserProfile.ProfileData.AccountType==0)
		flags|=1;
	if(gUserProfile.ProfileData.isDevAccount)
		flags|=2;
	addChatMessage(currentTabIndex, userName, &s_chatMsg[start_text], flags);

	memset(s_chatMsg, 0, sizeof(s_chatMsg));
}

void HUDDisplay::addChatMessage(int tabIndex, const char* user, const char* text, uint32_t flags)
{
	if(!Inited) return;
	Scaleform::GFx::Value var[3];

	char tmpMsg[1024];
	const char* tabNames[] = {"[PROXIMITY]", "[GLOBAL]", "[CLAN]"};
	const char* tabNamesColor[] = {"#00A000", "#13bbeb", "#de13eb"};
	const char* userNameColor[] = {"#ffffff", "#ffa800"};

	bool isUserLegend = (flags&1)?true:false;
	bool isUserDev = (flags&2)?true:false;

	const char* userColor = userNameColor[isUserLegend?1:0];
	const char* textColor = "#d0d0d0";
	const char* namePrefix = "";
	if(isUserDev)
	{
		userColor = "#ff0000";
		textColor = "#ff0000";
		namePrefix = "&lt;DEV&gt;";
	}

	// dirty stl :)
	std::string sUser = user;
	int pos = 0;
	while((pos= sUser.find('<'))!=-1)
		sUser.replace(pos, 1, "&lt;");
	while((pos = sUser.find('>'))!=-1)
		sUser.replace(pos, 1, "&gt;");

	std::string sMsg = text;
	while((pos = sMsg.find('<'))!=-1)
		sMsg.replace(pos, 1, "&lt;");
	while((pos = sMsg.find('>'))!=-1)
		sMsg.replace(pos, 1, "&gt;");

	// really simple profanity filter
	{
		int counter = 0;
		char profanityFilter[2048]={0};
		char clearString[2048]={0};
		r3dscpy(profanityFilter, sMsg.c_str());
		char* word = strtok(profanityFilter, " ");
		while(word)
		{
			if(dictionaryHash_.IsExists(word))
			{
				r3dscpy(&clearString[counter], "*** ");
				counter +=4;
			}
			else
			{
				r3dscpy(&clearString[counter], word);
				counter +=strlen(word);
				clearString[counter++] = ' ';
			}
			word = strtok(NULL, " ");
		}
		clearString[counter++] = 0;

		sMsg = clearString;
	}

	sprintf(tmpMsg, "<font color=\"%s\">%s</font> <font color=\"%s\">%s%s:</font> <font color=\"%s\">%s</font>", tabNamesColor[tabIndex], tabNames[tabIndex], userColor, namePrefix, sUser.c_str(), textColor, sMsg.c_str());

	var[0].SetString(tmpMsg);
	gfxHUD.Invoke("_root.api.receiveChat", var, 1);
}

void HUDDisplay::setVisibility(float percent)
{
	if(!Inited) return;
	gfxHUD.Invoke("_root.api.updateVisibility", percent);
}

void HUDDisplay::setHearing(float percent)
{
	if(!Inited) return;
	gfxHUD.Invoke("_root.api.updateHearingRadius", percent);
}

void HUDDisplay::setLifeParams(int food, int water, int health, int toxicity, int stamina)
{
	if(!Inited) return;
	Scaleform::GFx::Value var[5];

	// temp, for testing
#ifndef FINAL_BUILD
	if(d_ui_health->GetInt() >= 0)
		health = d_ui_health->GetInt();
	if(d_ui_toxic->GetInt() >= 0)
		toxicity = d_ui_toxic->GetInt();
	if(d_ui_water->GetInt() >= 0)
		water = d_ui_water->GetInt();
	if(d_ui_food->GetInt() >= 0)
		food = d_ui_food->GetInt();
	if(d_ui_stamina->GetInt() >= 0)
		stamina = d_ui_stamina->GetInt();
#endif

	// UI expects inverse values, so do 100-X (exception is toxicity)
	var[0].SetInt(100-food);
	var[1].SetInt(100-water);
	var[2].SetInt(100-health);
	var[3].SetInt(toxicity);
	var[4].SetInt(100-stamina);
	gfxHUD.Invoke("_root.api.setHeroCondition", var, 5);
}

void HUDDisplay::setWeaponInfo(int ammo, int clips, int firemode)
{
	if(!Inited) return;
	Scaleform::GFx::Value var[3];
	var[0].SetInt(ammo);
	var[1].SetInt(clips);
	if(firemode==1)
		var[2].SetString("one");
	else if(firemode ==2)
		var[2].SetString("three");
	else
		var[2].SetString("auto");
	gfxHUD.Invoke("_root.api.setWeaponInfo", var, 3);
}

void HUDDisplay::showWeaponInfo(int state)
{
	if(!Inited) return;
	if(state != weaponInfoVisible)
		gfxHUD.Invoke("_root.api.showWeaponInfo", state);
	weaponInfoVisible = state;
}

void HUDDisplay::setSlotInfo(int slotID, const char* name, int quantity, const char* icon)
{
	if(!Inited) return;
	Scaleform::GFx::Value var[4];
	var[0].SetInt(slotID);
	var[1].SetString(name);
	var[2].SetInt(quantity);
	var[3].SetString(icon);
	gfxHUD.Invoke("_root.api.setSlot", var, 4);
}

void HUDDisplay::updateSlotInfo(int slotID, int quantity)
{
	if(!Inited) return;
	Scaleform::GFx::Value var[2];
	var[0].SetInt(slotID);
	var[1].SetInt(quantity);
	gfxHUD.Invoke("_root.api.updateSlot", var, 2);
}

void HUDDisplay::showSlots(bool state)
{
	if(!Inited) return;
	gfxHUD.Invoke("_root.api.showSlots", state);
}

void HUDDisplay::setActiveSlot(int slotID)
{
	if(!Inited) return;
	gfxHUD.Invoke("_root.api.setActiveSlot", slotID);
}

void HUDDisplay::setActivatedSlot(int slotID)
{
	if(!Inited) return;
	gfxHUD.Invoke("_root.api.setActivatedSlot", slotID);
}

void HUDDisplay::showMessage(const wchar_t* text)
{
	if(!Inited) return;
	gfxHUD.Invoke("_root.api.showMsg", text);
}

void HUDDisplay::setshowHideReticle(bool phase)
{
    if(!Inited) return;
    gfxHUD.SetVariable("_root.api.Main.reticle.visible", phase);
}  

void HUDDisplay::showChat(bool showChat, bool force)
{
	if(!Inited) return;
	if(chatVisible != showChat || force)
	{
		chatVisible = showChat;
		Scaleform::GFx::Value var[2];
		var[0].SetBoolean(showChat);
		var[1].SetBoolean(chatInputActive);
		gfxHUD.Invoke("_root.api.showChat", var, 2);
	}
	if(showChat)
		chatVisibleUntilTime = r3dGetTime() + 20.0f;
}

void HUDDisplay::showChatInput()
{
	if(!Inited) return;
	chatInputActive = true;
	showChat(true, true);
	gfxHUD.Invoke("_root.api.setChatActive", "");
}

void HUDDisplay::setChatTransparency(float alpha)
{
	if(!Inited) return;
	gfxHUD.Invoke("_root.api.setChatTransparency", alpha);
}

void HUDDisplay::setChatChannel(int index)
{
	if(!Inited) return;
	if(index <0 || index > 2) return;

	if(currentChatChannel != index)
	{
		currentChatChannel = index;
		Scaleform::GFx::Value var[1];
		var[0].SetInt(index);
		gfxHUD.Invoke("_root.api.setChatTabActive", var, 1);

		showChatInput();
	}
}

void HUDDisplay::clearPlayersList()
{
	if(!Inited) return;
	gfxHUD.Invoke("_root.api.clearPlayersList", "");
}

extern const char* getReputationString(int reputation);
//nova Hud
//public function addPlayerToList(index:int, pos:int, Name:String, alignment:String, isLegend:Boolean, isDev:Boolean, isPunisher:Boolean, isInvitePending:Boolean, isVoipMuted:Boolean, isPremium:Boolean, isLocalPlayer:Boolean)
void HUDDisplay::addPlayerToList(int num, const char* name, int Reputation, bool isLegend, bool isDev, bool isPunisher, bool isInvitePending, bool isPremium,bool isMute, bool local)
{
	if(!Inited) return;
	Scaleform::GFx::Value var[11];
	var[0].SetInt(num);
	var[1].SetInt(num);

	// dirty stl :)
	std::string sUser = name;
	int pos = 0;
	while((pos= sUser.find('<'))!=-1)
		sUser.replace(pos, 1, "&lt;");
	while((pos = sUser.find('>'))!=-1)
		sUser.replace(pos, 1, "&gt;");

	var[2].SetString(sUser.c_str());

	const char* algnmt = getReputationString(Reputation);
	if(isDev)
		algnmt = "";
	var[3].SetString(algnmt);
	var[4].SetBoolean(isLegend);
	var[5].SetBoolean(isDev);
	var[6].SetBoolean(isPunisher);
	var[7].SetBoolean(isInvitePending);
	var[8].SetBoolean(isMute);
	var[9].SetBoolean(isPremium);
	var[10].SetBoolean(local);
	gfxHUD.Invoke("_root.api.addPlayerToList", var, 11);
}


void HUDDisplay::showPlayersList(int flag)
{
	if(!Inited) return;
	playersListVisible = flag;
	gfxHUD.Invoke("_root.api.showPlayersList", flag);
}

void HUDDisplay::showWriteNote(int slotIDFrom)
{
	if(!Inited) return;

	r3dMouse::Show();
	
	writeNoteSavedSlotIDFrom = slotIDFrom;

	Scaleform::GFx::Value var[1];
	var[0].SetBoolean(true);
	gfxHUD.Invoke("_root.api.showNoteWrite", var, 1);
}

void HUDDisplay::eventNoteWritePost(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount)
{
	r3d_assert(argCount == 1);

	r3dMouse::Hide();

	const char* Message = args[0].GetString();

	obj_Player* plr = gClientLogic().localPlayer_;
	r3d_assert(plr);

	PKT_C2S_CreateNote_s n;
	n.SlotFrom = (BYTE)writeNoteSavedSlotIDFrom;
	n.pos      = plr->GetPosition() + plr->GetvForw()*0.2f;
	n.ExpMins  = PKT_C2S_CreateNote_s::DEFAULT_PLAYER_NOTE_EXPIRE_TIME;
	r3dscpy(n.TextFrom, plr->CurLoadout.Gamertag);
	sprintf(n.TextSubj, Message); 
	p2pSendToHost(gClientLogic().localPlayer_, &n, sizeof(n));

	// local logic
	wiInventoryItem& wi = plr->CurLoadout.Items[writeNoteSavedSlotIDFrom];
	r3d_assert(wi.itemID && wi.quantity > 0);
	//local logic
	wi.quantity--;
	if(wi.quantity <= 0) {
		wi.Reset();
	}

	plr->OnBackpackChanged(writeNoteSavedSlotIDFrom);

	writeNoteSavedSlotIDFrom = 0;

	timeoutForNotes = r3dGetTime() + .5f;
}

void HUDDisplay::eventNoteClosed(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount)
{
	r3dMouse::Hide();

	writeNoteSavedSlotIDFrom = 0;
	timeoutForNotes = r3dGetTime() + .5f;
}

void HUDDisplay::showReadNote(const char* msg)
{
	if(!Inited) return;

	r3dMouse::Show();
	writeNoteSavedSlotIDFrom = 1; // temp, to prevent mouse from hiding
	Scaleform::GFx::Value var[2];
	var[0].SetBoolean(true);
	var[1].SetString(msg);
	gfxHUD.Invoke("_root.api.showNoteRead", var, 2);
}

void HUDDisplay::eventNoteReportAbuse(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount)
{
	// ptumik: not sure what to do with this yet... need design

	//r3dMouse::Hide();
	//writeNoteSavedSlotIDFrom = 0;
	//timeoutForNotes = r3dGetTime() + 1.0f;

	timeoutNoteReadAbuseReportedHideUI = r3dGetTime() + 0.5f;
}

void HUDDisplay::showYouAreDead(const char* killedBy)
{
	if(!Inited) return;

	gfxHUD.SetVariable("_root.Main.PlayerDead.DeadMsg.Text2.text", killedBy);
	gfxHUD.Invoke("_root.Main.PlayerDead.gotoAndPlay", "in");
}

void HUDDisplay::showSafeZoneWarning(bool flag)
{
	if(!Inited) return;

	if(SafeZoneWarningVisible != flag)
	{
		SafeZoneWarningVisible = flag;
		gfxHUD.Invoke("_root.Main.Condition.gotoAndPlay", flag ? 0 : 8); //"in":"out"
	}
}

void HUDDisplay::addClanTag(const char* name, Scaleform::GFx::Value& result)
{
	if(!Inited) return;
	r3d_assert(result.IsUndefined());

	Scaleform::GFx::Value var[1];
	var[0].SetString(name);
	gfxHUD.Invoke("_root.api.addClanTag", &result, var, 1);
}

void HUDDisplay::removeUserIcon(Scaleform::GFx::Value& icon)
{
	if(!Inited) return;
	r3d_assert(!icon.IsUndefined());

	Scaleform::GFx::Value var[1];
	var[0] = icon;
	gfxHUD.Invoke("_root.api.removeUserIcon", var, 1);

	icon.SetUndefined();
}

// optimized version
void HUDDisplay::moveUserIcon(Scaleform::GFx::Value& icon, const r3dPoint3D& pos, bool alwaysShow, bool force_invisible /* = false */, bool pos_in_screen_space/* =false */)
{
	if(!Inited)
		return;
	r3d_assert(!icon.IsUndefined());

	r3dPoint3D scrCoord;
	float x, y;
	int isVisible = 1;
	if(!pos_in_screen_space)
	{
		if(alwaysShow)
			isVisible = r3dProjectToScreenAlways(pos, &scrCoord, 20, 20);
		else
			isVisible = r3dProjectToScreen(pos, &scrCoord);
	}
	else
		scrCoord = pos;

	// convert screens into UI space
	float mulX = 1920.0f/r3dRenderer->ScreenW;
	float mulY = 1080.0f/r3dRenderer->ScreenH;
	x = scrCoord.x * mulX;
	y = scrCoord.y * mulY;

	Scaleform::GFx::Value::DisplayInfo displayInfo;
	icon.GetDisplayInfo(&displayInfo);
	displayInfo.SetVisible(isVisible && !force_invisible);
	displayInfo.SetX(x);
	displayInfo.SetY(y);
	icon.SetDisplayInfo(displayInfo);
}

void HUDDisplay::setUserIconTextVisible(Scaleform::GFx::Value& icon, bool isVisible)
{
	if(!Inited) return;
	r3d_assert(!icon.IsUndefined());

	Scaleform::GFx::Value var[2];
	var[0] = icon;
	var[1].SetBoolean(isVisible);
	gfxHUD.Invoke("_root.api.setUserIconTextVisible", var, 2);
}