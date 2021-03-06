USE [UndeadAlpha]
GO
/****** Object:  StoredProcedure [dbo].[DB_BackupDatabase]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DB_BackupDatabase]   
AS  
BEGIN  
	SET NOCOUNT ON;  

	declare @databaseName sysname = 'WarZ'
	declare @sqlCommand NVARCHAR(1000)
	declare @dateTime NVARCHAR(20)

	SELECT @dateTime = REPLACE(CONVERT(VARCHAR, GETDATE(),111),'/','') +
	REPLACE(CONVERT(VARCHAR, GETDATE(),108),':','')

	SET @sqlCommand = 'BACKUP DATABASE ' + @databaseName +
		' TO DISK = ''C:\SQL_Backup\' + @databaseName + '_Full_' + @dateTime + '.BAK'''
         
	select @sqlCommand
	EXECUTE sp_executesql @sqlCommand
END
GO
/****** Object:  Table [dbo].[DataSkill2Price]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DataSkill2Price](
	[SkillID] [int] NOT NULL,
	[SkillName] [varchar](64) NULL,
	[Lv1] [int] NULL,
	[Lv2] [int] NULL,
	[Lv3] [int] NULL,
	[Lv4] [int] NULL,
	[Lv5] [int] NULL,
 CONSTRAINT [PK_DataSkill2Price] PRIMARY KEY CLUSTERED 
(
	[SkillID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DataGameRewards]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataGameRewards](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[GD_SOFT] [int] NOT NULL,
	[XP_SOFT] [int] NOT NULL,
	[GD_HARD] [int] NOT NULL,
	[XP_HARD] [int] NOT NULL,
 CONSTRAINT [PK_DataGameRewards] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClanInvites]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClanInvites](
	[ClanInviteID] [int] IDENTITY(1,1) NOT NULL,
	[ClanID] [int] NOT NULL,
	[InviterCharID] [int] NOT NULL,
	[CharID] [int] NOT NULL,
	[ExpireTime] [datetime] NOT NULL,
 CONSTRAINT [PK_ClanInvites] PRIMARY KEY CLUSTERED 
(
	[ClanInviteID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClanEvents]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClanEvents](
	[ClanEventID] [int] IDENTITY(1,1) NOT NULL,
	[ClanID] [int] NOT NULL,
	[EventDate] [datetime] NOT NULL,
	[EventType] [int] NOT NULL,
	[EventRank] [int] NOT NULL,
	[Var1] [int] NOT NULL,
	[Var2] [int] NOT NULL,
	[Var3] [int] NOT NULL,
	[Var4] [int] NOT NULL,
	[Text1] [nvarchar](64) NULL,
	[Text2] [nvarchar](64) NULL,
	[Text3] [nvarchar](256) NULL,
 CONSTRAINT [PK_ClanEvents] PRIMARY KEY CLUSTERED 
(
	[ClanEventID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClanData]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClanData](
	[ClanID] [int] IDENTITY(1472,1) NOT NULL,
	[ClanName] [nvarchar](64) NOT NULL,
	[ClanNameColor] [int] NOT NULL,
	[ClanTag] [nvarchar](4) NOT NULL,
	[ClanTagColor] [int] NOT NULL,
	[ClanEmblemID] [int] NOT NULL,
	[ClanEmblemColor] [int] NOT NULL,
	[ClanXP] [int] NOT NULL,
	[ClanLevel] [int] NOT NULL,
	[ClanGP] [int] NOT NULL,
	[OwnerCustomerID] [int] NOT NULL,
	[OwnerCharID] [int] NOT NULL,
	[MaxClanMembers] [int] NOT NULL,
	[NumClanMembers] [int] NOT NULL,
	[ClanLore] [nvarchar](512) NULL,
	[Announcement] [nvarchar](512) NULL,
	[ClanCreateDate] [datetime] NULL,
 CONSTRAINT [PK_ClanData] PRIMARY KEY CLUSTERED 
(
	[ClanID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClanApplications]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClanApplications](
	[ClanApplicationID] [int] IDENTITY(1,1) NOT NULL,
	[ClanID] [int] NOT NULL,
	[CharID] [int] NOT NULL,
	[ExpireTime] [datetime] NOT NULL,
	[ApplicationText] [nvarchar](500) NOT NULL,
	[IsProcessed] [int] NOT NULL,
 CONSTRAINT [PK_ClanApplications] PRIMARY KEY CLUSTERED 
(
	[ClanApplicationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CheatLog]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheatLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SessionID] [bigint] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[CheatID] [int] NOT NULL,
	[ReportTime] [datetime] NOT NULL,
 CONSTRAINT [PK_CheatLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CharsStats]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharsStats](
	[CharID] [int] NOT NULL,
	[PlayersKilled] [int] NOT NULL,
	[ZombiesKilled] [int] NOT NULL,
 CONSTRAINT [PK_CharsStats] PRIMARY KEY CLUSTERED 
(
	[CharID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Achievements]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Achievements](
	[CustomerID] [int] NOT NULL,
	[AchID] [int] NOT NULL,
	[Value] [int] NOT NULL,
	[Unlocked] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Accounts](
	[CustomerID] [int] IDENTITY(1000000,1) NOT NULL,
	[email] [varchar](128) NOT NULL,
	[MD5Password] [varchar](32) NULL,
	[dateregistered] [datetime] NULL,
	[ReferralID] [int] NOT NULL,
	[AccountStatus] [int] NOT NULL,
	[IsDeveloper] [int] NOT NULL,
	[lastlogindate] [datetime] NULL,
	[lastloginIP] [varchar](16) NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FinancialTransactions]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FinancialTransactions](
	[CustomerID] [int] NOT NULL,
	[TransactionID] [varchar](64) NOT NULL,
	[TransactionType] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Amount] [float] NOT NULL,
	[ResponseCode] [varchar](64) NOT NULL,
	[AprovalCode] [varchar](16) NOT NULL,
	[ItemID] [varchar](32) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DBG_WOAdminChanges]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DBG_WOAdminChanges](
	[ChangeID] [int] IDENTITY(1,1) NOT NULL,
	[ChangeTime] [datetime] NULL,
	[UserName] [nvarchar](64) NULL,
	[Action] [int] NULL,
	[Field] [varchar](512) NULL,
	[RecordID] [int] NULL,
	[OldValue] [varchar](2048) NULL,
	[NewValue] [varchar](2048) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DBG_UserRoundResults]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DBG_UserRoundResults](
	[IP] [varchar](32) NOT NULL,
	[GameSessionID] [bigint] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[GamePoints] [int] NOT NULL,
	[HonorPoints] [int] NOT NULL,
	[SkillPoints] [int] NOT NULL,
	[Kills] [int] NOT NULL,
	[Deaths] [int] NOT NULL,
	[ShotsFired] [int] NOT NULL,
	[ShotsHits] [int] NOT NULL,
	[Headshots] [int] NOT NULL,
	[AssistKills] [int] NOT NULL,
	[Wins] [int] NOT NULL,
	[Losses] [int] NOT NULL,
	[CaptureNeutralPoints] [int] NOT NULL,
	[CaptureEnemyPoints] [int] NOT NULL,
	[TimePlayed] [int] NOT NULL,
	[GameReportTime] [datetime] NOT NULL,
	[GameDollars] [int] NOT NULL,
	[TeamID] [int] NOT NULL,
	[MapID] [int] NOT NULL,
	[MapType] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DBG_SrvLogInfo]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DBG_SrvLogInfo](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[ReportTime] [datetime] NULL,
	[IsProcessed] [int] NULL,
	[CustomerID] [int] NULL,
	[CharID] [int] NULL,
	[CustomerIP] [varchar](64) NULL,
	[GameSessionID] [bigint] NULL,
	[CheatID] [int] NULL,
	[RepeatCount] [int] NULL,
	[Gamertag] [nvarchar](64) NULL,
	[Msg] [varchar](512) NULL,
	[Data] [varchar](4096) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[DBG_RegisterIISCall]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DBG_RegisterIISCall]
	@in_API	varchar(128),
	@in_BytesIn int,
	@in_BytesOut int
AS
BEGIN
	SET NOCOUNT ON;
	
	select 0 as ResultCode
	/*
	update DBG_IISApiStats set Hits=Hits+1, BytesIn=BytesIn+@in_BytesIn, BytesOut=BytesOut+@in_BytesOut where API=@in_API
	if(@@ROWCOUNT = 0) begin
		insert into DBG_IISApiStats	values (
			@in_API,
			1,
			@in_BytesIn,
			@in_BytesOut
		)
	end
	*/

	return
