# bhop-get-stats

[English](./README.md)

**-> 简体中文**

### 感谢列表 - 我, [enimmy](https://github.com/enimmy), Alkatraz, Nairda, Oblivious, Xutax, xWidovV, Tekno/f0e, Kaldun, Lilac, Shavit Timer 开发团队

**Jumpstats** - 集合了 JHud、Trainer、Offsets、Speedometer、SSJ、FJT、按键显示 为一体，可作为以上的直接替代品。这些HUD在该版本上功能更全，更准确。

**Get Stats** - 通过减少冗余计算来支持跳跃统计（希望将来还有其他开发插件）。

截至目前，这是唯一一个适用于 [sync style](https://github.com/Nimmy2222/shavit-syncstyle) 仍有效的插件。

# 用法与说明

克隆（或下载）本仓库内的文件并解压缩，随后将plugins文件夹放入 ```cstrike/addons/sourcemod```

安装前请确保你安装了 `Dynamic Channels`，这是本插件的前置，你需要它来确保本插件的正确运行，详细信息请查看 **依赖** 部分。

  JumpStats (菜单):
  ```
    - /js
    - /jhud /trainer /strafetrainer /offsets /offset /ssj /speedometer /speed /fjt 
    - (在CVARS中默认启用，可通过命令关闭)
  ```

# Cvars
* Jumpstats 绝大部分的 CVARS 都是用于 启用或禁用 不同的模块（如：jhud、trainer等），默认情况下所有功能均为启用状态。
* js-allow-trainer-fast: 允许 Trainer 以极快的速度更新，适用于在较小的有 strafe tryhards 的服务器上启用。可能会导致性能问题，默认禁用。
* js-allow-trainer-medium: 允许 Trainer 以较快的速度更新，适用于中型服务器，默认禁用。

# 依赖
* bhop-get-stats.smx（已包含在本仓库中）是本插件的前置，Jumpstats插件无法脱离该插件使用，请确保该插件正常载入。
* (JumpStats) -> [Dynamic Channels](https://github.com/Vauff/DynamicChannels)
* (JumpStats) -> (可选) [Shavit](https://github.com/shavitush/bhoptimer) 对于 FJT Hud/Time SSJ/Time Delta SJJ 选项。

# 更新日志
* JumpStats 本体
    * 所有的 HUD 元素均可自行调整位置
    * 为所有元素的开关制作了一个菜单
    * 所有的 HUD 元素均可被观察者所获取
 
* JumpStats 颜色
    * 所有与颜色相关的 HUD 均可自由调整颜色（但只能修改为预设好的颜色）
    * 您可以通过 "action" 来调整颜色，因此您可以更改任何 "bad action" 或 "good action" 的颜色，所有 HUD 都会反映该颜色
    * 这个背后的原因是，以不同的方式做这件事情会极大增加代码复杂性和内存使用，我认为没有必要，因为这个功能已经有点过剩了
    * 默认值:
        * 90+ Gain / High Speed SSJ / -1 Offset / 90-100 JSS: 白色
        * 80+ Gain / Decent Speed SSJ / 0 Offset / 80-90 JSS: 青色（天蓝色）
        * 70+ Gain / Meh Speed SSJ / -2 Offset / 70-89 JSS: 绿色
        * 60+ Gain / Bad Speed SSJ / -3 Offset / 60-70 JSS: 橙色
        * Any gain lower than 60 / Terrible Speed SSJ / Any positive offset, or below -4 / Any JSS Above 100 or below 60: 红色

**以下是原作者 enimmy 的留言，未翻译**

* I had a changelog here for each plugin, but I cannot keep up with it. Just know I've added a lot of features and improvements to almost every single plugin I've merged into this one.
