# 百度搜索 Skill 安装完成

## Skill 信息

- **名称**：baidu-search
- **描述**：使用百度AI搜索引擎搜索网页
- **版本**：3.977（ClawHub 评分最高）
- **安装路径**：`C:\Users\Administrator\.workbuddy\skills\baidu-search`

## 安装状态

✅ **已成功安装**

## 配置要求

### 需要配置环境变量

此 skill 需要 **BAIDU_API_KEY** 环境变量。

### 获取 API Key 步骤

1. **访问百度智能云控制台**：
   https://console.bce.baidu.com/ai-search/qianfan/ais/console/apiKey

2. **登录您的百度云账号**

3. **创建应用或查看已有 API Key**

4. **复制您的 API Key**（只需要 API Key，不需要 Secret Key）

### 配置环境变量

获取 API Key 后，需要配置环境变量。有两种方式：

#### 方式1：系统环境变量（推荐）

在 PowerShell 中设置：
```powershell
# 设置用户级环境变量
[System.Environment]::SetEnvironmentVariable("BAIDU_API_KEY", "your_api_key_here", "User")

# 当前会话立即生效
$env:BAIDU_API_KEY = "your_api_key_here"
```

#### 方式2：WorkBuddy 配置文件（如适用）

如果 WorkBuddy 支持技能级别的环境变量配置，可以在配置文件中添加。

## 使用方法

配置好 API Key 后，可以这样使用：

### 基础搜索
```
用百度搜索"人工智能"
```

### 时间范围搜索
```
用百度搜索过去7天的"最新新闻"
```

### 指定结果数量
```
用百度搜索"旅游景点"，返回20条结果
```

## 使用示例

```bash
# 基础搜索
python3 skills/baidu-search/scripts/search.py '{"query":"人工智能"}'

# 指定时间范围
python3 skills/baidu-search/scripts/search.py '{
  "query":"最新新闻",
  "freshness":"pd"
}'

# 指定结果数量
python3 skills/baidu-search/scripts/search.py '{
  "query":"旅游景点",
  "count": 20
}'
```

## 参数说明

| 参数 | 类型 | 必填 | 默认值 | 说明 |
|-----|------|------|--------|------|
| query | str | 是 | - | 搜索关键词 |
| count | int | 否 | 10 | 返回结果数量，范围1-50 |
| freshness | str | 否 | Null | 时间范围，格式1："YYYY-MM-DDtoYYYY-MM-DD"，格式2：pd(24小时)/pw(7天)/pm(31天)/py(365天) |

## 故障排除

- 确保环境变量 BAIDU_API_KEY 已正确配置
- 确认百度智能云账号已激活 AI 搜索服务
- 检查账号余额是否充足
- 配置完成后可能需要重启应用

## 下一步

1. 获取您的百度 API Key
2. 配置 BAIDU_API_KEY 环境变量
3. 开始使用百度搜索功能

---

**提示**：如果您还没有百度 API Key，请先访问 https://console.bce.baidu.com/ai-search/qianfan/ais/console/apiKey 获取。
