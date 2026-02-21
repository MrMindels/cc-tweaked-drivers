local network_config = dofile("/programs/drivers/network/config_manager.lua")

print(string.format("starting rednet host name: %s, protocol: %s", network_config["network-name"], network_config["protocol"]))
--rednet.host("mqtt", network_config["network-name"])