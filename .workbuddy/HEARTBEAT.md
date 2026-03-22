# HEARTBEAT - 心跳检查配置

> 批量定期检查（日历、Todoist、品牌交易跟踪、鱼缸监控等），运行在心跳轮询上，而不是单独的 cron。

---

## 心跳机制说明

### 什么是心跳？
心跳（Heartbeat）是定期执行的自动化任务集合，用于：
- 监控系统和应用状态
- 同步数据和提醒
- 检查重要更新和变化
- 自动化重复性检查任务

### 优势
- **统一管理**：所有定期任务集中配置
- **资源高效**：批量执行，减少系统资源占用
- **易于维护**：单一配置文件，便于更新和调试
- **可靠执行**：通过 WorkBuddy automation 系统保证执行

---

## 已配置的心跳任务

### 任务 1：日历检查
- **频率**：每日 9:00 AM
- **RRULE**：`FREQ=DAILY;BYHOUR=9;BYMINUTE=0`
- **功能**：
  - 检查今日日程
  - 提醒重要会议
  - 同步日历更新
- **当前状态**：⚠️ 未配置（需根据实际日历系统配置）

### 任务 2：Todoist 同步
- **频率**：每小时
- **RRULE**：`FREQ=HOURLY;INTERVAL=1`
- **功能**：
  - 同步待办事项
  - 检查截止日期
  - 提醒紧急任务
- **当前状态**：⚠️ 未配置（需安装 Todoist API 集成）

### 任务 3：品牌交易跟踪
- **频率**：每日 10:00 AM
- **RRULE**：`FREQ=DAILY;BYHOUR=10;BYMINUTE=0`
- **功能**：
  - 检查新品牌交易
  - 跟踪交易状态
  - 发送更新通知
- **当前状态**：⚠️ 未配置（需根据实际品牌交易系统配置）

### 任务 4：鱼缸监控
- **频率**：每 2 小时
- **RRULE**：`FREQ=HOURLY;INTERVAL=2`
- **功能**：
  - 检查水质参数
  - 监控设备状态
  - 发送异常警报
- **当前状态**：⚠️ 未配置（需根据实际鱼缸系统配置）

### 任务 5：系统状态检查
- **频率**：每小时
- **RRULE**：`FREQ=HOURLY;INTERVAL=1`
- **功能**：
  - 检查磁盘空间
  - 监控 CPU 和内存使用
  - 检查服务状态
  - Git 同步状态
- **当前状态**：✅ 部分实现（通过记忆系统）

---

## 配置格式

### Automation 配置结构
```toml
name = "heartbeat-calendar"
prompt = "检查今日日程，提醒重要会议"
rrule = "FREQ=DAILY;BYHOUR=9;BYMINUTE=0"
cwds = ["~/", "~/WorkBuddy/Claw"]
status = "ACTIVE"
```

### RRULE 参数说明
- `FREQ`：频率类型（HOURLY, DAILY, WEEKLY, MONTHLY）
- `INTERVAL`：间隔（每隔 N 个周期执行一次）
- `BYHOUR`：小时（0-23）
- `BYMINUTE`：分钟（0-59）
- `BYDAY`：星期几（MO, TU, WE, TH, FR, SA, SU）

---

## 创建新心跳任务

### 步骤 1：定义任务
```powershell
# 任务名称
name = "heartbeat-task-name"

# 任务描述
prompt = "执行具体的检查和操作"

# 执行频率
rrule = "FREQ=HOURLY;INTERVAL=1"

# 工作目录
cwds = ["~/", "~/WorkBuddy/Claw"]

# 任务状态
status = "ACTIVE"  # 或 "PAUSED"
```

### 步骤 2：使用 automation_update 创建
```bash
# 创建自动化任务
automation_update mode="suggested create" name="heartbeat-task-name" prompt="执行检查" rrule="FREQ=HOURLY;INTERVAL=1" cwds="['~/', '~/WorkBuddy/Claw']" status="ACTIVE"
```

### 步骤 3：验证任务
```bash
# 查看已创建的任务
automation_update mode="view" id="heartbeat-task-name"
```

---

## 常见 RRULE 模板

### 每小时
```
FREQ=HOURLY;INTERVAL=1
```

### 每天特定时间
```
# 每天 9:00 AM
FREQ=DAILY;BYHOUR=9;BYMINUTE=0

# 每天 12:00 PM（中午）
FREQ=DAILY;BYHOUR=12;BYMINUTE=0
```

### 每周特定时间
```
# 每周一 9:00 AM
FREQ=WEEKLY;BYDAY=MO;BYHOUR=9;BYMINUTE=0

# 每周一、三、五 10:00 AM
FREQ=WEEKLY;BYDAY=MO,WE,FR;BYHOUR=10;BYMINUTE=0
```

### 每 2 小时
```
FREQ=HOURLY;INTERVAL=2
```

### 每 3 天
```
FREQ=DAILY;INTERVAL=3
```

