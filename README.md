#VIM配置

## 思路

1. 尽可能不使用vim原有快捷键
2. 尽可能精简插件，只保留当前github最热最实用插件
3. vimrc全部选项提供注释

## 插件列表

## 效果图
### 完成界面

!()(1.png)

+ 左侧目录树，按F2打开
+ 右侧为符号列表， 按F9打开
+ 顶上为打开buffer列表，默认打开，airline功能，可关闭
+ 底下为状态栏，使用airline插件

### 文件搜索功能

!()(2.png)

按ctrl+p 进入文件搜索功能,当前最热门的fzf提供搜索支持

### 代码搜索功能

!()(3.png)

普通模式按F8跳出搜索代码命令，
或visual模块下按F8搜索当前选择单词，
使用ctrlsf插件提供搜索功能，界面如上

## 使用方法
+ git clone https://github.com/Hereasalways/VIM.git
+ mv VIM ~/.vim
+ cp ~/.vim/.vimrc ~/.vimrc
+ 打开vim, 执行:PlugInstall
+ 安装ctags, cscope, astyle, lua, the\_silver\_searcher, fcitx-remote-for-osx, python@2


