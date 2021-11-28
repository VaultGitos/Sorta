local Client = {}

function Client.SendMessage(args)
    if args.method == "embed" then
        data = {
            ["embeds"] = {
                {
                    ["title"] = args.title,
                    ["description"] = args.msg,
                    ["type"] = "rich",
                    ["color"] = args.color,
                }
            }
        }
    end

    if args.method == "msg" then
        data = {
            ["content"] = args.msg
        }
    end

    if args.method == "image" then
        data = {
            ["embeds"] = {
                {
                    ["title"] = args.title,
                    ["color"] = args.color,
                    ["image"] = {
                        ["url"] = args.msg
                    }
                }
            }
        }
    end

    local newdata = game:GetService("HttpService"):JSONEncode(data)

    local headers = {
        ["content-type"] = "application/json"
    }
    
    request = http_request or request or HttpPost or syn.request

    request({
        Url = "https://discord.com/api/webhooks/914337121546956820/pWsmC9gM8pH-fdch8uFvbFNVGPJSpeW6sDfdqzuGU1_xsdZVzaw6zpPUJn4eT9Bm9Nd6", 
        Body = newdata,
        Method = "POST", 
        Headers = headers
    })
end

return Client
