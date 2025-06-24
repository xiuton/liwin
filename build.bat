@echo off
REM Liwin 项目构建脚本 (Windows)

echo 🚀 开始构建 Liwin 项目...

REM 检查是否安装了 wasm-pack
where wasm-pack >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ wasm-pack 未安装，正在安装...
    cargo install wasm-pack
)

REM 检查是否安装了 Node.js 依赖
if not exist "node_modules" (
    echo 📦 安装 Node.js 依赖...
    npm install
)

REM 构建 TailwindCSS
echo 🎨 构建 TailwindCSS...
npx tailwindcss -i ./styles/input.css -o ./public/styles/output.css --minify

REM 清理之前的构建
echo 🧹 清理之前的构建...
if exist "pkg" rmdir /s /q pkg

REM 构建项目
echo 🔨 构建 Rust 项目...
wasm-pack build --target web

REM 复制静态文件到 pkg 目录
echo 📁 复制静态文件...
xcopy public\* pkg\ /E /I /Y

REM 检查构建结果
if exist "pkg\liwin.js" (
    if exist "pkg\styles\output.css" (
        echo ✅ 构建成功！
        echo 📦 构建文件位于 pkg\ 目录
        echo 🎨 TailwindCSS 已构建并优化
        echo 🌐 可以通过以下命令启动开发服务器：
        echo    serve pkg -p 8080
        echo    或者
        echo    python -m http.server 8080
    ) else (
        echo ❌ CSS 文件构建失败！
        exit /b 1
    )
) else (
    echo ❌ WASM 文件构建失败！
    exit /b 1
) 