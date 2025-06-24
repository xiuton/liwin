# 🚀 快速开始指南

## 第一步：环境准备

### 1. 安装 Rust
```bash
# 安装 rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# 重新加载环境变量
source ~/.bashrc  # 或 source ~/.zshrc

# 验证安装
rustc --version
cargo --version
```

### 2. 安装 wasm-pack
```bash
cargo install wasm-pack
```

### 3. 安装 Node.js 18+ (用于 TailwindCSS 构建)
```bash
# 使用 nvm 安装 Node.js
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
nvm install 18
nvm use 18

# 验证安装
node --version
npm --version
```

## 第二步：克隆和构建项目

### 1. 克隆项目
```bash
git clone <your-repo-url>
cd Liwin
```

### 2. 安装依赖
```bash
# 安装 Node.js 依赖 (包括 TailwindCSS)
npm install
```

### 3. 构建项目
```bash
# 使用构建脚本 (包含 TailwindCSS 构建)
bash build.sh

# 或者手动构建
npm run build:css:prod
wasm-pack build --target web
cp -r public/* pkg/
```

### 4. 启动开发服务器
```bash
# 使用 npm 脚本
npm run serve

# 或者直接使用 serve
serve pkg -p 8080

# 或者使用 Python
python -m http.server 8080
```

### 5. 访问应用
打开浏览器访问 `http://localhost:8080`

## 第三步：开发工作流

### 1. 开发模式 (推荐)
```bash
# 启动开发模式 (自动监听 CSS 和 Rust 变化)
npm run dev
```

### 2. 手动构建
```bash
# 修改代码后重新构建
bash build.sh
```

### 3. 仅构建 CSS
```bash
# 监听 CSS 变化
npm run build:css

# 生产构建 CSS
npm run build:css:prod
```

## 第四步：项目结构说明

```
Liwin/
├── src/                     # Rust 源代码
│   ├── main.rs              # 应用入口点
│   ├── router/              # 路由配置
│   ├── pages/               # 页面组件
│   └── components/          # 可复用组件
├── public/                  # 静态资源
│   ├── index.html           # HTML 模板
│   ├── styles/
│   │   └── output.css       # 构建后的 CSS
│   └── icons/               # 图标文件
├── styles/                  # 样式源文件
│   └── input.css            # TailwindCSS 输入文件
├── tailwind.config.js       # TailwindCSS 配置
├── package.json             # Node.js 依赖和脚本
├── build.sh                 # 构建脚本
└── README.md               # 项目文档
```

## 第五步：添加新页面

### 1. 创建页面组件
在 `src/pages/` 目录下创建新的 `.rs` 文件：

```rust
// src/pages/new_page.rs
use dioxus::prelude::*;
use crate::components::{Container, Card};

#[component]
pub fn NewPage(cx: Scope) -> Element {
    cx.render(rsx! {
        Container {
            class: "py-12",
            h1 {
                class: "text-3xl font-bold",
                "新页面"
            }
            Card {
                class: "p-6",
                p { "这是新页面的内容" }
            }
        }
    })
}
```

### 2. 注册页面
在 `src/pages/mod.rs` 中添加：

```rust
pub mod new_page;
pub use new_page::NewPage;
```

### 3. 添加路由
在 `src/router/mod.rs` 中添加路由：

```rust
#[derive(Routable, Clone)]
pub enum Route {
    // ... 其他路由
    #[route("/new-page")]
    NewPage {},
}
```

### 4. 创建路由组件
在 `src/router/routes.rs` 中添加：

```rust
#[component]
pub fn NewPageRoute(cx: Scope) -> Element {
    cx.render(rsx! {
        NewPage {}
    })
}
```

## 第六步：自定义样式

### 1. 修改 TailwindCSS 配置
编辑 `tailwind.config.js`：

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
        custom: {
          500: '#your-color',
        }
      }
    }
  },
  plugins: [
    // 你的插件
  ],
}
```

### 2. 添加自定义 CSS
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

### 3. 添加 TailwindCSS 插件
```bash
# 安装插件
npm install @tailwindcss/your-plugin

# 在 tailwind.config.js 中添加
plugins: [
  require('@tailwindcss/your-plugin'),
]
```

## 第七步：部署

### 1. 构建生产版本
```bash
# 构建优化的 CSS 和 WASM
bash build.sh
```

### 2. 部署到静态托管
将 `pkg/` 目录部署到：
- Netlify
- Vercel
- GitHub Pages
- AWS S3

## 常见问题

### Q: 构建失败怎么办？
A: 检查是否安装了所有依赖：
```bash
npm install
cargo install wasm-pack
```

### Q: CSS 没有更新？
A: 确保运行了 CSS 构建：
```bash
npm run build:css
```

### Q: 页面显示空白？
A: 检查浏览器控制台是否有错误，确保 WASM 文件正确加载。

### Q: 样式不生效？
A: 确保 `public/styles/output.css` 文件存在且正确构建。

### Q: 如何添加新的依赖？
A: 
- Rust 依赖：在 `Cargo.toml` 的 `[dependencies]` 部分添加
- Node.js 依赖：使用 `npm install package-name`

## 技术栈版本

- **Rust**: 最新稳定版
- **Dioxus**: 0.6.3
- **TailwindCSS**: 3.4+ (CLI 构建)
- **wasm-pack**: 0.12
- **Node.js**: 18+

## 下一步

- 阅读完整的 [README.md](README.md)
- 查看 [Dioxus 文档](https://dioxuslabs.com/)
- 学习 [TailwindCSS](https://tailwindcss.com/)

祝你开发愉快！🎉 