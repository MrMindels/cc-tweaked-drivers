local ccuid_util = dofile("/programs/utils/ccuid-util.lua")
local network_config = {}

print("Initializing network driver config")

network_config["network-name"] = "undefined"
network_config["protocol"] = "mqtt"

local config_file = nil

local function saveConfig()
    local config_file = fs.open("/programs/drivers/network/config.txt", "w")
    for k, v in pairs(network_config) do
        print(k .. "=" .. v)
        config_file.writeLine(k .. "=" .. v)
    end

    config_file.close()
end


if not fs.exists("/programs/drivers/network/config.txt") then
    saveConfig()
else
    config_file = fs.open("/programs/drivers/network/config.txt", "r")
    while true do
        local line = config_file.readLine()
        if not line then break end
        
        local key, value = string.match(line, "^%s*(.-)%s*=%s*(.-)%s*$")
        if key and value then
            network_config[key] = value
        end
    end

    config_file.close()
end

return network_config