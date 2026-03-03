# MATLAB 数学建模实验教程

<div align="center">

[![MATLAB](https://img.shields.io/badge/MATLAB-R2020a+-blue.svg)](https://www.mathworks.com/products/matlab.html)

[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

</div>

## 项目简介

本项目包含集美大学数学建模课程的完整实验代码，涵盖MATLAB编程基础、曲线拟合、非线性建模、微积分应用以及优化模型等核心内容。每个实验模块都配有详细的代码注释和可视化示例，适合数学建模入门学习和参考。

### 适用场景
- 数学建模课程学习
- MATLAB编程技能提升
- 数据分析与可视化实践
- 优化算法应用研究

---

## 目录结构

```
MATLAB/
├── Lab1/                    # MATLAB基础编程
│   ├── exp_1.m             # 命令窗口操作与数组矩阵运算
│   ├── exp_2.m             # 程序设计与流程控制
│   ├── exp_3.m             # 绘图命令练习
│   └── conclusion.m        # 实验总结综合脚本
│
├── Lab2/                    # 曲线拟合与插值
│   ├── exp_1.m             # 多项式拟合
│   ├── exp_2.m             # 非线性曲线拟合
│   ├── exp_3.m             # 最小二乘法拟合
│   └── conclusion.m        # 拟合方法总结
│
├── Lab3/                    # 非线性模型拟合
│   ├── exp_1.m             # 使用Curve Fitting Toolbox
│   ├── exp_2.m             # 自定义非线性函数拟合
│   └── ...
│
├── Lab4/                    # 微积分与优化
│   ├── exp_1.m             # 符号求导与极值问题
│   ├── exp_2.m             # 数值积分应用
│   ├── exp_3.m             # 符号积分
│   └── ...
│
├── Lab5/                    # 优化模型应用
│   ├── exp_1.m             # 压缩机生产销售存贮模型
│   ├── exp_2.m             # 线性规划模型
│   └── ...
│
└── work/                    # 扩展练习
    ├── ex1.m               # 线性规划应用实例
    └── ex2.m               # 综合优化问题
```

---

## 实验模块详解

### Lab1: MATLAB编程基础

**学习目标**
- 掌握MATLAB基本语法和数据结构
- 熟悉数组与矩阵运算
- 学习流程控制语句
- 掌握数据可视化方法

**核心内容**
- 数组和矩阵的创建与操作
- `for`/`while`循环与条件语句
- 函数定义与调用
- 二维/三维图形绘制（`plot`, `surf`, `mesh`, `polar`）

**运行示例**
```matlab
% 运行Lab1完整实验
cd Lab1
conclusion
```

---

### Lab2: 曲线拟合与插值

**学习目标**
- 理解多项式拟合原理
- 掌握非线性拟合方法
- 学习最小二乘法应用
- 评估拟合效果

**核心函数**
- `polyfit`: 多项式拟合
- `lsqcurvefit`: 非线性最小二乘拟合
- `interp1`: 一维插值

---

### Lab3: 非线性模型拟合

**学习目标**
- 使用MATLAB Curve Fitting Toolbox
- 处理复杂非线性关系
- 参数估计与模型验证

**依赖工具箱**
- Curve Fitting Toolbox

---

### Lab4: 微积分与优化

**学习目标**
- 符号求导与积分计算
- 极值问题求解
- 优化问题建模与求解

**核心内容**
- `diff`: 符号求导
- `int`: 符号积分
- `fmincon`: 约束优化
- `fminunc`: 无约束优化

**依赖工具箱**
- Symbolic Math Toolbox
- Optimization Toolbox

---

### Lab5: 优化模型应用

**学习目标**
- 实际问题的优化建模
- EOQ（经济订货批量）模型
- 生产-存储优化问题
- 线性规划应用

**典型问题**
```matlab
% 压缩机生产销售存贮模型（exp_1.m）
% 参数：
%   r = 100;   % 需求速率（套/月）
%   k = 500;   % 生产速率（套/月）
%   c1 = 5;    % 准备费（万元）
%   c2 = 0.2;  % 存储费（万元/套/月）
%
% 输出：
%   最佳生产周期 T*
%   最佳生产批量 Q*
%   最小平均每月费用
```

---

## 环境要求

### MATLAB版本
- **最低版本**: MATLAB R2020a
- **推荐版本**: MATLAB R2023a及以上

### 必需工具箱

| 工具箱 | 用途 | 必需性 |
|--------|------|--------|
| Symbolic Math Toolbox | 符号计算、微积分 | 必需 |
| Curve Fitting Toolbox | 曲线拟合与插值 | Lab2, Lab3必需 |
| Optimization Toolbox | 优化问题求解 | Lab4, Lab5必需 |

### 安装检查

运行以下命令检查工具箱是否安装：

```matlab
% 检查Symbolic Math Toolbox
ver('symbolic')

% 检查Curve Fitting Toolbox
ver('curvefit')

% 检查Optimization Toolbox
ver('optim')
```

---

## 快速开始

### 1. 克隆仓库

```bash
git clone https://github.com/hexinhao/MATLAB.git
cd MATLAB
```

### 2. 运行实验

```matlab
% 方法一：在MATLAB命令窗口运行
cd Lab1
run('exp_1.m')

% 方法二：直接在MATLAB编辑器中打开并点击"运行"
```

### 3. 自定义参数

各实验脚本中的关键参数均在文件开头定义，可根据需要修改：

```matlab
% 示例：修改Lab5中的生产速率
r = 100;    % 需求速率
k = 500;    % 生产速率 ← 修改此参数
c1 = 5;     % 准备费
c2 = 0.2;   % 存储费
```

---

## 代码示例

### 示例1: 数组与矩阵运算（Lab1）

```matlab
% 创建数组
A = [3 10 1 6 5];
a = 2:2:10;  % [2 4 6 8 10]

% 矩阵运算
B = [A.' (A+1).' (A-1).' A.'];
C = B(2:5, [1 3]);

% 逐元素运算
result = A .* a;
```

### 示例2: 多项式拟合（Lab2）

```matlab
% 准备数据
x = linspace(0, 10, 20);
y = sin(x) + 0.1*randn(size(x));

% 三次多项式拟合
p = polyfit(x, y, 3);
y_fit = polyval(p, x);

% 绘图
plot(x, y, 'o', x, y_fit, '-');
legend('原始数据', '拟合曲线');
```

### 示例3: 优化模型求解（Lab5）

```matlab
% 定义符号变量
syms T positive

% 目标函数
CT = c1/T + (c2 * r * T / 2) * (1 - r/k);

% 求解最优值
dT = diff(CT, T);
T_opt = solve(dT == 0, T);
```

---

## 参考文献

1. 司守奎, 孙兆亮. 《数学建模算法与应用》(第2版). 国防工业出版社.
2. MATLAB官方文档: [https://www.mathworks.com/help/](https://www.mathworks.com/help/)
3. 姜启源, 谢金星. 《数学模型》(第五版). 高等教育出版社.

---

## 贡献指南

欢迎提交Issue和Pull Request！

### 提交规范
- Bug报告: 请详细描述问题、复现步骤和期望结果
- 功能建议: 请说明使用场景和预期效果
- 代码贡献: 请遵循现有代码风格，添加必要注释

---

## 许可证

本项目采用 [MIT License](LICENSE) 开源许可证。

---

## 联系方式

- 邮箱：xhhdaxx@gmail.com

---

<div align="center">
</div>