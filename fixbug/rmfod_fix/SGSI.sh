#/bin/bash

rm -rf ./services.jar.out
rm -rf ./tmp
mkdir ./tmp

if [ -e ./services.jar ];then
  echo "正在反编译services.jar"
  java -jar ../apktool.jar d ./services.jar > /dev/null 2>&1
    echo "正在移除屏幕指纹特性2"
  LightImpl=$(grep  ".method private declared-synchronized getFingerprintDaemon()Landroid/hardware/biometrics/fingerprint/V2_1/IBiometricsFingerprint;" ./services.jar.out/smali/com/android/server/biometrics/fingerprint/ -ril)

  if [ ! $LightImpl = "" ];then
    cp -frp $LightImpl ./tmp/FingerprintService.smali
    rm -rf $LightImpl
    while IFS= read -r line ;do
      $flag && echo "$line" >> $LightImpl
      if [ "$line" = ".method public constructor <init>(Landroid/content/Context;)V" ];then
        flag=false
        cat ./rmfod2.patch >> $LightImpl
      fi
      if ! $flag && [ "$line" = ".end method" ];then
        flag=true
        echo "$line" >> $LightImpl
      fi
    done < ./tmp/FingerprintService.smali
    echo "屏幕指纹特性2移除完成"
    echo "正在回编译services.jar"
    java -jar ../apktool.jar b ./services.jar.out > /dev/null 2>&1
  else
    echo "此rom不支持亮度修复"
    echo "正在回编译services.jar"
    java -jar ../apktool.jar b ./services.jar.out > /dev/null 2>&1
    exit
  fi
else
  echo "没有检测到 services.jar"
  exit
fi
