#!/bin/bash

# record the current dir
current_dir=`pwd`

dir=$1
iotdb_home=$2
conf=$3
cd $dir

echo "#check total data size"
du -h -d 1



target=("/" "/sequence" "/unsequence")


for element in ${target[@]}
do
echo "#check data$element size"
du -h -d data$element

echo "#check $element tsfile size"
ls -lR data$element | grep ".tsfile" |grep -v "resource" | awk '{print $5}' | awk '{sum+=$1} END {print sum}'

echo "#top 100 $element TsFile size "
ls -lR data$element |  grep ".tsfile" |grep -v "resource" | awk '{print $5}' | sort -nr |head -100

echo "#check $element resource size"
ls -lR data$element | grep ".resource" | awk '{print $5}' | awk '{sum+=$1} END {print sum}'

echo "#top 10 $element resource size "
ls -lR data$element |  grep ".resource" | awk '{print $5}' | sort -nr |head -10

echo "#check $element mods size"
ls -lR data$element | grep ".mods" | awk '{print $5}' | awk '{sum+=$1} END {print sum}'
echo "#top 100 $element mods size "
ls -lR data$element |  grep ".mods" | awk '{print $5}' | sort -nr |head -10

done

echo "#sg number"
ls data/sequence |wc


echo "#device number"
$2/tools/mlog/mLogParser.sh -f system/schema/mlog.bin -o tmp.result.dia
cat tmp.result.dia |grep "^4" | wc
echo "#total operation"
cat tmp.result.dia |wc
rm tmp.result.dia

# return to the previous dir
cd $current_dir

cp $3/iotdb-engine.properties ./iotdb-engine.properties.result
cp $3/iotdb-env.sh ./iotdb-env.sh.result

#echo "#series number per device"




