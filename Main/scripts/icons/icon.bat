@Echo off & Chcp 936 & Color 0b & MODE con: COLS=60 LINES=12>nul
@echo off
setlocal EnableDelayedExpansion
::----------------------------------------------------------------
for /f "tokens=*" %%i in ('dir /b /a-d *.ico') do (
	md "%%~ni">nul
	ren "%%i" "&M&m-gb5l-SgSN-%%i"
	move "&M&m-gb5l-SgSN-%%i" "%%~ni\">nul
	(echo [.ShellClassInfo]
		echo IconResource="&M&m-gb5l-SgSN-%%i",0
		)>"%%~ni\desktop.ini"
		attrib +s +h "%%~ni\desktop.ini"
		attrib +s +h "%%~ni\&M&m-gb5l-SgSN-%%i"
		attrib +r /s /d "%%~ni"
		)
::----------------------------------------------------------------
echo.
echo.
echo ���ļ���ͼ���޸ĳɹ����밴������رճ���
echo.
set /p a=���ļ���ͼ���ޱ仯������ 1 ˢ��ͼ�껺�棺
echo.
for %%i in (%a%) do (
	if %%i==1 call :aa
)
echo.
exit
 
:aa
taskkill /f /im explorer.exe
attrib -h -s -r "%userprofile%\AppData\Local\IconCache.db"
del /f "%userprofile%\AppData\Local\IconCache.db"
attrib /s /d -h -s -r "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\*"
del /f "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_32.db"
del /f "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_96.db"
del /f "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_102.db"
del /f "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_256.db"
del /f "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_1024.db"
del /f "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_idx.db"
del /f "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_sr.db"
echo y|reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v IconStreams
echo y|reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v PastIconsStream
start explorer