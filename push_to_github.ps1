# สคริปต์ PowerShell สำหรับเอาโค้ดขึ้น GitHub แบบอัตโนมัติ
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "  ระบบอัปโหลดเข้าสู่ GitHub อัตโนมัติ" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Cyan

$githubUser = Read-Host "1. กรุณากรอกชื่อ GitHub Username ของคุณ (เช่น somchai)"
$repoName = "student-attendance-app"

if ([string]::IsNullOrWhiteSpace($githubUser)) {
    Write-Host "❌ กรุณากรอก Username ให้ถูกต้อง" -ForegroundColor Red
    exit
}

cd "C:\Users\ใบ\.gemini\antigravity\scratch\student-attendance-app"

# ตรวจสอบและตั้งค่า Remote
git remote remove origin 2>$null
git remote add origin "https://github.com/$githubUser/$repoName.git"
git branch -M main

Write-Host "`n🚀 กำลัง Push ข้อมูลขึ้น GitHub..." -ForegroundColor Yellow
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n✅ สำเร็จ! อัปโหลดไฟล์ขึ้น GitHub เรียบร้อยแล้ว" -ForegroundColor Green
    Write-Host "`n🌐 ขั้นตอนเปิดลิงก์ออนไลน์ถาวร (GitHub Pages ฟรีตลอด 24 ชม.):" -ForegroundColor Cyan
    Write-Host "1. ไปที่ลิงก์: https://github.com/$githubUser/$repoName/settings/pages"
    Write-Host "2. ตรงหัวข้อ 'Branch' ให้เลือกเป็น 'main' แล้วกด 'Save'"
    Write-Host "3. รอ 1 นาที คุณจะได้ลิงก์ออนไลน์สำหรับใช้งานคือ:"
    Write-Host "👉 https://$githubUser.github.io/$repoName/index.html" -ForegroundColor Yellow
} else {
    Write-Host "`n⚠️ หาก Push ไม่ผ่าน อย่าลืมสร้าง Repository ชื่อ '$repoName' บน github.com ก่อนนะครับ" -ForegroundColor Yellow
}
