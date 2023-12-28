; Scale an x coordinate based on 1920 screen width to current width
ScaleX(x)
{
 return Round(x * (A_ScreenWidth / 1920))
}

; Scale a y coordinate based on 1080 screen height to current height
ScaleY(y)
{
 return Round(y * (A_ScreenHeight / 1080))
}

; q::e means when you press q, e is pressed instead
; ^ is Ctrl, ! is Alt, + is Shift, # is Win

; the code below will only run for CK3
#ifWinActive, ahk_exe ck3.exe


^CapsLock::
global OCR := "CAPS"
MsgBox NVDA key is set to CAPS LOCK
return

^Insert::
global OCR := "Insert"
MsgBox NVDA key is set to Insert
return

^NumpadIns::
global OCR := "Num"
MsgBox NVDA key is set to Numpad Insert
return


RouteMouse()
{
  if (GetKeyState("NumLock", "T"))  ; get the toggle-state of NumLock
  {
    SetNumLockState, Off
  }
  if ( OCR = "Num" )
  {
    SendInput, {NumpadIns down}
  }
  else if ( OCR = "CAPS" )
  {
    SendInput, {CapsLock down}
  }
  else
  {
    SendInput, {Insert down}
  }

  SendInput, {NumpadDiv}
  SendInput, {Shift M}
  Sleep, 50
  mousemove, 2, 2, 0, R

  if ( OCR = "Num" )
  {
    SendInput, {NumpadIns up}
  }
  else if ( OCR = "CAPS" )
  {
    SendInput, {CapsLock up}
  }
  else
  {
    SendInput, {Insert up}
  }
  return
}

OCR()
{
  if (GetKeyState("NumLock", "T"))  ; get the toggle-state of NumLock
  {
    SetNumLockState, Off
  }
  if ( OCR = "Num" )
  {
    SendInput, {NumpadIns down}
  }
  else if ( OCR = "CAPS" )
  {
    SendInput, {CapsLock down}
  }
  else
  {
    SendInput, {Insert down}
  }

  SendInput, r

  if ( OCR = "Num" )
  {
    SendInput, {NumpadIns up}
  }
  else if ( OCR = "CAPS" )
  {
    SendInput, {CapsLock up}
  }
  else
  {
    SendInput, {Insert up}
  }
  return
}


`::
Send, {Escape}
OCR()
return

; left click
/::
RouteMouse()

Sleep, 50
Click
Sleep, 300
mousemove, % ScaleX("1919"), 0, 0
Send, {Escape}

OCR()
return

; control click
^/::
RouteMouse()

Sleep, 50
ControlClick
Sleep, 300
mousemove, % ScaleX("1919"), 0, 0
Send, {Escape}

OCR()
return

; control click
+/::
RouteMouse()
Sleep, 300
Send, {Escape}

OCR()
return

; right click
\::
RouteMouse()

Sleep, 50
Click, Right
Sleep, 300
mousemove, % ScaleX("1919"), 0, 0
Send, {Escape}

OCR()
return

#F2::`

; scroll up or down with shift up or down
+Down::
Send {WheelDown 10}
return

+Up::
Send {WheelUp 10}
return

; disable sound effects with shift F12
+F12::
T := !T
return

; control+shift+c centers the mouse
^+c::
mousemove, % ScaleX("960"), ScaleY("540"), 0
MouseGetPos, xpos, ypos
if (ScaleX(xpos) = 960 and ScaleY(ypos) = 540 and !T )
{
  SoundPlay, C:\Windows\media\Windows Ding.wav
}
return

; dismiss tooltips with control shift d
^+d::
mousemove, % ScaleX("1919"), 0, 0
if !T
  SoundPlay, C:\Windows\media\Windows Recycle.wav
Sleep, 300
Send, {Escape}

OCR()
return

; dismiss tooltips with control d
^d::
mousemove, % ScaleX("1919"), 0, 0
if !T
  SoundPlay, C:\Windows\media\Windows Recycle.wav
return

; shift+1 centers the cursor, clicks and moves away
+1::
mousemove, % ScaleX("960"), ScaleY("540"), 0
MouseGetPos, xpos, ypos
if ( ScaleX(xpos) = 960 AND ScaleY(ypos) = 540 AND !T)
{
  SoundPlay, C:\Windows\media\Windows Ding.wav
}
Click
Sleep, 100
mousemove, % ScaleX("1919"), 0, 0
return

; control 2 centers the cursor and clicks
^2::
mousemove, % ScaleX("960"), ScaleY("540"), 0
MouseGetPos, xpos, ypos
if (ScaleX(xpos) = 960 and ScaleY(ypos) = 540 and !T)
{
  SoundPlay, C:\Windows\media\Windows Ding.wav
}
Click, Right
Sleep, 100
mousemove, % ScaleX("1919"), 0, 0
return

; shift 3 centers the cursor and right-clicks
+3::
mousemove, % ScaleX("960"), ScaleY("540"), 0
MouseGetPos, xpos, ypos
if (ScaleX(xpos) = 960 and ScaleY(ypos) = 540 and !T)
{
  SoundPlay, C:\Windows\media\Windows Default.wav
}
SendInput {ShiftDown}
Click, Right
SendInput {ShiftUp}
Sleep, 100
mousemove, % ScaleX("1919"), 0, 0
return

; control+g selects armies in the center of the screen
^g::
mousemove, % ScaleX("700"), ScaleY("300"), 0
SendInput {LButton down}
Sleep, 150
mousemove, % ScaleX("1200"), ScaleY("800"), 0
Sleep, 150
SendInput {LButton up}
Sleep, 150
mousemove, % ScaleX("1919"), 0, 0
return
; Control F performs a control click


#ifWinActive
