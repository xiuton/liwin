# Liwin - Rust + Dioxus + TailwindCSS 项目模板

一个基于 Rust + Dioxus + TailwindCSS 的现代化 Web 应用模板，采用模块化的目录结构，便于快速开发和维护。

## 🚀 技术栈

- **后端**: Rust (最新版本)
- **前端框架**: Dioxus 0.6.3
- **样式**: TailwindCSS 3.4+ (CLI 构建)
- **路由**: Dioxus Router 0.6.3
- **构建**: wasm-pack 0.12 + TailwindCSS CLI

## 📁 项目结构

```
Liwin/
├── src/
│   ├── main.rs              # 应用入口
│   ├── router/              # 路由相关
│   │   ├── mod.rs
│   │   └── routes.rs
│   ├── pages/               # 页面组件
│   │   ├── mod.rs
│   │   ├── home.rs
│   │   ├── about.rs
│   │   ├── contact.rs
│   │   ├── dashboard.rs
│   │   └── not_found.rs
│   └── components/          # 可复用组件
│       ├── mod.rs
│       ├── layout.rs        # 布局组件
│       ├── ui.rs           # UI基础组件
│       └── common.rs       # 通用组件
├── public/                  # 静态资源
│   ├── index.html
│   ├── styles/
│   │   └── output.css      # 构建后的 CSS
│   └── icons/
├── styles/                  # 样式源文件
│   └── input.css           # TailwindCSS 输入文件
├── tailwind.config.js       # TailwindCSS 配置
├── package.json            # Node.js 依赖和脚本
├── Cargo.toml
└── README.md
```

## 🚀 Windows 下完整启动步骤

### 1. 安装依赖

- 安装 Rust（推荐使用 rustup）
- 安装 wasm-pack
- 安装 Node.js 18+（推荐使用 nvm）

```powershell
# 安装 Rust
https://www.rust-lang.org/zh-CN/tools/install

# 安装 wasm-pack
cargo install wasm-pack

# 安装 Node.js（推荐用 nvm）
# 参考 https://github.com/coreybutler/nvm-windows
nvm install 18
nvm use 18

# 安装 Node.js 依赖
npm install
```

### 2. 构建项目

```powershell
# Windows 下请运行批处理脚本
./build.bat
```

### 3. 启动开发服务器

```powershell
# 推荐使用 serve 启动静态服务器
npx serve pkg -p 8080

# 或者使用 Python
python -m http.server 8080
```

### 4. 访问项目

在浏览器中打开：
```
http://localhost:8080
```

## 🛠️ 开发环境设置

### 前置要求

1. 安装 Rust (推荐使用 rustup)
2. 安装 wasm-pack
3. 安装 Node.js 18+ (用于 TailwindCSS 构建)

### 安装依赖

```bash
# 安装 wasm-pack
cargo install wasm-pack

# 安装 Node.js 依赖 (包括 TailwindCSS)
npm install
```

### 开发命令

```bash
# 构建项目 (包含 TailwindCSS)
bash build.sh

# 开发模式 (监听 CSS 变化)
npm run dev

# 仅构建 CSS
npm run build:css

# 生产构建 CSS
npm run build:css:prod

# 启动开发服务器
npm run serve
```

### 开发工作流

1. 修改 Rust 代码或 TailwindCSS 样式
2. 运行 `bash build.sh` 或 `npm run dev`
3. 刷新浏览器查看更改

## 🎨 样式系统

### TailwindCSS 配置

项目使用 TailwindCSS CLI 进行构建，配置文件位于 `tailwind.config.js`：

```javascript
module.exports = {
  content: [
    "./src/**/*.{rs,html}",
    "./public/**/*.html",
    "./styles/**/*.css"
  ],
  theme: {
    extend: {
      colors: {
        primary: { /* 自定义颜色 */ }
      }
    }
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/aspect-ratio'),
  ],
}
```

### 自定义样式

在 `styles/input.css` 中添加自定义样式：

