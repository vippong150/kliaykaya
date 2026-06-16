$verPath = "F:\scan\version.json"
$idxPath = "F:\scan\index.html"

# Bump version
$v = Get-Content $verPath -Raw | ConvertFrom-Json
$v.version = [int]$v.version + 1
$v | ConvertTo-Json -Compress | Set-Content $verPath -NoNewline

# Commit & push
Set-Location "F:\scan"
git add deploy.ps1 version.json index.html
git commit -m "deploy v$($v.version)"
git push
Write-Host "✅ Deployed v$($v.version)"
