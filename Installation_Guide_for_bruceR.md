# Installation Bugs and Solutions

All bugs are NOT related to the `bruceR` package!

��װ��������������**������**`bruceR`�������⣡������йأ�Ҳ����Ϊ`bruceR`��Ҫ���Ȱ�װ�ܶ�����R�������ڰ�װ��ЩR��ʱ���˴�

**�󲿷��û�����˳����װ**`bruceR`������ڰ�װ�������������⣬����ϸ�Ķ����ĵ���������7�ֳ���bug�Ľ����������**����RStudio**ͨ��Ҳ���ã���

**ǿ�ҽ���**�Ȱ�װ��`tidyverse`��`ggstatsplot`����������������һ�������Ѱ�װ�İ����ٰ�װ`bruceR`�����������Ƿ���Ҫʹ��`bruceR`����ǿ���Ƽ���װ`tidyverse`��`ggstatsplot`��

Ϊ��֤�����ٶȣ�**ǿ�ҽ���**�й��û���CRAN��������Ϊ���ڵľ������廪��ѧ���������ɲο���[R�����趨��R����װ](https://mp.weixin.qq.com/s/7_Z4RZOMgyI3DQn045PAHg)

```r
#### ��װ���� ####

## ׼����Ϊ��֤�����ٶȣ��й��û���ѡ��һ�����ڵľ��񣨷�������������ӣ�

## ��1������װ����R��������Ѿ���װ��������ԣ�
install.packages("devtools")
install.packages("tidyverse")
install.packages("ggstatsplot")

## ��2������������R����Ϊ�˱����3��Ƶ������
update.packages(ask=F)

## ��3������װbruceR��
devtools::install_github("psychbruce/bruceR")
```

> R��һ�㶼������������R�����ڰ�װʱ�����Զ���װ����R�����ٰ�װ����`bruceR`������`tidyverse`��`ggstatsplot`��10+��R����[�鿴�����б�](https://github.com/psychbruce/bruceR/blob/master/DESCRIPTION)������`tidyverse`��`ggstatsplot`��������һ��200+����������R�����������ֱ�Ӱ�װ`bruceR`����ᷢ�����ϰٸ�R����Ҫ��װ��һ����װ�������׳��������`rlang`��`gsl`��`Rcpp`�ȣ�����ǰ����������Ҫ����һ�飬������Ȼ�п��ܳ����˷��˴���ʱ�䡣��ˣ�**ǿ�ҽ���**�Ȱ�װ��`tidyverse`��`ggstatsplot`�������ۺ��Ե�R�����ٰ�װ`bruceR`���⽫����ʡʱ�䣡


## Bug #01:
```
> install.packages("bruceR")
Warning in install.packages :
  package ��bruceR�� is not available (for R version 4.0.0)
```
### Solution:
Use `devtools::install_github("psychbruce/bruceR")`.
DO NOT use `install.packages("bruceR")`.

����`bruceR`��û�з�����CRAN�����ϣ�������ͨ��`devtools`������װ��������ֱ��ʹ��`install.packages()`������

���²ۣ�`package ��bruceR�� is not available (for R version 4.x.x)`��仰������**����Ϊ**bruceR��֧��R��ĳ���汾�����ò�˵��Python�ı�����Ϣ��R���Եı�����Ϣ���ö��ˣ���


## Bug #02:
```
> devtools::install_github("psychbruce/bruceR")
Error: Failed to install 'unknown package' from GitHub:
Timeout was reached: [http://api.github.com] Connection timed out after 10000 milliseconds
```
or
```
> devtools::install_github("psychbruce/bruceR")
Error: Failed to install 'bruceR' from GitHub:
  schannel: failed to receive handshake, SSL/TLS connection failed
```
or
```
> devtools::install_github("psychbruce/bruceR")
Downloading GitHub repo psychbruce/bruceR@master
Error in utils::download.file(url, path, method = method, quiet = quiet,  : 
  cannot open URL 'https://api.github.com/repos/psychbruce/bruceR/tarball/master'
```
### Solution:
Check your network connection, or see:
- https://ask.csdn.net/questions/713186

��װǰ��ȷ�����糩ͨ�������Ȼ���У����һ��������ԡ�

���ڡ�SSL/TLS connection failed�����⣨���޷���װ�κ�����GitHub��R����������������£�
1. ���δ�IE��Internetѡ��߼����ҵ���ȫģ�飬��ѡ4����ʹ��SSL 3.0��ʹ��TLS 1.0��ʹ��TLS 1.1��ʹ��TLS 1.2
2. �ҵ�R��װ·���еġ�etc���ļ����µġ�Rprofile.site���ļ�������C:\\Program Files\\R\\R-4.0.0\\etc\\Rprofile.site������RStudio���ı��༭���򿪣�Ȼ�����������һ��`options(download.file.method="libcurl")`�����������`options(help_type="html")`��һ���·������������RStudio
3. �����Ȼ���У����һ���������


## Bug #03:
```
> devtools::install_github("psychbruce/bruceR")
...
Error: Failed to install 'bruceR' from GitHub:
  (converted from warning) installation of package ��rlang�� had non-zero exit status
```
or
```
> devtools::install_github("psychbruce/bruceR")
...
Error: Failed to install 'bruceR' from GitHub:
  (converted from warning) cannot remove prior installation of package ��Rcpp��
```
### Solution:
Use the RStudio menu bar [**`Packages -> Update`**](https://shimo.im/docs/YWwKvcRgqWRdh3HR) or the code `update.packages(ask=F)` to update all the other packages before you install `bruceR`.

Sometimes you have to first use `remove.packages()` to uninstall the old packages (e.g., `rlang`, `gsl`, `Rcpp`) and then use `install.packages()` to reinstall them. Sometimes you also have to restart RStudio and try these again.

���Bug�����ĳЩ����R���ڸ���ʱ�����׳��ָ���ʧ�ܵ������Ŀǰ���֣�`rlang`��`gsl`��`Rcpp`�������׳��ָ���ʧ�ܡ�����ԭ��һ������Щ�����°汾��**�ոշ���**��ʱ����Ҫͨ�����루compilation���ķ�ʽ����װ���£�����R����������װ���̲�ͬ�������Ӹ���ʱҲ�����׳���

��**�ֶ�ж����װ**��ЩR�����������`rlang`����������ô����
```r
## ��1�����ֶ�ж��
remove.packages("rlang")

## ��2��������R����
# ��RStudio������Ե���˵�����`Session -> Restart R`����ʹ�ÿ�ݼ�`Ctrl+Shift+F10`

## ��3�����ֶ���װ
install.packages("rlang")
```


## Bug #04:
```
> devtools::install_github("psychbruce/bruceR")
...
* installing *source* package 'bruceR' ...
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** byte-compile and prepare package for lazy loading
����: (�ɾ���ת����)�̼���'rio'����R�汾3.6.1 �������
ִֹͣ��
ERROR: lazy loading failed for package 'bruceR'
Error: Failed to install 'bruceR' from GitHub:
  (converted from warning) installation of package ��bruceR�� had non-zero exit status
```
or
```
> devtools::install_github("psychbruce/bruceR")
...
* installing *source* package 'bruceR' ...
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** byte-compile and prepare package for lazy loading
����: (�ɾ���ת����)�̼���'dplyr'����R�汾3.6.1 �������
ִֹͣ��
ERROR: lazy loading failed for package 'bruceR'
Error: Failed to install 'bruceR' from GitHub:
  (converted from warning) installation of package ��bruceR�� had non-zero exit status
```
### Solution:
Update R to the [latest version](https://cran.r-project.org/), because the latest versions of some packages (e.g., `rio`, `dplyr`) also require the latest version of R.

Tips: Use the `installr` package to update R and copy R packages from the old folder to the new one.
```r
install.packages("installr")
library(installr)
updateR()
copy.packages.between.libraries(ask=TRUE)
```

��R���Ա���İ汾�и���ʱ��ĳЩR��Ҳ��ͬ�����²�����Ҫ�������°汾��R������������������ЩR����������Ȱ�R�������������°汾�������ṩ��һ����������R���Ե�С��ʿ�����Է��������¹��̡�


## Bug #05:
```
> devtools::install_github("psychbruce/bruceR")
...
* installing *source* package 'bruceR' ...
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** byte-compile and prepare package for lazy loading
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) :
there is no package called 'emmeans'
Calls: ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
ִֹͣ��
ERROR: lazy loading failed for package 'bruceR'
* removing 'C:/Users/THINK/Documents/R/win-library/4.0/bruceR'
����: Failed to install 'bruceR' from GitHub:
(�ɾ���ת����)installation of package ��C:/Users/THINK/AppData/Local/Temp/RtmpSoK5KO/file48d823453f6b/bruceR_0.5.1.tar.gz�� had non-zero exit status
```
### Solution:
You can find `there is no package called 'emmeans'` in the error messages. In other circumstances, there may be "no package" called another one. Just install the package(s) (e.g., `install.packages("emmeans")`) and then re-install `bruceR`.

��ϸ�Ķ�������Ϣ����ϸ�Ķ�������Ϣ����ϸ�Ķ�������Ϣ����Ҫ������˵���顣


## Bug #06:
```
> devtools::install_github("psychbruce/bruceR")
WARNING: Rtools is required to build R packages, but is not currently installed.

Please download and install Rtools 3.5 from http://cran.r-project.org/bin/windows/Rtools/

Error in parse_repo_spec(repo) : Invalid git repo specification: 'bruceR'
```
### Solution:
Download and install [Rtools](http://cran.r-project.org/bin/windows/Rtools/).

Rtools����һ��R��������һ������Ĺ��ߣ���ð�װ��


## Bug #07:
```
> devtools::install_github("psychbruce/bruceR")
Skipping install of 'bruceR' from a github remote, the SHA1 has not changed since last install.
Use `force = TRUE` to force installation
```
### Solution:
Congratulations! You have already installed the latest version of `bruceR`. No need to reinstall or update it.

����ϸ�Ķ�������Ϣ���ף�����ʾ��GitHub�ϵİ汾�����Ѿ���װ���İ汾֮��û�б仯��**���Ѿ��ɹ���װ�����°汾**��

��Ȼ���������**��������**��������`install_github()`���������һ������`force = TRUE`��ǿ����װһ�飬��ô����Ŀ���Ǵ�ʱ�䡣