END
GO
/****** Object:  Table [dbo].[DBG_PasswordResets]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DBG_PasswordResets](
	[ResetID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[ResetDate] [datetime] NULL,
	[NewPassword] [varchar](200) NULL,
 CONSTRAINT [PK_DBG_PasswordResets] PRIMARY KEY CLUSTERED 
(
	[ResetID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DBG_LootRewards]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBG_LootRewards](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[ReportTime] [datetime] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Roll] [float] NOT NULL,
	[LootID] [float] NOT NULL,
	[ItemID] [int] NOT NULL,
	[ExpDays] [int] NOT NULL,
	[GD] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DBG_LevelUpEvents]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBG_LevelUpEvents](
	[CustomerID] [int] NULL,
	[LevelGained] [int] NULL,
	[ReportTime] [datetime] NULL,
	[SessionID] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DBG_IISApiStats]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DBG_IISApiStats](
	[API] [varchar](128) NOT NULL,
	[Hits] [bigint] NOT NULL,
	[BytesIn] [bigint] NOT NULL,
	[BytesOut] [bigint] NOT NULL,
 CONSTRAINT [PK_DBG_IISApiStats] PRIMARY KEY CLUSTERED 
(
	[API] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DBG_GPTransactions]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DBG_GPTransactions](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[TransactionTime] [datetime] NULL,
	[Amount] [int] NULL,
	[Reason] [varchar](64) NULL,
	[Previous] [int] NULL,
 CONSTRAINT [PK_DBG_GPTransactions] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DBG_BanLog]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBG_BanLog](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[BanTime] [datetime] NULL,
	[BanDuration] [int] NULL,
	[BanReason] [nvarchar](512) NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[WZ_ClanCreateCheckMoney]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_ClanCreateCheckMoney]
	@in_CustomerID int
AS
BEGIN
	SET NOCOUNT ON;

	-- this call is always valid
	select 0 as ResultCode

	-- doesn't need money yet	
	select 0 as NeedMoney

	return
END
GO
/****** Object:  Table [dbo].[ServerNotesData]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServerNotesData](
	[NoteID] [int] IDENTITY(1,1) NOT NULL,
	[GameServerId] [int] NOT NULL,
	[GamePos] [varchar](128) NULL,
	[CreateUtcDate] [datetime] NULL,
	[ExpireUtcDate] [datetime] NULL,
	[CustomerID] [int] NULL,
	[CharID] [int] NULL,
	[TextFrom] [nvarchar](128) NULL,
	[TextSubj] [nvarchar](2048) NULL,
 CONSTRAINT [PK_ServerNotesData] PRIMARY KEY CLUSTERED 
(
	[NoteID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SecurityLog]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SecurityLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[IP] [varchar](64) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[EventData] [varchar](256) NOT NULL,
 CONSTRAINT [PK_SecurityLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MasterServerInfo]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MasterServerInfo](
	[ServerID] [int] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[CreateGameKey] [int] NOT NULL,
	[IP] [varchar](64) NOT NULL,
 CONSTRAINT [PK_MasterServerInfo] PRIMARY KEY CLUSTERED 
(
	[ServerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoginSessions]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoginSessions](
	[CustomerID] [int] NOT NULL,
	[SessionKey] [varchar](50) NOT NULL,
	[SessionID] [int] NOT NULL,
	[LoginIP] [varchar](16) NOT NULL,
	[TimeLogged] [datetime] NOT NULL,
	[TimeUpdated] [datetime] NOT NULL,
	[GameSessionID] [bigint] NOT NULL,
 CONSTRAINT [PK_LoginSessions] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Logins]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Logins](
	[LoginID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[LoginTime] [datetime] NOT NULL,
	[IP] [varchar](16) NOT NULL,
	[LoginSource] [int] NOT NULL,
 CONSTRAINT [PK_Logins] PRIMARY KEY CLUSTERED 
(
	[LoginID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Leaderboard7]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leaderboard7](
	[Pos] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[gamertag] [nvarchar](32) NOT NULL,
	[Rank] [int] NOT NULL,
	[HonorPoints] [int] NOT NULL,
	[Wins] [int] NOT NULL,
	[Losses] [int] NOT NULL,
	[Kills] [int] NOT NULL,
	[Deaths] [int] NOT NULL,
	[ShotsFired] [int] NOT NULL,
	[ShotsHit] [int] NOT NULL,
	[TimePlayed] [int] NOT NULL,
	[HavePremium] [int] NOT NULL,
 CONSTRAINT [PK_Leaderboard7] PRIMARY KEY CLUSTERED 
(
	[Pos] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leaderboard30]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leaderboard30](
	[Pos] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[gamertag] [nvarchar](32) NOT NULL,
	[Rank] [int] NOT NULL,
	[HonorPoints] [int] NOT NULL,
	[Wins] [int] NOT NULL,
	[Losses] [int] NOT NULL,
	[Kills] [int] NOT NULL,
	[Deaths] [int] NOT NULL,
	[ShotsFired] [int] NOT NULL,
	[ShotsHit] [int] NOT NULL,
	[TimePlayed] [int] NOT NULL,
	[HavePremium] [int] NOT NULL,
 CONSTRAINT [PK_Leaderboard30] PRIMARY KEY CLUSTERED 
(
	[Pos] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leaderboard1]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leaderboard1](
	[Pos] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[gamertag] [nvarchar](32) NOT NULL,
	[Rank] [int] NOT NULL,
	[HonorPoints] [int] NOT NULL,
	[Wins] [int] NOT NULL,
	[Losses] [int] NOT NULL,
	[Kills] [int] NOT NULL,
	[Deaths] [int] NOT NULL,
	[ShotsFired] [int] NOT NULL,
	[ShotsHit] [int] NOT NULL,
	[TimePlayed] [int] NOT NULL,
	[HavePremium] [int] NOT NULL,
 CONSTRAINT [PK_Leaderboard1] PRIMARY KEY CLUSTERED 
(
	[Pos] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leaderboard]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leaderboard](
	[Pos] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[gamertag] [nvarchar](32) NOT NULL,
	[Rank] [int] NOT NULL,
	[HonorPoints] [int] NOT NULL,
	[Wins] [int] NOT NULL,
	[Losses] [int] NOT NULL,
	[Kills] [int] NOT NULL,
	[Deaths] [int] NOT NULL,
	[ShotsFired] [int] NOT NULL,
	[ShotsHit] [int] NOT NULL,
	[TimePlayed] [int] NOT NULL,
	[HavePremium] [int] NOT NULL,
 CONSTRAINT [PK_Leaderboard] PRIMARY KEY CLUSTERED 
(
	[Pos] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items_Weapons]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Items_Weapons](
	[ItemID] [int] IDENTITY(101001,1) NOT NULL,
	[FNAME] [varchar](32) NOT NULL,
	[Category] [int] NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[Description] [nvarchar](256) NOT NULL,
	[MuzzleOffset] [varchar](32) NOT NULL,
	[MuzzleParticle] [varchar](32) NOT NULL,
	[Animation] [varchar](32) NOT NULL,
	[BulletID] [varchar](32) NOT NULL,
	[Sound_Shot] [varchar](255) NOT NULL,
	[Sound_Reload] [varchar](255) NOT NULL,
	[Damage] [float] NOT NULL,
	[isImmediate] [int] NOT NULL,
	[Mass] [float] NOT NULL,
	[Speed] [float] NOT NULL,
	[DamageDecay] [float] NOT NULL,
	[Area] [float] NOT NULL,
	[Delay] [float] NOT NULL,
	[Timeout] [float] NOT NULL,
	[NumClips] [int] NOT NULL,
	[Clipsize] [int] NOT NULL,
	[ReloadTime] [float] NOT NULL,
	[ActiveReloadTick] [float] NOT NULL,
	[RateOfFire] [int] NOT NULL,
	[Spread] [float] NOT NULL,
	[Recoil] [float] NOT NULL,
	[NumGrenades] [int] NOT NULL,
	[GrenadeName] [varchar](32) NOT NULL,
	[Firemode] [varchar](3) NOT NULL,
	[DetectionRadius] [int] NOT NULL,
	[ScopeType] [varchar](32) NOT NULL,
	[ScopeZoom] [int] NOT NULL,
	[Price1] [int] NOT NULL,
	[Price7] [int] NOT NULL,
	[Price30] [int] NOT NULL,
	[PriceP] [int] NOT NULL,
	[IsNew] [int] NOT NULL,
	[LevelRequired] [int] NOT NULL,
	[GPrice1] [int] NOT NULL,
	[GPrice7] [int] NOT NULL,
	[GPrice30] [int] NOT NULL,
	[GPriceP] [int] NOT NULL,
	[ShotsFired] [bigint] NOT NULL,
	[ShotsHits] [bigint] NOT NULL,
	[KillsCQ] [int] NOT NULL,
	[KillsDM] [int] NOT NULL,
	[KillsSB] [int] NOT NULL,
	[IsUpgradeable] [int] NOT NULL,
	[IsFPS] [int] NOT NULL,
	[FPSSpec0] [int] NOT NULL,
	[FPSSpec1] [int] NOT NULL,
	[FPSSpec2] [int] NOT NULL,
	[FPSSpec3] [int] NOT NULL,
	[FPSSpec4] [int] NOT NULL,
	[FPSSpec5] [int] NOT NULL,
	[FPSSpec6] [int] NOT NULL,
	[FPSSpec7] [int] NOT NULL,
	[FPSSpec8] [int] NOT NULL,
	[FPSAttach0] [int] NOT NULL,
	[FPSAttach1] [int] NOT NULL,
	[FPSAttach2] [int] NOT NULL,
	[FPSAttach3] [int] NOT NULL,
	[FPSAttach4] [int] NOT NULL,
	[FPSAttach5] [int] NOT NULL,
	[FPSAttach6] [int] NOT NULL,
	[FPSAttach7] [int] NOT NULL,
	[FPSAttach8] [int] NOT NULL,
	[AnimPrefix] [varchar](32) NOT NULL,
	[Weight] [int] NOT NULL,
 CONSTRAINT [PK_Items_Weapons] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Items_LootData]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items_LootData](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[LootID] [int] NOT NULL,
	[Chance] [float] NULL,
	[ItemID] [int] NULL,
	[GDMin] [int] NULL,
	[GDMax] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items_Generic]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Items_Generic](
	[ItemID] [int] IDENTITY(301000,1) NOT NULL,
	[FNAME] [varchar](32) NOT NULL,
	[Category] [int] NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
	[Price1] [int] NOT NULL,
	[Price7] [int] NOT NULL,
	[Price30] [int] NOT NULL,
	[PriceP] [int] NOT NULL,
	[IsNew] [int] NOT NULL,
	[LevelRequired] [int] NOT NULL,
	[GPrice1] [int] NOT NULL,
	[GPrice7] [int] NOT NULL,
	[GPrice30] [int] NOT NULL,
	[GPriceP] [int] NOT NULL,
	[Weight] [int] NOT NULL,
 CONSTRAINT [PK_Items_Generic] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Items_Gear]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Items_Gear](
	[ItemID] [int] IDENTITY(20000,1) NOT NULL,
	[FNAME] [varchar](64) NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[Description] [nvarchar](256) NOT NULL,
	[Category] [int] NOT NULL,
	[Weight] [int] NOT NULL,
	[DamagePerc] [int] NOT NULL,
	[DamageMax] [int] NOT NULL,
	[Bulkiness] [int] NOT NULL,
	[Inaccuracy] [int] NOT NULL,
	[Stealth] [int] NOT NULL,
	[Price1] [int] NOT NULL,
	[Price7] [int] NOT NULL,
	[Price30] [int] NOT NULL,
	[PriceP] [int] NOT NULL,
	[IsNew] [int] NOT NULL,
	[ProtectionLevel] [int] NOT NULL,
	[LevelRequired] [int] NOT NULL,
	[GPrice1] [int] NOT NULL,
	[GPrice7] [int] NOT NULL,
	[GPrice30] [int] NOT NULL,
	[GPriceP] [int] NOT NULL,
 CONSTRAINT [PK_Items_Gear] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Items_Attachments]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Items_Attachments](
	[ItemID] [int] IDENTITY(400000,1) NOT NULL,
	[FNAME] [varchar](32) NOT NULL,
	[Type] [int] NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[Description] [nvarchar](256) NOT NULL,
	[MuzzleParticle] [varchar](64) NOT NULL,
	[FireSound] [varchar](256) NOT NULL,
	[Damage] [float] NOT NULL,
	[Range] [float] NOT NULL,
	[Firerate] [float] NOT NULL,
	[Recoil] [float] NOT NULL,
	[Spread] [float] NOT NULL,
	[Clipsize] [int] NOT NULL,
	[ScopeMag] [float] NOT NULL,
	[ScopeType] [varchar](32) NOT NULL,
	[AnimPrefix] [varchar](32) NOT NULL,
	[SpecID] [int] NOT NULL,
	[Category] [int] NOT NULL,
	[Price1] [int] NOT NULL,
	[Price7] [int] NOT NULL,
	[Price30] [int] NOT NULL,
	[PriceP] [int] NOT NULL,
	[GPrice1] [int] NOT NULL,
	[GPrice7] [int] NOT NULL,
	[GPrice30] [int] NOT NULL,
	[GPriceP] [int] NOT NULL,
	[IsNew] [int] NOT NULL,
	[LevelRequired] [int] NOT NULL,
	[Weight] [int] NOT NULL,
 CONSTRAINT [PK_Items_Attachments] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FriendsMap]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FriendsMap](
	[CustomerID] [int] NULL,
	[FriendID] [int] NULL,
	[FriendStatus] [int] NULL,
	[DateAdded] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[FN_LevelUpBonus]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FN_LevelUpBonus] 
       @in_CustomerID int,
       @in_LevelUp int
AS
BEGIN
	SET NOCOUNT ON;

	declare @gd int = 0 -- level up bonus
	declare @sp int = 1 -- always give at least one SP

	-- not implemented yet

END
GO
/****** Object:  StoredProcedure [dbo].[FN_CreateMD5Password]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FN_CreateMD5Password]
	@in_Password varchar(100),
	@out_MD5 varchar(32) OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	declare @PASSWORD_SALT varchar(100) = 'g5sc4gs1fz0h'
	set @out_MD5 = SUBSTRING(master.dbo.fn_varbintohexstr(HashBytes('md5', @PASSWORD_SALT + @in_Password)), 3, 999)
END
GO
/****** Object:  Table [dbo].[VitalStats_V1]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VitalStats_V1](
	[Timestamp] [datetime] NULL,
	[TotalSales] [int] NULL,
	[TotalUsers] [int] NULL,
	[DAU] [int] NULL,
	[CCU] [int] NULL,
	[Revenues] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersInventory]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersInventory](
	[InventoryID] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[CharID] [int] NOT NULL,
	[BackpackSlot] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[LeasedUntil] [datetime] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Var1] [int] NOT NULL,
	[Var2] [int] NOT NULL,
 CONSTRAINT [PK_UsersInventory] PRIMARY KEY CLUSTERED 
(
	[InventoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersData]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersData](
	[CustomerID] [int] NOT NULL,
	[IsDeveloper] [int] NOT NULL,
	[AccountType] [int] NOT NULL,
	[AccountStatus] [int] NOT NULL,
	[GamePoints] [int] NOT NULL,
	[GameDollars] [int] NOT NULL,
	[dateregistered] [datetime] NOT NULL,
	[lastjoineddate] [datetime] NOT NULL,
	[lastgamedate] [datetime] NOT NULL,
	[ClanID] [int] NOT NULL,
	[ClanRank] [int] NOT NULL,
	[GameServerId] [bigint] NULL,
	[CharsCreated] [int] NOT NULL,
	[TimePlayed] [int] NOT NULL,
	[DateActiveUntil] [datetime] NOT NULL,
	[BanTime] [datetime] NULL,
	[BanReason] [nvarchar](512) NULL,
	[BanCount] [int] NOT NULL,
	[BanExpireDate] [datetime] NULL,
 CONSTRAINT [PK_UsersData] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersChars]    Script Date: 11/08/2014 01:27:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsersChars](
	[CharID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Hardcore] [int] NOT NULL,
	[Gamertag] [nvarchar](64) NOT NULL,
	[HeroItemID] [int] NOT NULL,
	[HeadIdx] [int] NOT NULL,
	[BodyIdx] [int] NOT NULL,
	[LegsIdx] [int] NOT NULL,
	[Alive] [int] NOT NULL,
	[DeathUtcTime] [datetime] NOT NULL,
	[XP] [int] NOT NULL,
	[TimePlayed] [int] NOT NULL,
	[GameMapId] [int] NOT NULL,
	[GameServerId] [bigint] NOT NULL,
	[GamePos] [varchar](128) NOT NULL,
	[GameFlags] [int] NOT NULL,
	[Health] [float] NOT NULL,
	[Food] [float] NOT NULL,
	[Water] [float] NOT NULL,
	[Toxic] [float] NOT NULL,
	[Reputation] [int] NOT NULL,
	[BackpackID] [int] NOT NULL,
	[BackpackSize] [int] NOT NULL,
	[Attachment1] [varchar](256) NOT NULL,
	[Attachment2] [varchar](256) NOT NULL,
	[Stat00] [int] NOT NULL,
	[Stat01] [int] NOT NULL,
	[Stat02] [int] NOT NULL,
	[Stat03] [int] NOT NULL,
	[Stat04] [int] NOT NULL,
	[Stat05] [int] NOT NULL,
	[LastUpdateDate] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[ClanID] [int] NOT NULL,
	[ClanRank] [int] NOT NULL,
	[ClanContributedXP] [int] NOT NULL,
	[ClanContributedGP] [int] NOT NULL,
 CONSTRAINT [PK_Profile_Loadouts2] PRIMARY KEY CLUSTERED 
(
	[CharID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[FN_BackpackValidateItem]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FN_BackpackValidateItem] 
	@in_CharID int,
	@in_ItemID int,
	@in_EquipIdx int
AS
BEGIN
	SET NOCOUNT ON;
	
	if @in_ItemID = 0
		return 0

	if not exists (SELECT ItemID from UsersBackpack WHERE CharID=@in_CharID and ItemID=@in_ItemID and LeasedUntil>GETDATE()) begin
		return 0
	end

	-- item is valid
	return @in_ItemID
END
GO
/****** Object:  StoredProcedure [dbo].[TEMP_AddGPToUser]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TEMP_AddGPToUser]
	@in_email varchar(128),
	@in_GP int
AS
BEGIN
	SET NOCOUNT ON;
	
	--
	-- used in account.thewarz.com/admin/gpadd
	-- 
	
	declare @CustomerID int = 0
	select @CustomerID=CustomerID from dbo.Accounts where email=@in_email
	if(@@ROWCOUNT = 0) begin
		select 0 as 'CustomerID'
		return
	end
		
	declare @GamePoints int = 0
	select @GamePoints=GamePoints from UsersData where CustomerID=@CustomerID

	insert into DBG_GPTransactions (
		CustomerID,
		TransactionTime,
		Amount,
		Reason,
		Previous
	) values (
		@CustomerID,
		GETDATE(),
		@in_GP,
		'ADMIN_ADD',
		@GamePoints
	)
	
	update UsersData set GamePoints=(GamePoints + @in_GP) where CustomerID=@CustomerID
	select @CustomerID as 'CustomerID', (@GamePoints+@in_GP) as 'GamePoints'

END
GO
/****** Object:  StoredProcedure [dbo].[FN_AlterUserGP]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FN_AlterUserGP]
	@in_CustomerID int,
	@in_GP int,
	@in_Reason varchar(64)
AS
BEGIN
	SET NOCOUNT ON;
	
	if(@in_GP = 0)
		return
		
	declare @GamePoints int = 0
	select @GamePoints=GamePoints from UsersData where CustomerID=@in_CustomerID

	insert into DBG_GPTransactions (
		CustomerID,
		TransactionTime,
		Amount,
		Reason,
		Previous
	) values (
		@in_CustomerID,
		GETDATE(),
		@in_GP,
		@in_Reason,
		@GamePoints
	)
	
	update UsersData set GamePoints=(GamePoints + @in_GP) where CustomerID=@in_CustomerID

END
GO
/****** Object:  StoredProcedure [dbo].[FN_AddItemToUser]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FN_AddItemToUser]
	@in_CustomerID int,
	@in_ItemID int,
	@in_ExpDays int
AS
BEGIN
	SET NOCOUNT ON;

	declare @InventoryID bigint = 0
	declare @LeasedUntil datetime
	declare @CurDate datetime = GETDATE()
	
	-- check if this is stackable item, if so - get buying stack size.
	-- stackable item defined where NumClips>0, Quantity is ClipSize
	declare @BuyStackSize int = 1
	select @BuyStackSize=ClipSize from Items_Weapons where ItemID=@in_ItemID and NumClips>0
	
	-- see if we already have that item in inventory without modification vars
	select @InventoryID=InventoryID, @LeasedUntil=LeasedUntil from UsersInventory 
		where (CustomerID=@in_CustomerID and CharID=0 and ItemID=@in_ItemID and Var1<0)
	if(@InventoryID = 0) 
	begin
		INSERT INTO UsersInventory (
			CustomerID,
			CharID,
			ItemID, 
			LeasedUntil, 
			Quantity
		)
		VALUES (
			@in_CustomerID,
			0,
			@in_ItemID,
			DATEADD(day, @in_ExpDays, @CurDate),
			@BuyStackSize
		)
		return
	end
       
	if(@LeasedUntil < @CurDate)
		set @LeasedUntil = DATEADD(day, @in_ExpDays, @CurDate)
	else
		set @LeasedUntil = DATEADD(day, @in_ExpDays, @LeasedUntil)
		
	if(@LeasedUntil > '2020-1-1')
		set @LeasedUntil = '2020-1-1'

	-- all items is stackable by default
	UPDATE UsersInventory SET 
		LeasedUntil=@LeasedUntil,
		Quantity=(Quantity+@BuyStackSize)
	WHERE InventoryID=@InventoryID
	
	return
END
GO
/****** Object:  StoredProcedure [dbo].[FN_ADD_SECURITY_LOG]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[FN_ADD_SECURITY_LOG] 
	-- Add the parameters for the stored procedure here
	@EventID int,
	@IP varchar(64),
	@CustomerID int,
	@EventData varchar(256)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO SecurityLog
		(EventID, Date, IP, CustomerID, EventData) 
	VALUES 
		(@EventID, GETDATE(), @IP, @CustomerID, @EventData)

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_CharCreate]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_CharCreate] 
	@in_CustomerID int,
	@in_Hardcore int,
	@in_Gamertag nvarchar(64),
	@in_HeroItemID int,
	@in_HeadIdx int,
	@in_BodyIdx int,
	@in_LegsIdx int
AS
BEGIN
	SET NOCOUNT ON;

	if(@in_Gamertag like '%sergey%titov%') begin
		select 9 as ResultCode, 'no impersonation' as ResultMsg
		return
	end

	if(@in_Gamertag like '%titov%sergey%') begin
		select 9 as ResultCode, 'no impersonation' as ResultMsg
		return
	end
	
	if(@in_Gamertag like '%\[dev\]%' escape '\') begin
		select 9 as ResultCode, 'no dev' as ResultMsg
		return
	end
	
	-- check if gamertag is unique
	if exists (select CharID from UsersChars where Gamertag=@in_Gamertag)
	begin
		select 9 as ResultCode, 'Gamertag already exists' as ResultMsg
		return
	end

	-- we can't have more that 5 survivors
	declare @NumChars int = 0
	select @NumChars=COUNT(*) from UsersChars where CustomerID=@in_CustomerID
	if(@NumChars >= 5) begin
		select 6 as ResultCode, 'too many created chars' as ResultMsg
		return
	end

	insert into UsersChars (
		CustomerID,
		Gamertag,
		Alive,
		Hardcore,
		HeroItemID,
		HeadIdx,
		BodyIdx,
		LegsIdx,
		CreateDate
	) values (
		@in_CustomerID,
		@in_Gamertag,
		3,
		@in_Hardcore,
		@in_HeroItemID,
		@in_HeadIdx,
		@in_BodyIdx,
		@in_LegsIdx,
		GETDATE()
	)
	declare @CharID int = SCOPE_IDENTITY()
	
	-- give basic items for first few survivors
	declare @CharsCreated int = 0
	update UsersData set CharsCreated=(CharsCreated+1) where CustomerID=@in_CustomerID
	select @CharsCreated=CharsCreated from UsersData where CustomerID=@in_CustomerID
	if(@CharsCreated <= 5) begin
		-- add some default items - BE ULTRA CAREFUL with BackpackSlot number
		insert into UsersInventory (CustomerID, CharID, BackpackSlot, ItemID, LeasedUntil, Quantity)
			values (@in_CustomerID, @CharID, 1, 101306, '2020-1-1', 1) -- Flashlight
		insert into UsersInventory (CustomerID, CharID, BackpackSlot, ItemID, LeasedUntil, Quantity)
			values (@in_CustomerID, @CharID, 2, 101261, '2020-1-1', 1) -- Bandages
		insert into UsersInventory (CustomerID, CharID, BackpackSlot, ItemID, LeasedUntil, Quantity)
			values (@in_CustomerID, @CharID, 3, 101296, '2020-1-1', 1) -- Can of Soda
		insert into UsersInventory (CustomerID, CharID, BackpackSlot, ItemID, LeasedUntil, Quantity)
			values (@in_CustomerID, @CharID, 4, 101289, '2020-1-1', 1) -- Granola Bar
	end
	
	-- allow to use postbox on newly created survivors
	update UsersChars set GameFlags=1 where CharID=@CharID
	
	select 0 as ResultCode
	select @CharID as 'CharID'
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_Char_SRV_SetStatus]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_Char_SRV_SetStatus]
	@in_CustomerID int,
	@in_CharID int,
	@in_Alive int,
	@in_GamePos varchar(256),
	@in_GameFlags int,
	@in_Health float,
	@in_Hunger float,
	@in_Thirst float,
	@in_Toxic float,
	@in_TimePlayed int,
	@in_XP int,
	@in_Reputation int,
	@in_GameDollars int,
	@in_Stat00 int,
	@in_Stat01 int,
	@in_Stat02 int,
	@in_Stat03 int,
	@in_Stat04 int,
	@in_Stat05 int
AS
BEGIN
	SET NOCOUNT ON;
	
	--
	-- this function should be called only by server, so we skip all validations
	--
	
	-- record last game update
	update UsersData set GameDollars=@in_GameDollars, lastgamedate=GETDATE() where CustomerID=@in_CustomerID

	-- update basic character data
	update UsersChars set
		GamePos=@in_GamePos,
		GameFlags=@in_GameFlags,
		Alive=@in_Alive,
		Health=@in_Health,
		Food=@in_Hunger,
		Water=@in_Thirst,
		Toxic=@in_Toxic,
		TimePlayed=@in_TimePlayed,
		LastUpdateDate=GETDATE(),
		XP=@in_XP,
		Reputation=@in_Reputation,
		Stat00=@in_Stat00,
		Stat01=@in_Stat01,
		Stat02=@in_Stat02,
		Stat03=@in_Stat03,
		Stat04=@in_Stat04,
		Stat05=@in_Stat05
	where CharID=@in_CharID
	
	if(@in_Alive = 0) begin
		update UsersChars set DeathUtcTime=GETUTCDATE() where CharID=@in_CharID
		-- set default backpack on death
		update UsersChars set BackpackID=20176, BackpackSize=12 where CharID=@in_CharID
		-- delete stuff from backpack
		delete from UsersInventory where CustomerID=@in_CustomerID and CharID=@in_CharID
	end

	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_Char_SRV_SetAttachments]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_Char_SRV_SetAttachments]
	@in_CustomerID int,
	@in_CharID int,
	@in_Attm1 varchar(256),
	@in_Attm2 varchar(256)
AS
BEGIN
	SET NOCOUNT ON;
	
	--
	-- this function should be called only by server, so we skip all validations
	--

	-- update attachments
	UPDATE UsersChars SET Attachment1=@in_Attm1, Attachment2=@in_Attm2 where CharID=@in_CharID

	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_BuyItemFN_GetPrice]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_BuyItemFN_GetPrice]
    @out_FNResult int out,
	@in_ItemId int,
	@in_BuyDays int,
	@in_Currency varchar(32),
	@o_FinalPrice int out
AS
BEGIN
	SET NOCOUNT ON;
	
--
-- get prices from table based on itemID
--
	declare @Price1 int = 0
	declare @Price7 int = 0
	declare @Price30 int = 0
	declare @PriceP int = 0
	declare @GPrice1 int = 0
	declare @GPrice7 int = 0
	declare @GPrice30 int = 0
	declare @GPriceP int = 0
	declare @IsEnabled int = 1

	if(@in_ItemId >= 20000 and @in_ItemId < 99999)
		SELECT
		   @Price1=Price1, @Price7=Price7, @Price30=Price30, @PriceP=PriceP, 
		   @GPrice1=GPrice1, @GPrice7=GPrice7, @GPrice30=GPrice30, @GPriceP=GPriceP
		FROM Items_Gear where ItemID=@in_ItemID
	else
	if(@in_ItemId >= 100000 and @in_ItemId < 190000)
		SELECT
		   @Price1=Price1, @Price7=Price7, @Price30=Price30, @PriceP=PriceP, 
		   @GPrice1=GPrice1, @GPrice7=GPrice7, @GPrice30=GPrice30, @GPriceP=GPriceP
		FROM Items_Weapons where ItemID=@in_ItemID
	else 
	if(@in_ItemId >= 300000 and @in_ItemId < 390000) 
		SELECT
		   @Price1=Price1, @Price7=Price7, @Price30=Price30, @PriceP=PriceP, 
		   @GPrice1=GPrice1, @GPrice7=GPrice7, @GPrice30=GPrice30, @GPriceP=GPriceP
		FROM Items_Generic where ItemID=@in_ItemID
	else 
	if(@in_ItemId >= 400000 and @in_ItemId < 490000) 
		SELECT
		   @Price1=Price1, @Price7=Price7, @Price30=Price30, @PriceP=PriceP, 
		   @GPrice1=GPrice1, @GPrice7=GPrice7, @GPrice30=GPrice30, @GPriceP=GPriceP
		FROM Items_Attachments where ItemID=@in_ItemID
	else 
	begin
		set @out_FNResult = 1
		return
	end
	if (@@RowCount = 0) begin
		set @out_FNResult = 2
		return
	end
	
	     if(@in_Currency = 'GP' and @in_BuyDays = 1)    set @o_FinalPrice = @Price1
	else if(@in_Currency = 'GP' and @in_BuyDays = 7)    set @o_FinalPrice = @Price7
	else if(@in_Currency = 'GP' and @in_BuyDays = 30)   set @o_FinalPrice = @Price30
	else if(@in_Currency = 'GP' and @in_BuyDays = 2000) set @o_FinalPrice = @PriceP
	else if(@in_Currency = 'GD' and @in_BuyDays = 1)    set @o_FinalPrice = @GPrice1
	else if(@in_Currency = 'GD' and @in_BuyDays = 7)    set @o_FinalPrice = @GPrice7
	else if(@in_Currency = 'GD' and @in_BuyDays = 30)   set @o_FinalPrice = @GPrice30
	else if(@in_Currency = 'GD' and @in_BuyDays = 2000) set @o_FinalPrice = @GPriceP
	else begin
		set @out_FNResult = 3
		return
	end

	-- check if listed
	if(@o_FinalPrice <= 0 or @IsEnabled = 0) begin
		set @out_FNResult = 4
		return
	end
	
	set @out_FNResult = 0
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_ClanCreate]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_ClanCreate]
	@in_CustomerID int,
	@in_CharID int,
	@in_ClanName nvarchar(64),
	@in_ClanNameColor int,
	@in_ClanTag nvarchar(4),
	@in_ClanTagColor int,
	@in_ClanEmblemID int,
	@in_ClanEmblemColor int
AS
BEGIN
	SET NOCOUNT ON;
	
	declare @DEFAULT_CLAN_SIZE int = 15

	-- sanity check
	declare @ClanID int = 0
	declare @Gamertag nvarchar(64)
	select @ClanID=ClanID, @Gamertag=Gamertag from UsersChars where CharID=@in_CharID
	if(@ClanID > 0) begin
		select 6 as 'ResultCode', 'already have clan' as 'ResultMsg'
		return
	end
	
	-- create clan!
	insert into ClanData (
		ClanName, ClanNameColor, 
		ClanTag, ClanTagColor,
		ClanEmblemID, ClanEmblemColor,
		ClanXP,	ClanLevel, ClanGP,
		OwnerCustomerID, OwnerCharID,
		MaxClanMembers, NumClanMembers,
		ClanCreateDate
	) values (
		@in_ClanName, @in_ClanNameColor,
		@in_ClanTag, @in_ClanTagColor,
		@in_ClanEmblemID, @in_ClanEmblemColor,
		0,	0,	0,
		@in_CustomerID, @in_CharID,
		@DEFAULT_CLAN_SIZE,	1,
		GETDATE()
	)
	
	-- get new clanID
	select @ClanID=ClanID from ClanData where OwnerCharID=@in_CharID
	if(@@ROWCOUNT = 0) begin
		select 6 as 'ResultCode', 'clan creation failed!' as 'ResultMsg'
		return
	end
	
	-- update owner clan data
	update UsersChars set ClanID=@ClanID, ClanRank=0 where CharID=@in_CharID
	
	-- generate clan event
	insert into ClanEvents (
		ClanID,
		EventDate,
		EventType,
		EventRank,
		Var1,
		Text1
	) values (
		@ClanID,
		GETDATE(),
		1, -- CLANEVENT_Created
		99, -- Visible to all
		@in_CharID,
		@Gamertag
	)
	
	-- success
	select 0 as ResultCode
	
	select @ClanID as 'ClanID'
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_ClanApplyToJoin]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_ClanApplyToJoin]
	@in_CharID int,
	@in_ClanID int,
	@in_ApplicationText nvarchar(500)
AS
BEGIN
	SET NOCOUNT ON;

	declare @APPLY_EXPIRE_TIME_HOURS int = 72
	declare @MAX_PENDING_APPS int = 5	-- can be maximum 5 pending invitations
	
-- sanity checks

	-- player must be without clan
	declare @PlayerClanID int = 0
	select @PlayerClanID=ClanID from UsersChars where CharID=@in_CharID
	if(@PlayerClanID > 0) begin
		select 6 as ResultCode, 'already in clan' as ResultMsg
		return
	end

	-- make sure clan exists
	if not exists (select ClanID from ClanData where ClanID=@in_ClanID) begin
		select 6 as ResultCode, 'no clanid' as ResultMsg
		return
	end
	
	-- see if we already have pending invidation
	declare @AppExpireTime datetime
	select @AppExpireTime=ExpireTime from ClanApplications where ClanID=@in_ClanID and CharID=@in_CharID and GETDATE()<ExpireTime
	if(@@ROWCOUNT > 0) begin
		select 24 as ResultCode, 'pending application' as ResultMsg
		return
	end
	
	-- see if we already have too much applications
	declare @AppTotalCounts int = 0
	select @AppTotalCounts=COUNT(*) from ClanApplications where CharID=@in_CharID and GETDATE()<ExpireTime
	if(@AppTotalCounts >= @MAX_PENDING_APPS) begin
		select 25 as ResultCode, 'too many applications' as ResultMsg
		return 
	end
	
-- send application

	insert into ClanApplications (
		ClanID,
		CharID,
		ExpireTime,
		ApplicationText,
		IsProcessed
	) values (
		@in_ClanID,
		@in_CharID,
		DATEADD(hour, @APPLY_EXPIRE_TIME_HOURS, GETDATE()),
		@in_ApplicationText,
		0
	)

	-- success
	select 0 as ResultCode
	return
	
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_ClanApplyGetList]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_ClanApplyGetList]
	@in_CharID int
AS
BEGIN
	SET NOCOUNT ON;

-- sanity checks

	-- clan id valudation of caller
	declare @ClanID int = 0
	declare @ClanRank int
	declare @Gamertag nvarchar(64)
	select @ClanID=ClanID, @ClanRank=ClanRank, @Gamertag=Gamertag from UsersChars where CharID=@in_CharID
	if(@ClanID = 0) begin
		select 6 as ResultCode, 'no clan' as ResultMsg
		return
	end
	
-- give list of applyers

	-- only leader and officers can view application list
	if(@ClanRank > 1) begin
		select 6 as ResultCode, 'no permission' as ResultMsg
		return
	end

	-- success
	select 0 as ResultCode
	
	select 
		a.ClanApplicationID,
		a.ApplicationText,
		DATEDIFF(mi, GETDATE(), a.ExpireTime) as MinutesLeft,
		c.*
	from ClanApplications a
	join UsersChars c on (c.CharID=a.CharID)
	where a.ClanID=@ClanID and GETDATE()<ExpireTime and IsProcessed=0
	
	return
	
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_ClanApplyAnswer]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_ClanApplyAnswer]
	@in_CharID int,
	@in_ClanApplicationID int,
	@in_Answer int
AS
BEGIN
	SET NOCOUNT ON;

-- sanity checks

	-- clan id valudation of caller
	declare @ClanID int = 0
	declare @ClanRank int
	declare @Gamertag nvarchar(64)
	select @ClanID=ClanID, @ClanRank=ClanRank, @Gamertag=Gamertag from UsersChars where CharID=@in_CharID
	if(@ClanID = 0) begin
		select 6 as ResultCode, 'no clan' as ResultMsg
		return
	end
	
	-- only leader and officers can answer application
	if(@ClanRank > 1) begin
		select 23 as ResultCode, 'no permission' as ResultMsg
		return
	end

	-- check if we have enough slots in clan
	declare @MaxClanMembers int
	declare @NumClanMembers int
	select @MaxClanMembers=MaxClanMembers, @NumClanMembers=NumClanMembers from ClanData where ClanID=@ClanID
	if(@NumClanMembers >= @MaxClanMembers) begin
		select 20 as 'ResultCode', 'not enough slots' as ResultMsg
		return
	end

-- check application

	declare @AppClanID int = 0
	declare @AppCharID int
	select @AppClanID=ClanID, @AppCharID=CharID	from ClanApplications where ClanApplicationID=@in_ClanApplicationID
	if(@AppClanID <> @ClanID) begin
		select 6 as ResultCode, 'bad application id' as ResultMsg
		return
	end
	
	-- mark that application as processed
	update ClanApplications set IsProcessed=1 where ClanApplicationID=@in_ClanApplicationID
	
	-- make sure that this guy isn't joined other clan somehow (race condition)
	declare @AppGamertag nvarchar(64)
	select @AppClanID=ClanID, @AppGamertag=Gamertag from UsersChars where CharID=@AppCharID
	if(@AppClanID <> 0) begin
		select 21 as ResultCode, 'applicant already joined clan' as ResultMsg
		return
	end

	if(@in_Answer = 0)
	begin
		-- declined clan joining
		-- TODO: send message to player about denial

		select 0 as ResultCode
		return
	end
	
	-- accept application, join player to clan
	update ClanData set NumClanMembers=(NumClanMembers + 1) where ClanID=@ClanID
	update UsersChars set ClanID=@ClanID, ClanRank=99 where CharID=@AppCharID
	
	-- clear all other applications
	delete from ClanApplications where CharID=@AppCharID

-- generate clan event
	insert into ClanEvents (
		ClanID,
		EventDate,
		EventType,
		EventRank,
		Var1,
		Text1
	) values (
		@ClanID,
		GETDATE(),
		4, -- CLANEvent_Join
		99, -- Visible to all
		@AppCharID,
		@AppGamertag
	)
	
	select 0 as ResultCode
	return

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_ClanAddClanMembers]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_ClanAddClanMembers]
	@in_CharID int,
	@in_ItemID int
AS
BEGIN
	SET NOCOUNT ON;
	
	-- clan id valudation of caller
	declare @ClanID int = 0
	declare @ClanRank int
	declare @Gamertag nvarchar(64)
	select @ClanID=ClanID, @ClanRank=ClanRank, @Gamertag=Gamertag from UsersChars where CharID=@in_CharID
	if(@ClanID = 0) begin
		select 6 as ResultCode, 'no clan' as ResultMsg
		return
	end

	-- add members value is in permanent GD price
	declare @GPriceP int = 0
	select @GPriceP=GPriceP from Items_Generic where ItemID=@in_ItemID
	if(@GPriceP = 0) begin
		select 6 as ResultCode, 'no price1' as ResultMsg
		return
	end
	
	-- update clan
	update ClanData set MaxClanMembers=(MaxClanMembers+@GPriceP) where ClanID=@ClanID
	
	-- generate clan event
	insert into ClanEvents (
		ClanID,
		EventDate,
		EventType,
		EventRank,
		Var1,
		Var2,
		Text1
	) values (
		@ClanID,
		GETDATE(),
		13, -- ClanEvent_AddMaxMembers
		99, -- Visible to all
		@in_CharID,
		@GPriceP,
		@Gamertag
	)
	
	-- success
	select 0 as ResultCode

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_CharRevive]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_CharRevive]
	@in_CustomerID int,
	@in_CharID int
AS
BEGIN
	SET NOCOUNT ON;
	
	-- validate CharID/CustomerID pair
	declare @CustomerID int = 0
	select @CustomerID=CustomerID from UsersChars where CharID=@in_CharID
	if(@@ROWCOUNT = 0 or @CustomerID <> @in_CustomerID) begin
		select 6 as ResultCode, 'bad charid' as ResultMsg
		return
	end
	
	-- get developer flag
	declare @IsDeveloper int = 0
	select @IsDeveloper=IsDeveloper from UsersData where CustomerID=@in_CustomerID

	-- note that revive timer is 1hrs, change in WZ_GetAccountInfo1 as well
	declare @SecToRevive int
	declare @Alive int = 0
	select 
		@SecToRevive=DATEDIFF(second, GETUTCDATE(), DATEADD(hour, 1, DeathUtcTime)),
		@Alive=Alive
	from UsersChars where CharID=@in_CharID

	-- prevent fast teleporting if we're not dead
	if(@Alive <> 0) begin
		select 6 as ResultCode, 'character is not dead' as ResultMsg
		return
	end
	
	-- do not allow early revive, give 2min grace
	if(@SecToRevive > 120 and @IsDeveloper = 0) begin
		select 6 as ResultCode, 'too early' as ResultMsg
		return
	end
	
	-- revive
	update UsersChars set
		Alive=2,
		Health=100,
		Food=0,
		Water=0,
		Toxic=0,
		GameFlags=1
	where CharID=@in_CharID

	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_VITALSTATS_V1]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_VITALSTATS_V1]
AS
BEGIN

	SET NOCOUNT ON;


declare @today datetime
set @today = GETDATE()

declare @Sales int;
declare @TUsers int;
declare @DAU int;
declare @CCU int;
declare @Revenues int;

set @Sales = 0--(select count(*) from [BreezeNet.WarZPreorders])
set @Revenues = 0--(select COALESCE(SUM(Amount),0) from [BreezeNet.WarZPreorders] where OrderDate>=@today and OrderDate<DATEADD(hour, -1, @today))

set @TUsers = (select count(*) from Accounts)
set @DAU = (select count(*) from Accounts where lastlogindate > DATEADD(hour, -24, @today))
set @CCU = (select count(*) from LoginSessions where TimeUpdated > DATEADD(minute, -7, @today))

INSERT INTO VitalStats_V1 VALUES (@today, @Sales, @TUsers, @DAU, @CCU, @Revenues );

	    
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_UpdateLoginSession]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_UpdateLoginSession]
	@in_IP varchar(32),
	@in_CustomerID int,
	@in_SessionID int
AS
BEGIN
	SET NOCOUNT ON;
	
	declare @SessionID int

	-- check if we have record for that user          
	SELECT 
		@SessionID=LoginSessions.SessionID
	FROM LoginSessions
	WHERE CustomerID=@in_CustomerID
	if (@@RowCount = 0) begin
		select 6 as ResultCode
		return
	end

	-- compare session key. if it's different, supplied sesson is invalid	
	if(@in_SessionID <> @SessionID) begin
		select 1 as ResultCode
		return
	end
	
	-- update last ping time
	UPDATE LoginSessions SET 
		LoginSessions.TimeUpdated=GETDATE()
	WHERE CustomerID=@in_CustomerID
	
	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_UpdateAchievementStatus]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_UpdateAchievementStatus]
	@in_CustomerID int,
	@in_AchID int,
	@in_AchValue int,
	@in_AchUnlocked int
AS
BEGIN
	SET NOCOUNT ON;

	if not exists (select * from Achievements where (AchID=@in_AchID and CustomerID=@in_CustomerID))
	begin
		INSERT INTO Achievements(
			CustomerID, 
			AchID, 
			Value, 
			Unlocked
		)
		VALUES (
			@in_CustomerID,
			@in_AchID,
			@in_AchValue,
			@in_AchUnlocked
		)
	end
	else
	begin
		UPDATE Achievements SET 
			Value=@in_AchValue,
			Unlocked=@in_AchUnlocked
		WHERE AchID=@in_AchID and CustomerID=@in_CustomerID
    end

    select 0 as ResultCode
    
    -- check for steamID
    declare @SteamID bigint = 0
	--select @SteamID=SteamID from SteamUserIDMap where CustomerID=@in_CustomerID
	--select @SteamID as 'SteamID'
	
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_SRV_UserLeftGame]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_SRV_UserLeftGame]
	@in_CustomerID int,
	@in_CharID int,
	@in_GameMapId int,
	@in_GameServerId bigint,
	@in_TimePlayed int
AS
BEGIN
	SET NOCOUNT ON;
	
	-- store current user server location
	update UsersData set 
		lastgamedate=GETDATE(),
		GameServerId=0,
		TimePlayed=(TimePlayed+@in_TimePlayed)
	where CustomerID=@in_CustomerID
	
	-- update some stats here
	
	-- we're done
	select 0 as ResultCode

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_SRV_UserJoinedGame2]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_SRV_UserJoinedGame2]
	@in_CustomerID int,
	@in_CharID int,
	@in_GameMapId int,
	@in_GameServerId bigint
AS
BEGIN
	SET NOCOUNT ON;

	-- check if game is still active or 90sec passed from last update (COPYPASTE_GAMECHECK, search for others)
	declare @lastgamedate datetime
	declare @GameServerId int
	select @GameServerId=GameServerId, @lastgamedate=lastgamedate from UsersData where CustomerID=@in_CustomerID
	if(@GameServerId > 0 and DATEDIFF(second, @lastgamedate, GETDATE()) < 90) begin
		select 7 as ResultCode, 'game still active' as ResultMsg
		return
	end
	
	-- store current user server location
	update UsersData set 
		lastgamedate=GETDATE(),
		GameServerId=@in_GameServerId
	where CustomerID=@in_CustomerID
	
	-- per char info
	update UsersChars set 
		GameMapId=@in_GameMapId,
		GameServerId=@in_GameServerId
	where CharID=@in_CharID
		
	-- we're done
	select 0 as ResultCode

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_SRV_UserJoinedGame]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_SRV_UserJoinedGame] 
	@in_CustomerID int,
	@in_CharID int,
	@in_GameMapId int,
	@in_GameServerId bigint,
	@in_GamePos varchar(256)
AS
BEGIN
	SET NOCOUNT ON;
	
	-- store current user server location
	update UsersData set 
		lastgamedate=GETDATE(),
		GameServerId=@in_GameServerId
	where CustomerID=@in_CustomerID
	
	-- per char info
	update UsersChars set 
		GameMapId=@in_GameMapId,
		GameServerId=@in_GameServerId
	where CharID=@in_CharID
		
	-- we're done
	select 0 as ResultCode

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_SRV_NoteGetAll]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_SRV_NoteGetAll]
	@in_GameServerID int
AS
BEGIN
	SET NOCOUNT ON;

	-- we're done
	select 0 as ResultCode

	delete from ServerNotesData where GameServerId=@in_GameServerID and GETUTCDATE()>[ExpireUtcDate]
	
	select GETUTCDATE() as 'CurUtcDate'
	select * from ServerNotesData where GameServerId=@in_GameServerID
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_SRV_NoteAddNew]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_SRV_NoteAddNew]
	@in_CustomerID int,
	@in_CharID int,
	@in_GameServerID int,
	@in_GamePos varchar(128),
	@in_ExpireMins int,
	@in_TextFrom nvarchar(128),
	@in_TextSubj nvarchar(2048)
AS
BEGIN
	SET NOCOUNT ON;

	insert into ServerNotesData (
		GameServerId,
		GamePos,
		CreateUtcDate,
		[ExpireUtcDate],
		CustomerID,
		CharID,
		TextFrom,
		TextSubj
	) values (
		@in_GameServerID,
		@in_GamePos,
		GETUTCDATE(),
		DATEADD(mi, @in_ExpireMins, GETUTCDATE()),
		@in_CustomerID,
		@in_CharID,
		@in_TextFrom,
		@in_TextSubj
	)
	declare @NoteID int = SCOPE_IDENTITY()
		
	-- we're done
	select 0 as ResultCode
	select @NoteID as 'NoteID'
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_SRV_AddWeaponStats]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_SRV_AddWeaponStats] 
	@in_ItemID int,
	@in_ShotsFired int,
	@in_ShotsHits int,
	@in_KillsCQ int,
	@in_KillsDM int,
	@in_KillsSB int
AS
BEGIN
	SET NOCOUNT ON;

	update Items_Weapons set
		ShotsFired=(ShotsFired + @in_ShotsFired),
		ShotsHits=(ShotsHits + @in_ShotsHits),
		KillsCQ=(KillsCQ + @in_KillsCQ),
		KillsDM=(KillsDM + @in_KillsDM),
		KillsSB=(KillsSB + @in_KillsSB)
	where ItemID=@in_ItemID

	-- we're done
	select 0 as ResultCode

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_SRV_AddLogInfo]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_SRV_AddLogInfo]
	@in_CustomerID int,
	@in_CharID int = 0,
	@in_Gamertag nvarchar(64) = N'',
	@in_CustomerIP varchar(64),
	@in_GameSessionID bigint,
	@in_CheatID int,
	@in_Msg varchar(4000),
	@in_Data varchar(4000)
AS
BEGIN
	SET NOCOUNT ON;
	
	-- see if this event is recurring inside single game session
	--declare @RecordID int
	--select @RecordID=RecordID from DBG_SrvLogInfo where
	--	GameSessionID=@in_GameSessionID 
	--	and CustomerID=@in_CustomerID
	--	and (@in_CheatID > 0 and CheatID=@in_CheatID)
	--	and @in_Msg=Msg 
	--	and @in_Data=Data
	--if(@@ROWCOUNT > 0) begin
	--	-- increase count
	--	update DBG_SrvLogInfo set RepeatCount=RepeatCount+1 where RecordID=@RecordID
	--	select 0 as ResultCode
	--	return
	--end
	
	insert into DBG_SrvLogInfo (
		ReportTime,
		IsProcessed,
		CustomerID,
		CharID,
		Gamertag,
		CustomerIP,
		GameSessionID,
		CheatID,
		RepeatCount,
		Msg,
		Data)
	values (
		GETDATE(),
		0,
		@in_CustomerID,
		@in_CharID,
		@in_Gamertag,
		@in_CustomerIP,
		@in_GameSessionID,
		@in_CheatID,
		1,
		@in_Msg,
		@in_Data)
		
	-- we're done
	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_SRV_AddCheatAttempt]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_SRV_AddCheatAttempt]
	@in_IP char(32),
	@in_CustomerID int,
	@in_GameSessionID bigint,

	@in_CheatID int
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO CheatLog (SessionID, CustomerID, CheatID, ReportTime)
	VALUES               (@in_GameSessionID, @in_CustomerID, @in_CheatID, GETDATE())

	-- we're done
	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_LeaderboardGet]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_LeaderboardGet]
	@in_CustomerID int,
	@in_TableID int,
	@in_StartPos int
AS
BEGIN
	SET NOCOUNT ON;

	-- this call is always success
	select 0 as ResultCode
	
	declare @TotalRows int = 0
	declare @ROWS_TO_FETCH int = 100
	
	-- if need to find our position in leaderboard
	if(@in_StartPos < 0) 
	begin
		if(@in_TableID = 0) begin
			select @in_StartPos=Pos from Leaderboard1 where CustomerID=@in_CustomerID
			select @TotalRows=COUNT(*) from Leaderboard1
		end else if(@in_TableID = 1) begin
			select @in_StartPos=Pos from Leaderboard7 where CustomerID=@in_CustomerID
			select @TotalRows=COUNT(*) from Leaderboard7
		end else if(@in_TableID = 2) begin
			select @in_StartPos=Pos from Leaderboard30 where CustomerID=@in_CustomerID
			select @TotalRows=COUNT(*) from Leaderboard30
		end else begin
			select @in_StartPos=Pos from Leaderboard where CustomerID=@in_CustomerID
			select @TotalRows=COUNT(*) from Leaderboard
		end
	
		set @in_StartPos = @in_StartPos - (@ROWS_TO_FETCH / 2)
		if(@in_StartPos < 0)
			set @in_StartPos = 0
	end

	-- report starting position
	select @in_StartPos as 'StartPos', @TotalRows as 'Size'
	
	-- return actual leaderboard

	if(@in_TableID = 0) begin
		select * from Leaderboard1 where Pos > @in_StartPos and Pos <= (@in_StartPos + @ROWS_TO_FETCH)
			order by HonorPoints desc
	end else if(@in_TableID = 1) begin
		select * from Leaderboard7 where Pos > @in_StartPos and Pos <= (@in_StartPos + @ROWS_TO_FETCH)
			order by HonorPoints desc
	end else if(@in_TableID = 2) begin
		select * from Leaderboard30 where Pos > @in_StartPos and Pos <= (@in_StartPos + @ROWS_TO_FETCH)
			order by HonorPoints desc
	end else begin
		select * from Leaderboard where Pos > @in_StartPos and Pos <= (@in_StartPos + @ROWS_TO_FETCH)
			order by HonorPoints desc
	end
	
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_GetShopInfo1]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_GetShopInfo1] 
AS
BEGIN
	SET NOCOUNT ON;

	select 0 as ResultCode
	
	-- select all shop items
	      SELECT ItemID, Category, IsNew, Price1, Price7, Price30, PriceP, GPrice1, GPrice7, GPrice30, GPriceP FROM Items_Gear
	union SELECT ItemID, Category, IsNew, Price1, Price7, Price30, PriceP, GPrice1, GPrice7, GPrice30, GPriceP	FROM Items_Weapons
	union SELECT ItemID, Category, IsNew, Price1, Price7, Price30, PriceP, GPrice1, GPrice7, GPrice30, GPriceP	FROM Items_Generic
	union SELECT ItemID, Category, IsNew, Price1, Price7, Price30, PriceP, GPrice1, GPrice7, GPrice30, GPriceP	FROM Items_Attachments
	
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_GetItemsData]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_GetItemsData] 
AS
BEGIN
	SET NOCOUNT ON;

	select 0 as ResultCode
	
	select * from Items_Gear
	select * from Items_Weapons;
	select * from Items_Generic
	
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_GetDataGameRewards]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_GetDataGameRewards]
AS
BEGIN  
	SET NOCOUNT ON;  

	select 0 as ResultCode
	select * from DataGameRewards
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_GetAccountInfo2]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_GetAccountInfo2] 
	@in_CustomerID int,
	@in_CharID int
AS
BEGIN
	SET NOCOUNT ON;

	-- check if CustomerID is valid
	if not exists (SELECT CustomerID FROM UsersData WHERE CustomerID=@in_CustomerID)
	begin
		select 6 as ResultCode
		return;
	end
	
	if(@in_CharID > 0) begin
		update UsersData set lastjoineddate=GETDATE() where CustomerID=@in_CustomerID
	end

	select 0 as ResultCode

	SELECT 
		UsersData.*,
		DATEDIFF(ss, lastgamedate, GETDATE()) as 'SecFromLastGame'
	FROM UsersData 
	where UsersData.CustomerID=@in_CustomerID
	
--
-- report chars
--
	if(@in_CharID > 0) 
	begin
		-- single character, version called from server
		select 
			0 as 'SecToRevive', 
			c.*,
			ClanData.ClanTag, ClanData.ClanTagColor
		from UsersChars c
		left JOIN ClanData on (c.ClanID = ClanData.ClanID)
		where CustomerID=@in_CustomerID and CharID=@in_CharID
	end
	else 
	begin
		-- note that revive timer is 1hrs, change in WZ_CharRevive as well
		select 
			DATEDIFF(second, GETUTCDATE(), DATEADD(hour, 1, DeathUtcTime)) as 'SecToRevive',
			c.*,
			ClanData.ClanTag, ClanData.ClanTagColor
		from UsersChars c
		left JOIN ClanData on (c.ClanID = ClanData.ClanID)
		where CustomerID=@in_CustomerID order by CharID asc
	end

--
-- report inventory
--
	select *
	from UsersInventory
	where CustomerID=@in_CustomerID and CharID=0
	
--
-- report backpacks
--
	if(@in_CharID > 0) begin
		-- single character, called from server
		select * from UsersInventory where CharID=@in_CharID
	end
	else begin
		select * from UsersInventory where CustomerID=@in_CustomerID and CharID>0 order by CharID asc
	end

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_GetAccountInfo1]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_GetAccountInfo1] 
	@in_CustomerID int,
	@in_CharID int
AS
BEGIN
	SET NOCOUNT ON;

	-- check if CustomerID is valid
	if not exists (SELECT CustomerID FROM UsersData WHERE CustomerID=@in_CustomerID)
	begin
		select 6 as ResultCode
		return;
	end
	
	if(@in_CharID > 0) begin
		update UsersData set lastjoineddate=GETDATE() where CustomerID=@in_CustomerID
	end

	select 0 as ResultCode

	SELECT 
		UsersData.*,
		DATEDIFF(ss, lastgamedate, GETDATE()) as 'SecFromLastGame',
		ClanData.ClanTag, ClanData.ClanTagColor
	FROM UsersData 
	left JOIN ClanData on (UsersData.ClanID = ClanData.ClanID)
	where UsersData.CustomerID=@in_CustomerID
	
--
-- report chars
--
	if(@in_CharID > 0) 
	begin
		-- single character, version called from server
		select 
			0 as 'SecToRevive', 
			* 
		from UsersChars where CustomerID=@in_CustomerID and CharID=@in_CharID
	end
	else 
	begin
		-- note that revive timer is 1hrs, change in WZ_CharRevive as well
		select 
			DATEDIFF(second, GETUTCDATE(), DATEADD(hour, 1, DeathUtcTime)) as 'SecToRevive',
			* 
		from UsersChars where CustomerID=@in_CustomerID order by CharID asc
	end

--
-- report inventory
--
	select *
	from UsersInventory
	where CustomerID=@in_CustomerID and CharID=0
	
--
-- report backpacks
--
	if(@in_CharID > 0) begin
		-- single character, called from server
		select * from UsersInventory where CharID=@in_CharID
	end
	else begin
		select * from UsersInventory where CustomerID=@in_CustomerID and CharID>0 order by CharID asc
	end

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_DB_GenerateLeaderboard7]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_DB_GenerateLeaderboard7]
AS  
BEGIN  
	SET NOCOUNT ON;  

	/*
	The Query Processor estimates that implementing the following index could improve the query cost by 13.035%.
	NOTE: using index IX_DBG_UserRoundResults_LBIdx1 on DBG_UserRoundResults
	*/
	
	-- assemble start date of this week
	declare @StartDay date = GETDATE()
	set @StartDay = DATEADD(day, -(DATEPART(weekday, @StartDay) - 1), @StartDay)

	-- reset table with zero seed
	delete from Leaderboard7
	DBCC CHECKIDENT (Leaderboard7, RESEED, 0)
	
	-- insert all ordered by honorpoints
	insert into Leaderboard7 (
			CustomerID, gamertag, HonorPoints,
			Kills, Deaths, Wins, Losses, ShotsFired, ShotsHit, 
			TimePlayed,
			Rank,
			HavePremium)
		select
			urr.CustomerID, 
			l.Gamertag,
			sum(urr.HonorPoints),
			sum(Kills), sum(Deaths), sum(Wins), sum(Losses), sum(ShotsFired), sum(ShotsHits),
			sum(TimePlayed),
			-- not need rank now
			0, --(select top(1) rank from DataRankPoints where LoginID.HonorPoints<DataRankPoints.HonorPoints order by HonorPoints asc),
			-- check if have premium
			(case when exists (select * from Inventory where ItemID=301004 and Inventory.CustomerID=urr.CustomerID and LeasedUntil>GETDATE()) 
				then 1
				else 0
			end)
		from DBG_UserRoundResults urr
		join LoginID l on (l.CustomerID=urr.CustomerID)
		where GameReportTime>=@StartDay and l.AccountStatus=101
		group by urr.CustomerID, l.Gamertag
		order by sum(urr.HonorPoints) desc
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_DB_GenerateLeaderboard30]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_DB_GenerateLeaderboard30]
AS  
BEGIN  
	SET NOCOUNT ON;  

	/*
	The Query Processor estimates that implementing the following index could improve the query cost by 13.035%.
	NOTE: using index IX_DBG_UserRoundResults_LBIdx1 on DBG_UserRoundResults
	*/
	
	-- assemble start date of this month
	declare @StartDay date = '2000-01-01'
	set @StartDay = DATEADD(year, YEAR(GETDATE()) - 2000, @StartDay)
	set @StartDay = DATEADD(month, MONTH(GETDATE()) - 1, @StartDay)

	-- reset table with zero seed
	delete from Leaderboard30
	DBCC CHECKIDENT (Leaderboard30, RESEED, 0)
	
	-- insert all ordered by honorpoints
	insert into Leaderboard30 (
			CustomerID, gamertag, HonorPoints,
			Kills, Deaths, Wins, Losses, ShotsFired, ShotsHit, 
			TimePlayed,
			Rank,
			HavePremium)
		select
			urr.CustomerID,
			l.Gamertag,
			sum(urr.HonorPoints),
			sum(Kills), sum(Deaths), sum(Wins), sum(Losses), sum(ShotsFired), sum(ShotsHits),
			sum(TimePlayed),
			-- not need rank now
			0, --(select top(1) rank from DataRankPoints where LoginID.HonorPoints<DataRankPoints.HonorPoints order by HonorPoints asc),
			-- check if have premium
			(case when exists (select * from Inventory where ItemID=301004 and Inventory.CustomerID=urr.CustomerID and LeasedUntil>GETDATE()) 
				then 1
				else 0
			end)
		from DBG_UserRoundResults urr
		join LoginID l on (l.CustomerID=urr.CustomerID)
		where GameReportTime>=@StartDay and l.AccountStatus=101
		group by urr.CustomerID, l.Gamertag
		order by sum(urr.HonorPoints) desc
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_DB_GenerateLeaderboard]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_DB_GenerateLeaderboard]
AS  
BEGIN  
	SET NOCOUNT ON;  
	
	-- reset table with zero seed
	delete from Leaderboard
	DBCC CHECKIDENT (Leaderboard, RESEED, 0)
	
	-- insert all ordered by honorpoints
	insert into Leaderboard (
			CustomerID, gamertag, HonorPoints,
			Kills, Deaths, Wins, Losses ,ShotsFired, ShotsHit, 
			TimePlayed,
			Rank,
			HavePremium)
		select
			LoginID.CustomerID, gamertag, HonorPoints,
			Stats.Kills, Stats.Deaths, Stats.Wins, Stats.Losses, Stats.ShotsFired, Stats.ShotsHits, 
			Stats.TimePlayed,
			-- get rank from table
			(select top(1) rank from DataRankPoints where LoginID.HonorPoints<DataRankPoints.HonorPoints order by HonorPoints asc),
			-- check if have premium
			(case when exists (select * from Inventory where ItemID=301004 and Inventory.CustomerID=LoginID.CustomerID and LeasedUntil>GETDATE()) 
				then 1
				else 0
			end)
		from LoginID
		join Stats on Stats.CustomerID=LoginID.CustomerID
		where AccountStatus=101
		order by LoginID.HonorPoints desc

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_DB_GenerateDailyLeaderboard]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_DB_GenerateDailyLeaderboard]
AS  
BEGIN  
	SET NOCOUNT ON;  
	
	/*
	The Query Processor estimates that implementing the following index could improve the query cost by 13.035%.
	NOTE: using index IX_DBG_UserRoundResults_LBIdx1 on DBG_UserRoundResults
	*/

	declare @CurDay date = GETDATE() -- date is truncated to day only, no time

	-- reset table with zero seed
	delete from Leaderboard1
	DBCC CHECKIDENT (Leaderboard1, RESEED, 0)
	
	-- insert all ordered by honorpoints
	insert into Leaderboard1 (
			CustomerID, gamertag, HonorPoints,
			Kills, Deaths, Wins, Losses, ShotsFired, ShotsHit, 
			TimePlayed,
			Rank,
			HavePremium)
		select
			urr.CustomerID,
			l.Gamertag,
			sum(urr.HonorPoints),
			sum(Kills), sum(Deaths), sum(Wins), sum(Losses), sum(ShotsFired), sum(ShotsHits),
			sum(TimePlayed),
			-- not need rank now
			0, --(select top(1) rank from DataRankPoints where LoginID.HonorPoints<DataRankPoints.HonorPoints order by HonorPoints asc),
			-- check if have premium
			(case when exists (select * from Inventory where ItemID=301004 and Inventory.CustomerID=urr.CustomerID and LeasedUntil>GETDATE()) 
				then 1
				else 0
			end)
		from DBG_UserRoundResults urr
		join LoginID l on (l.CustomerID=urr.CustomerID)
		where GameReportTime>=@CurDay and l.AccountStatus=101
		group by urr.CustomerID, l.Gamertag
		order by sum(urr.HonorPoints) desc
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_ClanSetMemberRank]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_ClanSetMemberRank]
	@in_CharID int,
	@in_MemberID int,
	@in_Rank int
