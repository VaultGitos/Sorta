local Client = {}

Client.Hook = url

function Client.SentMessage(title, des)
    local data = {
        ["embeds"] = {
            {
                ["title"] = tostring(title),
                ["description"] = tostring(des),
                ["type"] = "rich",
                ["color"] = tonumber(0x7269da),
            }
        }
    }

    local newdata = game:GetService("HttpService"):JSONEncode(data)

    local headers = {
    ["content-type"] = "application/json"
    }

    syn.request({
        Url = url, 
        Body = newdata,
        Method = "POST", 
        Headers = headers
    })
end

return Client
