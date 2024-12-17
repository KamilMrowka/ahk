SetCapsLockState, AlwaysOff
SetCapsLockState, Off

; Disable Caps Lock's default functionality, even with other modifiers
*CapsLock::Return

#If GetKeyState("CapsLock", "P")

*k::
    SendInput {Blind}{Up}
    Return

*j::
    SendInput {Blind}{Down}
    Return

*h::
    SendInput {Blind}{Left}
    Return

*l::
    SendInput {Blind}{Right}
    Return


*t::
    Send {`~}
    Return

*b::
    Send {``}
    Return

*d::
    SendInput {Blind}{Delete}
    Return

*p::
    SendInput {Blind}{PrintScreen}
    Return

*u::
    SendInput {Blind}{Escape}
    Return

*y::
    SendInput {Blind}{CapsLock}
    Return

*f::
    SendInput {Blind}{Control down}{Tab}
    While GetKeyState("f", "P")
        Sleep, 10
    SendInput {Control up}
    Return


*g::
    SendInput {Blind}{Alt down}{Tab}
    While GetKeyState("g", "P")
        Sleep, 10
    SendInput {Alt up}
    Return

*n::
    SendInput {Blind}{Alt down}{Insert}{Alt up}
    Return


*o::
    SendInput {Blind}{Shift down}{Escape}{Shift up}
    Return

*w::
    SendInput {Blind}{Alt down}1{Alt up}
    Return

*m::
    SendInput {Blind}{Backspace}
    Return

v::Volume_Up

+v::Volume_Down

*,::Media_Prev

*.::Media_Next

/::
    SendInput {Media_Play_Pause}
    Return

*s::
    SendInput {Ctrl Down}
    While GetKeyState("s", "P")
        Sleep, 10
    SendInput {Ctrl Up}
    Return
*Space::
    SendInput {Ctrl Down}{Shift Down}
    While GetKeyState("Space", "P")
        Sleep, 10
    SendInput {Shift Up}{Ctrl Up}
    Return

*a::
    SendInput {Shift Down}
    While GetKeyState("a", "P")
        Sleep, 10
    SendInput {Shift Up}
    Return

*;::
    SendInput {Ctrl Down}c{Ctrl Up}
    Return

*'::
    SendInput {Ctrl Down}v{Ctrl Up}
    Return