AS
BEGIN
	SET NOCOUNT ON;
	
-- sanity checks
	if(@in_CharID = @in_MemberID) begin
		select 6 as 'ResultCode', 'can not set own rank' as 'ResultMsg'
		return
	end

	-- clan id valudation of caller
	declare @ClanID int = 0
	declare @ClanRank int
	declare @Gamertag nvarchar(64)
	select @ClanID=ClanID, @ClanRank=ClanRank, @Gamertag=Gamertag from UsersChars where CharID=@in_CharID
	if(@ClanID = 0) begin
		select 6 as ResultCode, 'no clan' as ResultMsg
		return
	end
	
	-- clan id validation of member
	declare @MemberClanID int = 0
	declare @MemberGamerTag nvarchar(64)
	declare @MemberClanRank int
	declare @MemberCustomerID int
	select @MemberClanID=ClanID, @MemberClanRank=ClanRank, @MemberGamerTag=GamerTag, @MemberCustomerID=CustomerID from UsersChars where CharID=@in_MemberID
	if(@MemberClanID <> @ClanID) begin
		select 6 as ResultCode, 'member in wrong clan' as ResultMsg
		return
	end
	
-- validate that we can change rank

	-- only leader and officers can change ranks
	if(@ClanRank > 1) begin
		select 23 as ResultCode, 'no permission' as ResultMsg
		return
	end

	-- cant change higher rank
	if(@ClanRank > 0 and @ClanRank >= @MemberClanRank) begin
		select 6 as ResultCode, 'cant change highter rank' as ResultMsg
		return
	end
	
	if(@ClanRank > 0 and @ClanRank >= @in_Rank) begin
		select 6 as ResultCode, 'cant set same rank' as ResultMsg
		return
	end
	
