# BROWSER RULES - 浏览器使用规则

> 正确使用正确的工具，提高效率和安全性。

---

## 核心原则

### 规则 1：选择正确的浏览器工具
- **Chrome Browser Relay** (profile="chrome")：访问需要登录会话的网站
- **隔离浏览器** (profile="openclaw")：通用 Web 自动化
- **原则**：正确工具用于正确工作

---

## Chrome Browser Relay (profile="chrome")

### 适用场景
访问需要登录会话的网站，包括但不限于：
- ✅ Twitter (X)
- ✅ YouTube
- ✅ 认证仪表板（Authentication Dashboards）
- ✅ 需要登录的社交媒体平台
- ✅ 个人账户相关页面
- ✅ 任何需要 Cookie/Session 的网站

### 使用方式
```bash
# 示例：访问 Twitter
$B goto https://twitter.com
profile="chrome"
```

### 优势
- 保持登录状态
- 继承用户会话
- 无需重复登录
- 访问个人化内容

### 注意事项
- ⚠️ 仅用于需要登录的网站
- ⚠️ 不要用于通用自动化（使用 profile="openclaw"）
- ⚠️ 注意隐私和安全性

---

## 隔离浏览器 (profile="openclaw")

### 适用场景
通用 Web 自动化和测试，包括但不限于：
- ✅ 无头浏览器测试
- ✅ 网页抓取（Web Scraping）
- ✅ 自动化测试
- ✅ 公开网站的访问
- ✅ 无需登录的网站
- ✅ 批量网页操作

### 使用方式
```bash
# 示例：访问公开网站
$B goto https://example.com
profile="openclaw"
```

### 优势
- 隔离环境，不影响主浏览器
- 自动化测试友好
- 无登录状态干扰
- 可重复、可预测

### 注意事项
- ⚠️ 无登录状态
- ⚠️ 不能访问需要认证的页面
- ⚠️ 适合自动化和测试

---

## 浏览器相关技能

### 1. fast-browser-use
- **描述**：快速浏览器使用技能
- **用途**：复杂的浏览器自动化操作
- **触发关键词**：浏览器、网页、打开、访问
- **适用场景**：
  - 需要深度浏览器交互
  - 复杂的网页操作
  - 需要 JavaScript 执行

### 2. agent-browser
- **描述**：Agent 浏览器技能
- **用途**：浏览器自动化和交互
- **适用场景**：
  - 浏览器自动化
  - 网页截图
  - 表单填写

### 3. gstack（已删除）
- **状态**：已删除（2026-03-22 15:23）
- **原因**：用户认为无需求

---

## 浏览器操作最佳实践

### 操作前
1. ✅ 确定目标：是否需要登录？
2. ✅ 选择合适的 profile：
   - 需要登录 → profile="chrome"
   - 不需要登录 → profile="openclaw"
3. ✅ 评估操作复杂度：
   - 简单 → 直接操作
   - 复杂 → 使用浏览器技能

### 操作中
1. ✅ 等待页面加载完成
2. ✅ 验证元素可见后再操作
3. ✅ 使用适当的延迟避免竞态条件
4. ✅ 错误处理和重试机制

### 操作后
1. ✅ 关闭不需要的标签页
2. ✅ 清理临时数据
3. ✅ 验证操作结果
4. ✅ 记录日志

---

## 常用浏览器操作命令

### 基本操作
```bash
# 打开页面
$B goto <url>

# 截图
$B screenshot /tmp/screenshot.png

# 查看页面源码
$B source
```

### 元素交互
```bash
# 点击元素
$B click <selector>

# 填写表单
$B fill <selector> <value>

# 鼠标悬停
$B hover <selector>
```

### 状态验证
```bash
# 验证元素可见
$B is visible <selector>

# 验证元素存在
$B exists <selector>

# 获取文本内容
$B text <selector>
```

### JavaScript 执行
```bash
# 执行 JavaScript
$B eval <javascript_code>

# 获取页面标题
$B eval document.title

# 检查控制台错误
$B console --errors
```

---

## 决策流程

```
需要访问网站？
    ↓
需要登录/有会话？
    ↓ 是
    使用 Chrome Browser Relay (profile="chrome")
    ↓
不需要登录/无会话？
    ↓ 是
    使用 隔离浏览器 (profile="openclaw")
    ↓
操作复杂？
    ↓ 是
    使用浏览器技能（fast-browser-use, agent-browser）
    ↓ 否
    直接操作
```

---

## 禁止事项

### ❌ 错误使用
- ❌ 使用 profile="chrome" 访问不需要登录的网站（浪费会话资源）
- ❌ 使用 profile="openclaw" 访问需要登录的网站（会失败）
- ❌ 混淆两种 profile 的用途
- ❌ 不等待页面加载完成就操作元素
- ❌ 硬编码延迟时间（应该用智能等待）

### ⚠️ 安全注意事项
- ⚠️ 不要在 profile="chrome" 中访问可疑网站
- ⚠️ 注意隐私和数据安全
- ⚠️ 不要自动化敏感操作（密码输入、支付等）
- ⚠️ 遵守网站的 robots.txt 和使用条款

---

## 示例场景

### 场景 1：访问 Twitter 查看推文
```bash
# 使用 profile="chrome" 因为需要登录
$B goto https://twitter.com
profile="chrome"
$B is visible "[data-testid='tweet']"
$B screenshot /tmp/twitter-feed.png
```

### 场景 2：抓取公开网站数据
```bash
# 使用 profile="openclaw" 因为不需要登录
$B goto https://example.com
profile="openclaw"
$B text "h1"
$B screenshot /tmp/scrape-result.png
```

### 场景 3：自动化测试教学平台
```bash
# 教学平台可能需要登录
# 根据实际情况选择 profile
$B goto https://teaching.school.edu.cn
$B is visible "#login-button"
$B fill @e1 "username"
$B fill @e2 "password"
$B click @e3
```

### 场景 4：采购流程测试
```bash
# 办公系统需要登录
$B goto https://oa.company.edu.cn/procure
$B fill @e1 "采购内容"
$B fill @e2 "金额"
$B click @e3
$B screenshot /tmp/procure-result.png
```

---

## 性能优化

### 加速加载
1. 使用网络缓存
2. 禁用不必要的资源（图片、CSS、JS）
3. 使用 headless 模式（如果不需要可视化）

### 减少延迟
1. 并行操作多个页面
2. 智能等待而非固定延迟
3. 重用浏览器实例

### 资源管理
1. 关闭不需要的标签页
2. 清理浏览器缓存
3. 限制并发连接数

---

## 故障排查

### 问题：元素找不到
- 原因：页面未加载完成
- 解决：增加等待时间或使用智能等待

### 问题：登录失败
- 原因：使用了错误的 profile
- 解决：检查是否需要使用 profile="chrome"

### 问题：自动化失败
- 原因：网站结构变化
- 解决：更新选择器，检查元素是否仍然存在

### 问题：性能慢
- 原因：浏览器加载过多资源
- 解决：禁用不必要的资源，使用 headless 模式

---

## 更新日志

### 2026-03-22 15:33
- 创建 BROWSER_RULES.md 文件
- 定义 Chrome Browser Relay 和隔离浏览器的使用规则
- 提供决策流程和示例场景
- 添加故障排查指南

---

## 文件信息

- **创建时间**：2026-03-22 15:33
- **最后更新**：2026-03-22 15:33
- **创建人**：WorkBuddy AI Assistant
- **用途**：明确浏览器工具的使用规则，提高效率和安全性
