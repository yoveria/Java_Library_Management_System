# run.ps1
# 编译和运行Java项目

# 设置路径
$projectRoot = "E:\code_vs\java\Project\Java_Library_Management_System"
$srcDir = "$projectRoot\src"
$binDir = "$projectRoot\bin"
$libPath = "$projectRoot\lib\mysql-connector-java-8.0.16.jar"

# 清理并重新创建bin目录
if (Test-Path $binDir) {
    Remove-Item "$binDir\*" -Recurse -Force
} else {
    New-Item -ItemType Directory -Path $binDir | Out-Null
}

# 编译Java文件
Write-Host "正在编译Java文件..." -ForegroundColor Green
javac -encoding GBK -d $binDir -cp "$libPath;src" src/view/*.java src/database/*.java

if ($LASTEXITCODE -eq 0) {
    Write-Host "编译成功！" -ForegroundColor Green
    
    # 运行程序
    Write-Host "启动图书馆管理系统..." -ForegroundColor Yellow
    java -cp "$binDir;$libPath" view.Main
} else {
    Write-Host "编译失败！" -ForegroundColor Red
    pause
}