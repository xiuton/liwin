#!/bin/bash

# Liwin 项目构建脚本 (Linux/macOS)
set -e

echo "🚀 开始构建 Liwin 项目..."

# 清理 Rust 构建缓存
cargo clean

# 删除 public/pkg 目录
rm -rf public/pkg

# 删除 public/styles/output.css
rm -f public/styles/output.css

# 删除 node_modules 目录
rm -rf node_modules

# 重新安装 Node.js 依赖
echo "📦 安装 Node.js 依赖..."
npm install

# 构建 TailwindCSS
echo "🎨 构建 TailwindCSS..."
npx tailwindcss -i ./styles/input.css -o ./public/styles/output.css --minify

# 构建 WASM 包
echo "🔨 构建 Rust WASM 包..."
wasm-pack build --target web --out-dir public/pkg

# 删除 pkg/.gitignore 防止部署丢失
rm -f public/pkg/.gitignore

# 启动本地开发服务器
echo "🌐 启动本地开发服务器..."
npx serve public -p 8080 