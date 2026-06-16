$verPath = "F:\scan\version.json"
$idxPath = "F:\scan\index.html"
$remote = "https://vippong150:TOKEN@github.com/vippong150/kliaykaya.git"

# Bump version
$v = Get-Content $verPath -Raw | ConvertFrom-Json
$v.version = [int]$v.version + 1
$v | ConvertTo-Json -Compress | Set-Content $verPath -NoNewline

# Commit & push
Set-Location "F:\scan"
git add deploy.ps1 version.json index.html
git commit -m "deploy v$($v.version)"
git remote set-url origin $remote
git push
Write-Host "✅ Deployed v$($v.version) — GitHub Pages will update in 1-2 min"
