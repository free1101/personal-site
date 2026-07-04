@echo off
set "PATH=D:\Program Files\Git\mingw64\bin;%PATH%"
cd /d F:\personal-site

echo ========================================
echo   Deploy Script for personal-site
echo ========================================
echo.

echo [1/3] Staging all changes...
git add .
if %errorlevel% neq 0 (
    echo [FAIL] git add failed!
    pause
    exit /b %errorlevel%
)
echo [OK] Done
echo.

echo [2/3] Committing changes...
git commit -m "update site"
if %errorlevel% neq 0 (
    echo [WARN] Nothing to commit or commit failed
)
echo.

echo [3/3] Pushing to GitHub...
git push origin master
if %errorlevel% neq 0 (
    echo [FAIL] Push failed! Check network or permissions.
    pause
    exit /b %errorlevel%
)
echo [OK] Push succeeded!
echo.

echo ========================================
echo   Deploy complete! Cloudflare Pages will auto-deploy.
echo ========================================
pause
