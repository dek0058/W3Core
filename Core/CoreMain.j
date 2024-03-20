scope CoreMain initializer OnInit

    globals
        private trigger trig = null
        private triggeraction trig_action = null
        private event evt = null
    endglobals

    private function Update takes nothing returns nothing
        set GameTime = GameTime + DeltaTime

        if GameSeeker == GAME_SEEKER_INITIALIZE then
            
        elseif GameSeeker == GAME_SEEKER_PLAYING then

        elseif GameSeeker == GAME_SEEKER_PAUSE then

        endif

        call DisplayTextToPlayer(Player(0), 0.00, 0.00, R2S(GameTime))

    endfunction

    private function OnInit takes nothing returns nothing
        set trig = CreateTrigger()
        set trig_action = TriggerAddAction(trig, function Update)
        set evt = TriggerRegisterTimerEvent(trig, DeltaTime, true)
    endfunction

endscope