function getDatabasePrefix()
  return get("tablePrefix")
end

tables = {}

tables["players"] = [[
  CREATE TABLE IF NOT EXISTS `%s` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `login` varchar(32) NOT NULL,
    `password` varchar(60) NOT NULL,
    `registerSerial` varchar(32) NOT NULL,
    `registerIp` varchar(22) NOT NULL,
    `registeredTs` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `lastSerial` varchar(32) NOT NULL,
    `lastIp` varchar(22) NOT NULL,
    `lastTs` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8
]]

addEventHandler("onDayzDatabaseConnected", root, function()
  for tableName,sql in pairs(tables)do
    queryFree(string.format(sql, getDatabasePrefix()..tableName))
  end
end)