```css
@tailwind base;
@tailwind components;
@tailwind utilities;

/* 你的自定义样式 */
.custom-class {
    /* 样式定义 */
}
```

### 包含的插件

- `@tailwindcss/forms` - 表单样式
- `@tailwindcss/typography` - 排版样式
- `@tailwindcss/aspect-ratio` - 宽高比

## 🎨 组件使用

### 基础组件

```rust
use crate::components::{Button, Card, Container, Input};

// 按钮
Button {
    href: Some("/dashboard".to_string()),
    "点击我"
}

// 卡片
Card {
    class: "p-6",
    h1 { "标题" }
    p { "内容" }
}

// 输入框
Input {
    value: name.clone(),
    oninput: move |e| name.set(e.value.clone()),
    placeholder: "请输入姓名"
}
```

### 布局组件

```rust
use crate::components::Layout;

Layout {
    // 页面内容
    div { "你的内容" }
}
```

## 📱 响应式设计

项目使用 TailwindCSS 的响应式类，支持移动端和桌面端：

- `sm:` - 640px 及以上
- `md:` - 768px 及以上  
- `lg:` - 1024px 及以上
- `xl:` - 1280px 及以上

## 🎯 特性

- ✅ 模块化架构
- ✅ 类型安全的 Rust 代码
- ✅ 现代化的 UI 设计
- ✅ 响应式布局
- ✅ 组件化开发
- ✅ 路由管理
- ✅ 热重载支持
- ✅ TailwindCSS CLI 构建
- ✅ CSS 优化和压缩
- ✅ 最新版本技术栈

## 🔧 自定义配置

### 添加新的 TailwindCSS 插件

```bash
npm install @tailwindcss/your-plugin
```

然后在 `tailwind.config.js` 中添加：

```javascript
plugins: [
  require('@tailwindcss/your-plugin'),
]
```

### 自定义主题

在 `tailwind.config.js` 的 `theme.extend` 中添加自定义配置。

## 📦 部署

### 构建生产版本

```bash
# 构建优化的 CSS 和 WASM
bash build.sh
```

### 部署到静态托管

将 `pkg/` 目录部署到任何静态文件托管服务：

- Netlify
- Vercel
- GitHub Pages
- AWS S3

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📄 许可证

MIT License

## 🙏 致谢

- [Dioxus](https://dioxuslabs.com/) - 优秀的 Rust UI 框架
- [TailwindCSS](https://tailwindcss.com/) - 实用优先的 CSS 框架 

## 📝 常见问题

- **wasm-pack 未安装**：请先执行 `cargo install wasm-pack`
- **Node.js 依赖未安装**：请先执行 `npm install`
- **serve 版本问题**：请确保 package.json 里 serve 版本为 ^14.2.1
- **构建失败**：请检查 Rust、Node.js、wasm-pack 是否都已正确安装
- **页面样式不生效**：请确认 `public/styles/output.css` 已生成且被 `index.html` 正确引用

## 其他平台

- Linux/macOS 用户可参考 Windows 步骤，使用 `bash build.sh` 替代 `build.bat`

## 其余内容（项目结构、技术栈、组件用法等）详见下方原文档 



```sh
npm install
```
```sh
wasm-pack build --target web

xcopy pkg public\pkg /E /I /Y
```
or
```sh
wasm-pack build --target web --out-dir public/pkg
```
```sh
npx tailwindcss -i ./styles/input.css -o ./public/styles/output.css

# or

npx tailwindcss -i ./styles/input.css -o ./public/styles/output.css --minify
```
```sh
npx serve public
```

```sh
cargo clean

rm public/pkg

rm public/styles/output.css

rm node_modules

npx tailwindcss -i ./styles/input.css -o ./public/styles/output.css --minify

wasm-pack build --target web --out-dir public/pkg

npx serve public -p 8080
```

```sh
cargo clean ; rm public/pkg ; rm public/styles/output.css ; rm node_modules ; npx tailwindcss -i ./styles/input.css -o ./public/styles/output.css --minify ; wasm-pack build --target web --out-dir public/pkg ; npx serve public -p 8080
```