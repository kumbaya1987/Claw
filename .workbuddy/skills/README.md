# WorkBuddy 项目技能同步

## 说明

此目录包含通过 Git 同步的项目级技能（Skills），用于多设备共享。

## 当前技能列表

### 1. baidu-search
- **功能**：百度AI搜索引擎
- **配置**：需要 BAIDU_API_KEY 环境变量
- **文档**：[docs/baidu-search-setup.md](../docs/baidu-search-setup.md)
- **状态**：✅ 已配置

### 2. ima-note
- **功能**：IMA 个人笔记管理
- **配置**：需要 IMA_OPENAPI_CLIENTID 和 IMA_OPENAPI_APIKEY 环境变量
- **文档**：[KnowledgeRouter.md](../../KnowledgeRouter.md)
- **状态**：✅ 已配置

## 多设备同步步骤

### 从其他设备克隆

```bash
# 克隆项目仓库
git clone https://github.com/kumbaya1987/Claw.git

# 进入项目目录
cd Claw

# 技能已在 .workbuddy/skills/ 中
# 无需额外安装，WorkBuddy 会自动识别
```

### 首次使用配置

1. **配置环境变量**：
   - BAIDU_API_KEY（百度搜索）
   - IMA_OPENAPI_CLIENTID（IMA笔记）
   - IMA_OPENAPI_APIKEY（IMA笔记）

2. **验证技能可用性**：
   ```
   # 测试百度搜索
   用百度搜索"测试"
   ```

## 技能管理

### 添加新技能

```bash
# 1. 在用户目录安装技能
npx clawhub install skill-name --workdir ~ --dir .workbuddy/skills

# 2. 复制到项目
cp -r ~/.workbuddy/skills/skill-name 项目目录/.workbuddy/skills/

# 3. 提交到 Git
git add .workbuddy/skills/skill-name
git commit -m "Add skill-name skill"
git push
```

### 删除技能

```bash
# 1. 删除技能目录
rm -rf .workbuddy/skills/skill-name

# 2. 提交更改
git add .workbuddy/skills
git commit -m "Remove skill-name skill"
git push
```

## 安全注意事项

⚠️ **敏感信息不提交**

以下内容不会被提交到 Git（在 .gitignore 中排除）：
- API Key（通过环境变量配置）
- 本地缓存文件
- 临时日志

## 环境变量配置记录

### 百度搜索
```powershell
[System.Environment]::SetEnvironmentVariable("BAIDU_API_KEY", "your_key", "User")
```

### IMA 笔记
```powershell
[System.Environment]::SetEnvironmentVariable("IMA_OPENAPI_CLIENTID", "your_client_id", "User")
[System.Environment]::SetEnvironmentVariable("IMA_OPENAPI_APIKEY", "your_api_key", "User")
```

---

**注意**：每台设备都需要单独配置环境变量，技能代码通过 Git 同步。
