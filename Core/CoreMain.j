scope CoreMain initializer OnInit

    globals
        private trigger trig = null
        private triggeraction trig_action = null
        private event evt = null
    endglobals

    private function Update takes nothing returns nothing
        set GameTime = GameTime + DeltaTime

        
        if GameSeeker == GAME_SEEKER_NONE then
            set GameSeeker = GAME_SEEKER_INITIALIZE
        elseif GameSeeker == GAME_SEEKER_INITIALIZE then
            call CallInit()
        elseif GameSeeker == GAME_SEEKER_PLAYING then

        elseif GameSeeker == GAME_SEEKER_PAUSE then

        endif

    endfunction

    private function OnInit takes nothing returns nothing
        set trig = CreateTrigger()
        set trig_action = TriggerAddAction(trig, function Update)
        set evt = TriggerRegisterTimerEvent(trig, DeltaTime, true)
    endfunction

endscope