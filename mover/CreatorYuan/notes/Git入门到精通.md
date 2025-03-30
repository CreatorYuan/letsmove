# Git 工作机制

         git add      git commit
    工作区   -->  暂存区    -->    本地库

# Git 常用命令

| 命名名称                               | 作用      |
|:-----------------------------------|:--------|
| git config --global user.email 用户名 | 设置用户签名  |
| git config --global user.name   邮箱 | 设置用户签名  |
| git init                           | 初始化本地库  |
| git status                         | 查看本地库状态 |
| git add 文件名                        | 添加到暂存区  |
| git commit -m "日志信息"  文件名          | 提交到本地库  |
| git reflog                         | 查看历史记录  |
| git reset --hard                   | 切换版本    |

## 添加用户信息
```shell

git config --global user.email "abcmeabc@163.com"

git config --global user.name "CreatorYuan"

```

## 初始化本地库 git init

```shell
   $ git init    # 初始化本地库
   $ git status  # 查看
   $ git config --global --add safe.directory E:/
   $ git status
On branch master

No commits yet

Untracked files:

nothing added to commit but untracked files present (use "git add" to track)

```


## 添加到暂存区 git add

```shell
git add hello.txt        # 添加到暂存区

git rm --cached hello.txt      # 从暂存区删除

git commit -m "first commit" hello.txt  # 提交

git status

git reflog    # 查看历史版本

git log      # 查看完整信息
```


## 版本回退
```shell
git reflog   # 查看历史版本

git rest --hard 6666666  # (版本号)   可以跳到任意版本
```

## 分支管理

| 命名名称             | 作用             |
|:-----------------|:---------------|
| git branch 分支名   | 创建分支           |
| git branch -v    | 查看分支           |
| git checkout 分支名 | 切换分支           |
| git merge 分支名    | 把指定的分支合并到当前分支上 |

```shell
 git branch hot-fix
 git branch -v

 git checkout hot-fix

 (master)
git merge hot-fix 分支合并到当前分支
```

## 合并异常
```shell

vi hello.txt  # 删除异常行

# 从新 git add 文件名
git status

git add hello.txt

git commit -m "merge test"  # 不能带文件名
```

## 代码托管中心

其他团队： 本地库 --> push  --> 远程库(team1)


本团队： 远程库(team1)  -->  fork  -->  远程库(team2)


本人  ： 远程库(team2) --> clone --> 本地库

修改后
本人  ： 本地库  --> push  -->  远程库(team2)


远程库(team2)  --> pull request  -->  远程库(team1)

https://github.com/move-cn/letsmove.git
https://github.com/CreatorYuan/letsmove.git

```shell

# 查看当前所有远程地址别名
git remote -v

# 添加别名
git remote add letsmove https://github.com/CreatorYuan/letsmove.git

# 推送到远程库
git push letsmove master

# 拉取远程库
git pull letsmove main

# clone : 1.拉取代码  2.初始化本地仓库  3.创建别名
git clone https://github.com/CreatorYuan/letsmove.git

```


## SSH
```shell
$  ssh-keygen -t rsa -C abcmeabc@163.com
# 生成后将公钥添加到github

$ git add mover/CreatorYuan/notes/Git入门到精通.md
$ git commit -m "CreatorYuan is note." mover/CreatorYuan/notes/Git入门到精通.md

$ git branch -v
* main 5a9ebda6 [ahead 1] CreatorYuan is note.


$ git push git@github.com:CreatorYuan/letsmove.git main


```

# IDEA集成Git

## 忽略文件
C:\Users\Administrator\
git.ignore
```shell
# Compild class file
*.class

# Log file
*.log


```

C:\Users\Administrator\
.gitconfig  # 添加文件到配置
```shell
[core]
	excludesfile = C:/Users/Administrator/git.ignore
```

## 拉起最新远端代码版本
- 撤销本地、暂存区、版本库、
- git fetch --all
- 回退到最新的远端代码
- git pull origin master
```shell
git fetch --all
git reset --hard origin/master
git pull 
```

当你在执行 git pull 命令时遇到提示“You have divergent branches and need to specify how to reconcile them”，意味着你的本地分支和远程分支存在差异，需要你指定合并或变基的策略。‌

原因
当本地分支和远程分支有不同的提交历史时，Git 无法自动决定如何合并这些差异。这通常发生在以下情况：

‌合并（Merge）‌：默认策略，会将远程分支的更改合并到本地分支。
‌变基（Rebase）‌：将本地分支上的更改应用到远程分支的最新提交上。
‌仅快进（Fast-forward only）‌：只有在可以快进的情况下才进行合并，否则会报错。
解决步骤
‌设置默认策略‌：

使用 git config pull.rebase false 来设置默认合并策略。
使用 git config pull.rebase true 来设置默认变基策略。
使用 git config pull.ff only 来设置仅快进策略。
你可以使用 git config --global 来为所有仓库设置默认策略。
‌临时指定策略‌：

在执行 git pull 时，可以使用 --rebase、--no-rebase 或 --ff-only 参数来临时指定策略。
‌执行 git pull‌：

根据你选择的策略执行 git pull 命令。例如，如果你选择了变基策略，可以运行 git pull --rebase。
通过以上步骤，你可以根据需要选择合适的合并或变基策略，解决分支差异问题。


