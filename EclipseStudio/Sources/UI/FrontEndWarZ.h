#pragma once

#include "UIMenu.h"
#include "UIAsync.h"
#include "UIMarket.h"

#include "../../ServerNetPackets/NetPacketsGameBrowser.h"

#include "CkHttp.h"

#include "FrontEndShared.h"
#include "GameCode\UserProfile.h"
#include "GameCode\UserClans.h"

class FrontendWarZ : public UIMenu, public r3dIResource
{
public:
	virtual bool 	Unload();
private:
	Scaleform::Render::D3D9::Texture* RTScaleformTexture;
	bool		needReInitScaleformTexture;
	int			frontendStage; // 0 - login, 1-frontend

	EGameResult	prevGameResult;

	void drawPlayer();

//	void	eventFriendPopupClosed(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	
public:
	FrontendWarZ(const char * movieName);
	virtual ~FrontendWarZ();

	virtual bool Initialize();

	virtual int Update();

	void InitButtons();
	int  CurrentBrowse;

	int OficialServersNumber;
	int PrivateServersNumber;
	int PremiumServersNumber;
	int StrongHoldsServersNumber;
	int PublicServersNumber;
	int VeteranServersNumber;
	int TrialServersNumber;

	void postLoginStepInit(EGameResult gameResult);
	void initLoginStep(const wchar_t* loginErrorMsg);

	//	r3dIResource, callbacks
	//	Need to rebind texture to scaleform after device lost
	virtual	void D3DCreateResource();
	virtual	void D3DReleaseResource(){};

	void bindRTsToScaleForm();

	void SetLoadedThings(obj_Player* plr)
	{
		r3d_assert(m_Player == NULL);
		m_Player = plr;
	}

	// login part of frontend
private:
	friend void FrontendWarZ_LoginProcessThread(void* in_data);
	static unsigned int WINAPI LoginProcessThread(void* in_data);
	static unsigned int WINAPI LoginAuthThread(void* in_data);
	HANDLE	loginThread;
	enum {
		ANS_Unactive,
		ANS_Processing,
		ANS_Timeout,
		ANS_Error,

