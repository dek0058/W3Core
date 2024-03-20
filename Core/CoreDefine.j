library CoreDefine initializer OnInit

    globals
        constant real DeltaTime = 0.033
        real GameTime = 0.00
    endglobals

    globals
        constant integer GAME_SEEKER_INITIALIZE = 0
        constant integer GAME_SEEKER_PLAYING = 1
        constant integer GAME_SEEKER_PAUSE = 2
        integer GameSeeker = GAME_SEEKER_INITIALIZE
    endglobals

    globals
        player LocalPlayer 
    endglobals

    private function OnInit takes nothing returns nothing
        // TODO: Init
        set LocalPlayer = GetLocalPlayer()
    endfunction

endlibrary