**关于系统的说明**

1. 前期使用的架构是Windows 2003上的iis+asp+bootstrap+mssql 2000
2. asp开发参考的书目是《ASP 从入门到精通（放弃）》
3. 主要的代码逻辑则仿造的是php版的sqli-labs，完成了前20关的内容，其中也有些小替换

**程序的几个关键点**

1. asp不支持动态包含文件所以就重复了多次前端页面
2. 对于数据库的报错特性，在脚本中设置了捕获陷阱，当有报错时再把错误信息写入到页面中
3. 由于使用到Recordset，不能简单地取出某一列来判断SQL语句是否有查询出结果，而是需要同时判断BOF和EOF才更加合理
4. 在SQL Server 2000中QUOTED_IDENTIFIER 为 ON 时，双引号只能用于分隔标识符，不能用于分隔字符串，所以在某些关卡中对查询语句进行了替换

详见：[NmapRecordSearch && MSSQL-SQLi-Labs 初步开发小结](http://larryxi.github.io/nmaprecordsearch-and-mssql-sqli-labs.html)