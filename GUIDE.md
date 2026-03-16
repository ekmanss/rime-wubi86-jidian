# Rime 极点五笔 86 配置指南

基于 [KyleBing/rime-wubi86-jidian](https://github.com/KyleBing/rime-wubi86-jidian) 定制，适用于 macOS (Squirrel) 和 Windows (Weasel) 双平台。

---

## 安装部署

将本文件夹中的所有文件复制到 Rime 用户配置目录：

| 平台 | 路径 |
|------|------|
| macOS | `~/Library/Rime` |
| Windows | `%APPDATA%\Rime` |
| Linux | `~/.config/ibus/rime` |

复制完成后，点击 Rime 菜单中的 **重新部署（Deploy）** 使配置生效。

---

## 输入方案

本配置包含以下输入方案，按 `Control+0` 或 `Shift+Control+0` 弹出切换菜单：

| 方案 | 说明 |
|------|------|
| **极点五笔86**（默认） | 纯五笔输入，四码自动上屏 |
| **拼音混输** | 五笔与拼音混合输入，忘记编码时可直接打拼音 |
| **简体拼音** | 纯拼音输入 |
| **大写数字** | 快速输入壹贰叁等大写数字（按 `1` 出 `壹`，按 `Shift+1` 出 `一`） |

> 繁体相关方案（简入繁出、拼音混输繁体）已注释，如需使用请在 `default.custom.yaml` 中取消注释。

---

## 快捷键一览

### 中英文切换

| 按键 | 行为 |
|------|------|
| `Shift`（左/右） | 将已输入的编码上屏，切换到英文模式 |
| `Caps Lock` | 将已输入的编码上屏，切换到英文模式（保留大小写锁定功能） |

### 候选词操作

| 按键 | 功能 |
|------|------|
| `Space` | 选择第 1 个候选词 |
| `;`（分号） | 选择第 2 个候选词 |
| `'`（单引号） | 选择第 3 个候选词 |
| `1` - `9` | 选择对应序号的候选词 |

### 翻页

| 按键 | 功能 |
|------|------|
| `-` | 上一页 |
| `=` | 下一页 |

> `[ ]` 翻页和 `Tab` 翻页已禁用，避免与符号输入和程序快捷键冲突。

### 编辑操作

| 按键 | 功能 |
|------|------|
| `Enter`（回车） | **清空当前输入**（不会上屏任何内容） |
| `Backspace` | 删除最后一个编码字符 |
| `Escape` | 清空当前输入 |

### Emacs 风格快捷键（输入编码时生效）

| 按键 | 功能 |
|------|------|
| `Control+p` | 上一个候选词 |
| `Control+n` | 下一个候选词 |
| `Control+b` | 光标左移 |
| `Control+f` | 光标右移 |
| `Control+a` | 光标到行首 |
| `Control+e` | 光标到行尾 |
| `Control+d` | 删除光标后的字符 |
| `Control+h` | 删除光标前的字符（同 Backspace） |
| `Control+k` | 删除光标后所有内容 |
| `Control+g` | 取消输入（同 Escape） |

---

## 特色功能

### 四码自动上屏

输入 4 个字母后，如果只有唯一匹配的候选词，会自动上屏，无需按空格确认。这是五笔输入法最高效的特性之一。

### 空码自动清空

输入了不存在的编码时（例如 `aaaa` 没有对应的字词），会自动清空输入区，无需手动退格。

### 用户词典与自动造词

配置已开启用户词典功能：

- **词频调整**：常用词会根据使用频率自动排到前面，越用越顺手
- **自动造词**：连续上屏的字词会被自动记录为新词组（最长 10 字）
- **用户词典文件**：`wubi86_jidian_user_db.tabledb`，纯文本格式，可手动编辑

> 注意：以 `z` 开头的输入不会录入用户词典，因为 `z` 是拼音反查的前缀。

### 拼音反查

在五笔模式下，忘记某个字的五笔编码时：

1. 先输入 `z`
2. 然后输入该字的拼音（如 `zhong`）
3. 候选区会显示对应的汉字

例如：输入 `zzhong` 可以看到"中"、"种"等候选词。

### 重复上一次输入

输入 `z` 可以快速重复上一次上屏的内容。

> 注意：由于反查也用 `z` 作为前缀，单独输入 `z` 时会触发重复功能，输入 `z` 后继续输入字母则进入反查模式。

### 日期时间快捷输入

在五笔和拼音混输方案中，输入以下编码可以快速插入日期时间：

| 输入 | 输出示例 | 说明 |
|------|----------|------|
| `rq` | 2026-03-16、2026.03.16、2026年03月16日 等 | 当前日期（多种格式可选） |
| `sj` | 14:30、14:30:25 等 | 当前时间 |
| `xq` | 周一、星期一、Monday 等 | 当前星期 |
| `yf` | March、Mar | 当前月份英文 |
| `rqsj` | 2026-03-16 14:30:25 | 完整日期时间 |

### 大写数字方案

切换到"大写数字"方案后：

- 按 `1` - `0` 输入 壹贰叁肆伍陆柒捌玖零
- 按 `Shift+1` - `Shift+0` 输入 一二三四五六七八九〇
- 常用辅助键：`s`=拾、`b`=佰、`q`=仟、`w`=万、`y`=元/月/亿、`n`=年、`r`=日

---

## 词库说明

本配置加载了以下词库：

| 词库文件 | 说明 |
|----------|------|
| `wubi86_jidian.dict.yaml` | 主词库，包含常用字词 |
| `wubi86_jidian_user.dict.yaml` | 个人私有词库，可手动添加自定义词条 |
| `wubi86_jidian_user_hamster.dict.yaml` | Hamster（仓输入法）专用词库 |
| `wubi86_jidian_extra.dict.yaml` | 扩展词库（汽车、品牌等） |
| `wubi86_jidian_extra_district.dict.yaml` | 行政区域词库（省市区地名） |

### 添加自定义词条

编辑 `wubi86_jidian_user.dict.yaml`，在 `...` 之后添加词条，格式为：

```
词语	编码
```

中间用 **Tab 键**分隔（不是空格）。添加后重新部署即可生效。

---

## 符号输入

在中文输入模式下，常用符号会自动转换为中文标点：

| 按键 | 输出 | 按键 | 输出 |
|------|------|------|------|
| `,` | ， | `.` | 。 |
| `!` | ！ | `?` | ？ |
| `:` | ： | `;` | ； |
| `"` | "" （自动配对） | `'` | '' （自动配对） |
| `(` | （ | `)` | ） |
| `<` | 《 | `>` | 》 |
| `[` | 【 | `]` | 】 |
| `\` | 、 | `^` | …… |
| `_` | —— | `$` | ￥ |

> 按 `Control+0` 打开设置菜单，可切换"半角/全角"和"中文标点/英文标点"。

---

## 平台专属配置

### macOS (Squirrel)

配置文件：`squirrel.custom.yaml`

**皮肤主题**：

- 亮色模式：玫枫（Roseo Maple）— 浅灰底，玫红高亮
- 暗黑模式：玫枫-暗黑（Roseo Maple Dark）— 深灰底，半透明白高亮

**自动英文模式**：以下程序启动后默认使用英文输入：

| 程序 | Bundle ID |
|------|-----------|
| Termius | com.termius-dmg.mac |
| Warp | dev.warp.Warp-Stable |
| PyCharm Professional | com.jetbrains.pycharm |
| PyCharm Community | com.jetbrains.pycharm-ce |

如需添加更多程序，在 `squirrel.custom.yaml` 的 `app_options` 中按相同格式添加。查看程序的 Bundle ID 方法：

```bash
osascript -e 'id of app "程序名"'
```

### Windows (Weasel)

配置文件：`weasel.custom.yaml`

**皮肤主题**：玫红（MacRoseo）— 白底，玫红高亮

**自动英文模式**：以下程序默认使用英文输入：

| 程序 | 进程名 |
|------|--------|
| CMD | cmd.exe |
| PowerShell | powershell.exe |
| Windows Terminal | WindowsTerminal.exe |
| PyCharm | pycharm64.exe |
| VS Code | Code.exe |

如需添加更多程序，在 `weasel.custom.yaml` 的 `app_options` 中添加对应的进程名。

---

## 文件清单

```
.
├── default.custom.yaml                   # 全局配置（方案列表、快捷键、符号）
├── wubi86_jidian.schema.yaml             # 五笔主方案
├── wubi86_jidian_pinyin.schema.yaml      # 五笔拼音混输方案
├── wubi86_jidian_trad.schema.yaml        # 简入繁出方案
├── wubi86_jidian_trad_pinyin.schema.yaml # 拼音混输繁体方案
├── pinyin_simp.schema.yaml               # 简体拼音方案
├── numbers.schema.yaml                   # 大写数字方案
├── squirrel.custom.yaml                  # macOS Squirrel 皮肤与程序配置
├── weasel.custom.yaml                    # Windows Weasel 皮肤与程序配置
├── wubi86_jidian.dict.yaml               # 主词库
├── wubi86_jidian_user.dict.yaml          # 用户私有词库
├── wubi86_jidian_user_hamster.dict.yaml  # Hamster 词库
├── wubi86_jidian_extra.dict.yaml         # 扩展词库
├── wubi86_jidian_extra_district.dict.yaml# 行政区域词库
├── pinyin_simp.dict.yaml                 # 拼音词库
├── lua/
│   ├── wubi86_jidian_date_translator.lua       # 日期时间快捷输入脚本
│   ├── wubi86_jidian_single_char_first_filter.lua  # 单字优先过滤器（未启用）
│   └── wubi86_jidian_single_char_only.lua      # 纯单字过滤器（未启用）
├── GUIDE.md                              # 本文档
└── README.md                             # 原项目说明
```

---

## 常见问题

### 部署后没有生效？

确认文件复制到了正确的目录，然后点击 Rime 图标 → 重新部署。macOS 上也可以在终端执行：

```bash
/Library/Input Methods/Squirrel.app/Contents/MacOS/Squirrel --reload
```

### 候选词太多/太少？

修改 `default.custom.yaml` 中的 `page_size` 值（当前为 9），范围 1-10。

### 想在某个程序里默认用英文？

- macOS：编辑 `squirrel.custom.yaml`，在 `app_options` 下添加程序的 Bundle ID
- Windows：编辑 `weasel.custom.yaml`，在 `app_options` 下添加程序的进程名

### 想恢复 Tab 翻页？

取消 `default.custom.yaml` 中第 65-66 行的注释（删除行首的 `#`）。

### 想恢复 `[ ]` 翻页？

取消 `default.custom.yaml` 中第 57-58 行的注释。

### 想启用单字优先？

取消 `wubi86_jidian.schema.yaml` 中 `lua_filter@*wubi86_jidian_single_char_first_filter` 的注释。启用后，输入不满四码时，单字会排在词组前面。

### 想使用纯单字模式？

取消 `wubi86_jidian.schema.yaml` 中 `lua_filter@*wubi86_jidian_single_char_only` 的注释。启用后，只显示单字候选，不显示词组。

### 想启用繁体输出？

按 `Control+0` 打开方案菜单，切换到"简入繁出"方案。或者在五笔方案内，通过菜单切换"简体/繁体"状态。

### 回车键无法换行了？

当前配置中回车键被设置为清空编码。这只在有输入编码时生效，没有编码时回车键功能正常。如果不习惯，可以注释掉 `default.custom.yaml` 第 69 行。

### 自动造词的词组在哪里？

用户词典文件为 `wubi86_jidian_user_db.tabledb`，位于 Rime 用户配置目录中，部署后自动生成。该文件是纯文本格式，可以直接查看和编辑。
