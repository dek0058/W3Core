library W3CDebug uses CoreDefine

function WriteLog takes string msg returns nothing
    static if REFORGED_MODE then
        call DisplayTimedTextToPlayer(LocalPlayer, 0, 0, 30., msg)
    else
        call JNWriteLog(msg)
    endif
endfunction

endlibrary
