@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo ==============================
echo  restaurant-map  GitHubへ再UP
echo ==============================
echo.

git add -A

git diff --cached --quiet
if %errorlevel%==0 (
  echo 変更はありません。未pushのコミットがあれば送信します...
) else (
  for /f "tokens=1-3 delims=/ " %%a in ('date /t') do set TODAY=%%a-%%b-%%c
  git commit -m "Manual update %TODAY%"
  echo コミットしました。
)

echo.
echo GitHubへpush中...
git push

echo.
if %errorlevel%==0 (
  echo ✅ 完了：GitHubに反映されました。
) else (
  echo ⚠️ pushに失敗しました。メッセージを確認してください。
)
echo.
pause
