@echo off
cd /d "%~dp0"

echo ============================================
echo  VideoSeller AI - Public Dashboard
echo ============================================
echo.
echo  Frontend  ^>  http://localhost:3000
echo  Backend   ^>  http://localhost:8080 (ตองเปิด WebServer หลักก่อน)
echo.
echo  กด Ctrl+C เพื่อหยุด
echo.

start http://localhost:3000
npx serve . -l 3000 --cors

pause
