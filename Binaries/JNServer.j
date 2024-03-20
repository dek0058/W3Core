library JNServer
static if not REFORGED_MODE then
    // JN Server Basic
    native JNUse takes nothing returns boolean
    native JNServerTime takes string Format returns string
    native JNServerUnixTime takes nothing returns integer
    native JNServerPluginVersion takes nothing returns integer
    native JNOpenBrowser takes string Address returns nothing
    native JNCheckNameHack takes string UserId returns boolean
    native JNStringBase64Encoding takes string String returns string
    native JNStringBase64Decoding takes string String returns string

    // JN Server Util
    native JNSetLog takes string MapId, string UserId, string SecretKey, string Character, string Version, string Loging returns string
    native JNSetLogUseType takes string MapId, string UserId, string SecretKey, string Character, string Version, string Loging, string LogType returns string
    native JNMapServerLog takes string MapId, string SecretKey, string Version, string Loging returns string
    native JNMapServerLogUseType takes string MapId, string SecretKey, string Version, string Loging, string LogType returns string
    native JNPublicMapServerLog takes string MapId, string SecretKey, string Version, string Loging returns string
    native JNUseUserRoleItemInfo takes string MapId, string SecretKey, string UserId, string ItemName returns string
    native JNScreenShotReg takes string MapId, string SecretKey, string UserId, string Character, string Loging returns boolean
    native JNPublicScreenShotReg takes string MapId, string SecretKey, string UserId, string Character, string Tag, string Loging returns boolean
    native JNReplayReg takes string MapId, string SecretKey, string UserId, string Character, string Loging returns nothing
    native JNPushReg takes string MapId returns nothing
    native JNGetPushMessage takes nothing returns string

    // JN Server Daily
    native JNDailySave takes string MapId, string UserId, string SecretKey, string Character, string DailyType returns string
    native JNDailyCheckToday takes string MapId, string UserId, string SecretKey, string Character, string DailyType returns string
    native JNDailyCheckTodayList takes string MapId, string UserId, string SecretKey, string Character, string DailyType returns string
    native JNDailyCountWeek takes string MapId, string UserId, string SecretKey, string Character, string DailyType, string WeekDay returns string
    native JNDailyCountWeekList takes string MapId, string UserId, string SecretKey, string Character, string DailyType, string WeekDay returns string
    native JNDailyCountMonth takes string MapId, string UserId, string SecretKey, string Character, string DailyType returns string
    native JNDailyCountMonthList takes string MapId, string UserId, string SecretKey, string Character, string DailyType returns string

    // JN Server Object Score
    native JNObjectScoreInit takes string MapId, string SecretKey, string UserId, string Character returns integer
    native JNObjectScoreSave takes string MapId, string SecretKey, string UserId, string Character returns string
    native JNObjectScoreGet takes string UserId, string Field returns integer
    native JNObjectScoreAdd takes string UserId, string Field, integer Value returns nothing
    native JNObjectScoreSet takes string UserId, string Field, integer Value returns nothing

    // JN Server Code Manage
    native JNSetSaveCode takes string MapId, string UserId, string SecretKey, string Character, string Code returns string
    native JNGetLoadCode takes string MapId, string UserId, string SecretKey, string Character returns string
    native JNRPGGetCharacterCount takes string MapId, string UserId, string SecretKey returns integer
    native JNRPGGetCharacterNameByIndex takes string UserId, integer Index returns string

    // JN Server Object Character
    native JNObjectCharacterSave takes string MapId, string UserId, string SecretKey, string Character returns string
    native JNObjectCharacterInit takes string MapId, string UserId, string SecretKey, string Character returns integer
    native JNObjectCharacterResetCharacter takes string UserId returns nothing
    native JNObjectCharacterServerConnectCheck takes nothing returns boolean
    native JNObjectCharacterPopGlobalMessage takes nothing returns string
    native JNObjectCharacterPopGlobalMessageFormat takes string Format returns string
    native JNObjectCharacterSendGlobalMessage takes string message returns nothing
    native JNObjectCharacterRemoveField takes string Userid, string Field returns nothing
    native JNObjectCharacterClearField takes string UserId returns nothing
    native JNObjectCharacterSetInt takes string UserId, string Field, integer Value returns nothing
    native JNObjectCharacterGetInt takes string UserId, string Field returns integer
    native JNObjectCharacterSetReal takes string UserId, string Field, real Value returns nothing
    native JNObjectCharacterGetReal takes string UserId, string Field returns real
    native JNObjectCharacterSetString takes string UserId, string Field, string Value returns nothing
    native JNObjectCharacterGetString takes string UserId, string Field returns string
    native JNObjectCharacterSetBoolean takes string UserId, string Field, boolean Value returns nothing
    native JNObjectCharacterGetBoolean takes string UserId, string Field returns boolean
    native JNObjectCharacterGetCharacterCount takes string MapId, string UserId, string SecretKey returns integer
    native JNObjectCharacterGetCharacterNameByIndex takes string UserId, integer Index returns string

    // JN Server Object User
    native JNObjectUserSave takes string MapId, string UserId, string SecretKey, string Character returns string
    native JNObjectUserInit takes string MapId, string Userid, string SecretKey, string Character returns integer
    native JNObjectUserResetCharacter takes string UserId returns nothing
    native JNObjectUserRemoveField takes string UserId, string Field returns nothing
    native JNObjectUserClearField takes string UserId returns nothing
    native JNObjectUserSetInt takes string UserId, string Field, integer Value returns nothing
    native JNObjectUserGetInt takes string UserId, string Field returns integer
    native JNObjectUserSetReal takes string UserId, string Field, real Value returns nothing
    native JNObjectUserGetReal takes string UserId, string Field returns real
    native JNObjectUserSetString takes string UserId, string Field, string Value returns nothing
    native JNObjectUserGetString takes string UserId, string Field returns string
    native JNObjectUserSetBoolean takes string UserId, string Field, boolean Value returns nothing
    native JNObjectUserGetBoolean takes string UserId, string Field returns boolean

    // JN Server Object Map
    native JNObjectMapInit takes string MapId, string SecretKey returns integer
    native JNObjectMapGetInt takes string Field returns integer
    native JNObjectMapGetReal takes string Field returns real
    native JNObjectMapGetString takes string Field returns string
    native JNObjectMapGetBoolean takes string Field returns boolean

    // JN PVP
    native JNPVPCharacter takes string UserId, string Character returns nothing
    native JNPVPKill takes string UserId returns nothing
    native JNPVPDeath takes string UserId returns nothing
    native JNPVPAssist takes string UserId returns nothing
    native JNPVPLog takes string UserId, string Log returns nothing
    native JNPVPWin takes string UserId, boolean Win returns nothing
    native JNSetPVPLog2 takes string MapId, string UserId, string SecretKey, string Character, boolean Win, integer Kill, integer Death, integer Assist, integer Point, string Loging returns string

    // AreaSteel
    native JNSetAreasteal takes string MapId, string UserId, string SecretKey, string Character, integer Area, integer Score returns string
    native JNRemoveAreasteal takes string MapId, string UserId, string SecretKey, string Character, integer Area returns string
    native JNGetMyAreastealScore takes string MapId, string UserId, string SecretKey, string Character, integer Area returns integer
    native JNInitBestAreastealtop10 takes string MapId, string UserId, string SecretKey, string Character, integer Area returns integer
    native JNGetBestAreasteal takes integer Area, integer Index, string Format returns string
    native JNInitBestMultiAreasteal takes string MapId, string UserId, string SecretKey, string Character, string Areas returns integer
    native JNGetMultipleBestAreasteal takes integer Area, string Format returns string

    // JN Group
    native JNUserJoinGroupInfo takes string MapId, string UserId, string SecretKey returns string
    native JNGroupManageLog takes string MapId, string UserId, string SecretKey, string Log returns string
    native JNGroupNumberGet takes string MapId, string UserId, string SecretKey, string Field returns real
    native JNGroupNumberAdd takes string MapId, string UserId, string SecretKey, string Field, real Number returns string
    native JNGroupStringGet takes string MapId, string UserId, string SecretKey, string Field returns string
    native JNGroupStringSet takes string MapId, string UserId, string SecretKey, string Field, string Set returns string

    // Mail
    native JNInitMail takes string MapId, string UserId, string SecretKey, string Character returns integer
    native JNGetMailItem takes integer Index returns string
    native JNGetMailMsg takes integer Index returns string
    native JNGetMailid takes integer Index returns string
    native JNGetMailremove takes string MapId, string UserId, string SecretKey, string Character, string Id returns boolean
endif
endlibrary