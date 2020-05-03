local mysqlHandler = nil
addEvent("onDayzDatabaseConnected")
local function mysql_connect( )
  local mysqlData = {
    login = get("login"),
    host = get("host"),
    password = get("password"),
    database = get("database")
  }
  mysqlHandler = dbConnect( "mysql", "dbname="..mysqlData.database..";host="..mysqlData.host, mysqlData.login, mysqlData.password, "share=1" )
  if mysqlHandler then
    outputDebugString( "[db:mysql_connect()] Connected" )
    query( "SET NAMES utf8;" )
    setTimer(query,1000*60*2,0,'SET NAMES utf8;')
    triggerEvent("onDayzDatabaseConnected", root)
  else
    outputDebugString( "[db:mysql_connect()] Error while connecting, reconnecting in 10 seconds..." )
    setTimer( mysql_connect, 10000, 1 )
    return false
  end
  return true
end

addEventHandler( "onResourceStart", resourceRoot, function( )
  mysqlHandler = nil
  mysql_connect( )
end )

function dbGet(tableName, ... )
  local args = {...}
  args[1] = string.format(args[1], getDatabasePrefix()..tableName)
  return query(unpack(args))
end

function dbSet(tableName, ... )
  local args = {...}
  args[1] = string.format(args[1], getDatabasePrefix()..tableName)
  return queryFree(unpack(args))
end

function query( ... )
  if not isElement( mysqlHandler ) then
    mysql_connect( )
    return
  end
  local safeString = dbPrepareString( mysqlHandler, ... )
	if safeString then
    local query = dbQuery( mysqlHandler, safeString )
    local result, rows, last_insert_id = dbPoll( query, -1 )
    if not result then 
      outputDebugString( "[db:query()]: Error: ".. select( 1, ... ), 1 )
      return false
    end 
    return result, last_insert_id, rows
  else 
		return false
	end
	return false
end

function queryFree( ... )
  if not isElement( mysqlHandler ) then
    mysql_connect( )
    return
  end
  local safeString = dbPrepareString( mysqlHandler, ... )
	if safeString then
    local query = dbExec( mysqlHandler, safeString )
		return query
	else 
		return false
	end
	return false
end

function queryAsync( trigger, args, ... )
  if not isElement( mysqlHandler ) then
    mysql_connect( ) -- autoreconnect
    return
  end

  local safeString = dbPrepareString( mysqlHandler, ... )
	if safeString then
		local function callback( query, ...)
      local args = { ... }
      local triggerName = args[1] 
      table.remove( args, 1 )
      
      local result = dbPoll( query, 0 )
      triggerEvent( triggerName, root, result, unpack( args ) )     
    end
    dbQuery( callback, { trigger, unpack( args ) }, mysqlHandler, safeString )
  end
  return true          
end