-- code for changing clan ownership, owner becomes officer
	if(@ClanRank = 0 and @in_Rank = 0) begin
		update UsersChars set ClanRank=1 where CharID=@in_CharID
		update ClanData set OwnerCharID=@in_MemberID, OwnerCustomerID=@MemberCustomerID where ClanID=@ClanID
	end
	
-- update target member
	update UsersChars set ClanRank=@in_Rank where CharID=@in_MemberID
	
-- generate clan set rank event
	insert into ClanEvents (
		ClanID,
		EventDate,
		EventType,
		EventRank,
		Var1,
		Var2,
		Var3,
		Text1,
		Text2
	) values (
		@ClanID,
		GETDATE(),
		3, -- CLANEVENT_SetRank
		99, -- Visible to all
		@in_CharID,
		@in_MemberID,
		@in_Rank,
		@Gamertag,
		@MemberGamertag
	)
	
	-- TODO: send message to player about rank change
	
	-- success
	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_ClanSetLore]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_ClanSetLore]
	@in_CharID int,
	@in_Lore nvarchar(512)
AS
BEGIN
	SET NOCOUNT ON;
	
	-- clan id valudation of caller
	declare @ClanID int = 0
	declare @ClanRank int = 99
	declare @Gamertag nvarchar(64)
	select @ClanID=ClanID, @ClanRank=ClanRank, @Gamertag=Gamertag from UsersChars where CharID=@in_CharID
	if(@ClanID = 0) begin
		select 6 as ResultCode, 'no clan' as ResultMsg
		return
	end
	
	-- only leader and officers can change lore
	if(@ClanRank > 1) begin
		select 23 as ResultCode, 'no permission' as ResultMsg
		return
	end
	
	update ClanData set ClanLore=@in_Lore where ClanID=@ClanID

	-- success
	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_ClanKickMember]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_ClanKickMember]
	@in_CharID int,
	@in_MemberID int
AS
BEGIN
	SET NOCOUNT ON;
	
-- sanity checks
	if(@in_CharID = @in_MemberID) begin
		select 6 as 'ResultCode', 'cant kick himselft' as 'ResultMsg'
		return
	end

	-- clan id valudation of caller
	declare @ClanID int = 0
	declare @ClanRank int
	declare @Gamertag nvarchar(64)
	select @ClanID=ClanID, @ClanRank=ClanRank, @Gamertag=Gamertag from UsersChars where CharID=@in_CharID
	if(@ClanID = 0) begin
		select 6 as ResultCode, 'no clan' as ResultMsg
		return
	end
	
	-- clan id validation of member
	declare @MemberClanID int = 0
	declare @MemberGamerTag nvarchar(64)
	declare @MemberClanRank int
	select @MemberClanID=ClanID, @MemberClanRank=ClanRank, @MemberGamerTag=GamerTag from UsersChars where CharID=@in_MemberID
	if(@MemberClanID <> @ClanID) begin
		select 6 as ResultCode, 'member in wrong clan' as ResultMsg
		return
	end
	
-- validate that we can kick

	-- only leader and officers can kick
	if(@ClanRank > 1) begin
		select 23 as ResultCode, 'no permission' as ResultMsg
		return
	end

	-- cant kick higher rank
	if(@ClanRank > 0 and @ClanRank >= @MemberClanRank) begin
		select 6 as ResultCode, 'cant kick highter rank' as ResultMsg
		return
	end
	
-- update clan info and kick player
	update ClanData set NumClanMembers=(NumClanMembers-1) where ClanID=@ClanID
	update UsersChars set ClanID=0, ClanContributedGP=0, ClanContributedXP=0 where CharID=@in_MemberID
	
-- generate clan event
	insert into ClanEvents (
		ClanID,
		EventDate,
		EventType,
		EventRank,
		Var1,
		Var2,
		Text1,
		Text2
	) values (
		@ClanID,
		GETDATE(),
		6, -- CLANEvent_Kick
		99, -- Visible to all
		@in_CharID,
		@in_MemberID,
		@Gamertag,
		@MemberGamertag
	)
	
	-- TODO: send message to player about kick
	
	-- success
	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_ClanInviteSendToPlayer]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_ClanInviteSendToPlayer]
	@in_CharID int,
	@in_InvGamertag nvarchar(64)
AS
BEGIN
	SET NOCOUNT ON;

	declare @INVITE_EXPIRE_TIME_HOURS int = 80
	
-- sanity checks

	-- clan id valudation of caller
	declare @ClanID int = 0
	declare @ClanRank int
	declare @Gamertag nvarchar(64)
	select @ClanID=ClanID, @ClanRank=ClanRank, @Gamertag=Gamertag from UsersChars where CharID=@in_CharID
	if(@ClanID = 0) begin
		select 6 as ResultCode, 'not in clan' as ResultMsg
		return
	end
	
-- validate that we can invite

	-- only leader and officers can invite
	if(@ClanRank > 1) begin
		select 23 as ResultCode, 'no permission' as ResultMsg
		return
	end
	
	-- check if we have enough slots in clan
	declare @MaxClanMembers int
	declare @NumClanMembers int
	select @MaxClanMembers=MaxClanMembers, @NumClanMembers=NumClanMembers from ClanData where ClanID=@ClanID
	
	declare @PendingInvites int = 0
	--DISABLED FOR NOW: select @PendingInvites=COUNT(*) from ClanInvites where ClanID=@ClanID and GETDATE()<ExpireTime
	if((@NumClanMembers + @PendingInvites) >= @MaxClanMembers) begin
		select 20 as 'ResultCode', 'not enough slots' as ResultMsg
		return
	end

	-- check if user exists	
	declare @InvCharID int
	declare @InvClanID int
	select @InvCharID=CharID, @InvClanID=ClanID from UsersChars where Gamertag=@in_InvGamertag
	if(@@ROWCOUNT = 0) begin
		select 22 as ResultCode, 'no such gamertag' as ResultMsg
		return
	end
	-- and have no clan
	if(@InvClanID <> 0) begin
		select 21 as ResultCode, 'already in clan' as ResultMsg
		return
	end
	
	-- check if we have pending invite
	if(exists(select * from ClanInvites where ClanID=@ClanID and CharID=@InvCharID and GETDATE()<ExpireTime)) begin
		select 24 as ResultCode, 'already invited' as ResultMsg
		return
	end
	
-- invite
	insert into ClanInvites (
		ClanID,
		InviterCharID,
		CharID,
		ExpireTime
	) values (
		@ClanID,
		@in_CharID,
		@InvCharID,
		DATEADD(hour, @INVITE_EXPIRE_TIME_HOURS, GETDATE())
	)

	-- success
	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_ClanInviteReportAll]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_ClanInviteReportAll]
	@in_CharID int
AS
BEGIN
	SET NOCOUNT ON;

-- sanity checks

	-- clan id valudation of caller
	declare @ClanID int = 0
	declare @ClanRank int
	declare @Gamertag nvarchar(64)
	select @ClanID=ClanID, @ClanRank=ClanRank, @Gamertag=Gamertag from UsersChars where CharID=@in_CharID
	if(@ClanID = 0) begin
		select 6 as ResultCode, 'no clan' as ResultMsg
		return
	end
	
-- validate that we can invite

	-- only leader and officers can invite
	if(@ClanRank > 1) begin
		select 6 as ResultCode, 'no permission' as ResultMsg
		return
	end

-- report all pending invites

	-- success
	select 0 as ResultCode
	
	select 
		i.ClanInviteID, 
		c.Gamertag,
		DATEDIFF(mi, GETDATE(), i.ExpireTime) as MinutesLeft
	from ClanInvites i
	join UsersChars c on (c.CharID=i.CharID)
	where i.ClanID=@ClanID and GETDATE()<ExpireTime
	
	return
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_ClanInviteGetInvitesForPlayer]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_ClanInviteGetInvitesForPlayer]
	@in_CharID int
AS
BEGIN
	SET NOCOUNT ON;

-- report all pending invites

	select 0 as ResultCode
	
	select 
		i.ClanInviteID,
		c.Gamertag, 
		d.*
	from ClanInvites i
	left join UsersChars c on (c.CharID=i.InviterCharID)
	join ClanData d on (d.ClanID=i.ClanID)
	where i.CharID=@in_CharID and GETDATE()<ExpireTime
	
	return
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_ClanInviteAnswer]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_ClanInviteAnswer]
	@in_CharID int,
	@in_ClanInviteID int,
	@in_Answer int
AS
BEGIN
	SET NOCOUNT ON;

-- sanity checks

	-- must be free to join clan
	declare @ClanID int = 0
	declare @Gamertag nvarchar(64)
	select @ClanID=ClanID, @Gamertag=Gamertag from UsersChars where CharID=@in_CharID
	if(@ClanID <> 0) begin
		select 6 as ResultCode, 'already in clan' as ResultMsg
		return
	end
	
	-- have valid invitation id (get actual ClanID here)
	declare @InvCharID int
	select @ClanID=ClanID, @InvCharID=CharID from ClanInvites where ClanInviteID=@in_ClanInviteID
	if(@@ROWCOUNT = 0) begin
		select 6 as ResultCode, 'bad inviteid #1' as ResultMsg
		return
	end
	if(@InvCharID <> @in_CharID) begin
		select 6 as ResultCode, 'bad inviteid #2' as ResultMsg
		return
	end

-- invite

	-- delete invite anyway
	delete from ClanInvites where ClanInviteID=@in_ClanInviteID
	
	-- check if invite is denied
	if(@in_Answer = 0) begin
		select 0 as ResultCode
		select @ClanID as ClanID
		return
	end

	-- check if we have enough slots in clan
	declare @MaxClanMembers int
	declare @NumClanMembers int
	select @MaxClanMembers=MaxClanMembers, @NumClanMembers=NumClanMembers from ClanData where ClanID=@ClanID
	if(@NumClanMembers >= @MaxClanMembers) begin
		select 20 as 'ResultCode', 'not enough slots' as ResultMsg
		return
	end
	
	-- join the clan!
	update ClanData set NumClanMembers=(NumClanMembers + 1) where ClanID=@ClanID
	update UsersChars set ClanID=@ClanID, ClanRank=99 where CharID=@in_CharID

-- generate clan event
	insert into ClanEvents (
		ClanID,
		EventDate,
		EventType,
		EventRank,
		Var1,
		Text1
	) values (
		@ClanID,
		GETDATE(),
		4, -- CLANEvent_Join
		99, -- Visible to officers
		@in_CharID,
		@Gamertag
	)
	
	-- success
	select 0 as ResultCode
	select @ClanID as ClanID
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_ClanGetPlayerData]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_ClanGetPlayerData]
	@in_CharID int
AS
BEGIN
	SET NOCOUNT ON;

	-- success
	select 0 as ResultCode
	
	-- report player clan id and current clan info
	select c.ClanID, c.ClanRank, d.*
		from UsersChars c
		left join ClanData d on d.ClanID=c.ClanID
		where CharID=@in_CharID

	return
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_ClanGetInfo]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_ClanGetInfo]
	@in_ClanID int,
	@in_GetMembers int
AS
BEGIN
	SET NOCOUNT ON;

	-- success
	select 0 as ResultCode
	
	-- and report clan data
	if(@in_ClanID > 0) 
	begin
		-- specific clan
		select *, c.gamertag from ClanData 
			left join UsersChars c on c.CharID=ClanData.OwnerCharID
			where ClanData.ClanID=@in_ClanID
	end
	else 
	begin
		-- all clans
		select *, c.gamertag from ClanData
			left join UsersChars c on c.CharID=ClanData.OwnerCharID
	end
		
	-- if need to report members
	if(@in_ClanID > 0 and @in_GetMembers > 0) begin
		select UsersChars.* from UsersChars	where ClanID=@in_ClanID
	end

	return
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_ClanGetEvents]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_ClanGetEvents]
	@in_CharID int,
	@in_Days int
AS
BEGIN
	SET NOCOUNT ON;

-- sanity checks

	-- clan id valudation of caller
	declare @ClanID int = 0
	declare @ClanRank int
	declare @Gamertag nvarchar(64)
	select @ClanID=ClanID, @ClanRank=ClanRank, @Gamertag=Gamertag from UsersChars where CharID=@in_CharID
	if(@ClanID = 0) begin
		select 6 as ResultCode, 'no clan' as ResultMsg
		return
	end
	
-- report clan log
	select 0 as ResultCode
	
	declare @MinDate datetime = DATEADD(day, -@in_Days, GETDATE())
	select * from ClanEvents where ClanID=@ClanID and EventDate>=@MinDate and @ClanRank <= EventRank order by EventDate asc
	
	return
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_ClanFN_DeleteClan]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_ClanFN_DeleteClan]
	@in_ClanID int
AS
BEGIN
	SET NOCOUNT ON;
	
	delete from ClanData where ClanID=@in_ClanID
	delete from ClanApplications where ClanID=@in_ClanID
	delete from ClanInvites where ClanID=@in_ClanID

	update UsersChars set ClanID=0 where ClanID=@in_ClanID
	
	return
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_BackpackToInv]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_BackpackToInv] 
	@in_CustomerID int,
	@in_CharID int,
	@in_InventoryID bigint,	-- target inventory id where to put that item
	@in_Slot int,
	@in_Amount int
AS
BEGIN
	SET NOCOUNT ON;

	if(@in_Amount <= 0) begin
		select 6 as ResultCode, 'bad amount' as ResultMsg
		return
	end

	-- check if CustomerID/CharID pair is valid
	declare @CustomerID int
	select @CustomerID=CustomerID FROM UsersChars WHERE CharID=@in_CharID
	if(@@ROWCOUNT = 0 or @CustomerID <> @in_CustomerID) begin
		select 6 as ResultCode, 'bad charid' as ResultMsg
		return
	end
	
	-- check if game is still active or 90sec passed from last update (COPYPASTE_GAMECHECK, search for others)
	declare @lastgamedate datetime
	declare @GameServerId int
	select @GameServerId=GameServerId, @lastgamedate=lastgamedate from UsersData where CustomerID=@in_CustomerID
	if(@GameServerId > 0 and DATEDIFF(second, @lastgamedate, GETDATE()) < 90) begin
		select 7 as ResultCode, 'game still active' as ResultMsg
		return
	end
	
	declare @BackpackInventoryID bigint
	declare @BackpackItemID int
	declare @BackpackLeasedUntil datetime
	declare @BackpackQuantity int
	declare @BackpackVar1 int
	declare @BackpackVar2 int
	select 
		@BackpackInventoryID=InventoryID,
		@BackpackItemID=ItemID, 
		@BackpackQuantity=Quantity,
		@BackpackLeasedUntil=LeasedUntil,
		@BackpackVar1=Var1,
		@BackpackVar2=Var2
	from UsersInventory where CharID=@in_CharID and BackpackSlot=@in_Slot
	if(@@ROWCOUNT = 0) begin
		select 6 as ResultCode, 'bad slot' as ResultMsg
		return
	end
	
	if(@in_Amount > @BackpackQuantity) begin
		select 6 as ResultCode, 'bad quantity' as ResultMsg
		return
	end
	
	-- check for easy case, just switching to inventory
	if(@in_InventoryID = 0 and @BackpackQuantity = @in_Amount) begin
		update UsersInventory set BackpackSlot=-1, CharID=0 where InventoryID=@BackpackInventoryID

		select 0 as ResultCode
		select @BackpackInventoryID as 'InventoryID'
		return
	end
	
	-- validate that we own that inventory slot and item can be moved there
	if(@in_InventoryID > 0) 
	begin
		declare @InvCustomerID int
		declare @InvCharID int
		declare @InvItemID int
		declare @InvVar1 int
		select 
			@InvCustomerID=CustomerID,
			@InvCharID=CharID, 
			@InvItemID=ItemID, 
			@InvVar1=Var1 
			from UsersInventory where InventoryID=@in_InventoryID
		if(@@ROWCOUNT = 0 or @InvCustomerID <> @in_CustomerID or @InvCharID <> 0 or @InvItemID <> @BackpackItemID) begin
			select 6 as ResultCode, 'bad inventoryid' as ResultMsg
			return
		end
		if(@InvVar1 >= 0 or @BackpackVar1 >= 0) begin
			select 6 as ResultCode, 'not stackable' as ResultMsg
			return
		end
	end

	declare @InvInventoryID bigint = @in_InventoryID
	if(@InvInventoryID = 0) begin
		-- modified (won't stack) or new inventory item
		INSERT INTO UsersInventory (
			CustomerID,
			CharID,
			ItemID, 
			LeasedUntil, 
			Quantity,
			Var1,
			Var2
		)
		VALUES (
			@in_CustomerID,
			0,
			@BackpackItemID,
			@BackpackLeasedUntil,
			@in_Amount,
			@BackpackVar1,
			@BackpackVar2
		)
		set @InvInventoryID = SCOPE_IDENTITY()
	end
	else begin
		update UsersInventory set Quantity=(Quantity+@in_Amount) where InventoryID=@InvInventoryID
	end

	-- from backpack
	set @BackpackQuantity = @BackpackQuantity - @in_Amount
	if(@BackpackQuantity <= 0) begin
		delete from UsersInventory where InventoryID=@BackpackInventoryID
	end 
	else begin
		update UsersInventory set Quantity=@BackpackQuantity where InventoryID=@BackpackInventoryID
	end
	
	select 0 as ResultCode
	select @InvInventoryID as 'InventoryID'
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_BackpackGridSwap]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_BackpackGridSwap] 
	@in_CustomerID int,
	@in_CharID int,
	@in_SlotFrom int,
	@in_SlotTo int
AS
BEGIN
	SET NOCOUNT ON;

	-- check if CustomerID/CharID pair is valid
	declare @CustomerID int
	declare @BackpackSize int
	select @CustomerID=CustomerID, @BackpackSize=BackpackSize FROM UsersChars WHERE CharID=@in_CharID
	if(@@ROWCOUNT = 0 or @CustomerID <> @in_CustomerID) begin
		select 6 as ResultCode, 'bad charid' as ResultMsg
		return
	end
	
	-- check if game is still active or 90sec passed from last update (COPYPASTE_GAMECHECK, search for others)
	declare @lastgamedate datetime
	declare @GameServerId int
	select @GameServerId=GameServerId, @lastgamedate=lastgamedate from UsersData where CustomerID=@in_CustomerID
	if(@GameServerId > 0 and DATEDIFF(second, @lastgamedate, GETDATE()) < 90) begin
		select 7 as ResultCode, 'game still active' as ResultMsg
		return
	end
	
	-- validate backpack slot number
	if(@in_SlotFrom < 0 or @in_SlotFrom >= @BackpackSize) begin
		select 6 as ResultCode, 'bad slot' as ResultMsg
		return
	end
	if(@in_SlotTo < 0 or @in_SlotTo >= @BackpackSize) begin
		select 6 as ResultCode, 'bad slot' as ResultMsg
		return
	end
	
	-- get inventory ids of both slots
	declare @InventoryIdFrom bigint = 0
	declare @InventoryIdTo bigint = 0
	select @InventoryIdFrom=InventoryID from UsersInventory where CharID=@in_CharID and BackpackSlot=@in_SlotFrom
	select @InventoryIdTo=InventoryID   from UsersInventory where CharID=@in_CharID and BackpackSlot=@in_SlotTo

	-- swap slots. operation will silently be ok if there is no item in that slot
	update UsersInventory set BackpackSlot=@in_SlotTo   where InventoryID=@InventoryIdFrom
	update UsersInventory set BackpackSlot=@in_SlotFrom where InventoryID=@InventoryIdTo
	
	-- clear attachments if swapped items was in weapon slots
	if(@in_SlotTo = 0 or @in_SlotFrom = 0) update UsersChars set Attachment1='' where CharID=@in_CharID
	if(@in_SlotTo = 1 or @in_SlotFrom = 1) update UsersChars set Attachment2='' where CharID=@in_CharID
	
	select 0 as ResultCode
	select 0 as 'InventoryID'
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_BackpackGridJoin]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_BackpackGridJoin]
	@in_CustomerID int,
	@in_CharID int,
	@in_SlotFrom int,
	@in_SlotTo int
