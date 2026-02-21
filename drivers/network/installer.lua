files = {"config_manager.lua", "driver.lua", "init.lua"}
base_url = "https://raw.githubusercontent.com/MrMindels/cc-tweaked-drivers/refs/heads/main/drivers/network/"

if not fs.exists("programs/drivers/network") then
    fs.makeDir("programs/drivers/network")   
    print("Made needed directorie's")
else
    if not fs.isDir("programs/drivers/network") then
        fs.makeDir("programs/drivers/network")
    end
end

for _, file_name in ipairs(files) do
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
