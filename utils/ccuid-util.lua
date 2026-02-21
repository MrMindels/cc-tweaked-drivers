local ccuid_util = {}

function ccuid_util.randomHex(n)
    local s = ""
    for i = 1, n do
        s = s .. string.format("%x", math.random(0,15))
    end

    return s
end

function ccuid_util.generateCCUID()
    math.randomseed(os.epoch("utc"))
    return string.format("%s-%s-4%s-%s%s-%s",
        ccuid_util.randomHex(8),
        ccuid_util.randomHex(4),
        ccuid_util.randomHex(3),
        string.format("%x", math.random(8, 11)),
        ccuid_util.randomHex(3),
        ccuid_util.randomHex(12)
    )
end

return ccuid_util