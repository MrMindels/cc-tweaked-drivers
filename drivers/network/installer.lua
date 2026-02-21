local files = {"config_manager.lua", "driver.lua", "init.lua"}
local base_url = "https://raw.githubusercontent.com/MrMindels/cc-tweaked-drivers/refs/heads/main/drivers/network/"


for file_name in files do
    local url = base_url .. file_name

    local response, err = http.get(url)

    if not response then
        print("Download failed at file: " .. file_name .. " from url: " .. url)
        return
    end

    local content = response.readAll()
    response.close()

    local file = fs.open(file_name, "w")
    file.write(content)
    file.close()
end