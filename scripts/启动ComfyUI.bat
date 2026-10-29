@echo off
chcp 65001 >nul
title ComfyUI Launcher
rem ============ 一键启动：后端(8188) + Comfy Desktop ============

curl.exe -sf -o NUL --max-time 2 http://127.0.0.1:8188/system_stats
if %errorlevel%==0 goto backend_ok

echo [1/3] 启动后端(8188)... 已最小化到任务栏，关闭那个窗口=停止服务
start "ComfyUI Backend 8188 (close=stop)" /min cmd /k "cd /d D:\LocalAI\ComfyUI_windows_portable && python_embeded\python.exe -s ComfyUI\main.py --windows-standalone-build"

echo       等待后端就绪(最多2分钟)...
set /a n=0
:wait
curl.exe -sf -o NUL --max-time 2 http://127.0.0.1:8188/system_stats
if %errorlevel%==0 goto backend_ok
set /a n+=1
if %n% geq 60 (echo 后端启动超时，请查看后台窗口的报错 & pause & exit /b 1)
timeout /t 2 /nobreak >nul
goto wait

:backend_ok
echo [2/3] 后端已就绪: http://127.0.0.1:8188
echo [3/3] 打开 Comfy Desktop (在软件里点: 远程连接 -^> 127.0.0.1:8188)...
start "" "E:\application\Comfy Desktop\Comfy Desktop.exe"
exit /b 0
