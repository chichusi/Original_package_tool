#/bin/bash

rm -rf ./services.jar.out
rm -rf ./tmp
mkdir ./tmp

if [ -e ./services.jar ];then
  echo "正在反编译services.jar"
  java -jar ../apktool.jar d ./services.jar > /dev/null 2>&1
  echo "正在修复通知呼吸灯1"
  LightImpl=$(grep  ".method private isLedDoubleFlash()Z" ./services.jar.out/smali/com/android/server/notification/ -ril)

  if [ ! $LightImpl = "" ];then
    cp -frp $LightImpl ./tmp/NotificationManagerService.smali
    rm -rf $LightImpl
    while IFS= read -r line ;do
      $flag && echo "$line" >> $LightImpl
      if [ "$line" = ".method private isLedDoubleFlash()Z" ];then
        flag=false
        cat ./Breathlight_fix.patch >> $LightImpl
      fi
      if ! $flag && [ "$line" = ".end method" ];then
        flag=true
        echo "$line" >> $LightImpl
      fi
    done < ./tmp/NotificationManagerService.smali
    echo "呼吸灯1修复完成"
    echo "正在回编译services.jar"
    java -jar ../apktool.jar b ./services.jar.out > /dev/null 2>&1
  else
    echo "此rom不支持呼吸灯修复"
    echo "正在回编译services.jar"
    java -jar ../apktool.jar b ./services.jar.out > /dev/null 2>&1
    exit
  fi
else
  echo "没有检测到 services.jar"
  exit
fi
