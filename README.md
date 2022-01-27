# Original_package_tool

### 本工具为PC版

### （工具和小新大大的SGSI-build-tool差不多 删除了构建SGSI 加入了制造强开包）

## 使用工具

### 制造强开包：

```
把刷机包放至tmp文件夹内 
制造A-only:./make.sh A  
制造AB:./make.sh AB
也可单独使用./SGSI.sh A 或 ./SGSI.sh AB 
如果原包是super.img 把super.img放置工具根目录   
然后使用./unpacksuper.sh解包然后把解出来的img丢到工具更目录直接执行./SGSI.sh即可  
本工具制造的SGSI也支持动态分区机型刷入 不过要打包成super.img
使用./makesuper.sh打包
Patch1 Patch2 的内容需要自行把他打包至vendor.img 把system vendor打包生成super.img然后刷入 然后刷入patch3格式化data即可
本工具仅仅制作system.img部分Patch部分需要手动  
本工具是半自动工具 因为有些处理自动化并不理想 多变 所以手动更好 如果你不清楚这些东西的处理 也可以不处理 直接制造也行  
成品输出在SGSI文件夹 然后手动制造Patch1 2 3即可
```

## 工具打包解包脚本

```
img打包解包: makeimg2.sh unpackimg.sh(单独可使用 支持任意分区打包解包)  
super.img打包解包: makesuper.sh unpacksuper.sh  
boot.img打包解包: makeboot.sh unpackboot.sh  
dat/br生成: img2sdat.sh simg2sdat.sh  
解压img的apex: apex.sh (apex扁平化)  
局部deodex: bin/oat2dex/deodex.sh  
ozip解密: oppo_ozip 
dtboimg打包解包： makedtbo.sh unpackdtbo.sh
apk签名： bin/tools/signapk/signapk.sh
LG kdz解包：unpack_kdz.sh
oppo/oneplus ops解包：unpack_ops.sh
```

(我估计在整个维护过程中也就写个这了 我太菜了)

