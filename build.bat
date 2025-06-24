@echo off
setlocal enabledelayedexpansion
set ERRORS=0

REM Liwin 项目构建脚本 (Windows)
echo 🚀 开始构建 Liwin 项目...

REM 清理 Rust 构建缓存
cargo clean
echo [step] cargo clean done

REM 删除 public/pkg 目录
if exist "public\pkg" rmdir /s /q public\pkg
echo [step] rmdir public\pkg done

REM 删除 public/styles/output.css
if exist "public\styles\output.css" del /f /q public\styles\output.css
echo [step] del public\styles\output.css done

REM 删除 node_modules 目录
if exist "node_modules" rmdir /s /q node_modules
echo [step] rmdir node_modules done

REM 重新安装 Node.js 依赖
echo 📦 安装 Node.js 依赖...
call npm install
echo [step] npm install done
pause

REM 构建 TailwindCSS
echo 🎨 构建 TailwindCSS...
call npx tailwindcss -i ./styles/input.css -o ./public/styles/output.css --minify
echo [step] tailwindcss done

REM 构建 WASM 包
echo 🔨 构建 Rust WASM 包...
wasm-pack build --target web --out-dir public/pkg
echo [step] wasm-pack done

REM 删除 pkg/.gitignore 防止部署丢失
if exist "public\pkg\.gitignore" del /f /q public\pkg\.gitignore
echo [step] del public\pkg\.gitignore done

REM 启动本地开发服务器
echo 🌐 启动本地开发服务器...
call npx serve public -p 8080
echo [step] serve done

if !ERRORS! NEQ 0 (
    echo 脚本执行过程中有错误，请检查上方输出！
) else (
    echo ✅ 构建流程全部完成！
) 