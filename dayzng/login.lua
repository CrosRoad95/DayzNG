local accountsInUse = {}

function accountExistsById(id)
  local result = exports.dayzngdb:dbGet("players", "select 1 from %s where id = ? limit 1", id)
  return #result == 1
end

function accountExistsByLogin(login, caseSensitive)
  return getAccountByLogin(login, caseSensitive) and true or false
end

function getAccountByLogin(login, caseSensitive)
  local result;
  if(caseSensitive)then
    result = exports.dayzngdb:dbGet("players", "select id from %s where login = ? limit 1", login)
  else
    result = exports.dayzngdb:dbGet("players", "select id from %s where lower(login) = ? limit 1", string.lower(login))
  end
  if(result and #result == 1)then
    return result[1].id
  end
  return false
end

function getLastAccountId()
  local q = exports.dayzngdb:dbGet("players", "select max(id) as id from %s")
  if(q and #q > 0)then
    return q[1].id
  else
    return 0
  end
end

function registerAccount(login, password)
  local exist = accountExistsByLogin(login)
  if(exist)then
    return false
  end
  local password = passwordHash(password, "bcrypt", {})
  exports.dayzngdb:dbSet("players", "insert into %s (login, password)values(?,?)", login, password)
  return getLastAccountId()
end

function isPlayerLoggedIn(player)
  return getElementData(player, "uid") and true or false
end

function login(player, login, password)
  if(isPlayerLoggedIn(player))then
    return false
  end
  local accountId = getAccountByLogin(login)

end

setTimer(function()
  iprint("register",registerAccount("test", "asdasd"))
end,200, 1)