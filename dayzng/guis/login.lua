function createLoginGui()
  local loginWindow = DGS:dgsCreateWindow ( sx/2 - 250, sy/2 - 200, 500, 400, config:getText("Login panel"), false, 0xFFFFFFFF, 25, nil, 0xC8141414, nil, 0x96141414, 5, true)

  local login = DGS:dgsCreateEdit( 20, 50, 120, 30, "", false, loginWindow )
  local password = DGS:dgsCreateEdit( 20, 95, 120, 30, "", false, loginWindow )
  local registerLogin = DGS:dgsCreateEdit( 360, 50, 120, 30, "", false, loginWindow )
  local registerPassword = DGS:dgsCreateEdit( 360, 95, 120, 30, "", false, loginWindow )
  local repeatPassword = DGS:dgsCreateEdit( 360, 135, 120, 30, "", false, loginWindow )
  DGS:dgsEditSetPlaceHolder(login, config:getText("login"))
  DGS:dgsEditSetPlaceHolder(password, config:getText("password"))
  DGS:dgsEditSetPlaceHolder(registerLogin, config:getText("login"))
  DGS:dgsEditSetPlaceHolder(registerPassword, config:getText("password"))
  DGS:dgsEditSetPlaceHolder(repeatPassword, config:getText("repeat password"))
  local loginButton = DGS:dgsCreateButton(20, 330, 120, 30, config:getText("Login"), false, loginWindow)
  local registerButton = DGS:dgsCreateButton(360, 330, 120, 30, config:getText("Register"), false, loginWindow)
  DGS:dgsWindowSetMovable(loginWindow, false)
  DGS:dgsWindowSetSizable(loginWindow, false)
  
  addEventHandler ( "onDgsMouseClick", loginButton, function(button, state)
    if(button == "left" and state == "down")then
      local loginText,passwordText = DGS:dgsGetText(login),DGS:dgsGetText(password)
      triggerServerEvent("requestLogin", resourceRoot, loginText,passwordText);
    end
  end, false)
  
  addEventHandler ( "onDgsMouseClick", registerButton, function(button, state)
    if(button == "left" and state == "down")then
      local loginText,passwordText,repeatPasswordText = DGS:dgsGetText(registerLogin),DGS:dgsGetText(registerPassword),DGS:dgsGetText(repeatPassword)
      triggerServerEvent("requestRegister", resourceRoot, loginText,passwordText,repeatPasswordText);
    end
  end, false)
  return loginWindow
end

guis["login"] = createLoginGui