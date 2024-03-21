library W3Common
    static if REFORGED_MODE then
        globals
            private integer array powShift
            private player localPlayer
            private constant real DISPLAY_LOG_DURATION - 30.
        endglobals

        private struct Executor extends array
            private static method onInit takes nothing returns nothing
                local integer bit = 0
                loop
                    exitwhen bit > 0x20
                    set powShift[bit] = R2I(Pow(2, bit))
                    set bit = bit + 1
                endloop
            endmethod

            set localPlayer = GetLocalPlayer()
        endstruct
    else
        //! JN Bit
        native BitOr takes integer x, integer y returns integer
        native BitAnd takes integer x, integer y returns integer
        native BitXor takes integer x, integer y returns integer
        native BitShiftL takes integer x, integer y returns integer
        native BitShiftR takes integer x, integer y returns integer
        native I2R takes integer i returns real
        native R2I takes real r returns integer
        
        //! JN Memory plugin (reforged not supported)
        // globals
        //     constant hashtable JNProc_ht = InitHashtable()
        //     constant integer JNProc_key = StringHash("jass")

        //     constant integer JNProc__cdecl = 1
        //     constant integer JNProc__stdcall = 2
        //     constant integer JNProc__fastcall = 3
        //     constant integer JNProc__thiscall = 4
        // endglobals
        // native GetModuleHandle takes string moduleName returns integer
        // native FindModuleHandle takes integer offset, integer signature returns integer
        // native MemoryGetByte takes integer offset returns integer
        // native MemorySetByte takes integer offset, integer value returns nothing
        // native MemoryGetInteger takes integer offset returns integer
        // native MemorySetInteger takes integer offset, integer value returns nothing
        // native MemoryGetReal takes integer offset returns real
        // native MemorySetReal takes integer offset, real value returns nothing
        // native MemoryGetString takes integer offset, integer size returns string
        // native MemorySetString takes integer offset, string value, integer size returns nothing
        // native ProcCall takes integer callConv, integer address, hashtable ht returns boolean

        //! JN Miscellaneous
        native WriteLog takes string str returns nothing
        // [reforged not supported] native WriteLogReal takes real r returns nothing
        // [reforged not supported] native GetLocalDateTime takes nothing returns string
        // [reforged not supported] native GetLocalUnixTime takes nothing returns integer
        // [reforged not supported] native GetMaxAttackSpeed takes nothing returns real
        // [reforged not supported] native SetMaxAttackSpeed takes real speed returns nothing
        // [reforged not supported] native IsReplayMode takes nothing returns boolean
        // [reforged not supported] native IsHostPlayer takes nothing returns boolean
        // [reforged not supported] native GetSyncDelay takes nothing returns integer
        // [reforged not supported] native SetSyncDelay takes integer delay returns nothing
        // [reforged not supported] native GetConnectionState takes nothing returns integer
        // [reforged not supported] native ProcessStart takes string fileName, string arguments returns boolean

        //! JN Stopwatch
        // [reforged not supported] native StopwatchCreate takes nothing returns integer
        // [reforged not supported] native StopwatchStart takes integer id returns nothing
        // [reforged not supported] native StopwatchPause takes integer id returns nothing
        // [reforged not supported] native StopwatchReset takes integer id returns nothing
        // [reforged not supported] native StopwatchDestroy takes integer id returns nothing
        // [reforged not supported] native StopwatchElapsedMS takes integer id returns integer
        // [reforged not supported] native StopwatchElapsedSecond takes integer id returns integer
        // [reforged not supported] native StopwatchElapsedMinute takes integer id returns integer
        // [reforged not supported] native StopwatchElapsedHour takes integer id returns integer
        // [reforged not supported] native StopwatchTick takes integer returns real
        
        //! JN String
        native StringPos takes string str, string sub returns string
        native StringInsert takes string str, integer index, string val returns nothing
        native StringTrim takes string str returns string
        native StringTrimStart takes string str returns string
        native StringTrimEnd takes string str returns string
        native StringSplit takes string str, string sub, integer index returns string
        native StringReplace takes string str, string old, string newstr returns string
        native StringReverse takes string str returns string
        native StringContains takes string str, string sub returns boolean
        native StringCount takes string str, string sub returns integer
        native StringRegex takes string str, string regex, integer index returns string
        native StringSub takes string str, integer start, integer length returns string
        native StringLength takes string str returns integer
        native StringCalcLines takes string str, integer length returns integer
        native StringFromBase64 takes string str returns string
        native StringToBase64 takes string str returns string
        native StringEncrypt takes string plainText, string key returns string
        native StringDecrypt takes string chpherText, string key returns string
    endif

    function W3BitOr takes integer x, integer y returns integer
        static if REFORGED_MODE then
            return BlzBitOr(x, y)
        else
            return BitOr(x, y)
        endif
    endfunction

    function W3BitAnd takes integer x, integer y returns integer
        static if REFORGED_MODE then
            return BlzBitAnd(x, y)
        else
            return BitAnd(x, y)
        endif
    endfunction

    function W3BitXor takes integer x, integer y returns integer
        static if REFORGED_MODE then
            return BlzBitXor(x, y)
        else
            return BitXor(x, y)
        endif
    endfunction

    function W3BitShiftL takes integer x, integer y returns integer
        static if REFORGED_MODE then
            return x * powShift[y]
        else
            return BitShiftL(x, y)
        endif
    endfunction

    function W3BitShiftR takes integer x, integer y returns integer
        static if REFORGED_MODE then
            return R2I(x / powShift[y])
        else
            return BitShiftR(x, y)
        endif
    endfunction
    
    function W3WriteLog takes string str returns nothing
        static if REFORGED_MODE then
            call DisplayTimedTextToPlayer(localPlayer, 0, 0, DISPLAY_LOG_DURATION, str)
        else
            call WriteLog(str)
        endif
    endfunction

    function W3StringPos takes string str, string sub returns string
        static if REFORGED_MODE then
            // TODO: implement
        else
            return StringPos(str, sub)
        endif
    endfunction

    function W3StringInsert takes string str, integer index, string val returns nothing
        static if REFORGED_MODE then
            // TODO: implement
        else
            call StringInsert(str, index, val)
        endif
    endfunction
    
    function W3StringTrim takes string str returns string
        static if REFORGED_MODE then
            // TODO: implement
        else
            return StringTrim(str)
        endif
    endfunction
    
    function W3StringTrimStart takes string str returns string
        static if REFORGED_MODE then
            // TODO: implement
        else
            return StringTrimStart(str)
        endif
    endfunction
    
    function W3StringTrimEnd takes string str returns string
        static if REFORGED_MODE then
            // TODO: implement
        else
            return StringTrimEnd(str)
        endif
    endfunction
    
    function W3StringSplit takes string str, string sub, integer index returns string
        static if REFORGED_MODE then
            // TODO: implement
        else
            return StringSplit(str, sub, index)
        endif
    endfunction
    
    function W3StringReplace takes string str, string old, string newstr returns string
        static if REFORGED_MODE then
            // TODO: implement
        else
            return StringReplace(str, old, newstr)
        endif
    endfunction
    
    function W3StringReverse takes string str returns string
        static if REFORGED_MODE then
            // TODO: implement
        else
            return StringReverse(str)
        endif
    endfunction
    
    function W3StringContains takes string str, string sub returns boolean
        static if REFORGED_MODE then
            // TODO: implement
        else
            return StringContains(str, sub)
        endif
    endfunction
    
    function W3StringCount takes string str, string sub returns integer
        static if REFORGED_MODE then
            // TODO: implement
        else
            return StringCount(str, sub)
        endif
    endfunction
    
    function W3StringRegex takes string str, string regex, integer index returns string
        static if REFORGED_MODE then
            // TODO: implement
        else
            return StringRegex(str, regex, index)
        endif
    endfunction
    
    function W3StringSub takes string str, integer start, integer length returns string
        static if REFORGED_MODE then
            // TODO: implement
        else
            return StringSub(str, start, length)
        endif
    endfunction
    
    function W3StringLength takes string str returns integer
        static if REFORGED_MODE then
            // TODO: implement
        else
            return StringLength(str)
        endif
    endfunction
    
    function W3StringCalcLines takes string str, integer length returns integer
        static if REFORGED_MODE then
            // TODO: implement
        else
            return StringCalcLines(str, length)
        endif
    endfunction
    
    function W3StringFromBase64 takes string str returns string
        static if REFORGED_MODE then
            // TODO: implement
        else
            return StringFromBase64(str)
        endif
    endfunction
    
    function W3StringToBase64 takes string str returns string
        static if REFORGED_MODE then
            // TODO: implement
        else
            return StringToBase64(str)
        endif
    endfunction
    
    function W3StringEncrypt takes string plainText, string key returns string
        static if REFORGED_MODE then
            // TODO: implement
        else
            return StringEncrypt(plainText, key)
        endif
    endfunction
    
    function W3StringDecrypt takes string chpherText, string key returns string
        static if REFORGED_MODE then
            // TODO: implement
        else
            return StringDecrypt(chpherText, key)
        endif
    endfunction

endlibrary
