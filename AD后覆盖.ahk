﻿/*
黑钨重工出品 免费开源 请勿商用 侵权必究
更多免费教程尽在QQ群 1群763625227 2群643763519
*/

full_command_line := DllCall("GetCommandLine", "str")

if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
  try
  {
    if A_IsCompiled
      Run *RunAs "%A_ScriptFullPath%" /restart
    else
      Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
  }
  ExitApp
}

Process, Priority, , Realtime
#MenuMaskKey vkE8
#WinActivateForce
#InstallKeybdHook
#InstallMouseHook
#Persistent
#NoEnv
#SingleInstance Force
#MaxHotkeysPerInterval 2000
#KeyHistory 2000
SendMode Input
SetBatchLines -1
CoordMode Pixel Screen
CoordMode ToolTip Screen
SetKeyDelay -1, 20
SetWorkingDir %A_ScriptDir%

running:=1 ;1为运行 0为暂停
Menu, Tray, NoStandard ;不显示默认的AHK右键菜单
Menu, Tray, Add, 使用教程, 使用教程 ;添加新的右键菜单
Menu, Tray, Add, 暂停运行, 暂停运行 ;添加新的右键菜单
Menu, Tray, Add, 退出软件, 退出软件 ;添加新的右键菜单
return

使用教程:
MsgBox, , 按键后覆盖, 黑钨重工出品 免费开源 请勿商用 侵权必究`n`n默认覆盖字母A和D`n如果需要覆盖其他键位`n根据需求自行更改源代码`n`n更多免费教程尽在QQ群 1群763625227 2群643763519
return

暂停运行:
Critical, On
if (running=0)
{
  running:=1
  Hotkey, s, On
  Hotkey, f, On
  Menu, Tray, UnCheck, 暂停运行 ;右键菜单不打勾
}
else
{
  running:=0
  Hotkey, s, Off
  Hotkey, f, Off
  Menu, Tray, Check, 暂停运行 ;右键菜单不打勾
}
Critical, Off
return

退出软件:
ExitApp

~$f:: ;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<改键改字母成你需要的按键 右
if (热键开关f=0)
{
  return
}
右移动:
热键开关s:=0
if GetKeyState("s", "P")
{
  Send {s Up}
}
Critical On
loop
{
  if !GetKeyState("f", "P")
  {
    if GetKeyState("s", "P")
    {
      反向:=0
      break
    }
    else
    {
      热键开关s:=1
      Critical Off
      return
    }
  }
  else if !GetKeyState("s", "P") and (反向=1)
  {
    反向:=0
  }
  else if GetKeyState("s", "P") and (反向!=1)
  {
    break
  }
}
Send {s Down}
反向:=1
热键开关s:=1
Critical Off
goto 左移动

~$s:: ;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<改键改字母成你需要的按键 左
if (热键开关f=0)
{
  return
}
左移动:
热键开关s:=0
if GetKeyState("f", "P")
{
  Send {f Up}
}
loop
{
  Critical On
  if !GetKeyState("s", "P")
  {
    if GetKeyState("f", "P")
    {
      反向:=0
      Critical Off
      break
    }
    else
    {
      Critical Off
      热键开关f:=1
      return
    }
  }
  else if !GetKeyState("f", "P") and (反向=1)
  {
    反向:=0
  }
  else if GetKeyState("f", "P") and (反向!=1)
  {
    break
  }
}
Send {f Down}
反向:=1
热键开关f:=1
Critical Off
goto 右移动


~$v:: ;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<改键改字母成你需要的按键 上
if (热键开关e=0)
{
  return
}
上移动:
热键开关e:=0
if GetKeyState("e", "O")
{
  Send {e Up}
}
Critical On
loop
{
  if !GetKeyState("v", "O")
  {
    if GetKeyState("e", "O")
    {
      反向:=0
      break
    }
    else
    {
      热键开关v:=1
      Critical Off
      return
    }
  }
  else if !GetKeyState("e", "O") and (反向=1)
  {
    反向:=0
  }
  else if GetKeyState("e", "O") and (反向!=1)
  {
    break
  }
}
Send {e Down}
反向:=1
热键开关s:=1
Critical Off
goto 上移动

~$d:: ;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<改键改字母成你需要的按键 下
if (热键开关e=0)
{
  return
}
下移动:
热键开关v:=0
if GetKeyState("v", "O")
{
  Send {w Up}
}
loop
{
  Critical On
  if !GetKeyState("e", "O")
  {
    if GetKeyState("v", "O")
    {
      反向:=0
      Critical Off
      break
    }
    else
    {
      Critical Off
      热键开关e:=1
      return
    }
  }
  else if !GetKeyState("v", "O") and (反向=1)
  {
    反向:=0
  }
  else if GetKeyState("v", "O") and (反向!=1)
  {
    break
  }
}
Send {v Down}
反向:=1
热键开关v:=1
Critical Off
goto 下移动
