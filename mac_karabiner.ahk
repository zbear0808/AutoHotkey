; === AutoHotkey Script (v2.0) ===

; Translated from a Karabiner JSON configuration.
;
; To use this:
; 1. Install AutoHotkey (v2.0 or later) from <https://www.autohotkey.com/>
; 2. Save this file as "karabiner_port_v2.ahk" (or any name ending in .ahk).
; 3. Double-click the file to run the script. It will run in the background.


; ---
; Karabiner Rule: "Change shift + backspace to delete"
; ---
+Backspace::Delete

; ---
; Karabiner Rule: "Change right_command+ijkl; to arrow keys"
; ---
RAlt:: {
    KeyWait("RAlt")
}

#HotIf GetKeyState("RAlt", "P")
*i::Up
*k::Down
*j::Left
*l::Right
*u:: {
    if GetKeyState("Shift", "P")
        Send("{Ctrl Down}{Shift Down}{Left}{Shift Up}{Ctrl Up}")
    else
        Send("{Ctrl Down}{Left}{Ctrl Up}")
}
*o:: {
    if GetKeyState("Shift", "P")
        Send("{Ctrl Down}{Shift Down}{Right}{Shift Up}{Ctrl Up}")
    else
        Send("{Ctrl Down}{Right}{Ctrl Up}")
}
*h:: {
    if GetKeyState("Shift", "P")
        Send("{Shift Down}{Home}{Shift Up}")
    else
        Send("{Home}")
}
*;:: {
    if GetKeyState("Shift", "P")
        Send("{Shift Down}{End}{Shift Up}")
    else
        Send("{End}")
}
*8:: {
    if GetKeyState("Shift", "P")
        Send("{Ctrl Down}{Shift Down}{Home}{Shift Up}{Ctrl Up}")
    else
        Send("{Ctrl Down}{Home}{Ctrl Up}")
}
*,:: {
    if GetKeyState("Shift", "P")
        Send("{Ctrl Down}{Shift Down}{End}{Shift Up}{Ctrl Up}")
    else
        Send("{Ctrl Down}{End}{Ctrl Up}")
}

*Space::Send("{Ctrl Down}{Space}{Ctrl Up}") ; for raycast

; Passthrough for other common keys - sends them with RAlt as modifier
*Enter::Send("{RAlt Down}{Enter}{RAlt Up}")
*Tab::Send("{RAlt Down}{Tab}{RAlt Up}")
*Escape::Send("{RAlt Down}{Escape}{RAlt Up}")
*Backspace::Send("{RAlt Down}{Backspace}{RAlt Up}")
*Delete::Send("{RAlt Down}{Delete}{RAlt Up}")
*F1::Send("{RAlt Down}{F1}{RAlt Up}")
*F2::Send("{RAlt Down}{F2}{RAlt Up}")
*F3::Send("{RAlt Down}{F3}{RAlt Up}")
*F4::Send("{RAlt Down}{F4}{RAlt Up}")
*F5::Send("{RAlt Down}{F5}{RAlt Up}")
*F6::Send("{RAlt Down}{F6}{RAlt Up}")
*F7::Send("{RAlt Down}{F7}{RAlt Up}")
*F8::Send("{RAlt Down}{F8}{RAlt Up}")
*F9::Send("{RAlt Down}{F9}{RAlt Up}")
*F10::Send("{RAlt Down}{F10}{RAlt Up}")
*F11::Send("{RAlt Down}{F11}{RAlt Up}")
*F12::Send("{RAlt Down}{F12}{RAlt Up}")
#HotIf

;; same as above, but let's you use RAlt as a modifier for other combos
;; This one doesn't completely swallow Ralt, but is annoying to use in vscode
;; bc the alt button press triggers menu access
; #HotIf GetKeyState("RAlt", "P")
; *i::Send("{Blind}{RAlt Up}{Up}")
; *k::Send("{Blind}{RAlt Up}{Down}")
; *j::Send("{Blind}{RAlt Up}{Left}")
; *l::Send("{Blind}{RAlt Up}{Right}")
; #HotIf




; ---
; Karabiner Rule: "Change caps_lock to command+control+option+shift."
; ---
; remaps CapsLock to send the "Hyper" key combination:
; Ctrl + Alt + Shift
;

SetCapsLockState("AlwaysOff")
CapsLock:: {
    Send("{Control Down}{Alt Down}{Shift Down}")
}
CapsLock Up:: {
    Send("{Control Up}{Alt Up}{Shift Up}")
}

; Capslock + J or L to Back/Forward mouse button
^!+j::Click("X1")
^!+l::Click("X2")


; alt and ctrl combinations, left alt and ctrl already swapped via sharpkeys 
; switching via ahk would cause conflicts
LCtrl & Tab::AltTab 
LAlt & Tab::Send("{LCtrl Down}{Tab}{LCtrl Up}")

; Swap Alt+F4 and Ctrl+F4
LAlt & F4::Send("{LCtrl Down}{F4}{LCtrl Up}")
LCtrl & F4::Send("{LAlt Down}{F4}{LAlt Up}")




; copilot key rebind 
; partially doesn't work, if you hold down key for long enough it triggers win shift
*<+<#f23:: {
    Send("{Blind}{LShift Up}{LWin Up}{RControl Down}")
    KeyWait("F23")
    Send("{RControl up}")
}
