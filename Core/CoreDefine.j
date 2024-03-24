library CoreDefine initializer OnInit uses Table

    globals
        constant integer NULL = 0
        constant real DeltaTime = 0.033
        real GameTime = 0.00
    endglobals

    globals
        constant integer GAME_SEEKER_PAUSE = -1
        constant integer GAME_SEEKER_NONE = 0
        constant integer GAME_SEEKER_INITIALIZE = 1
        constant integer GAME_SEEKER_INITIALIZE_FINISH = 2
        constant integer GAME_SEEKER_PLAYING = 10

        integer GameSeeker = GAME_SEEKER_NONE

        Table InitTable = NULL

        private constant string preInitToken = "PreLoad"
        private integer preInitCount = 0
    endglobals

    globals
        player LocalPlayer 
    endglobals

    function FinishInit takes nothing returns nothing
        //debug call W3WriteLog("call FinishInit")
        if InitTable != NULL then
            call InitTable.delete(preInitToken)
            call InitTable.destroy()
            set InitTable = NULL
        endif
    endfunction

    function AddInit takes code callaback returns nothing
        local trigger t = CreateTrigger()
        local Table tempTable = NULL

        call TriggerAddAction(t, callaback)

        if InitTable == NULL then
            set InitTable = Table.create()
        endif
        
        set tempTable = InitTable.join(preInitToken)
        call BJDebugMsg("AddInit1 : " + I2S(tempTable))
        call BJDebugMsg("AddInit2 : " + I2S(InitTable.join(preInitToken).trigger))
        set InitTable.join(preInitToken).trigger[preInitCount] = t
        
        set preInitCount = preInitCount + 1
    endfunction

    function CallInit takes nothing returns nothing
        local Table tempTable = NULL

        if InitTable != NULL then
            if preInitCount > 0 then
                set tempTable = InitTable.join(preInitToken)
                call BJDebugMsg("CallInit1 : " + I2S(tempTable))
                call BJDebugMsg("CallInit2 : " + I2S(InitTable.join(preInitToken).trigger))

                set preInitCount = preInitCount - 1
                call TriggerExecute(InitTable.join(preInitToken).trigger[preInitCount])
            else
                call FinishInit()
            endif
        endif
    endfunction

    function TestA takes nothing returns nothing
        call BJDebugMsg("생성됨?")
        call CreateUnit(Player(0), 'hfoo', 0, 0, 0)
    endfunction

    private function OnInit takes nothing returns nothing
        set LocalPlayer = GetLocalPlayer()

        call AddInit(function TestA)
    endfunction

endlibrary