# SwiftUI macOS Final Class Shared Reference Demo

## 简介

这是 1 个只讲 `final class` 的 macOS SwiftUI demo。

它会让左右两个编辑面板同时盯同 1 本“共享笔记本”，你一改左边，右边立刻同步。

这里重点不是“自动广播”本身，而是：

- 为什么要用 `class`
- 为什么是“同 1 份引用对象”
- 为什么常常会加 `final`

## 快速开始

### 环境要求

- macOS 14+
- Xcode 15+
- XcodeGen

### 运行

```bash
cd /Users/peng.li/workspace/freewind-demos/swiftui-macos-final-class-shared-reference-demo
./scripts/build.sh
open FinalClassSharedReferenceDemo.xcodeproj
```

### 开发循环

```bash
cd /Users/peng.li/workspace/freewind-demos/swiftui-macos-final-class-shared-reference-demo
./dev.sh
```

## 注意事项

- 这个 demo 的体感重点是“共享引用”
- `final` 额外表达“不打算被继承”
- 你会看到左右两栏显示同 1 个对象 id

## 教程

### 1. `final class` 在解决什么

如果用 `struct` 传状态：

- 很容易复制出多份值
- 左边改了，右边拿到的可能只是旧副本

如果用 `final class`：

- 左右拿到的是同 1 个对象引用
- 改任意 1 处，就是改同 1 本笔记

### 2. 生动例子

把它想成公司前台 1 本登记簿：

- 左边前台拿这本本子写“会议纪要”
- 右边前台看的是同一本
- 墙上对象 id 也说明它们真的是同 1 本

### 3. 为什么还要 `final`

因为这里不需要继承层级。

加 `final` 后意思更收口：

- 这就是 1 个具体共享盒子
- 不是给别人继续扩展的基类

## 操作

1. 在左栏点“写入会议纪要”
2. 看右栏文本同步变
3. 在右栏点“写入报销提醒”
4. 看左栏同步变
5. 点“拍快照”
6. 再继续改共享本子，观察快照不再变化
