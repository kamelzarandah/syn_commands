local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

VorpInv = exports.vorp_inventory:vorp_inventoryApi()


RegisterCommand("hp", function(source, args)
    
    if args ~= nil then
  local User = VorpCore.getUser(source) -- Return User with functions and all characters
  local group = User.getGroup -- Return user group (not character group)
  local id =  args[1]
    if group == "admin" then
      TriggerClientEvent('syn_commands:heal', id)
    else return false
    end
   end
  end)

  RegisterCommand("res", function(source, args)
    
    if args ~= nil then
  local User = VorpCore.getUser(source) -- Return User with functions and all characters
  local group = User.getGroup -- Return user group (not character group)
  local id =  args[1]
    if group == "admin" then
      TriggerClientEvent('vorp:resurrectPlayer', id)
    else return false
    end
   end
  end)

  RegisterCommand("givecash", function(source, args)
    
    if args ~= nil then
  local User = VorpCore.getUser(source) -- Return User with functions and all characters
  --print(User)
  print(source)
  local group = User.getGroup -- Return user group (not character group)
  local id =  args[1]
  local cash =  args[2]
  local Character = VorpCore.getUser(id).getUsedCharacter

    if group == "admin" then
      Character.addCurrency(0, cash)
    else return false
    end
   end
  end)

  RegisterCommand("givegold", function(source, args)
    
    if args ~= nil then
  local User = VorpCore.getUser(source) -- Return User with functions and all characters
  --print(User)
  print(source)
  local group = User.getGroup -- Return user group (not character group)
  local id =  args[1]
  local cash =  args[2]
  local Character = VorpCore.getUser(id).getUsedCharacter

    if group == "admin" then
      Character.addCurrency(1, cash)
    else return false
    end
   end
  end)

  RegisterCommand("giveitem", function(source, args)
    
    if args ~= nil then
  local User = VorpCore.getUser(source) -- Return User with functions and all characters
  --print(User)
  print(source)
  local group = User.getGroup -- Return user group (not character group)
  local id =  args[1]
  local item =  args[2]
  local count =  args[3]
  local Character = VorpCore.getUser(id).getUsedCharacter

    if group == "admin" then
      VorpInv.addItem(id, item, count)
    else return false
    end
   end
  end)

  RegisterCommand("takecash", function(source, args)
    
    if args ~= nil then
  local User = VorpCore.getUser(source) -- Return User with functions and all characters
  --print(User)
  print(source)
  local group = User.getGroup -- Return user group (not character group)
  local id =  args[1]
  local cash =  args[2]
  local Character = VorpCore.getUser(id).getUsedCharacter

    if group == "admin" then
      Character.removeCurrency(0, cash)
    else return false
    end
   end
  end)

  RegisterCommand("takegold", function(source, args)
    
    if args ~= nil then
  local User = VorpCore.getUser(source) -- Return User with functions and all characters
  --print(User)
  print(source)
  local group = User.getGroup -- Return user group (not character group)
  local id =  args[1]
  local cash =  args[2]
  local Character = VorpCore.getUser(id).getUsedCharacter

    if group == "admin" then
      Character.removeCurrency(1, cash)
    else return false
    end
   end
  end)

  RegisterCommand("tpm", function(source, args)
  local User = VorpCore.getUser(source) -- Return User with functions and all characters
  local group = User.getGroup -- Return user group (not character group)
   if group == "admin" then
      TriggerClientEvent('syn_commands:tpm', source)
    else return false
   end
  end)