---

## 建议的心跳任务（待实现）

### 高优先级
1. **记忆系统维护**
   - 频率：每日 23:59
   - 功能：归档旧日志，更新 MEMORY.md
   - RRULE：`FREQ=DAILY;BYHOUR=23;BYMINUTE=59`

2. **Git 状态检查**
   - 频率：每 4 小时
   - 功能：检查未提交的更改，提醒同步
   - RRULE：`FREQ=HOURLY;INTERVAL=4`

3. **磁盘空间监控**
   - 频率：每小时
   - 功能：检查磁盘空间，低于阈值时警告
   - RRULE：`FREQ=HOURLY;INTERVAL=1`

### 中优先级
4. **技能更新检查**
   - 频率：每周一 10:00 AM
   - 功能：检查已安装技能是否有更新
   - RRULE：`FREQ=WEEKLY;BYDAY=MO;BYHOUR=10;BYMINUTE=0`

5. **文档一致性检查**
   - 频率：每周日 14:00
   - 功能：检查文档链接是否有效
   - RRULE：`FREQ=WEEKLY;BYDAY=SU;BYHOUR=14;BYMINUTE=0`

### 低优先级
6. **备份检查**
   - 频率：每天 2:00 AM
   - 功能：验证备份是否完整
   - RRULE：`FREQ=DAILY;BYHOUR=2;BYMINUTE=0`

---

## 状态检查命令

### 检查所有自动化任务
```bash
# 列出所有自动化任务
Get-ChildItem "~/.workbuddy/automations" -Directory
```

### 检查特定任务
```bash
# 查看任务配置
automation_update mode="view" id="task-name"
```

### 暂停/恢复任务
```bash
# 暂停任务
automation_update mode="suggested update" id="task-name" status="PAUSED"

# 恢复任务
automation_update mode="suggested update" id="task-name" status="ACTIVE"
```

---

## 集成示例

### 示例 1：日历检查任务
```toml
name = "heartbeat-calendar"
prompt = "检查今日日程，列出所有会议和重要事件，包括时间、地点、参与人员。如果有即将开始的会议（30分钟内），发送提醒。"
rrule = "FREQ=DAILY;BYHOUR=9;BYMINUTE=0"
cwds = ["~/", "~/WorkBuddy/Claw"]
status = "ACTIVE"
```

### 示例 2：Todoist 同步任务
```toml
name = "heartbeat-todoist"
prompt = "同步 Todoist 待办事项，检查是否有截止日期在今天的任务，列出紧急任务，按优先级排序。"
rrule = "FREQ=HOURLY;INTERVAL=1"
cwds = ["~/", "~/WorkBuddy/Claw"]
status = "ACTIVE"
```

### 示例 3：Git 状态检查
```toml
name = "heartbeat-git-status"
prompt = "检查 Git 工作目录状态，列出未提交的更改。如果有未提交的更改，提醒用户提交并推送。检查最近的提交，确认是否已推送到远程。"
rrule = "FREQ=HOURLY;INTERVAL=4"
cwds = ["~/WorkBuddy/Claw"]
status = "ACTIVE"
```

### 示例 4：磁盘空间监控
```toml
name = "heartbeat-disk-space"
prompt = "检查系统磁盘空间，如果可用空间低于 10GB 或使用率超过 90%，发送警告。检查关键目录（~/WorkBuddy, ~/.workbuddy）的大小。"
rrule = "FREQ=HOURLY;INTERVAL=1"
cwds = ["~"]
status = "ACTIVE"
```

---

## 故障排查

### 任务未执行
1. 检查任务状态是否为 `ACTIVE`
2. 检查 RRULE 格式是否正确
3. 检查工作目录是否存在
4. 查看任务日志

### 任务执行失败
1. 检查 prompt 是否清晰明确
2. 检查是否有足够的权限执行任务
3. 检查网络连接（如果需要）
4. 查看错误日志

### 资源占用过高
1. 增加 `INTERVAL` 值，减少执行频率
2. 优化 prompt，减少不必要的操作
3. 暂停非必要的任务

---

## 维护建议

### 定期检查
- **每周**：检查所有心跳任务的执行日志
- **每月**：评估任务频率，优化 RRULE
- **每季度**：清理不再需要的任务

### 性能优化
- 避免任务在同一时间执行（分散时间）
- 批量操作减少系统调用
- 缓存查询结果

### 监控指标
- 任务执行成功率
- 平均执行时间
- 资源占用（CPU、内存、磁盘 I/O）

---

## 更新日志

### 2026-03-22 15:33
- 创建 HEARTBEAT.md 文件
- 定义心跳机制和配置格式
- 提供常见 RRULE 模板
- 列出建议的心跳任务

---

## 文件信息

- **创建时间**：2026-03-22 15:33
- **最后更新**：2026-03-22 15:33
- **创建人**：WorkBuddy AI Assistant
- **用途**：统一配置和管理定期检查任务