		ANS_Logged,
		ANS_BadPassword,
		ANS_Frozen,
	};
	volatile DWORD loginAnswerCode;
	bool	DecodeAuthParams();
	void	LoginCheckAnswerCode();
	float	loginProcessStartTime;
	bool	loginMsgBoxOK_Exit;

private:
	void eventPlayGame(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventCancelQuickGameSearch(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventQuitGame(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventCreateCharacter(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventDeleteChar(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventReviveChar(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventBuyItem(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventBackpackFromInventory(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventBackpackToInventory(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventBackpackGridSwap(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventSetSelectedChar(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventOptionsReset(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventOptionsApply(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventOptionsLanguageSelection(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventOptionsControlsRequestKeyRemap(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventOptionsControlsReset(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventOptionsControlsApply(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventCreateChangeCharacter(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventCreateCancel(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventRequestPlayerRender(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventMsgBoxCallback(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventOpenBackpackSelector(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventChangeBackpack(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);

	void eventSetCurrentBrowseChannel(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventBrowseGamesRequestFilterStatus(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventBrowseGamesSetFilter(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventBrowseGamesJoin(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventBrowseGamesOnAddToFavorites(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventBrowseGamesRequestList(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventTrialUpgradeAccount(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);

	void eventRequestMyClanInfo(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventRequestClanList(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventCreateClan(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventClanAdminDonateGC(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventClanAdminAction(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventClanLeaveClan(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventClanDonateGCToClan(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventRequestClanApplications(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventClanApplicationAction(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventClanInviteToClan(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventClanRespondToInvite(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventClanBuySlots(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventClanApplyToJoin(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void eventRequestLeaderboardData(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void OnLeaderBoardDataSuccess();

	static unsigned int WINAPI as_LeaderBoardThread(void* in_data);
	int hardcore;
	int type;
	int pageType;
	int m_leaderboardPage;
	int m_leaderboardPageCount;

	//Skill System Thanks InvasionMMO
	void eventLearnSkill(r3dScaleformMovie* pMovie, const Scaleform::GFx::Value* args, unsigned argCount);
	void OnLearnSkillSuccess();
	static unsigned int WINAPI as_LearnSkilLThread(void* in_data);
	uint32_t skillid;
	int	CharID;

	CUserClans* clansmem;
    const char* FindClanTagAndColorById(int id ,char* str,CUserClans* clan);

	void checkForInviteFromClan();
	void setClanInfo();
	CUserClans::CreateParams_s clanCreateParams;
	std::string					   clanCreateParam_Desc;
	static unsigned int WINAPI as_CreateClanThread(void* in_data);
	void		OnCreateClanSuccess();
	void		refreshClanUIMemberList();

	static unsigned int WINAPI as_BrowseGamesThread(void* in_data);
	void		OnGameListReceived();
	void		processNewGameList();

	int		superPings_[2048]; // big enough to hold all possiblesupervisors id
	void		ProcessSupervisorPings();
	int		 GetSupervisorPing(DWORD ip);
	int		GetGamePing(DWORD superId);

	void initFrontend();
	void initInventoryItems();
	void updateInventoryAndSkillItems();
	void addStore();

	void addClientSurvivor(const wiCharDataFull& slot, int slotIndex);
	void addBackpackItems(const wiCharDataFull& slot, int slotIndex);

	bool		exitRequested_;
	bool		needExitByGameJoin_;
	bool		needReturnFromQuickJoin;

	//
	// Async Function Calls
	//
	UIAsync<FrontendWarZ> async_;
	UIMarket market_;

	float		lastServerReqTime_;
	void		DelayServerRequest();
	float		masterConnectTime_;
	bool		ConnectToMasterServer();
	bool		ParseGameJoinAnswer();
	volatile bool CancelQuickJoinRequest;


	static unsigned int WINAPI as_CreateCharThread(void* in_data);
	void		OnCreateCharSuccess();
	static unsigned int WINAPI as_DeleteCharThread(void* in_data);
	void		OnDeleteCharSuccess();
	static unsigned int WINAPI as_BuyItemThread(void* in_data);
	void		OnBuyItemSuccess();
	static	unsigned int WINAPI as_BackpackFromInventoryThread(void* in_data);
	static	unsigned int WINAPI as_BackpackFromInventorySwapThread(void* in_data);
	void		OnBackpackFromInventorySuccess();
	static	unsigned int WINAPI as_ReviveCharThread(void* in_data);
	void		OnReviveCharSuccess();
	static	unsigned int WINAPI as_BackpackToInventoryThread(void* in_data);
	void		OnBackpackToInventorySuccess();
	static	unsigned int WINAPI as_BackpackGridSwapThread(void* in_data);
	void		OnBackpackGridSwapSuccess();
	static	unsigned int WINAPI as_BackpackChangeThread(void* in_data);
	void		OnBackpackChangeSuccess();

	static unsigned int WINAPI as_PlayGameThread(void* in_data);
	static unsigned int WINAPI as_JoinGameThread(void* in_data);

	bool	UpdateInventoryWithBoughtItem();
	void	updateDefaultAttachments( bool isNewItem, uint32_t itemID );
	int		StoreDetectBuyIdx();
	void	SyncGraphicsUI();
	void	AddSettingsChangeFlag( DWORD flag );
	void	SetNeedUpdateSettings();
	void	UpdateSettings();
	void	updateSurvivorTotalWeight(int survivor);

// char create
	uint32_t		m_itemID;

	uint32_t		mStore_BuyItemID;
	int		mStore_BuyPrice;
	int		mStore_BuyPriceGD;
	__int64	m_inventoryID;
	int		m_gridTo;
	int		m_gridFrom;
	int		m_Amount;
	int		m_Amount2;
	__int64	mChangeBackpack_inventoryID;

	wiCharDataFull	PlayerCreateLoadout; // save loadout when creating player, so that user can see rendered player
	uint32_t		m_CreateHeroID;
	int		m_CreateBodyIdx;
	int		m_CreateHeadIdx;
	int		m_CreateLegsIdx;
	char	m_CreateGamerTag[64];
	int		m_CreateGameMode;
	
	DWORD		m_joinGameServerId;
	char		m_joinGamePwd[512];

	bool	m_ReloadProfile;
	float	m_ReloadTimer;

	DWORD	settingsChangeFlags_;
	bool	needUpdateSettings_;
	int		m_waitingForKeyRemap;

	class obj_Player* m_Player;
	int m_needPlayerRenderingRequest;

	int m_browseGamesMode; // 0 - browse, 1-recent, 2-favorites
};
