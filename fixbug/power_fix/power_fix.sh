#/bin/bash

rm -rf ./services.jar.out
rm -rf ./tmp
mkdir ./tmp

if [ -e ./services.jar ];then
  echo "正在反编译services.jar"
  java -jar ../apktool.jar d ./services.jar > /dev/null 2>&1
  echo "正在修复指纹功耗BUG"
  LightImpl=$(grep  ".method public static isAtLeastStrength(II)Z" ./services.jar.out/smali/com/android/server/biometrics/ -ril)

  if [ ! $LightImpl = "" ];then
    cp -frp $LightImpl ./tmp/Utils.smali
    rm -rf $LightImpl
    while IFS= read -r line ;do
      $flag && echo "$line" >> $LightImpl
      if [ "$line" = ".method public static isDebugEnabled(Landroid/content/Context;I)Z" ];then
        flag=false
        cat ./powerfix.patch >> $LightImpl
      fi
      if ! $flag && [ "$line" = ".end method" ];then
        flag=true
        echo "$line" >> $LightImpl
      fi
    done < ./tmp/Utils.smali
    echo "指纹功耗修复完成"
    echo "正在回编译services.jar"
    java -jar ../apktool.jar b ./services.jar.out > /dev/null 2>&1
  else
    echo "此rom不支持指纹功耗修复"
    echo "正在回编译services.jar"
    java -jar ../apktool.jar b ./services.jar.out > /dev/null 2>&1
    exit
  fi
else
  echo "没有检测到 services.jar"
  exit
fi