AS
BEGIN
	SET NOCOUNT ON;

	-- check if CustomerID/CharID pair is valid
	declare @CustomerID int
	declare @BackpackSize int
	select @CustomerID=CustomerID, @BackpackSize=BackpackSize FROM UsersChars WHERE CharID=@in_CharID
	if(@@ROWCOUNT = 0 or @CustomerID <> @in_CustomerID) begin
		select 6 as ResultCode, 'bad charid' as ResultMsg
		return
	end

	-- check if game is still active or 90sec passed from last update (COPYPASTE_GAMECHECK, search for others)
	declare @lastgamedate datetime
	declare @GameServerId int
	select @GameServerId=GameServerId, @lastgamedate=lastgamedate from UsersData where CustomerID=@in_CustomerID
	if(@GameServerId > 0 and DATEDIFF(second, @lastgamedate, GETDATE()) < 90) begin
		select 7 as ResultCode, 'game still active' as ResultMsg
		return
	end
	
	-- check from slot
	declare @FromItemID int
	declare @FromQuantity int
	declare @FromVar1 int
	declare @FromVar2 int
	select 
		@FromItemID=ItemID, 
		@FromQuantity=Quantity,
		@FromVar1=Var1,
		@FromVar2=Var2
	from UsersInventory where CharID=@in_CharID and BackpackSlot=@in_SlotFrom
	if(@@ROWCOUNT = 0 or @FromItemID = 0) begin
		select 6 as ResultCode, 'bad slot1' as ResultMsg
		return
	end
	
	-- check to slot
	declare @ToItemID int
	declare @ToQuantity int
	declare @ToVar1 int
	declare @ToVar2 int
	select 
		@ToItemID=ItemID, 
		@ToQuantity=Quantity,
		@ToVar1=Var1,
		@ToVar2=Var2
	from UsersInventory where CharID=@in_CharID and BackpackSlot=@in_SlotTo
	if(@@ROWCOUNT = 0 or @ToItemID = 0) begin
		select 6 as ResultCode, 'bad slot2' as ResultMsg
		return
	end
	
	if(@ToItemID <> @FromItemID or @FromVar1 >= 0 or @ToVar1 >= 0) begin
		select 6 as ResultCode, 'bad join' as ResultMsg
		return
	end
	
	-- swap slots. operation will silently be ok if there is no item in that slot
	update UsersInventory set Quantity=Quantity+@FromQuantity where CharID=@in_CharID and BackpackSlot=@in_SlotTo
	delete from UsersInventory where CharID=@in_CharID and BackpackSlot=@in_SlotFrom
	
	select 0 as ResultCode
	select 0 as 'InventoryID'
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_BackpackFromInv]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_BackpackFromInv] 
	@in_CustomerID int,
	@in_CharID int,
	@in_InventoryID bigint,
	@in_Slot int,
	@in_Amount int
AS
BEGIN
	SET NOCOUNT ON;
	
	if(@in_Amount <= 0) begin
		select 6 as ResultCode, 'bad amount' as ResultMsg
		return
	end

	-- check if CustomerID/CharID pair is valid
	declare @CustomerID int
	declare @BackpackSize int
	select @CustomerID=CustomerID, @BackpackSize=BackpackSize FROM UsersChars WHERE CharID=@in_CharID
	if(@@ROWCOUNT = 0 or @CustomerID <> @in_CustomerID) begin
		select 6 as ResultCode, 'bad charid' as ResultMsg
		return
	end
	
	-- check if game is still active or 90sec passed from last update (COPYPASTE_GAMECHECK, search for others)
	declare @lastgamedate datetime
	declare @GameServerId int
	select @GameServerId=GameServerId, @lastgamedate=lastgamedate from UsersData where CustomerID=@in_CustomerID
	if(@GameServerId > 0 and DATEDIFF(second, @lastgamedate, GETDATE()) < 90) begin
		select 7 as ResultCode, 'game still active' as ResultMsg
		return
	end
	
	-- check if we have that item in inventory
	declare @InvCustomerID int
	declare @InvInventoryID bigint
	declare @InvItemID int
	declare @InvLeasedUntil datetime
	declare @InvQuantity int
	declare @InvVar1 int
	declare @InvVar2 int
	select 
		@InvCustomerID=CustomerID,
		@InvInventoryID=InventoryID,
		@InvItemID=ItemID, 
		@InvQuantity=Quantity,
		@InvLeasedUntil=LeasedUntil,
		@InvVar1=Var1,
		@InvVar2=Var2
	from UsersInventory where InventoryID=@in_InventoryID
	if(@@ROWCOUNT = 0 or @InvCustomerID <> @in_CustomerID) begin
		select 6 as ResultCode, 'bad inventoryid' as ResultMsg
		return
	end
	
	if(@in_Amount > @InvQuantity) begin
		select 6 as ResultCode, 'bad quantity' as ResultMsg
		return
	end
	
	-- validate backpack slot number
	if(@in_Slot < 0 or @in_Slot >= @BackpackSize) begin
		select 6 as ResultCode, 'bad slot' as ResultMsg
		return
	end
	-- validate itemid in that slot
	declare @BackpackInventoryID bigint = 0
	declare @BackpackItemID int = 0
	select 
		@BackpackInventoryID=InventoryID,
		@BackpackItemID=ItemID
	from UsersInventory where CharID=@in_CharID and BackpackSlot=@in_Slot
	if(@@ROWCOUNT > 0 and @BackpackItemID <> @InvItemID) begin
		select 6 as ResultCode, 'slot itemid mismatch' as ResultMsg
		return
	end

	-- clear attachments if moved item was in weapon slot
	if(@in_Slot = 0) update UsersChars set Attachment1='' where CharID=@in_CharID
	if(@in_Slot = 1) update UsersChars set Attachment2='' where CharID=@in_CharID

	-- check for easy case, unmodified item, no such item in backpack
	if(@BackpackInventoryID = 0 and @InvQuantity = @in_Amount) begin
		update UsersInventory set BackpackSlot=@in_Slot, CharID=@in_CharID where InventoryID=@InvInventoryID

		select 0 as ResultCode
		select @InvInventoryID as 'InventoryID'
		return
	end

	if(@BackpackInventoryID = 0)
	begin
		-- modified (won't stack) or new backpack item
		INSERT INTO UsersInventory (
			CustomerID,
			CharID,
			ItemID,
			BackpackSlot,
			LeasedUntil, 
			Quantity,
			Var1,
			Var2
		)
		VALUES (
			@in_CustomerID,
			@in_CharID,
			@InvItemID,
			@in_Slot,
			@InvLeasedUntil,
			@in_Amount,
			@InvVar1,
			@InvVar2
		)
		set @BackpackInventoryID = SCOPE_IDENTITY()
	end
	else
	begin
		update UsersInventory set Quantity=(Quantity+@in_Amount) where InventoryID=@BackpackInventoryID
	end
	
	-- from inventory
	set @InvQuantity = @InvQuantity - @in_Amount
	if(@InvQuantity <= 0) begin
		delete from UsersInventory where InventoryID=@InvInventoryID
	end 
	else begin
		update UsersInventory set Quantity=@InvQuantity where InventoryID=@InvInventoryID
	end
	
	select 0 as ResultCode;
	select @BackpackInventoryID as 'InventoryID'
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_ClanCreateCheckParams]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_ClanCreateCheckParams]
	@in_CharID int,
	@in_ClanName nvarchar(64),
	@in_ClanTag nvarchar(4)
AS
BEGIN
	SET NOCOUNT ON;

	-- user can't create more that one clan
	declare @ClanID int = 0
	select @ClanID=ClanID from UsersChars where CharID=@in_CharID
	if(@ClanID > 0) begin
		select 6 as ResultCode, 'already have clan' as ResultMsg
		return
	end
	
	-- check that name/tag is unique
	if(exists(select * from ClanData where ClanName=@in_ClanName)) begin
		select 27 as ResultCode, 'clan name' as ResultMsg
		return
	end
	if(exists(select * from ClanData where ClanTag=@in_ClanTag)) begin
		select 28 as ResultCode, 'clan tag' as ResultMsg
		return
	end

	select 0 as ResultCode
	return
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_ACCOUNT_DELETE]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_ACCOUNT_DELETE]
	@in_CustomerID int
AS
BEGIN
	SET NOCOUNT ON;
	
	-- success
	select 0 as ResultCode
	
	delete from dbo.UsersChars where CustomerID=@in_CustomerID
	delete from dbo.UsersData where CustomerID=@in_CustomerID
	delete from dbo.UsersInventory where CustomerID=@in_CustomerID
	
	update dbo.Accounts set AccountStatus=999 where CustomerID=@in_CustomerID

	return
