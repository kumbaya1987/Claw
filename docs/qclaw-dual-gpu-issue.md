# QClaw 双显卡无法打开问题报告

## 问题描述

- **产品**：QClaw（腾讯电脑管家团队推出的本地 AI 智能助手）
- **问题**：安装后无法打开
- **原因**：双显卡环境
- **发现时间**：2026-03-22 上午 11:20
- **状态**：✅ 已解决
- **上报状态**：⚠️ 待上报

---

## 环境信息

| 项目 | 信息 |
|------|------|
| 操作系统 | Windows |
| 显卡配置 | 双显卡（独显 + 集显） |
| 问题表现 | QClaw 安装完成后无法启动/打开 |

---

## 可能原因分析

### 1. CUDA 环境配置问题

QClaw 基于 OpenClaw，在 Windows 上使用本地模型时可能依赖 CUDA 加速。双显卡环境下：

**常见问题**：
- NVIDIA 独立显卡 + Intel/AMD 集成显卡冲突
- CUDA 驱动优先级配置错误
- 系统默认使用集显，导致 CUDA 无法加载

### 2. GPU 选择问题

双显卡环境下，系统可能默认选择集成显卡，而 QClaw 需要独立显卡的 CUDA 支持。

### 3. 驱动不兼容

两个显卡驱动版本不兼容或冲突，导致应用程序无法识别正确的 GPU。

---

## 解决方案

### 方案 1：指定 GPU 运行（推荐）

在 QClaw 或 OpenClaw 的配置中，明确指定使用独立显卡。

**操作步骤**：

#### Windows 图形设置

1. 打开 **设置** → **系统** → **显示** → **图形设置**
2. 找到 QClaw 应用程序
3. 选择 **高性能**（使用独立显卡）
4. 保存设置并重启 QClaw

#### NVIDIA 控制面板

1. 打开 **NVIDIA 控制面板**
2. 转到 **管理 3D 设置** → **程序设置**
3. 添加 QClaw 可执行文件
4. 设置为 **高性能 NVIDIA 处理器**
5. 应用并重启

### 方案 2：禁用集成显卡

如果集成显卡与 QClaw 冲突，可以临时禁用。

**操作步骤**：

1. 打开 **设备管理器**
2. 展开 **显示适配器**
3. 右键点击集成显卡（如 Intel UHD Graphics）
4. 选择 **禁用设备**
5. 重启电脑并启动 QClaw

> ⚠️ **注意**：禁用集显可能影响续航，建议仅在测试时使用。

### 方案 3：更新显卡驱动

确保两个显卡的驱动都是最新版本。

**操作步骤**：

1. 访问 NVIDIA 官网下载最新驱动
2. 访问 Intel/AMD 官网下载集显驱动
3. 安装最新驱动
4. 重启电脑

### 方案 4：环境变量配置

设置 CUDA 相关环境变量，确保 QClaw 使用正确的 GPU。

**操作步骤**：

```powershell
# 添加环境变量（需要管理员权限）
[System.Environment]::SetEnvironmentVariable("CUDA_VISIBLE_DEVICES", "0", "User")

# 重启系统后生效
```

### 方案 5：检查依赖组件

根据搜索结果，QClaw 启动前会自动校验：

- Python 运行时
- Visual C++ Redistributable
- .NET Framework

任一缺失均可能导致静默退出。

**操作步骤**：

1. 下载并安装最新版 [Visual C++ Redistributable](https://learn.microsoft.com/zh-cn/cpp/windows/latest-supported-vc-redist)
2. 安装 .NET Framework（如缺失）
3. 重启电脑

---

## 验证步骤

### 1. 检查 GPU 识别

打开命令提示符，运行：

```bash
nvidia-smi
```

确认 NVIDIA 显卡被正确识别。

### 2. 检查 CUDA 版本

```bash
nvcc --version
```

确认 CUDA 已正确安装。

### 3. 启动 QClaw

尝试启动 QClaw，观察是否正常运行。

---

## 参考资料

1. [QClaw 常见问题 - 腾讯官方文档](https://qclaw.qq.com/docs/205354465821167616.html)
2. [OpenClaw 故障排除](https://docs.openclaw.ai/zh-CN/help/troubleshooting)
3. [Win11 下双 GPU 配置与优化指南](https://developer.baidu.com/article/detail.html?id=4101925)
4. [在 NVIDIA RTX 上运行 OpenClaw](https://www.nvidia.cn/geforce/news/open-claw-rtx-gpu-dgx-spark-guide/)

---

## 后续行动

### 待办事项

- [ ] 将此问题上报到 QClaw 官方
- [ ] 跟踪官方是否有更优解决方案
- [ ] 验证其他双显卡用户是否遇到相同问题

### 上报渠道

1. **QClaw 官方文档反馈**：[https://qclaw.qq.com](https://qclaw.qq.com)
2. **腾讯电脑管家社区**
3. **OpenClaw GitHub Issues**（如适用）

---

## 总结

| 项目 | 内容 |
|------|------|
| **问题** | QClaw 在双显卡环境下无法打开 |
| **原因** | GPU 选择冲突或 CUDA 配置问题 |
| **解决方案** | 指定高性能 GPU 运行 QClaw |
| **状态** | ✅ 已解决 |
| **上报** | ⚠️ 待上报 |

---

**文档版本**: 1.0
**创建日期**: 2026-03-22
**创建人**: WorkBuddy AI Assistant
**最后更新**: 2026-03-22
