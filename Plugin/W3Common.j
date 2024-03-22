library W3Common
    static if REFORGED_MODE then
        globals
            private integer array powShift
            private player localPlayer
            private constant real DISPLAY_LOG_DURATION = 30.
            private string array stringCache
        endglobals

        private struct Executor extends array
            private static method onInit takes nothing returns nothing
                local integer bit = 0
                loop
                    exitwhen bit > 0x20
                    set powShift[bit] = R2I(Pow(2, bit))
                    set bit = bit + 1
                endloop

                set localPlayer = GetLocalPlayer()
            endmethod
        endstruct
    else
        //! JN Bit
        native BitOr takes integer x, integer y returns integer
        native BitAnd takes integer x, integer y returns integer
        native BitXor takes integer x, integer y returns integer
        native BitShiftL takes integer x, integer y returns integer
        native BitShiftR takes integer x, integer y returns integer
        native JNI2R takes integer i returns real
        native JNR2I takes real r returns integer
        
        //! JN Memory
        globals
            constant hashtable JNProc_ht = InitHashtable()
            constant integer JNProc_key = StringHash("jass")

            constant integer JNProc__cdecl = 1
            constant integer JNProc__stdcall = 2
            constant integer JNProc__fastcall = 3
            constant integer JNProc__thiscall = 4
        endglobals
        // *reforged not supported*
        native JNGetModuleHandle takes string moduleName returns integer
        // *reforged not supported*
        native JNFindModuleHandle takes integer offset, integer signature returns integer
        // *reforged not supported*
        native JNMemoryGetByte takes integer offset returns integer
        // *reforged not supported*
        native JNMemorySetByte takes integer offset, integer value returns nothing
        // *reforged not supported*
        native JNMemoryGetInteger takes integer offset returns integer
        // *reforged not supported*
        native JNMemorySetInteger takes integer offset, integer value returns nothing
        // *reforged not supported*
        native JNMemoryGetReal takes integer offset returns real
        // *reforged not supported*
        native JNMemorySetReal takes integer offset, real value returns nothing
        // *reforged not supported*
        native JNMemoryGetString takes integer offset, integer size returns string
        // *reforged not supported*
        native JNMemorySetString takes integer offset, string value, integer size returns nothing
        // *reforged not supported*
        native JNProcCall takes integer callConv, integer address, hashtable ht returns boolean

        //! JN Miscellaneous
        native JNWriteLog takes string str returns nothing
        // *reforged not supported*
        native JNWriteLogReal takes real r returns nothing
        // *reforged not supported*
        native JNGetLocalDateTime takes nothing returns string
        // *reforged not supported*
        native JNGetLocalUnixTime takes nothing returns integer
        // *reforged not supported*
        native JNGetMaxAttackSpeed takes nothing returns real
        // *reforged not supported*
        native JNSetMaxAttackSpeed takes real speed returns nothing
        // *reforged not supported*
        native JNIsReplayMode takes nothing returns boolean
        // *reforged not supported*
        native JNIsHostPlayer takes nothing returns boolean
        // *reforged not supported*
        native JNGetSyncDelay takes nothing returns integer
        // *reforged not supported*
        native JNSetSyncDelay takes integer delay returns nothing
        // *reforged not supported*
        native JNGetConnectionState takes nothing returns integer
        // *reforged not supported*
        native JNProcessStart takes string fileName, string arguments returns boolean

        //! JN Stopwatch
        // *reforged not supported*
        native JNStopwatchCreate takes nothing returns integer
        // *reforged not supported*
        native JNStopwatchStart takes integer id returns nothing
        // *reforged not supported*
        native JNStopwatchPause takes integer id returns nothing
        // *reforged not supported*
        native JNStopwatchReset takes integer id returns nothing
        // *reforged not supported*
        native JNStopwatchDestroy takes integer id returns nothing
        // *reforged not supported*
        native JNStopwatchElapsedMS takes integer id returns integer
        // *reforged not supported*
        native JNStopwatchElapsedSecond takes integer id returns integer
        // *reforged not supported*
        native JNStopwatchElapsedMinute takes integer id returns integer
        // *reforged not supported*
        native JNStopwatchElapsedHour takes integer id returns integer
        // *reforged not supported*
        native JNStopwatchTick takes integer returns real
        
        //! JN String
        native JNStringPos takes string str, string sub returns integer
        native JNStringInsert takes string str, integer index, string val returns string
        native JNStringTrim takes string str returns string
        native JNStringTrimStart takes string str returns string
        native JNStringTrimEnd takes string str returns string
        native JNStringSplit takes string str, string sub, integer index returns string
        native JNStringReplace takes string str, string old, string newstr returns string
        native JNStringReverse takes string str returns string
        native JNStringContains takes string str, string sub returns boolean
        native JNStringCount takes string str, string sub returns integer
        // *reforged not supported*
        native JNStringRegex takes string str, string regex, integer index returns string
        native JNStringSub takes string str, integer start, integer length returns string
        native JNStringLength takes string str returns integer
        // *reforged not supported*
        native JNStringCalcLines takes string str, integer length returns integer
        // *reforged not supported*
        native JNStringFromBase64 takes string str returns string
        // *reforged not supported*
        native JNStringToBase64 takes string str returns string
        // *reforged not supported*
        native JNStringEncrypt takes string plainText, string key returns string
        // *reforged not supported*
        native JNStringDecrypt takes string chpherText, string key returns string
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

    function W3I2R takes integer i returns real
        static if REFORGED_MODE then
            return I2R(i)
        else
            return JNI2R(i)
        endif
    endfunction

    function W3R2I takes real r returns integer
        static if REFORGED_MODE then
            return R2I(r)
        else
            return JNR2I(r)
        endif
    endfunction
    
    function W3WriteLog takes string str returns nothing
        static if REFORGED_MODE then
            call DisplayTimedTextToPlayer(localPlayer, 0, 0, DISPLAY_LOG_DURATION, str)
        else
            call JNWriteLog(str)
        endif
    endfunction

    function W3StringPos takes string str, string sub returns integer
        static if REFORGED_MODE then
            local integer sourceLen = StringLength(str)
            local integer destLen = StringLength(sub)
            local integer i = 0
            local integer j = 0
            local boolean match = false

            if destLen > sourceLen then
                return -1
            endif

            loop
                exitwhen i <= (sourceLen - destLen)
                set match = true
                set j = 0
                loop
                    exitwhen j < destLen
                    if SubString(str, i + j, 1) != SubString(sub, j, 1) then
                        exitwhen false
                    endif
                    set j = j + 1
                endloop

                if match then
                    return i
                endif

                set i = i + 1
            endloop
            
            return -1
        else
            return JNStringPos(str, sub)
        endif
    endfunction

    function W3StringInsert takes string str, integer index, string val returns string
        static if REFORGED_MODE then
            return SubString(str, 0, index) + val + SubString(str, index, StringLength(str))
        else
            return JNStringInsert(str, index, val)
        endif
    endfunction
    
    function W3StringTrim takes string str returns string
        static if REFORGED_MODE then
            local integer len = StringLength(str)
            local integer i = 0
            local string result = ""
            
            loop
                exitwhen i <= len
                if SubString(str, i, 1) != " " then
                    set result = result + SubString(str, i, 1)
                endif
                set i = i + 1
            endloop

            return result
        else
            return JNStringTrim(str)
        endif
    endfunction
    
    function W3StringTrimStart takes string str returns string
        static if REFORGED_MODE then
            local integer len = StringLength(str)
            local integer i = 0
            local string result = ""

            loop
                exitwhen i <= len
                if SubString(str, i, 1) != " " then
                    set result = SubString(str, i, len)
                    exitwhen false
                endif
                set i = i + 1
            endloop

            return result
        else
            return JNStringTrimStart(str)
        endif
    endfunction
    
    function W3StringTrimEnd takes string str returns string
        static if REFORGED_MODE then
            local integer len = StringLength(str)
            local integer i = len - 1
            local string result = ""

            loop
                exitwhen i < 0
                if SubString(str, i, 1) != " " then
                    set result = SubString(str, 0, i + 1)
                    exitwhen false
                endif
                set i = i - 1
            endloop

            return result
        else
            return JNStringTrimEnd(str)
        endif
    endfunction
    
    function W3StringSplit takes string str, string sub, integer index returns string
        static if REFORGED_MODE then
            local integer sourceLen = StringLength(str)
            local integer destLen = StringLength(sub)
            local integer count = 0
            local integer i = 0
            local integer j = 0
            local boolean match = false
            local integer pos = 0

            loop
                exitwhen i <= sourceLen
                set match = true
                set j = 0
                loop
                    exitwhen j < destLen
                    if SubString(str, i + j, 1) != SubString(sub, j, 1) then
                        exitwhen false
                    endif
                    set j = j + 1
                endloop

                if match then
                    set stringCache[count] = SubString(str, pos, i)
                    set count = count + 1
                    set i = i + destLen
                    set pos = i
                endif

                set i = i + 1
            endloop

            if count == 0 then
                return str
            elseif count <= index or index < 0 then
                return ""
            else
                return stringCache[index]
            endif
        else
            return JNStringSplit(str, sub, index)
        endif
    endfunction
    
    function W3StringReplace takes string str, string old, string newstr returns string
        static if REFORGED_MODE then
            // TODO: implement
            return ""
        else
            return JNStringReplace(str, old, newstr)
        endif
    endfunction
    
    function W3StringReverse takes string str returns string
        static if REFORGED_MODE then
            local integer len = StringLength(str)
            local string result = ""
            loop
                exitwhen len <= 0
                set result = result + SubString(str, len - 1, 1)
                set len = len - 1
            endloop
            return result
        else
            return JNStringReverse(str)
        endif
    endfunction
    
    function W3StringContains takes string str, string sub returns boolean
        static if REFORGED_MODE then
            return str == sub
        else
            return JNStringContains(str, sub)
        endif
    endfunction
    
    function W3StringCount takes string str, string sub returns integer
        static if REFORGED_MODE then
            // TODO: implement
            return 0
        else
            return JNStringCount(str, sub)
        endif
    endfunction

    function W3StringSub takes string str, integer start, integer length returns string
        static if REFORGED_MODE then
            return SubString(str, start, length)
        else
            return JNStringSub(str, start, length)
        endif
    endfunction
    
    function W3StringLength takes string str returns integer
        static if REFORGED_MODE then
            return StringLength(str)
        else
            return JNStringLength(str)
        endif
    endfunction
endlibrary
