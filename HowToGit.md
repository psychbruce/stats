# 如何使用RStudio和Git同步你的代码

1. 安装好[Git](http://git-scm.com/download/win)

2. 设置RStudio的Project Options --> Git/SVN --> Version control system等，RStudio的面板Pane Layout中会出现Git菜单，常用功能包括Commit、Push等

3. 设置RStudio的Global Options --> Git/SVN --> SSH key等

4. 在GitHub网页同步设置SSH key和Clone with SSH

5. 在Git菜单中打开More --> Shell，弹出命令行，依次输入下列代码，即可完成：
```
git remote add origin git@github.com:yourID/yourPATH.git
git push -f origin master
git push --set-upstream origin master
```
（需替换自己的用户名和路径名称）