END
GO
/****** Object:  StoredProcedure [dbo].[DB_PurgeUnusedUserData]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Denis Zhulitov
-- Create date: 03/15/2011
-- Description:	deleting unused records from tables if user record was deleted
-- =============================================
CREATE PROCEDURE [dbo].[DB_PurgeUnusedUserData]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	delete from Profile_Chars
	where not exists (select * from LoginID where LoginID.CustomerID = Profile_Chars.CustomerID)
	select @@RowCount as Deleted, 'Profile_Chars' as FromTable

	delete from ProfileData
	where not exists (select * from LoginID where LoginID.CustomerID = ProfileData.CustomerID)
	select @@RowCount as Deleted, 'ProfileData' as FromTable

	delete from Stats
	where not exists (select * from LoginID where LoginID.CustomerID = Stats.CustomerID)
	select @@RowCount as Deleted, 'Stats' as FromTable

	delete from Logins
	where not exists (select * from LoginID where LoginID.CustomerID = Logins.CustomerID)
	select @@RowCount as Deleted, 'Logins' as FromTable

	delete from Inventory
	where not exists (select * from LoginID where LoginID.CustomerID = Inventory.CustomerID)
	select @@RowCount as Deleted, 'Inventory' as FromTable

	delete from Inventory_FPS
	where not exists (select * from LoginID where LoginID.CustomerID = Inventory_FPS.CustomerID)
	select @@RowCount as Deleted, 'Inventory_FPS' as FromTable

	--delete from SteamUserIDMap
	--where not exists (select * from LoginID where LoginID.CustomerID = SteamUserIDMap.CustomerID)
	--select @@RowCount as Deleted, 'SteamUserIDMap' as FromTable

	--delete from GamersfirstUserIDMap
	--where not exists (select * from LoginID where LoginID.CustomerID = GamersfirstUserIDMap.CustomerID)
	--select @@RowCount as Deleted, 'GamersfirstUserIDMap' as FromTable
	
	-- purge inventory
	declare @InvCleanDate datetime = DATEADD(day, -30, GETDATE())
	delete from Inventory where LeasedUntil<@InvCleanDate
	delete from Inventory_FPS where LeasedUntil<@InvCleanDate
	
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_ACCOUNT_ChangePassword]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_ACCOUNT_ChangePassword]
	@in_CustomerID int, 
	@in_NewPassword varchar(100)
AS
BEGIN
	SET NOCOUNT ON;

	-- update new password
	declare @MD5FromPwd varchar(100)
	exec FN_CreateMD5Password @in_NewPassword, @MD5FromPwd OUTPUT
	update Accounts set MD5Password=@MD5FromPwd where CustomerID=@in_CustomerID
	
	insert into DBG_PasswordResets (
		CustomerID,
		ResetDate,
		NewPassword
	) values (
		@in_CustomerID,
		GETDATE(),
		@in_NewPassword
	)

	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_ACCOUNT_APPLYKEY]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_ACCOUNT_APPLYKEY]
	@in_CustomerID int,
	@in_SerialKey varchar(128)
AS
BEGIN
	SET NOCOUNT ON;
	
	declare @AccountType int = -1
	select @AccountType=AccountType from dbo.UsersData where CustomerID=@in_CustomerID
	if(@@ROWCOUNT = 0) begin
		select 6 as ResultCode, 'no user' as ResultMsg;
		return
	end
	
	-- only guest accounts can be extended
	if(@AccountType <> 3) begin
		select 2 as ResultCode, 'bad account type' as ResultMsg;
		return
	end
	
	--
	-- add new return codes in CUpdater::DoApplyNewKey
	--
	
-- check for serial key
	declare @keyResultCode int = 99
	declare @keyCustomerID int = 99
	declare @keySerialType int = 99
	exec [BreezeNet].[dbo].[BN_WarZ_SerialGetInfo]
		@in_SerialKey,
		'email@not.used',
		@keyResultCode out,
		@keyCustomerID out,
		@keySerialType out

	if(@keyResultCode <> 0) begin
		select 3 as ResultCode, 'Serial not valid' as ResultMsg;
		return
	end
	if(@keyCustomerID > 0) begin
		select 4 as ResultCode, 'Serial already used' as ResultMsg;
		return
	end
	
-- update account type and expiration time
	declare @DateActiveUntil datetime = '2030-1-1'
	if(@keySerialType = 3) begin
		-- guest accounts have 48hrs play time (sync with [WZ_ACCOUNT_CREATE])
		set @DateActiveUntil = DATEADD(hour, 48, GETDATE())
	end
	update UsersData set DateActiveUntil=@DateActiveUntil, AccountType=@keySerialType where CustomerID=@in_CustomerID
	
-- register CustomerID in BreezeNet
	exec [BreezeNet].[dbo].[BN_WarZ_SerialSetCustomerID] @in_SerialKey, @in_CustomerID

-- BONUSES from [WZ_ACCOUNT_CREATE] - do not forget to sync them
	if(@keySerialType = 0) begin
		-- legend package, 30$ 1GC=142
		update UsersData set GamePoints=(GamePoints+4260) where CustomerID=@in_CustomerID
	end

	if(@keySerialType = 1) begin
		-- pioneer package, 15$ 1GC=142
		update UsersData set GamePoints=(GamePoints+2139) where CustomerID=@in_CustomerID
	end
	
	-- success
	select 0 as ResultCode
	select @in_CustomerID as CustomerID, @keySerialType as 'AccountType'

	return
END
GO
/****** Object:  StoredProcedure [dbo].[ADMIN_BanUser]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ADMIN_BanUser]
	@in_CustomerID int,
	@in_BanReason nvarchar(256)
AS
BEGIN
	SET NOCOUNT ON;
	if(LEN(@in_BanReason) < 4) begin
		select 'GIVE PROPER REASON'
		return
	end

	declare @email varchar(128)
	select @email=email from dbo.Accounts where CustomerID=@in_CustomerID

	-- do not ban multiple times
	declare @AccountStatus int = 0
	declare @AccountType int = 0
	declare @BanCount int = 0
	declare @BanReason nvarchar(512)
	select 
		@AccountStatus=AccountStatus, 
		@accountType=AccountType,
		@BanCount=BanCount, 
		@BanReason=BanReason 
	from UsersData where CustomerID=@in_CustomerID
	if(@AccountStatus = 200 or @AccountStatus = 201) begin
		select 0 as ResultCode, 'already banned' as ResultMsg, @email as 'email'
		return
	end

	-- clear his login session
	update dbo.LoginSessions set SessionID=0 where CustomerID=@in_CustomerID
	
	-- set his all alive chars to respawned mode
	update dbo.UsersChars set Alive=2 where CustomerID=@in_CustomerID and Alive=1

	if(@BanReason is null) set @BanReason = @in_BanReason
	else                   set @BanReason = @in_BanReason + ', ' + @BanReason

	-- guest ban, permament
	if(@AccountType	= 3) begin
		set @BanReason = '[GUEST_BAN] ' + @BanReason
		set @BanCount  = 99;
	end
	
	-- ban
	if(@BanCount > 0) 
	begin
		insert into dbo.DBG_BanLog values (@in_CustomerID, GETDATE(), 2000, @in_BanReason)

		update UsersData set 
			AccountStatus=200, 
			BanReason=@BanReason, 
			BanTime=GETDATE(),
			BanCount=(BanCount+1),
			BanExpireDate='2030-1-1'
			where CustomerID=@in_CustomerID

		select 0 as ResultCode, 'Permanent BAN' as ResultMsg, @email as 'email', @BanReason as 'BanReason'
		return
	end
	else
	begin
		declare @BanTime int = 24

		insert into dbo.DBG_BanLog values (@in_CustomerID, GETDATE(), @BanTime, @in_BanReason)

		update UsersData set 
			AccountStatus=201, 
			BanReason=@BanReason, 
			BanTime=GETDATE(),
			BanCount=(BanCount+1),
			BanExpireDate=DATEADD(hour, @BanTime, GETDATE())
			where CustomerID=@in_CustomerID

		select 0 as ResultCode, 'temporary ban' as ResultMsg, @email as 'email', @BanReason as 'BanReason'
		return
	end
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_Backpack_SRV_DeleteItem]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_Backpack_SRV_DeleteItem] 
	@in_CustomerID int,
	@in_CharID int,
	@in_Slot int,
	@in_ItemID int = 0, -- not used
	@in_Amount int = 0, -- not used
	@in_Var1 int = 0, -- not used
	@in_Var2 int = 0 -- not used
AS
BEGIN
	SET NOCOUNT ON;

	delete from UsersInventory where CharID=@in_CharID and BackpackSlot=@in_Slot
	if(@@ROWCOUNT = 0) begin
		select 6 as ResultCode, 'delete item failed' as ResultMsg
		return
	end
	
	select 0 as ResultCode
	return
	
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_Backpack_SRV_Change]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_Backpack_SRV_Change]
	@in_CustomerID int,
	@in_CharID int,
	@in_BackpackID int,
	@in_BackpackSize int
AS
BEGIN
	SET NOCOUNT ON;

	--
	-- _SRV_ function - no validity checks
	--
	
	-- replace backpack size/id
	update UsersChars set BackpackID=@in_BackpackID, BackpackSize=@in_BackpackSize where CharID=@in_CharID
	
	select 0 as ResultCode
	select 0 as 'InventoryID'
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_Backpack_SRV_AlterItem]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_Backpack_SRV_AlterItem] 
	@in_CustomerID int,
	@in_CharID int,
	@in_Slot int,
	@in_ItemID int,
	@in_Amount int,
	@in_Var1 int,
	@in_Var2 int
AS
BEGIN
	SET NOCOUNT ON;

	-- sanity check: input
	if(@in_ItemID = 0) begin
		select 6 as ResultCode, 'add item failed#1' as ResultMsg
		return
	end

	update UsersInventory set 
		ItemID=@in_ItemID,
		Quantity=@in_Amount,
		Var1=@in_Var1,
		Var2=@in_Var2
	where CharID=@in_CharID and BackpackSlot=@in_Slot
	
	if(@@ROWCOUNT = 0) begin
		select 6 as ResultCode, 'alter item failed' as ResultMsg
		return
	end
	
	select 0 as ResultCode
	return
	
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_Backpack_SRV_AddItem]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_Backpack_SRV_AddItem] 
	@in_CustomerID int,
	@in_CharID int,
	@in_Slot int,
	@in_ItemID int,
	@in_Amount int,
	@in_Var1 int,
	@in_Var2 int
AS
BEGIN
	SET NOCOUNT ON;

	-- sanity check: input
	if(@in_ItemID = 0) begin
		select 6 as ResultCode, 'add item failed#1' as ResultMsg
		return
	end

	-- sanity check, we must not have item in that slot
	declare @InventoryID bigint = 0
	select @InventoryID=InventoryID from UsersInventory where CharID=@in_CharID and BackpackSlot=@in_Slot
	if(@InventoryID > 0) begin
		select 6 as ResultCode, 'add item failed#2' as ResultMsg
		return
	end

	INSERT INTO UsersInventory (
		CustomerID,
		CharID,
		BackpackSlot,
		ItemID,
		LeasedUntil, 
		Quantity,
		Var1,
		Var2
	)
	VALUES (
		@in_CustomerID,
		@in_CharID,
		@in_Slot,
		@in_ItemID,
		DATEADD(day, 2000, GETDATE()),
		@in_Amount,
		@in_Var1,
		@in_Var2
	)
	set @InventoryID = SCOPE_IDENTITY()
	
	select 0 as ResultCode
	select @InventoryID as 'InventoryID'
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_ACCOUNT_LOGIN_EXEC]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_ACCOUNT_LOGIN_EXEC]
	@in_IP varchar(100),
	@CustomerID int
AS
BEGIN
	SET NOCOUNT ON;
	
	--
	-- helper function that perform actual user login
	--
	
	declare @IsDeveloper int = 0
	declare @AccountStatus int
	declare @DateActiveUntil datetime
	declare @BanExpireDate datetime
	declare @lastgamedate datetime
	declare @GameServerId int
	select
		@AccountStatus=AccountStatus, 
		@IsDeveloper=IsDeveloper, 
		@DateActiveUntil=DateActiveUntil,
		@BanExpireDate=BanExpireDate,
		@GameServerId=GameServerId, 
		@lastgamedate=lastgamedate
		from UsersData where CustomerID=@CustomerID
	if(@@ROWCOUNT = 0) begin
		select
			5 as LoginResult,
			@CustomerID as CustomerID,
			0 as AccountStatus,
			0 as SessionID,
			0 as IsDeveloper
		return
	end

	-- check if account time expired
	if(GETDATE() > @DateActiveUntil) begin
		select
			4 as LoginResult,
			@CustomerID as CustomerID,
			300 as AccountStatus,	-- special 'TimeExpired' code
			0 as SessionID,
			0 as IsDeveloper
		return
	end 

	-- status equal to 201 means temporary ban
	if (@AccountStatus = 201) begin
		declare @BanExpireMin int = DATEDIFF(mi, GETDATE(), @BanExpireDate)
		if(@BanExpireMin > 0) begin
			select
				3 as LoginResult,
				@CustomerID as CustomerID,
				@AccountStatus as AccountStatus,
				@BanExpireMin as SessionID,
				0 as IsDeveloper
			return
		end
		else
		begin
			-- unban player
			set @AccountStatus = 100
			update dbo.UsersData set AccountStatus=@AccountStatus where CustomerID=@CustomerID
		end
	end

	if (@AccountStatus >= 200) begin
		select
			3 as LoginResult,
			@CustomerID as CustomerID,
			@AccountStatus as AccountStatus,
			0 as SessionID,
			0 as IsDeveloper
		return
	end
	
	-- check if game is still active or 90sec passed from last update (COPYPASTE_GAMECHECK, search for others)
	if(@GameServerId > 0 and DATEDIFF(second, @lastgamedate, GETDATE()) < 90) begin
		select
			0 as LoginResult,
			@CustomerID as CustomerID,
			70 as AccountStatus,	-- game still active code
			0 as SessionID,
			0 as IsDeveloper
		return
	end
	
	-- update session key/id
	declare @SessionKey varchar(50) = NEWID()
	declare @SessionID int = checksum(@SessionKey)
	if exists (SELECT CustomerID FROM LoginSessions WHERE CustomerID = @CustomerID)
	begin
		UPDATE LoginSessions SET 
			SessionKey=@SessionKey, 
			SessionID=@SessionID,
			LoginIP=@in_IP, 
			TimeLogged=GETDATE(), 
			TimeUpdated=GETDATE()
		WHERE CustomerID=@CustomerID
	end
	else
	begin
		INSERT INTO LoginSessions
			(CustomerID, SessionKey, SessionID, LoginIP, TimeLogged, TimeUpdated)
		VALUES 
			(@CustomerID, @SessionKey, @SessionID, @in_IP, GETDATE(), GETDATE())
	end

	-- update other tables
	UPDATE Accounts SET 
		lastlogindate=GETDATE(), 
		lastloginIP=@in_IP
	WHERE CustomerID=@CustomerID
	
	INSERT INTO Logins 
		(CustomerID, LoginTime, IP, LoginSource) 
	VALUES 
		(@CustomerID, GETDATE(), @in_IP, 0)

	-- return session info
	SELECT 
		0 as LoginResult,
		@CustomerID as CustomerID,
		@AccountStatus as AccountStatus,
		@SessionID as SessionID,
		@IsDeveloper as IsDeveloper
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_ACCOUNT_LOGIN]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_ACCOUNT_LOGIN]
	@in_IP varchar(100),
	@in_EMail varchar(100), 
	@in_Password varchar(100)
AS
BEGIN
	SET NOCOUNT ON;
	
	declare @CustomerID int
	declare @MD5Password varchar(100)
	declare @AccountStatus int = 0	-- this is Accounts.AccountStatus

	-- this call is always valid
	select 0 as ResultCode
	
	-- search for record with username
	SELECT 
		@CustomerID=CustomerID,
		@MD5Password=MD5Password,
		@AccountStatus=AccountStatus
	FROM Accounts
	WHERE email=@in_Email
	if (@@RowCount = 0) begin
		select
			1 as LoginResult,
			0 as CustomerID,
			0 as AccountStatus
		return
	end

	-- check MD5 password
	declare @MD5FromPwd varchar(100)
	exec FN_CreateMD5Password @in_Password, @MD5FromPwd OUTPUT
	if(@MD5Password <> @MD5FromPwd) begin
		select
			2 as LoginResult,
			0 as CustomerID,
			0 as AccountStatus
		return
	end
	
	-- check if deleted account because of refund
	if(@AccountStatus = 999) begin
		select
			3 as LoginResult,
			0 as CustomerID,
			999 as AccountStatus
		return
	end
	
	-- perform actual login
	exec WZ_ACCOUNT_LOGIN_EXEC @in_IP, @CustomerID
END
GO
/****** Object:  StoredProcedure [dbo].[ADMIN_BanWeaponHackers]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ADMIN_BanWeaponHackers]
AS  
BEGIN  
	SET NOCOUNT ON;  
	declare @hacks TABLE 
	(
		CustomerID int,
		data varchar(512)
	)
	
	declare @dt1 date = DATEADD(day, -1, GETDATE())

	-- select all hack attempts to table
	insert into @hacks 
		select CustomerID, data from DBG_SrvLogInfo where 
			ReportTime >= @dt1 and IsProcessed=0 and CheatID=5 and (data like 'id:%')

	-- clear them
	update DBG_SrvLogInfo set IsProcessed=1 where
		ReportTime >= @dt1 and IsProcessed=0 and CheatID=5

	--
	-- main ban loop
	--
	declare @CustomerID int
	declare @HackData varchar(512)
	
	DECLARE t_cursor CURSOR FOR 
		select customerid, data from @hacks 

	OPEN t_cursor
	FETCH NEXT FROM t_cursor into @CustomerID, @HackData
	while @@FETCH_STATUS = 0 
	begin
		declare @AccountStatus int
		
		-- start banning
		select @AccountStatus=AccountStatus from dbo.UsersData where CustomerID=@CustomerID

		if(@AccountStatus = 100)
		begin
			declare @BanReason varchar(512) = ''
			set @BanReason = 'WH[' + 
				convert(varchar(128), MONTH(GETDATE())) + 
				'/' + 
				convert(varchar(128), DAY(GETDATE())) + 
				'] ' + @HackData
			
			print @CustomerID
			print @BanReason
			exec ADMIN_BanUser @CustomerID, @BanReason
		end
		
		FETCH NEXT FROM t_cursor into @CustomerID, @HackData
	end
	close t_cursor
	deallocate t_cursor

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_ACCOUNT_CREATE]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_ACCOUNT_CREATE]
	@in_IP varchar(64),
	@in_Email varchar(128),
	@in_Password varchar(64),
	@in_ReferralID int,
	@in_SerialKey varchar(128),
	@in_SerialEmail varchar(128)
AS
BEGIN
	SET NOCOUNT ON;
	
	--
	-- NOTE: add new ResultCodes to updater CUpdater::CreateAccThreadEntry
	--
	

-- check for serial key
	declare @keyResultCode int = 99
	declare @keyCustomerID int = 99
	declare @keySerialType int = 99
	exec [BreezeNet].[dbo].[BN_WarZ_SerialGetInfo]
		@in_SerialKey,
		@in_SerialEmail,
		@keyResultCode out,
		@keyCustomerID out,
		@keySerialType out
		
	if(@keyResultCode <> 0 or @keyCustomerID > 0) begin
		select 3 as ResultCode, 'Serial not valid' as ResultMsg;
		return
	end

-- check if that account was created and refunded before (status 999)
	declare @RefundCustomerID int = 0
	select @RefundCustomerID=CustomerID from Accounts WHERE email=@in_Email and AccountStatus=999
	if(@RefundCustomerID > 0) begin
		-- change email to some unique one so it can be used again.
		declare @dateTime varchar(128)
		set @dateTime = REPLACE(CONVERT(VARCHAR, GETDATE(),111),'/','') + REPLACE(CONVERT(VARCHAR, GETDATE(),108),':','')
		declare @refundedEmail varchar(128) = '(' + @dateTime + ') ' + @in_Email
		update Accounts set email=@refundedEmail where CustomerID=@RefundCustomerID
	end
	
-- validate that email is unique
	if exists (SELECT CustomerID from Accounts WHERE email=@in_Email) begin
		select 2 as ResultCode, 'Email already in use' as ResultMsg;
		return;
	end
	
-- create user
	declare @MD5FromPwd varchar(100)
	exec FN_CreateMD5Password @in_Password, @MD5FromPwd OUTPUT
	INSERT INTO Accounts ( 
		email,
		MD5Password,
		dateregistered,
		ReferralID,
		lastlogindate,
		lastloginIP
	) VALUES (
		@in_EMail,
		@MD5FromPwd,
		GETDATE(),
		@in_ReferralID,
		GETDATE(),
		@in_IP
	)

	-- get new CustomerID
	declare @CustomerID int
	SELECT @CustomerID=CustomerID from Accounts where email=@in_Email

-- create all needed user tables
	INSERT INTO UsersData (
		CustomerID,
		AccountType,
		dateregistered
	) VALUES (
		@CustomerID,
		@keySerialType,
		GETDATE()
	)
	
	-- guest accounts have 48hrs play time (sync with WZ_ACCOUNT_APPLYKEY also)
	if(@keySerialType = 3) begin
		declare @DateActiveUntil datetime = DATEADD(hour, 48, GETDATE())
		update UsersData set DateActiveUntil=@DateActiveUntil where CustomerID=@CustomerID
	end
	
-- register CustomerID in BreezeNet
	exec [BreezeNet].[dbo].[BN_WarZ_SerialSetCustomerID] @in_SerialKey, @CustomerID

-- default items and bonuses for account types

	exec FN_AddItemToUser @CustomerID, 20174, 2000 -- hero: regular guy

	-- CBT TEST HEROES
	exec FN_AddItemToUser @CustomerID, 20182, 2000
	exec FN_AddItemToUser @CustomerID, 20184, 2000

	-- 10 of each
	--declare @i int = 0
	--while(@i < 10) begin
	--	set @i = @i + 1

	--	exec FN_AddItemToUser @CustomerID, 101306, 2000 -- Flashlight
	--	exec FN_AddItemToUser @CustomerID, 101261, 2000 -- Bandages
	--	exec FN_AddItemToUser @CustomerID, 101296, 2000 -- Can of Soda
	--	exec FN_AddItemToUser @CustomerID, 101289, 2000 -- Granola Bar
	--end

-- BONUSES for packages - do not forget to sync them with [WZ_ACCOUNT_APPLYKEY]
	if(@keySerialType = 0) begin
		-- legend package, 30$ 1GC=142
		update UsersData set GamePoints=(GamePoints+4260) where CustomerID=@CustomerID
	end

	if(@keySerialType = 1) begin
		-- pioneer package, 15$ 1GC=142
		update UsersData set GamePoints=(GamePoints+2139) where CustomerID=@CustomerID
	end
	
	-- success
	select 0 as ResultCode
	select @CustomerID as CustomerID, @keySerialType as 'AccountType'

	return
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_BackpackChange]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_BackpackChange]
	@in_CustomerID int,
	@in_CharID int,
	@in_InventoryID bigint
AS
BEGIN
	SET NOCOUNT ON;

	-- check if CustomerID/CharID pair is valid
	declare @CustomerID int
	declare @BackpackSize int
	declare @GameFlags int
	select @CustomerID=CustomerID, @BackpackSize=BackpackSize, @GameFlags=GameFlags FROM UsersChars WHERE CharID=@in_CharID
	if(@@ROWCOUNT = 0 or @CustomerID <> @in_CustomerID) begin
		select 6 as ResultCode, 'bad charid' as ResultMsg
		return
	end
	
	-- do not allow operations outside safe zone
	if((@GameFlags & 1) = 0) begin
		select 9 as ResultCode, 'outside safe zone' as ResultMsg
		return
	end
	
	-- check if game is still active or 90sec passed from last update (COPYPASTE_GAMECHECK, search for others)
	declare @lastgamedate datetime
	declare @GameServerId int
	select @GameServerId=GameServerId, @lastgamedate=lastgamedate from UsersData where CustomerID=@in_CustomerID
	if(@GameServerId > 0 and DATEDIFF(second, @lastgamedate, GETDATE()) < 90) begin
		select 7 as ResultCode, 'game still active' as ResultMsg
		return
	end
	
	-- validate that we own that item
	declare @InvItemID int = 0
	declare @InvCustomerID int = 0
	declare @InvCharID int = 0
	declare @InvQuantity int = 0
	select @InvItemID=ItemID, @InvQuantity=Quantity, @InvCustomerID=CustomerID from UsersInventory where InventoryID=@in_InventoryID
	if(@InvCustomerID <> @in_CustomerID) begin
		select 6 as ResultCode, 'bad inventoryid #1' as ResultMsg
		return
	end
	if(@InvCharID > 0 and @InvCharID <> @in_CharID) begin
		select 6 as ResultCode, 'bad inventoryid #2' as ResultMsg
		return
	end

	-- validate that this is actually a backpack
	declare @MaxSlots int = 0
	select @MaxSlots=Bulkiness from Items_Gear where ItemID=@InvItemID and Category=12
	if(@MaxSlots = 0) begin
		select 6 as ResultCode, 'no backpack' as ResultMsg
		return
	end
	
	-- move everything above current slots to inventory
	update UsersInventory set CharID=0, BackpackSlot=-1 where CharID=@in_CharID and BackpackSlot>=@MaxSlots

	-- remove single backpack from inventory
	set @InvQuantity = @InvQuantity - 1
	if(@InvQuantity <= 0) begin
		delete from UsersInventory where InventoryID=@in_InventoryID
	end 
	else begin
		update UsersInventory set Quantity=@InvQuantity where InventoryID=@in_InventoryID
	end
	
	-- place old backpack to inventory
	declare @OldBackpackID int
	select @OldBackpackID=BackpackID from UsersChars where CharID=@in_CharID
	exec dbo.FN_AddItemToUser @CustomerID, @OldBackpackID, 2000
	
	-- replace backpack size/id
	update UsersChars set BackpackID=@InvItemID, BackpackSize=@MaxSlots where CharID=@in_CharID
	
	select 0 as ResultCode
	select 0 as 'InventoryID'
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_ClanDonateToMemberGP]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_ClanDonateToMemberGP]
	@in_CharID int,
	@in_GP int,
	@in_MemberID int
AS
BEGIN
	SET NOCOUNT ON;
	
-- sanity checks

	-- clan id valudation of caller
	declare @ClanID int
	declare @ClanRank int
	declare @Gamertag nvarchar(64)
	select @ClanID=ClanID, @ClanRank=ClanRank, @Gamertag=Gamertag from UsersChars where CharID=@in_CharID
	if(@ClanID = 0) begin
		select 6 as ResultCode, 'not in clan' as ResultMsg
		return
	end

	-- clan id validation of member
	declare @MemberClanID int = 0
	declare @MemberGamerTag nvarchar(64)
	select @MemberClanID=ClanID, @MemberGamerTag=GamerTag from UsersChars where CharID=@in_MemberID
	if(@MemberClanID <> @ClanID) begin
		select 6 as ResultCode, 'member in wrong clan' as ResultMsg
		return
	end
	
-- donating
	if(@ClanRank > 0) begin
		select 23 as ResultCode, 'no permission' as ResultMsg
		return
	end
	
	declare @ClanGP int = 0
	select @ClanGP=ClanGP from ClanData where ClanID=@ClanID
	if(@in_GP < 0) begin
		select 6 as ResultCode, 'sneaky bastard...' as ResultMsg
		return
	end
	if(@in_GP > @ClanGP) begin
		select 6 as ResultCode, 'not enough GP in clan' as ResultMsg
		return
	end

	-- substract GP from clan
	update ClanData set ClanGP=(ClanGP-@in_GP) where ClanID=@ClanID

	-- add member gp
	exec FN_AlterUserGP @in_MemberID, @in_GP, 'fromclan'
	-- and record that
	INSERT INTO FinancialTransactions
		VALUES (@in_MemberID, 'CLAN_GPToMember', 4001, GETDATE(), 
				@in_GP, '1', 'APPROVED', @ClanID)
	
-- generate clan event
	insert into ClanEvents (
		ClanID,
		EventDate,
		EventType,
		EventRank,
		Var1,
		Var2,
		Var3,
		Text1,
		Text2
	) values (
		@ClanID,
		GETDATE(),
		11, -- CLANEvent_DonateToMemberGP
		1, -- Visible to officers
		@in_CharID,
		@in_MemberID,
		@in_GP,
		@Gamertag,
		@MemberGamertag
	)
	
-- TODO: send message to player about donate

	-- success
	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_ClanDonateToClanGP]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_ClanDonateToClanGP]
	@in_CustomerID int,
	@in_CharID int,
	@in_GP int
AS
BEGIN
	SET NOCOUNT ON;
	
-- sanity checks
	declare @ClanID int
	declare @ClanRank int
	declare @Gamertag nvarchar(64)
	select @ClanID=ClanID, @ClanRank=ClanRank, @Gamertag=Gamertag from UsersChars where CharID=@in_CharID
	if(@ClanID = 0) begin
		select 6 as ResultCode, 'not in clan' as ResultMsg
		return
	end

	declare @GamePoints int = 0
	select @GamePoints=GamePoints from UsersData where CustomerID=@in_CustomerID
	
	if(@in_GP < 0) begin
		select 6 as ResultCode, 'sneaky bastard...' as ResultMsg
		return
	end
	if(@in_GP > @GamePoints) begin
		select 6 as ResultCode, 'not enough GP' as ResultMsg
		return
	end

-- donating

	-- substract GP
	declare @AlterGP int = -@in_GP
	exec FN_AlterUserGP @in_CustomerID, @AlterGP, 'toclan'
	update UsersChars set ClanContributedGP=(ClanContributedGP+@in_GP) where CharID=@in_CharID
	-- and record that
	INSERT INTO FinancialTransactions
		VALUES (@in_CustomerID, 'CLAN_GPToClan', 4000, GETDATE(), 
				@in_GP, '1', 'APPROVED', @ClanID)
	
	-- add clan gp
	update ClanData set ClanGP=(ClanGP+@in_GP) where ClanID=@ClanID

-- generate clan event
	insert into ClanEvents (
		ClanID,
		EventDate,
		EventType,
		EventRank,
		Var1,
		Var3,
		Text1
	) values (
		@ClanID,
		GETDATE(),
		10, -- CLANEvent_DonateToClanGP
		99, -- Visible to all
		@in_CharID,
		@in_GP,
		@Gamertag
	)

	-- success
	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_ClanLeave]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_ClanLeave]
	@in_CharID int
AS
BEGIN
	SET NOCOUNT ON;
	
-- sanity checks
	declare @ClanID int
	declare @ClanRank int
	declare @Gamertag nvarchar(64)
	select @ClanID=ClanID, @ClanRank=ClanRank, @Gamertag=Gamertag from UsersChars where CharID=@in_CharID
	if(@ClanID = 0) begin
		select 6 as ResultCode, 'no clan' as ResultMsg
		return
	end
	
-- leader is leaving clan	
	if(@ClanRank = 0) 
	begin
		declare @NumClanMembers int
		select @NumClanMembers=COUNT(*) from UsersChars where ClanID=@ClanID
		if(@NumClanMembers > 1) begin
			select 6 as ResultCode, 'owner cant leave - there is people left in clan' as ResultMsg
			return
		end

		-- generate clan event
		insert into ClanEvents (
			ClanID,
			EventDate,
			EventType,
			EventRank,
			Var1,
			Text1
		) values (
			@ClanID,
			GETDATE(),
			99, -- CLANEvent_Disband
			99, -- Visible to all
			@in_CharID,
			@Gamertag
		)
		
		-- and delete clan
		exec WZ_ClanFN_DeleteClan @ClanID
		
		select 0 as ResultCode
		return
	end

	-- actual leave
	update UsersChars set ClanID=0, ClanContributedGP=0, ClanContributedXP=0 where CharID=@in_CharID
	update ClanData set NumClanMembers=(NumClanMembers - 1) where ClanID=@ClanID

-- generate clan event
	insert into ClanEvents (
		ClanID,
		EventDate,
		EventType,
		EventRank,
		Var1,
		Text1
	) values (
		@ClanID,
		GETDATE(),
		5, -- CLANEvent_Left
		99, -- Visible to all
		@in_CharID,
		@Gamertag
	)
	
	-- success
	select 0 as ResultCode
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_CharDelete]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_CharDelete] 
	@in_CustomerID int,
	@in_CharID int
AS
BEGIN
	SET NOCOUNT ON;
	
	-- validate CharID/CustomerID pair
	declare @CustomerID int = 0
	select @CustomerID=CustomerID from UsersChars where CharID=@in_CharID
	if(@@ROWCOUNT = 0 or @CustomerID <> @in_CustomerID) begin
		select 6 as ResultCode, 'bad charid' as ResultMsg
		return
	end

	-- remove from clan
	declare @ClanID int = 0
	declare @ClanRank int = 0
	select @ClanID=ClanID, @ClanRank=ClanRank from UsersChars where CharID=@in_CharID
	if(@ClanID > 0)
	begin
		-- if leader is leaving
		if(@ClanRank = 0)
		begin
			-- check if there is people left in clan
			declare @NumClanMembers int
			select @NumClanMembers=COUNT(*) from UsersChars where ClanID=@ClanID
			if(@NumClanMembers > 1) begin
				select 7 as ResultCode, 'still members in clan'
				return
			end

			-- delete clan
			exec WZ_ClanFN_DeleteClan @ClanID
		end
		else
		begin
			-- not leader, just leave clan
			update ClanData set NumClanMembers=(NumClanMembers - 1) where ClanID=@ClanID
		end
	end
	
	delete from UsersChars where CharID=@in_CharID
	delete from UsersInventory where CharID=@in_CharID

	-- success
	select 0 as ResultCode
	
END
GO
/****** Object:  StoredProcedure [dbo].[WZ_BuyItemFN_Exec]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_BuyItemFN_Exec]
	@out_FNResult int out,
	@in_CustomerID int,
	@in_ItemId int,
	@in_BuyDays int
AS
BEGIN
	SET NOCOUNT ON;
	
	--
	--
	-- main function for buying items in game, should be called from WZ_BuyItem2
	--
	--

	-- set success by default
	set @out_FNResult = 0
	
	--SAMPLE ITEM 10k GD
	--if(@in_ItemId = 301107) begin
	--	update UsersData set GameDollars=GameDollars+10000 where CustomerID=@in_CustomerID
	--	return
	--end
	
	-- clan items. NOTE: no item adding
	if(@in_ItemId >= 301151 and @in_ItemId <= 301157) begin
		return
	end
	
	-- normal item
	exec FN_AddItemToUser @in_CustomerID, @in_ItemId, @in_BuyDays
	set @out_FNResult = 0

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_BuyItem_GP]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_BuyItem_GP]
	@in_IP char(32),
	@in_CustomerID int,
	@in_ItemId int,
	@in_BuyDays int
AS
BEGIN
	SET NOCOUNT ON;

	-- get points for that customer
	declare @GamePoints int
	SELECT @GamePoints=GamePoints FROM UsersData WHERE CustomerID=@in_CustomerID
	if (@@RowCount = 0) begin
		select 6 as ResultCode, 'no CustomerID' as ResultMsg
		return
	end

	declare @smsg1 varchar(1000)
	declare @out_FNResult int = 100

	-- get price
	declare @FinalPrice int
	exec WZ_BuyItemFN_GetPrice @out_FNResult out, @in_ItemId, @in_BuyDays, 'GP', @FinalPrice out
	if(@out_FNResult > 0) begin
		set @smsg1 = LTRIM(STR(@out_FNResult)) + ' GP '
		set @smsg1 = @smsg1 + LTRIM(STR(@in_BuyDays)) + ' ' + LTRIM(STR(@in_ItemID))
		EXEC FN_ADD_SECURITY_LOG 110, @in_IP, @in_CustomerID, @smsg1
		select 6 as ResultCode, 'bad GetPrice' as ResultMsg
		return
	end
	
	-- check if enough money
	if(@GamePoints < @FinalPrice) begin
		set @smsg1 = LTRIM(STR(@in_ItemId)) + ' ' + LTRIM(STR(@in_BuyDays)) + ' '
		set @smsg1 = @smsg1 + ' GP ' + LTRIM(STR(@FinalPrice)) + ' ' + LTRIM(STR(@GamePoints))
		EXEC FN_ADD_SECURITY_LOG 114, @in_IP, @in_CustomerID, @smsg1
		select 7 as ResultCode, 'Not Enough GP' as ResultMsg
		return
	end

	-- exec item adding function, if it fail, do not process transaction further
	exec WZ_BuyItemFN_Exec @out_FNResult out, @in_CustomerID, @in_ItemId, @in_BuyDays
	if(@out_FNResult <> 0) begin
		set @smsg1 = 'BuyExec failed' + LTRIM(STR(@out_FNResult))
		select 7 as ResultCode, @smsg1 as ResultMsg
		return
	end

	-- perform actual transaction
	declare @AlterGP int = -@FinalPrice;
	exec FN_AlterUserGP @in_CustomerID, @AlterGP, 'WZ_BuyItem_GP'
	set @GamePoints=@GamePoints-@FinalPrice;

	-- set transaction type
	declare @TType int = 0
	if(@in_BuyDays = 2000) set @TType = 3000;
	else set @TType = 2000;
	
	-- update transaction detail
	INSERT INTO FinancialTransactions
		VALUES (@in_CustomerID, 'INGAME', @TType, GETDATE(), 
				@FinalPrice, '1', 'APPROVED', @in_ItemId)
				
	-- search for InventoryID of added item
	declare @InventoryID bigint = 0
	select @InventoryID=InventoryID from UsersInventory
		where CustomerID=@in_CustomerID and CharID=0 and ItemID=@in_ItemId and Var1<0

	select 0 as ResultCode
	select @GamePoints as 'Balance', @InventoryID as 'InventoryID';

END
GO
/****** Object:  StoredProcedure [dbo].[WZ_BuyItem_GD]    Script Date: 11/08/2014 01:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WZ_BuyItem_GD]
	@in_IP char(32),
	@in_CustomerID int,
	@in_ItemId int,
	@in_BuyDays int
AS
BEGIN
	SET NOCOUNT ON;

	-- get points for that customer
	declare @GameDollars int
	SELECT @GameDollars=GameDollars FROM UsersData WHERE CustomerID=@in_CustomerID
	if (@@RowCount = 0) begin
		select 6 as ResultCode, 'no CustomerID' as ResultMsg
		return
	end

	declare @smsg1 varchar(1000)
	declare @out_FNResult int = 100

	-- get price
	declare @FinalPrice int
	exec WZ_BuyItemFN_GetPrice @out_FNResult out, @in_ItemId, @in_BuyDays, 'GD', @FinalPrice out
	if(@out_FNResult > 0) begin
		set @smsg1 = LTRIM(STR(@out_FNResult)) + ' GD '
		set @smsg1 = @smsg1 + LTRIM(STR(@in_BuyDays)) + ' ' + LTRIM(STR(@in_ItemID))
		EXEC FN_ADD_SECURITY_LOG 110, @in_IP, @in_CustomerID, @smsg1
		select 6 as ResultCode, 'bad GetPrice' as ResultMsg
		return
	end
	
	-- check if enough money
	if(@GameDollars < @FinalPrice) begin
		set @smsg1 = LTRIM(STR(@in_ItemId)) + ' ' + LTRIM(STR(@in_BuyDays)) + ' '
		set @smsg1 = @smsg1 + ' GD ' + LTRIM(STR(@FinalPrice)) + ' ' + LTRIM(STR(@GameDollars))
		EXEC FN_ADD_SECURITY_LOG 114, @in_IP, @in_CustomerID, @smsg1
		select 7 as ResultCode, 'Not Enough GD' as ResultMsg
		return
	end

	-- exec item adding function, if it fail, do not process transaction further
	exec WZ_BuyItemFN_Exec @out_FNResult out, @in_CustomerID, @in_ItemId, @in_BuyDays
	if(@out_FNResult <> 0) begin
		set @smsg1 = 'BuyExec failed' + LTRIM(STR(@out_FNResult))
		select 7 as ResultCode, @smsg1 as ResultMsg
		return
	end

	-- perform actual transaction
	set @GameDollars = @GameDollars-@FinalPrice;
	UPDATE UsersData SET GameDollars=@GameDollars where CustomerID=@in_CustomerID

	-- set transaction type
	declare @TType int = 0
	if(@in_BuyDays = 2000) set @TType = 3001;
	else set @TType = 2001;
	
	-- update transaction detail
	INSERT INTO FinancialTransactions
		VALUES (@in_CustomerID, 'INGAME', @TType, GETDATE(), 
				@FinalPrice, '1', 'APPROVED', @in_ItemId)

	-- search for InventoryID of added item
	declare @InventoryID bigint = 0
	select @InventoryID=InventoryID from UsersInventory
		where CustomerID=@in_CustomerID and CharID=0 and ItemID=@in_ItemId and Var1<0

	select 0 as ResultCode
	select @GameDollars as 'Balance', @InventoryID as 'InventoryID'

END
GO
/****** Object:  Default [DF_Accounts_AccountStatus]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Accounts_AccountStatus]  DEFAULT ((100)) FOR [AccountStatus]
GO
/****** Object:  Default [DF_Accounts_IsDeveloper]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Accounts_IsDeveloper]  DEFAULT ((0)) FOR [IsDeveloper]
GO
/****** Object:  Default [DF__Achieveme__Value__6BAEFA67]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Achievements] ADD  CONSTRAINT [DF__Achieveme__Value__6BAEFA67]  DEFAULT ((0)) FOR [Value]
GO
/****** Object:  Default [DF__Achieveme__Unloc__6CA31EA0]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Achievements] ADD  CONSTRAINT [DF__Achieveme__Unloc__6CA31EA0]  DEFAULT ((0)) FOR [Unlocked]
GO
/****** Object:  Default [DF_CharsStats_PlayersKilled]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[CharsStats] ADD  CONSTRAINT [DF_CharsStats_PlayersKilled]  DEFAULT ((0)) FOR [PlayersKilled]
GO
/****** Object:  Default [DF_CharsStats_ZombiesKilled]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[CharsStats] ADD  CONSTRAINT [DF_CharsStats_ZombiesKilled]  DEFAULT ((0)) FOR [ZombiesKilled]
GO
/****** Object:  Default [DF__ClanEvents__Var1__46B27FE2]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[ClanEvents] ADD  CONSTRAINT [DF__ClanEvents__Var1__46B27FE2]  DEFAULT ((0)) FOR [Var1]
GO
/****** Object:  Default [DF__ClanEvents__Var2__47A6A41B]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[ClanEvents] ADD  CONSTRAINT [DF__ClanEvents__Var2__47A6A41B]  DEFAULT ((0)) FOR [Var2]
GO
/****** Object:  Default [DF__ClanEvents__Var3__489AC854]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[ClanEvents] ADD  CONSTRAINT [DF__ClanEvents__Var3__489AC854]  DEFAULT ((0)) FOR [Var3]
GO
/****** Object:  Default [DF__ClanEvents__Var4__498EEC8D]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[ClanEvents] ADD  CONSTRAINT [DF__ClanEvents__Var4__498EEC8D]  DEFAULT ((0)) FOR [Var4]
GO
/****** Object:  Default [DF__DataGameR__Rewar__719CDDE7]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[DataGameRewards] ADD  CONSTRAINT [DF__DataGameR__Rewar__719CDDE7]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF__DataGameR__GD_CQ__72910220]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[DataGameRewards] ADD  CONSTRAINT [DF__DataGameR__GD_CQ__72910220]  DEFAULT ((0)) FOR [GD_SOFT]
GO
/****** Object:  Default [DF__DataGameR__HP_CQ__73852659]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[DataGameRewards] ADD  CONSTRAINT [DF__DataGameR__HP_CQ__73852659]  DEFAULT ((0)) FOR [XP_SOFT]
GO
/****** Object:  Default [DF__DataGameR__GD_DM__74794A92]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[DataGameRewards] ADD  CONSTRAINT [DF__DataGameR__GD_DM__74794A92]  DEFAULT ((0)) FOR [GD_HARD]
GO
/****** Object:  Default [DF__DataGameR__HP_DM__756D6ECB]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[DataGameRewards] ADD  CONSTRAINT [DF__DataGameR__HP_DM__756D6ECB]  DEFAULT ((0)) FOR [XP_HARD]
GO
/****** Object:  Default [DF__DataSkill__Skill__0662F0A3]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[DataSkill2Price] ADD  CONSTRAINT [DF__DataSkill__Skill__0662F0A3]  DEFAULT ('SKILL DESC') FOR [SkillName]
GO
/****** Object:  Default [DF__DataSkill2P__Lv1__075714DC]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[DataSkill2Price] ADD  CONSTRAINT [DF__DataSkill2P__Lv1__075714DC]  DEFAULT ((0)) FOR [Lv1]
GO
/****** Object:  Default [DF__DataSkill2P__Lv2__084B3915]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[DataSkill2Price] ADD  CONSTRAINT [DF__DataSkill2P__Lv2__084B3915]  DEFAULT ((0)) FOR [Lv2]
GO
/****** Object:  Default [DF__DataSkill2P__Lv3__093F5D4E]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[DataSkill2Price] ADD  CONSTRAINT [DF__DataSkill2P__Lv3__093F5D4E]  DEFAULT ((0)) FOR [Lv3]
GO
/****** Object:  Default [DF__DataSkill2P__Lv4__0A338187]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[DataSkill2Price] ADD  CONSTRAINT [DF__DataSkill2P__Lv4__0A338187]  DEFAULT ((0)) FOR [Lv4]
GO
/****** Object:  Default [DF__DataSkill2P__Lv5__0B27A5C0]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[DataSkill2Price] ADD  CONSTRAINT [DF__DataSkill2P__Lv5__0B27A5C0]  DEFAULT ((0)) FOR [Lv5]
GO
/****** Object:  Default [DF_DBG_SrvLogInfo_CharID]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[DBG_SrvLogInfo] ADD  CONSTRAINT [DF_DBG_SrvLogInfo_CharID]  DEFAULT ((0)) FOR [CharID]
GO
/****** Object:  Default [DF_DBG_SrvLogInfo_Gamertag]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[DBG_SrvLogInfo] ADD  CONSTRAINT [DF_DBG_SrvLogInfo_Gamertag]  DEFAULT ('') FOR [Gamertag]
GO
/****** Object:  Default [DF__DBG_UserR__GameS__0F2D40CE]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF__DBG_UserR__GameS__0F2D40CE]  DEFAULT ((0)) FOR [GameSessionID]
GO
/****** Object:  Default [DF__DBG_UserR__Custo__10216507]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF__DBG_UserR__Custo__10216507]  DEFAULT ((0)) FOR [CustomerID]
GO
/****** Object:  Default [DF__DBG_UserR__GameP__11158940]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF__DBG_UserR__GameP__11158940]  DEFAULT ((0)) FOR [GamePoints]
GO
/****** Object:  Default [DF__DBG_UserR__Honor__1209AD79]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF__DBG_UserR__Honor__1209AD79]  DEFAULT ((0)) FOR [HonorPoints]
GO
/****** Object:  Default [DF__DBG_UserR__Skill__12FDD1B2]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF__DBG_UserR__Skill__12FDD1B2]  DEFAULT ((0)) FOR [SkillPoints]
GO
/****** Object:  Default [DF__DBG_UserR__Kills__13F1F5EB]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF__DBG_UserR__Kills__13F1F5EB]  DEFAULT ((0)) FOR [Kills]
GO
/****** Object:  Default [DF__DBG_UserR__Death__14E61A24]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF__DBG_UserR__Death__14E61A24]  DEFAULT ((0)) FOR [Deaths]
GO
/****** Object:  Default [DF__DBG_UserR__Shots__15DA3E5D]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF__DBG_UserR__Shots__15DA3E5D]  DEFAULT ((0)) FOR [ShotsFired]
GO
/****** Object:  Default [DF__DBG_UserR__Heads__16CE6296]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF__DBG_UserR__Heads__16CE6296]  DEFAULT ((0)) FOR [Headshots]
GO
/****** Object:  Default [DF__DBG_UserR__Assis__17C286CF]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF__DBG_UserR__Assis__17C286CF]  DEFAULT ((0)) FOR [AssistKills]
GO
/****** Object:  Default [DF__DBG_UserRo__Wins__18B6AB08]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF__DBG_UserRo__Wins__18B6AB08]  DEFAULT ((0)) FOR [Wins]
GO
/****** Object:  Default [DF__DBG_UserR__Losse__19AACF41]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF__DBG_UserR__Losse__19AACF41]  DEFAULT ((0)) FOR [Losses]
GO
/****** Object:  Default [DF__DBG_UserR__Captu__1A9EF37A]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF__DBG_UserR__Captu__1A9EF37A]  DEFAULT ((0)) FOR [CaptureNeutralPoints]
GO
/****** Object:  Default [DF__DBG_UserR__Captu__1B9317B3]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF__DBG_UserR__Captu__1B9317B3]  DEFAULT ((0)) FOR [CaptureEnemyPoints]
GO
/****** Object:  Default [DF__DBG_UserR__TimeP__1C873BEC]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF__DBG_UserR__TimeP__1C873BEC]  DEFAULT ((0)) FOR [TimePlayed]
GO
/****** Object:  Default [DF__DBG_UserR__GameR__1D7B6025]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF__DBG_UserR__GameR__1D7B6025]  DEFAULT (((1)/(1))/(1970)) FOR [GameReportTime]
GO
/****** Object:  Default [DF__DBG_UserR__GameD__1E6F845E]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF__DBG_UserR__GameD__1E6F845E]  DEFAULT ((0)) FOR [GameDollars]
GO
/****** Object:  Default [DF__DBG_UserR__TeamI__1F63A897]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF__DBG_UserR__TeamI__1F63A897]  DEFAULT ((2)) FOR [TeamID]
GO
/****** Object:  Default [DF__DBG_UserR__MapID__2057CCD0]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[DBG_UserRoundResults] ADD  CONSTRAINT [DF__DBG_UserR__MapID__2057CCD0]  DEFAULT ((255)) FOR [MapID]
GO
/****** Object:  Default [DF__Items_Atta__Name__4C6B5938]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Attachments] ADD  CONSTRAINT [DF__Items_Atta__Name__4C6B5938]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF__Items_Att__Descr__4D5F7D71]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Attachments] ADD  CONSTRAINT [DF__Items_Att__Descr__4D5F7D71]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF__Items_Att__SpecI__4E53A1AA]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Attachments] ADD  CONSTRAINT [DF__Items_Att__SpecI__4E53A1AA]  DEFAULT ((0)) FOR [SpecID]
GO
/****** Object:  Default [DF__Items_Att__Categ__4F47C5E3]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Attachments] ADD  CONSTRAINT [DF__Items_Att__Categ__4F47C5E3]  DEFAULT ((19)) FOR [Category]
GO
/****** Object:  Default [DF__Items_Att__Price__503BEA1C]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Attachments] ADD  CONSTRAINT [DF__Items_Att__Price__503BEA1C]  DEFAULT ((0)) FOR [Price1]
GO
/****** Object:  Default [DF__Items_Att__Price__51300E55]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Attachments] ADD  CONSTRAINT [DF__Items_Att__Price__51300E55]  DEFAULT ((0)) FOR [Price7]
GO
/****** Object:  Default [DF__Items_Att__Price__5224328E]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Attachments] ADD  CONSTRAINT [DF__Items_Att__Price__5224328E]  DEFAULT ((0)) FOR [Price30]
GO
/****** Object:  Default [DF__Items_Att__Price__531856C7]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Attachments] ADD  CONSTRAINT [DF__Items_Att__Price__531856C7]  DEFAULT ((0)) FOR [PriceP]
GO
/****** Object:  Default [DF__Items_Att__GPric__540C7B00]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Attachments] ADD  CONSTRAINT [DF__Items_Att__GPric__540C7B00]  DEFAULT ((0)) FOR [GPrice1]
GO
/****** Object:  Default [DF__Items_Att__GPric__55009F39]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Attachments] ADD  CONSTRAINT [DF__Items_Att__GPric__55009F39]  DEFAULT ((0)) FOR [GPrice7]
GO
/****** Object:  Default [DF__Items_Att__GPric__55F4C372]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Attachments] ADD  CONSTRAINT [DF__Items_Att__GPric__55F4C372]  DEFAULT ((0)) FOR [GPrice30]
GO
/****** Object:  Default [DF__Items_Att__GPric__56E8E7AB]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Attachments] ADD  CONSTRAINT [DF__Items_Att__GPric__56E8E7AB]  DEFAULT ((0)) FOR [GPriceP]
GO
/****** Object:  Default [DF__Items_Att__IsNew__57DD0BE4]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Attachments] ADD  CONSTRAINT [DF__Items_Att__IsNew__57DD0BE4]  DEFAULT ((0)) FOR [IsNew]
GO
/****** Object:  Default [DF__Items_Att__Level__58D1301D]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Attachments] ADD  CONSTRAINT [DF__Items_Att__Level__58D1301D]  DEFAULT ((0)) FOR [LevelRequired]
GO
/****** Object:  Default [DF_Items_Attachments_Weight]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Attachments] ADD  CONSTRAINT [DF_Items_Attachments_Weight]  DEFAULT ((0)) FOR [Weight]
GO
/****** Object:  Default [DF__Items_Gea__FNAME__2CBDA3B5]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF__Items_Gea__FNAME__2CBDA3B5]  DEFAULT ('ITEM000') FOR [FNAME]
GO
/****** Object:  Default [DF__Items_Gear__Name__2DB1C7EE]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF__Items_Gear__Name__2DB1C7EE]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF__Items_Gea__Descr__2EA5EC27]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF__Items_Gea__Descr__2EA5EC27]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF__Items_Gea__Categ__2F9A1060]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF__Items_Gea__Categ__2F9A1060]  DEFAULT ((0)) FOR [Category]
GO
/****** Object:  Default [DF__Items_Gea__Weigh__308E3499]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF__Items_Gea__Weigh__308E3499]  DEFAULT ((0)) FOR [Weight]
GO
/****** Object:  Default [DF__Items_Gea__Damag__318258D2]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF__Items_Gea__Damag__318258D2]  DEFAULT ((0)) FOR [DamagePerc]
GO
/****** Object:  Default [DF__Items_Gea__Damag__32767D0B]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF__Items_Gea__Damag__32767D0B]  DEFAULT ((0)) FOR [DamageMax]
GO
/****** Object:  Default [DF__Items_Gea__Bulki__336AA144]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF__Items_Gea__Bulki__336AA144]  DEFAULT ((0)) FOR [Bulkiness]
GO
/****** Object:  Default [DF__Items_Gea__Inacc__345EC57D]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF__Items_Gea__Inacc__345EC57D]  DEFAULT ((0)) FOR [Inaccuracy]
GO
/****** Object:  Default [DF__Items_Gea__Steal__3552E9B6]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF__Items_Gea__Steal__3552E9B6]  DEFAULT ((0)) FOR [Stealth]
GO
/****** Object:  Default [DF__Items_Gea__Price__382F5661]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF__Items_Gea__Price__382F5661]  DEFAULT ((0)) FOR [Price1]
GO
/****** Object:  Default [DF__Items_Gea__Price__39237A9A]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF__Items_Gea__Price__39237A9A]  DEFAULT ((0)) FOR [Price7]
GO
/****** Object:  Default [DF__Items_Gea__Price__3A179ED3]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF__Items_Gea__Price__3A179ED3]  DEFAULT ((0)) FOR [Price30]
GO
/****** Object:  Default [DF__Items_Gea__Price__3B0BC30C]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF__Items_Gea__Price__3B0BC30C]  DEFAULT ((0)) FOR [PriceP]
GO
/****** Object:  Default [DF__Items_Gea__IsNew__3BFFE745]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF__Items_Gea__IsNew__3BFFE745]  DEFAULT ((0)) FOR [IsNew]
GO
/****** Object:  Default [DF__Items_Gea__Prote__3CF40B7E]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF__Items_Gea__Prote__3CF40B7E]  DEFAULT ((1)) FOR [ProtectionLevel]
GO
/****** Object:  Default [DF__Items_Gea__Level__3DE82FB7]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF__Items_Gea__Level__3DE82FB7]  DEFAULT ((0)) FOR [LevelRequired]
GO
/****** Object:  Default [DF__Items_Gea__GPric__3EDC53F0]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF__Items_Gea__GPric__3EDC53F0]  DEFAULT ((0)) FOR [GPrice1]
GO
/****** Object:  Default [DF__Items_Gea__GPric__3FD07829]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF__Items_Gea__GPric__3FD07829]  DEFAULT ((0)) FOR [GPrice7]
GO
/****** Object:  Default [DF__Items_Gea__GPric__40C49C62]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF__Items_Gea__GPric__40C49C62]  DEFAULT ((0)) FOR [GPrice30]
GO
/****** Object:  Default [DF__Items_Gea__GPric__41B8C09B]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Gear] ADD  CONSTRAINT [DF__Items_Gea__GPric__41B8C09B]  DEFAULT ((0)) FOR [GPriceP]
GO
/****** Object:  Default [DF__Items_Gen__FNAME__7C1A6C5A]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Generic] ADD  CONSTRAINT [DF__Items_Gen__FNAME__7C1A6C5A]  DEFAULT ('Item_Generic') FOR [FNAME]
GO
/****** Object:  Default [DF__Items_Gene__Name__7D0E9093]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Generic] ADD  CONSTRAINT [DF__Items_Gene__Name__7D0E9093]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF__Items_Gen__Descr__7E02B4CC]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Generic] ADD  CONSTRAINT [DF__Items_Gen__Descr__7E02B4CC]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF__Items_Gen__Price__7EF6D905]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Generic] ADD  CONSTRAINT [DF__Items_Gen__Price__7EF6D905]  DEFAULT ((0)) FOR [Price1]
GO
/****** Object:  Default [DF__Items_Gen__Price__7FEAFD3E]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Generic] ADD  CONSTRAINT [DF__Items_Gen__Price__7FEAFD3E]  DEFAULT ((0)) FOR [Price7]
GO
/****** Object:  Default [DF__Items_Gen__Price__00DF2177]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Generic] ADD  CONSTRAINT [DF__Items_Gen__Price__00DF2177]  DEFAULT ((0)) FOR [Price30]
GO
/****** Object:  Default [DF__Items_Gen__Price__01D345B0]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Generic] ADD  CONSTRAINT [DF__Items_Gen__Price__01D345B0]  DEFAULT ((0)) FOR [PriceP]
GO
/****** Object:  Default [DF__Items_Gen__IsNew__02C769E9]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Generic] ADD  CONSTRAINT [DF__Items_Gen__IsNew__02C769E9]  DEFAULT ((0)) FOR [IsNew]
GO
/****** Object:  Default [DF__Items_Gen__Level__03BB8E22]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Generic] ADD  CONSTRAINT [DF__Items_Gen__Level__03BB8E22]  DEFAULT ((0)) FOR [LevelRequired]
GO
/****** Object:  Default [DF__Items_Gen__GPric__04AFB25B]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Generic] ADD  CONSTRAINT [DF__Items_Gen__GPric__04AFB25B]  DEFAULT ((0)) FOR [GPrice1]
GO
/****** Object:  Default [DF__Items_Gen__GPric__05A3D694]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Generic] ADD  CONSTRAINT [DF__Items_Gen__GPric__05A3D694]  DEFAULT ((0)) FOR [GPrice7]
GO
/****** Object:  Default [DF__Items_Gen__GPric__0697FACD]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Generic] ADD  CONSTRAINT [DF__Items_Gen__GPric__0697FACD]  DEFAULT ((0)) FOR [GPrice30]
GO
/****** Object:  Default [DF__Items_Gen__GPric__078C1F06]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Generic] ADD  CONSTRAINT [DF__Items_Gen__GPric__078C1F06]  DEFAULT ((0)) FOR [GPriceP]
GO
/****** Object:  Default [DF_Items_Generic_Weight]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Generic] ADD  CONSTRAINT [DF_Items_Generic_Weight]  DEFAULT ((0)) FOR [Weight]
GO
/****** Object:  Default [DF__Items_Wea__FNAME__4222D4EF]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FNAME__4222D4EF]  DEFAULT ('ITEM000') FOR [FNAME]
GO
/****** Object:  Default [DF__Items_Wea__Categ__4316F928]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Categ__4316F928]  DEFAULT ((0)) FOR [Category]
GO
/****** Object:  Default [DF__Items_Weap__Name__440B1D61]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Weap__Name__440B1D61]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF__Items_Wea__Descr__44FF419A]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Descr__44FF419A]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF__Items_Wea__Muzzl__45F365D3]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Muzzl__45F365D3]  DEFAULT ('0 0 0') FOR [MuzzleOffset]
GO
/****** Object:  Default [DF__Items_Wea__Muzzl__46E78A0C]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Muzzl__46E78A0C]  DEFAULT ('default') FOR [MuzzleParticle]
GO
/****** Object:  Default [DF__Items_Wea__Anima__47DBAE45]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Anima__47DBAE45]  DEFAULT ('assault') FOR [Animation]
GO
/****** Object:  Default [DF__Items_Wea__Bulle__48CFD27E]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Bulle__48CFD27E]  DEFAULT ((5.45)) FOR [BulletID]
GO
/****** Object:  Default [DF__Items_Wea__Sound__49C3F6B7]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Sound__49C3F6B7]  DEFAULT ('Sounds/Weapons/AK74_7_62_Shot') FOR [Sound_Shot]
GO
/****** Object:  Default [DF__Items_Wea__Sound__4AB81AF0]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Sound__4AB81AF0]  DEFAULT ('Sounds/Weapons/AK74_Reload') FOR [Sound_Reload]
GO
/****** Object:  Default [DF__Items_Wea__Damag__4BAC3F29]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Damag__4BAC3F29]  DEFAULT ((20)) FOR [Damage]
GO
/****** Object:  Default [DF__Items_Wea__isImm__4CA06362]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__isImm__4CA06362]  DEFAULT ((1)) FOR [isImmediate]
GO
/****** Object:  Default [DF__Items_Weap__Mass__4D94879B]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Weap__Mass__4D94879B]  DEFAULT ((0.1)) FOR [Mass]
GO
/****** Object:  Default [DF__Items_Wea__Speed__4E88ABD4]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Speed__4E88ABD4]  DEFAULT ((300)) FOR [Speed]
GO
/****** Object:  Default [DF__Items_Wea__Damag__4F7CD00D]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Damag__4F7CD00D]  DEFAULT ((0)) FOR [DamageDecay]
GO
/****** Object:  Default [DF__Items_Weap__Area__5070F446]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Weap__Area__5070F446]  DEFAULT ((0)) FOR [Area]
GO
/****** Object:  Default [DF__Items_Wea__Delay__5165187F]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Delay__5165187F]  DEFAULT ((0)) FOR [Delay]
GO
/****** Object:  Default [DF__Items_Wea__Timeo__52593CB8]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Timeo__52593CB8]  DEFAULT ((0)) FOR [Timeout]
GO
/****** Object:  Default [DF__Items_Wea__NumCl__534D60F1]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__NumCl__534D60F1]  DEFAULT ((10)) FOR [NumClips]
GO
/****** Object:  Default [DF__Items_Wea__Clips__5441852A]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Clips__5441852A]  DEFAULT ((30)) FOR [Clipsize]
GO
/****** Object:  Default [DF__Items_Wea__Reloa__5535A963]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Reloa__5535A963]  DEFAULT ((2.5)) FOR [ReloadTime]
GO
/****** Object:  Default [DF__Items_Wea__Activ__5629CD9C]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Activ__5629CD9C]  DEFAULT ((1.2)) FOR [ActiveReloadTick]
GO
/****** Object:  Default [DF__Items_Wea__RateO__571DF1D5]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__RateO__571DF1D5]  DEFAULT ((600)) FOR [RateOfFire]
GO
/****** Object:  Default [DF__Items_Wea__Sprea__5812160E]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Sprea__5812160E]  DEFAULT ((0.08)) FOR [Spread]
GO
/****** Object:  Default [DF__Items_Wea__Recoi__59063A47]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Recoi__59063A47]  DEFAULT ((1)) FOR [Recoil]
GO
/****** Object:  Default [DF__Items_Wea__NumGr__59FA5E80]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__NumGr__59FA5E80]  DEFAULT ((0)) FOR [NumGrenades]
GO
/****** Object:  Default [DF__Items_Wea__Grena__5AEE82B9]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Grena__5AEE82B9]  DEFAULT ('asr_grenade') FOR [GrenadeName]
GO
/****** Object:  Default [DF__Items_Wea__Firem__5BE2A6F2]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Firem__5BE2A6F2]  DEFAULT ((101)) FOR [Firemode]
GO
/****** Object:  Default [DF__Items_Wea__Detec__5CD6CB2B]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Detec__5CD6CB2B]  DEFAULT ((30)) FOR [DetectionRadius]
GO
/****** Object:  Default [DF__Items_Wea__Scope__5DCAEF64]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Scope__5DCAEF64]  DEFAULT ('default') FOR [ScopeType]
GO
/****** Object:  Default [DF__Items_Wea__Scope__5EBF139D]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Scope__5EBF139D]  DEFAULT ((0)) FOR [ScopeZoom]
GO
/****** Object:  Default [DF__Items_Wea__Price__5FB337D6]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Price__5FB337D6]  DEFAULT ((0)) FOR [Price1]
GO
/****** Object:  Default [DF__Items_Wea__Price__60A75C0F]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Price__60A75C0F]  DEFAULT ((0)) FOR [Price7]
GO
/****** Object:  Default [DF__Items_Wea__Price__619B8048]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Price__619B8048]  DEFAULT ((0)) FOR [Price30]
GO
/****** Object:  Default [DF__Items_Wea__Price__628FA481]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Price__628FA481]  DEFAULT ((0)) FOR [PriceP]
GO
/****** Object:  Default [DF__Items_Wea__IsNew__6383C8BA]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__IsNew__6383C8BA]  DEFAULT ((0)) FOR [IsNew]
GO
/****** Object:  Default [DF__Items_Wea__Level__6477ECF3]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Level__6477ECF3]  DEFAULT ((0)) FOR [LevelRequired]
GO
/****** Object:  Default [DF__Items_Wea__GPric__656C112C]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__GPric__656C112C]  DEFAULT ((0)) FOR [GPrice1]
GO
/****** Object:  Default [DF__Items_Wea__GPric__66603565]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__GPric__66603565]  DEFAULT ((0)) FOR [GPrice7]
GO
/****** Object:  Default [DF__Items_Wea__GPric__6754599E]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__GPric__6754599E]  DEFAULT ((0)) FOR [GPrice30]
GO
/****** Object:  Default [DF__Items_Wea__GPric__68487DD7]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__GPric__68487DD7]  DEFAULT ((0)) FOR [GPriceP]
GO
/****** Object:  Default [DF__Items_Wea__Shots__693CA210]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Shots__693CA210]  DEFAULT ((0)) FOR [ShotsFired]
GO
/****** Object:  Default [DF__Items_Wea__Shots__6A30C649]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Shots__6A30C649]  DEFAULT ((0)) FOR [ShotsHits]
GO
/****** Object:  Default [DF__Items_Wea__Kills__6B24EA82]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Kills__6B24EA82]  DEFAULT ((0)) FOR [KillsCQ]
GO
/****** Object:  Default [DF__Items_Wea__Kills__6C190EBB]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Kills__6C190EBB]  DEFAULT ((0)) FOR [KillsDM]
GO
/****** Object:  Default [DF__Items_Wea__Kills__6D0D32F4]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__Kills__6D0D32F4]  DEFAULT ((0)) FOR [KillsSB]
GO
/****** Object:  Default [DF__Items_Wea__IsUpg__6E01572D]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__IsUpg__6E01572D]  DEFAULT ((1)) FOR [IsUpgradeable]
GO
/****** Object:  Default [DF__Items_Wea__IsFPS__6EF57B66]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__IsFPS__6EF57B66]  DEFAULT ((0)) FOR [IsFPS]
GO
/****** Object:  Default [DF__Items_Wea__FPSSp__6FE99F9F]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSSp__6FE99F9F]  DEFAULT ((0)) FOR [FPSSpec0]
GO
/****** Object:  Default [DF__Items_Wea__FPSSp__70DDC3D8]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSSp__70DDC3D8]  DEFAULT ((0)) FOR [FPSSpec1]
GO
/****** Object:  Default [DF__Items_Wea__FPSSp__71D1E811]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSSp__71D1E811]  DEFAULT ((0)) FOR [FPSSpec2]
GO
/****** Object:  Default [DF__Items_Wea__FPSSp__72C60C4A]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSSp__72C60C4A]  DEFAULT ((0)) FOR [FPSSpec3]
GO
/****** Object:  Default [DF__Items_Wea__FPSSp__73BA3083]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSSp__73BA3083]  DEFAULT ((0)) FOR [FPSSpec4]
GO
/****** Object:  Default [DF__Items_Wea__FPSSp__74AE54BC]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSSp__74AE54BC]  DEFAULT ((0)) FOR [FPSSpec5]
GO
/****** Object:  Default [DF__Items_Wea__FPSSp__75A278F5]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSSp__75A278F5]  DEFAULT ((0)) FOR [FPSSpec6]
GO
/****** Object:  Default [DF__Items_Wea__FPSSp__76969D2E]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSSp__76969D2E]  DEFAULT ((0)) FOR [FPSSpec7]
GO
/****** Object:  Default [DF__Items_Wea__FPSSp__778AC167]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSSp__778AC167]  DEFAULT ((0)) FOR [FPSSpec8]
GO
/****** Object:  Default [DF__Items_Wea__FPSAt__787EE5A0]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSAt__787EE5A0]  DEFAULT ((0)) FOR [FPSAttach0]
GO
/****** Object:  Default [DF__Items_Wea__FPSAt__797309D9]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSAt__797309D9]  DEFAULT ((0)) FOR [FPSAttach1]
GO
/****** Object:  Default [DF__Items_Wea__FPSAt__7A672E12]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSAt__7A672E12]  DEFAULT ((0)) FOR [FPSAttach2]
GO
/****** Object:  Default [DF__Items_Wea__FPSAt__7B5B524B]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSAt__7B5B524B]  DEFAULT ((0)) FOR [FPSAttach3]
GO
/****** Object:  Default [DF__Items_Wea__FPSAt__7C4F7684]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSAt__7C4F7684]  DEFAULT ((0)) FOR [FPSAttach4]
GO
/****** Object:  Default [DF__Items_Wea__FPSAt__7D439ABD]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSAt__7D439ABD]  DEFAULT ((0)) FOR [FPSAttach5]
GO
/****** Object:  Default [DF__Items_Wea__FPSAt__7E37BEF6]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSAt__7E37BEF6]  DEFAULT ((0)) FOR [FPSAttach6]
GO
/****** Object:  Default [DF__Items_Wea__FPSAt__7F2BE32F]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSAt__7F2BE32F]  DEFAULT ((0)) FOR [FPSAttach7]
GO
/****** Object:  Default [DF__Items_Wea__FPSAt__00200768]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__FPSAt__00200768]  DEFAULT ((0)) FOR [FPSAttach8]
GO
/****** Object:  Default [DF__Items_Wea__AnimP__01142BA1]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF__Items_Wea__AnimP__01142BA1]  DEFAULT ('') FOR [AnimPrefix]
GO
/****** Object:  Default [DF_Items_Weapons_Weight]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Items_Weapons] ADD  CONSTRAINT [DF_Items_Weapons_Weight]  DEFAULT ((0)) FOR [Weight]
GO
/****** Object:  Default [DF__Logins__Customer__2A164134]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Logins] ADD  CONSTRAINT [DF__Logins__Customer__2A164134]  DEFAULT ((0)) FOR [CustomerID]
GO
/****** Object:  Default [DF__Logins__LoginTim__2B0A656D]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Logins] ADD  CONSTRAINT [DF__Logins__LoginTim__2B0A656D]  DEFAULT (((12)/(1))/(1973)) FOR [LoginTime]
GO
/****** Object:  Default [DF__Logins__IP__2BFE89A6]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Logins] ADD  CONSTRAINT [DF__Logins__IP__2BFE89A6]  DEFAULT ('1.1.1.1') FOR [IP]
GO
/****** Object:  Default [DF__Logins__LoginSou__2CF2ADDF]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[Logins] ADD  CONSTRAINT [DF__Logins__LoginSou__2CF2ADDF]  DEFAULT ((0)) FOR [LoginSource]
GO
/****** Object:  Default [DF_LoginSessions_SessionID]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[LoginSessions] ADD  CONSTRAINT [DF_LoginSessions_SessionID]  DEFAULT ((0)) FOR [SessionID]
GO
/****** Object:  Default [DF__LoginSess__GameS__1EF99443]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[LoginSessions] ADD  CONSTRAINT [DF__LoginSess__GameS__1EF99443]  DEFAULT ((0)) FOR [GameSessionID]
GO
/****** Object:  Default [DF__MasterSer__Serve__370627FE]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[MasterServerInfo] ADD  CONSTRAINT [DF__MasterSer__Serve__370627FE]  DEFAULT ((0)) FOR [ServerID]
GO
/****** Object:  Default [DF__MasterSer__LastU__37FA4C37]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[MasterServerInfo] ADD  CONSTRAINT [DF__MasterSer__LastU__37FA4C37]  DEFAULT (((1)/(1))/(1970)) FOR [LastUpdated]
GO
/****** Object:  Default [DF__MasterSer__Creat__38EE7070]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[MasterServerInfo] ADD  CONSTRAINT [DF__MasterSer__Creat__38EE7070]  DEFAULT ((0)) FOR [CreateGameKey]
GO
/****** Object:  Default [DF__MasterServer__IP__39E294A9]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[MasterServerInfo] ADD  CONSTRAINT [DF__MasterServer__IP__39E294A9]  DEFAULT ('0.0.0.0') FOR [IP]
GO
/****** Object:  Default [DF__SecurityLog__IP__5BAD9CC8]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[SecurityLog] ADD  CONSTRAINT [DF__SecurityLog__IP__5BAD9CC8]  DEFAULT ('0.0.0.0') FOR [IP]
GO
/****** Object:  Default [DF__SecurityL__Custo__5CA1C101]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[SecurityLog] ADD  CONSTRAINT [DF__SecurityL__Custo__5CA1C101]  DEFAULT ((0)) FOR [CustomerID]
GO
/****** Object:  Default [DF__SecurityL__Event__5D95E53A]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[SecurityLog] ADD  CONSTRAINT [DF__SecurityL__Event__5D95E53A]  DEFAULT ('') FOR [EventData]
GO
/****** Object:  Default [DF_UsersChars_HeroItemID]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersChars] ADD  CONSTRAINT [DF_UsersChars_HeroItemID]  DEFAULT ((20170)) FOR [HeroItemID]
GO
/****** Object:  Default [DF_UsersChars_Alive]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersChars] ADD  CONSTRAINT [DF_UsersChars_Alive]  DEFAULT ((3)) FOR [Alive]
GO
/****** Object:  Default [DF_UsersChars_DeadTime]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersChars] ADD  CONSTRAINT [DF_UsersChars_DeadTime]  DEFAULT ('1/1/1973') FOR [DeathUtcTime]
GO
/****** Object:  Default [DF_UsersChars_XP]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersChars] ADD  CONSTRAINT [DF_UsersChars_XP]  DEFAULT ((0)) FOR [XP]
GO
/****** Object:  Default [DF__Profile_C__TimeP__40058253]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersChars] ADD  CONSTRAINT [DF__Profile_C__TimeP__40058253]  DEFAULT ((0)) FOR [TimePlayed]
GO
/****** Object:  Default [DF_UsersChars_GameMapId]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersChars] ADD  CONSTRAINT [DF_UsersChars_GameMapId]  DEFAULT ((0)) FOR [GameMapId]
GO
/****** Object:  Default [DF_UsersChars_GameServerId]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersChars] ADD  CONSTRAINT [DF_UsersChars_GameServerId]  DEFAULT ((0)) FOR [GameServerId]
GO
/****** Object:  Default [DF_UsersChars_GamePos]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersChars] ADD  CONSTRAINT [DF_UsersChars_GamePos]  DEFAULT ('') FOR [GamePos]
GO
/****** Object:  Default [DF_UsersChars_GameWorldFlags]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersChars] ADD  CONSTRAINT [DF_UsersChars_GameWorldFlags]  DEFAULT ((0)) FOR [GameFlags]
GO
/****** Object:  Default [DF_UsersChars_Health]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersChars] ADD  CONSTRAINT [DF_UsersChars_Health]  DEFAULT ((100)) FOR [Health]
GO
/****** Object:  Default [DF_UsersChars_Food]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersChars] ADD  CONSTRAINT [DF_UsersChars_Food]  DEFAULT ((0)) FOR [Food]
GO
/****** Object:  Default [DF_UsersChars_Water]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersChars] ADD  CONSTRAINT [DF_UsersChars_Water]  DEFAULT ((0)) FOR [Water]
GO
/****** Object:  Default [DF_UsersChars_Toxic]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersChars] ADD  CONSTRAINT [DF_UsersChars_Toxic]  DEFAULT ((0)) FOR [Toxic]
GO
/****** Object:  Default [DF_UsersChars_Reputation]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersChars] ADD  CONSTRAINT [DF_UsersChars_Reputation]  DEFAULT ((0)) FOR [Reputation]
GO
/****** Object:  Default [DF_UsersChars_BackpackID]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersChars] ADD  CONSTRAINT [DF_UsersChars_BackpackID]  DEFAULT ((20176)) FOR [BackpackID]
GO
/****** Object:  Default [DF_UsersChars_BackpackSize]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersChars] ADD  CONSTRAINT [DF_UsersChars_BackpackSize]  DEFAULT ((12)) FOR [BackpackSize]
GO
/****** Object:  Default [DF_UsersChars_Attachment1]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersChars] ADD  CONSTRAINT [DF_UsersChars_Attachment1]  DEFAULT ('') FOR [Attachment1]
GO
/****** Object:  Default [DF_UsersChars_Attachment2]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersChars] ADD  CONSTRAINT [DF_UsersChars_Attachment2]  DEFAULT ('') FOR [Attachment2]
GO
/****** Object:  Default [DF__UsersChar__Stat0__664B26CC]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersChars] ADD  CONSTRAINT [DF__UsersChar__Stat0__664B26CC]  DEFAULT ((0)) FOR [Stat00]
GO
/****** Object:  Default [DF__UsersChar__Stat0__673F4B05]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersChars] ADD  CONSTRAINT [DF__UsersChar__Stat0__673F4B05]  DEFAULT ((0)) FOR [Stat01]
GO
/****** Object:  Default [DF__UsersChar__Stat0__68336F3E]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersChars] ADD  CONSTRAINT [DF__UsersChar__Stat0__68336F3E]  DEFAULT ((0)) FOR [Stat02]
GO
/****** Object:  Default [DF__UsersChar__Stat0__69279377]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersChars] ADD  CONSTRAINT [DF__UsersChar__Stat0__69279377]  DEFAULT ((0)) FOR [Stat03]
GO
/****** Object:  Default [DF__UsersChar__Stat0__6A1BB7B0]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersChars] ADD  CONSTRAINT [DF__UsersChar__Stat0__6A1BB7B0]  DEFAULT ((0)) FOR [Stat04]
GO
/****** Object:  Default [DF__UsersChar__Stat0__6B0FDBE9]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersChars] ADD  CONSTRAINT [DF__UsersChar__Stat0__6B0FDBE9]  DEFAULT ((0)) FOR [Stat05]
GO
/****** Object:  Default [DF__UsersChar__ClanI__5026DB83]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersChars] ADD  CONSTRAINT [DF__UsersChar__ClanI__5026DB83]  DEFAULT ((0)) FOR [ClanID]
GO
/****** Object:  Default [DF__UsersChar__ClanR__511AFFBC]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersChars] ADD  CONSTRAINT [DF__UsersChar__ClanR__511AFFBC]  DEFAULT ((99)) FOR [ClanRank]
GO
/****** Object:  Default [DF__UsersChar__ClanC__520F23F5]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersChars] ADD  CONSTRAINT [DF__UsersChar__ClanC__520F23F5]  DEFAULT ((0)) FOR [ClanContributedXP]
GO
/****** Object:  Default [DF__UsersChar__ClanC__5303482E]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersChars] ADD  CONSTRAINT [DF__UsersChar__ClanC__5303482E]  DEFAULT ((0)) FOR [ClanContributedGP]
GO
/****** Object:  Default [DF__LoginID__IsDevel__208CD6FA]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersData] ADD  CONSTRAINT [DF__LoginID__IsDevel__208CD6FA]  DEFAULT ((0)) FOR [IsDeveloper]
GO
/****** Object:  Default [DF_UsersData_AccountType]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersData] ADD  CONSTRAINT [DF_UsersData_AccountType]  DEFAULT ((99)) FOR [AccountType]
GO
/****** Object:  Default [DF__LoginID__Account__0A9D95DB]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersData] ADD  CONSTRAINT [DF__LoginID__Account__0A9D95DB]  DEFAULT ((100)) FOR [AccountStatus]
GO
/****** Object:  Default [DF__LoginID__GamePoi__0B91BA14]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersData] ADD  CONSTRAINT [DF__LoginID__GamePoi__0B91BA14]  DEFAULT ((0)) FOR [GamePoints]
GO
/****** Object:  Default [DF__LoginID__GameDol__17036CC0]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersData] ADD  CONSTRAINT [DF__LoginID__GameDol__17036CC0]  DEFAULT ((0)) FOR [GameDollars]
GO
/****** Object:  Default [DF__LoginID__datereg__0F624AF8]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersData] ADD  CONSTRAINT [DF__LoginID__datereg__0F624AF8]  DEFAULT ('1/1/1973') FOR [dateregistered]
GO
/****** Object:  Default [DF_UsersData_lastjoineddate]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersData] ADD  CONSTRAINT [DF_UsersData_lastjoineddate]  DEFAULT ('1/1/1973') FOR [lastjoineddate]
GO
/****** Object:  Default [DF__LoginID__lastgam__123EB7A3]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersData] ADD  CONSTRAINT [DF__LoginID__lastgam__123EB7A3]  DEFAULT ('1/1/1973') FOR [lastgamedate]
GO
/****** Object:  Default [DF__LoginID__ClanID__160F4887]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersData] ADD  CONSTRAINT [DF__LoginID__ClanID__160F4887]  DEFAULT ((0)) FOR [ClanID]
GO
/****** Object:  Default [DF__LoginID__ClanRan__1CBC4616]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersData] ADD  CONSTRAINT [DF__LoginID__ClanRan__1CBC4616]  DEFAULT ((99)) FOR [ClanRank]
GO
/****** Object:  Default [DF__UsersData__Chars__338A9CD5]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersData] ADD  CONSTRAINT [DF__UsersData__Chars__338A9CD5]  DEFAULT ((0)) FOR [CharsCreated]
GO
/****** Object:  Default [DF__UsersData__TimeP__3EFC4F81]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersData] ADD  CONSTRAINT [DF__UsersData__TimeP__3EFC4F81]  DEFAULT ((0)) FOR [TimePlayed]
GO
/****** Object:  Default [DF__UsersData__DateA__40E497F3]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersData] ADD  CONSTRAINT [DF__UsersData__DateA__40E497F3]  DEFAULT ('2030-1-1') FOR [DateActiveUntil]
GO
/****** Object:  Default [DF__UsersData__BanCo__43C1049E]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersData] ADD  CONSTRAINT [DF__UsersData__BanCo__43C1049E]  DEFAULT ((0)) FOR [BanCount]
GO
/****** Object:  Default [DF_UsersInventory_CharID]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersInventory] ADD  CONSTRAINT [DF_UsersInventory_CharID]  DEFAULT ((0)) FOR [CharID]
GO
/****** Object:  Default [DF_UsersInventory_BackpackSlot]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersInventory] ADD  CONSTRAINT [DF_UsersInventory_BackpackSlot]  DEFAULT ((0)) FOR [BackpackSlot]
GO
/****** Object:  Default [DF__Inventory__Quant__03F0984C]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersInventory] ADD  CONSTRAINT [DF__Inventory__Quant__03F0984C]  DEFAULT ((1)) FOR [Quantity]
GO
/****** Object:  Default [DF_UsersInventory_Var1]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersInventory] ADD  CONSTRAINT [DF_UsersInventory_Var1]  DEFAULT ((-1)) FOR [Var1]
GO
/****** Object:  Default [DF_UsersInventory_Var2]    Script Date: 11/08/2014 01:27:14 ******/
ALTER TABLE [dbo].[UsersInventory] ADD  CONSTRAINT [DF_UsersInventory_Var2]  DEFAULT ((-1)) FOR [Var2]
GO
