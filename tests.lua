lu = require('3rdparty/luaunit')
local beyond = dofile("1beyond.qplug")

function TestBase64Encoding()
    local decoded  = "Pi = 3.1415 if you like precision!"
    local expected = "UGkgPSAzLjE0MTUgaWYgeW91IGxpa2UgcHJlY2lzaW9uIQ=="
    lu.assertEquals(expected, to_base64(decoded))
end

function TestUNAPEncode_Basic()
    local uname = "JohnSmith"
    local pwd   = "password"
    local expected = "Sm9oblNtaXRoOnBhc3N3b3Jk"
    lu.assertEquals(expected, UNAPEncode(uname, pwd))
end

function TestUNAPEncode_Fail_NoUname()
    lu.assertError(function()
        UNAPEncode("", "password")
    end)
end

function TestUNAPEncode_Fail_NoPWD()
    lu.assertError(function()
        UNAPEncode("JohnSmith", "")
    end)
end

os.exit( lu.LuaUnit.run() )