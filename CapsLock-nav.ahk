#Requires AutoHotkey v2.0
SetCapsLockState("AlwaysOff")
SetCapsLockState("Off")

; Disable Caps Lock's default functionality, even with other modifiers
*CapsLock::return

#HotIf CapsLockNoSpace()
*Space::return
; Intellij Support

*i::SendInput("^+n")  ; Search files in IntelliJ


*k::SendInput("{Blind}{Up}")
*j::SendInput("{Blind}{Down}")
*h::SendInput("{Blind}{Left}")
*l::SendInput("{Blind}{Right}")

*t::Send("~")
*b::Send("``")  ; Sends backtick
*d::SendInput("{Blind}{Delete}")
*p::SendInput("{Blind}{PrintScreen}")
*u::SendInput("{Blind}{Escape}")
*y::SendInput("{Blind}{CapsLock}")

*f:: {
    SendInput("{Blind}{Ctrl down}{Tab}")
    while GetKeyState("f", "P")
        Sleep(10)
    SendInput("{Ctrl up}")
}

*g:: {
    SendInput("{Blind}{Alt down}{Tab}")
    while GetKeyState("g", "P")
        Sleep(10)
    SendInput("{Alt up}")
}

*n::SendInput("{Blind}{Alt down}{Insert}{Alt up}")
*o::SendInput("{Blind}{Shift down}{Escape}{Shift up}")
*m::SendInput("{Blind}{Backspace}")

v::SoundSetVolume("+5")
+v::SoundSetVolume("-5")

*,::Send("{Media_Prev}")
*.::Send("{Media_Next}")
/::Send("{Media_Play_Pause}")

*e::Send("^a")

*a:: {
    SendInput("{Ctrl down}")
    while GetKeyState("a", "P")
        Sleep(10)
    SendInput("{Ctrl up}")
}
*w::Send("^+e")
*s:: {
    SendInput("{Shift down}")
    while GetKeyState("s", "P")
        Sleep(10)
    SendInput("{Shift up}")
}

*;:: {
    if WinActive("ahk_exe idea64.exe")
        Send(",y")
    else
        Send("^c")
}

*'::Send("^v")

*1::workspaces(1)
*2::workspaces(2)
*3::workspaces(3)
*4::workspaces(4)
*5::workspaces(5)
*6::workspaces(6)
*7::workspaces(7)
*8::workspaces(8)
*9::workspaces(9)
#HotIf


#HotIf CapsLockAndSpace()
*Space::return
*t::Send("!{F12}")
*n::Send("+{F6}")

*p::switcher("s", "d") ; DB PANEL
*s::Send("!4") ; RUN
*d::Send("!5") ; DEBUG
*g::Send("{Ctrl down}{Enter}{Ctrl up}") ; Ctrl + Enter
*f::Send("{Ctrl down}{F5}{Ctrl up}")
*l:: {
        Send("{Ctrl down}{F4}")
        Sleep(10)
        Send("{Ctrl up}")
    }
*k::Send("{Ctrl down}{Shift down}t{Shift up}{Ctrl up}")
*i::Send("^i")
*o::Send("^o")
*w::Send("^b")
*e::Send("^+n")
*r::Send("^+f")
#HotIf



; Helper Functions

; triggerKey = key pressed when triggering
; switchKey = key to be pressed on the switcher
switcher(triggerKey, switchKey) {
    KeyWait(triggerKey)
    SetKeyDelay(0, 50)

    Send("{Ctrl down}{Tab}")
    Sleep(50)
    Send(switchKey)
    Send("{Ctrl up}")
}

workspaces(workspaceNumber) {
   Send("!" workspaceNumber)
}


; Layer Functions
CapsLockNoSpace() {
    return GetKeyState("CapsLock", "P") && !GetKeyState("Space", "P")
}

CapsLockAndSpace() {
    return GetKeyState("CapsLock", "P") && GetKeyState("Space", "P")
}