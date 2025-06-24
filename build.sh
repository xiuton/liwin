#!/bin/bash

# Liwin 项目构建脚本

set -e

echo "🚀 开始构建 Liwin 项目..."

# 检查是否安装了 wasm-pack
if ! command -v wasm-pack &> /dev/null; then
    echo "❌ wasm-pack 未安装，正在安装..."
    cargo install wasm-pack
fi

# 检查是否安装了 Node.js 依赖
if [ ! -d "node_modules" ]; then
    echo "📦 安装 Node.js 依赖..."
    npm install
fi

# 构建 TailwindCSS
echo "🎨 构建 TailwindCSS..."
npx tailwindcss -i ./styles/input.css -o ./public/styles/output.css --minify

# 清理之前的构建
echo "🧹 清理之前的构建..."
rm -rf pkg/

# 构建项目
echo "🔨 构建 Rust 项目..."
wasm-pack build --target web

# 复制静态文件到 pkg 目录
echo "📁 复制静态文件..."
cp -r public/* pkg/

# 检查构建结果
if [ -f "pkg/liwin.js" ] && [ -f "pkg/styles/output.css" ]; then
    echo "✅ 构建成功！"
    echo "📦 构建文件位于 pkg/ 目录"
    echo "🎨 TailwindCSS 已构建并优化"
    echo "🌐 可以通过以下命令启动开发服务器："
    echo "   serve pkg -p 8080"
    echo "   或者"
    echo "   python -m http.server 8080"
else
    echo "❌ 构建失败！"
    exit 1
fi 