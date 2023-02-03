# diagnose-iotdb

此脚本用于采集用户对于IoTDB的使用情况。

## 使用方式
该脚本的启动命令如下：

```shell
./diagnose-iotdb.sh $IOTDB_DATA_DIR $IOTDB_HOME_DIR $IOTDB_CONF_DIR

# 比如
./diagnose-iotdb.sh /opt/iotdb/apache-iotdb-0.13.3-all-bin/data /opt/iotdb/apache-iotdb-0.13.3-all-bin /opt/iotdb/apache-iotdb-0.13.3-all-bin/conf
```

此时会输出用户使用相关的情况，输出结果如下：

```
#check total data size
4.0K	./wal
 12K	./system
 16K	./data
 80K	.
#check data/ size
 80K	.
#check / tsfile size
700
#top 100 / TsFile size
351
349
#check / resource size
119
#top 10 / resource size
63
56
#check / mods size

#top 100 / mods size
#check data/sequence size
 80K	.
#check /sequence tsfile size
700
#top 100 /sequence TsFile size
351
349
#check /sequence resource size
119
#top 10 /sequence resource size
63
56
#check /sequence mods size

#top 100 /sequence mods size
#check data/unsequence size
 80K	.
#check /unsequence tsfile size

#top 100 /unsequence TsFile size
#check /unsequence resource size

#top 10 /unsequence resource size
#check /unsequence mods size

#top 100 /unsequence mods size
#sg number
       2       2      16
#device number
---------------------
Starting Parsing the IoTDB Mlog or Snapshot
---------------------
10:15:46.714 [main] WARN org.apache.iotdb.db.conf.IoTDBDescriptor - Cannot find IOTDB_HOME or IOTDB_CONF environment variable when loading config file iotdb-engine.properties, use default configuration
10:15:46.718 [main] WARN org.apache.iotdb.tsfile.common.conf.TSFileDescriptor - not found iotdb-engine.properties, use the default configs.
10:15:46.718 [main] WARN org.apache.iotdb.db.conf.IoTDBDescriptor - Couldn't load the configuration from any of the known sources.
10:15:46.722 [main] INFO org.apache.iotdb.db.writelog.io.SingleFileLogReader - open WAL file: mlog.bin size is 798
       4       4      59
#total operation
      18      18     348
```

然后在执行脚本的目录中会有`iotdb-engine.properties.result`与`iotdb-env.sh.result`文件，这两个文件是用户的配置文件。
