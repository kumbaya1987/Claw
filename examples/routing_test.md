# 知识自动路由测试示例

## 测试用例

### 测试用例1：联系方式 → IMA
**输入**："供应商的电话是 13812345678，微信同号"
**预期路由**：存储到 IMA 知识库 - 供应商管理

### 测试用例2：商务条款 → IMA
**输入**："合同约定账期30天，付款方式为月结"
**预期路由**：存储到 IMA 知识库 - 供应商管理

### 测试用例3：产品信息 → IMA
**输入**："SKU12345的面料是纯棉，库存200件"
**预期路由**：存储到 IMA 知识库 - 产品资料库

### 测试用例4：日常记录 → 本地
**输入**："今天要完成：1. 审核合同 2. 更新库存"
**预期路由**：写入本地 memory.md

### 测试用例5：重要决策 → 双重存储
**输入**："最终决定采用方案A作为关键决策"
**预期路由**：
- 存储 IMA 奁地搜知识库
- 追加到本地 MEMORY.md

## 实现逻辑代码示例

```python
# 知识自动路由逻辑（伪代码）
def route_knowledge(user_input):
    # 定义路由规则
    routing_rules = {
        "ima_supplier": {
            "triggers": ["电话", "微信", "QQ", "邮箱", "地址", "合同", "协议", "报价", "账期", "付款", "供应商", "客户", "厂家", "合作方"],
            "storage": "ima",
            "notebook": "供应商管理"
        },
        "ima_product": {
            "triggers": ["产品", "库存", "SKU", "面料", "工艺", "行业报告", "趋势", "竞品", "分析"],
            "storage": "ima",
            "notebook": "产品资料库"
        },
        "ima_activity": {
            "triggers": ["活动", "促销", "618", "双11", "方案"],
            "storage": "ima",
            "notebook": "618活动方案"
        },
        "ima_service": {
            "triggers": ["话术", "客服", "回复", "FAQ"],
            "storage": "ima",
            "notebook": "客服话术"
        },
        "local_daily": {
            "triggers": ["今天", "明天", "待办", "计划"],
            "storage": "local",
            "file": "memory.md"
        },
        "local_idea": {
            "triggers": ["感觉", "想法", "灵感", "思路"],
            "storage": "local",
            "file": "MEMORY.md"
        },
        "dual_decision": {
            "triggers": ["重要", "关键", "最终方案", "决策"],
            "storage": "dual",
            "ima_notebook": "奁地搜",
            "local_file": "MEMORY.md"
        }
    }

    # 匹配路由规则
    for rule_name, rule in routing_rules.items():
        if any(trigger in user_input for trigger in rule["triggers"]):
            if rule["storage"] == "ima":
                return store_to_ima(user_input, rule["notebook"])
            elif rule["storage"] == "local":
                return store_to_local(user_input, rule["file"])
            elif rule["storage"] == "dual":
                store_to_ima(user_input, rule["ima_notebook"])
                return store_to_local(user_input, rule["local_file"])

    # 默认回退到本地
    return store_to_local(user_input, "memory.md")
```

## WorkBuddy Agent 集成示例

当用户要求记录信息时，Agent 应执行以下步骤：

1. **分析用户输入**，提取关键词
2. **匹配路由规则**，确定存储位置
3. **执行存储操作**：
   - IMA 存储：调用 ima-note skill
   - 本地存储：写入 memory.md
   - 双重存储：同时执行两者
4. **反馈确认**，告知用户信息已存储到何处
