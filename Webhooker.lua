local Client = {}
local Color3 = {}

function Color3.ConvertRGB(args)
    return tonumber(65536 * args.r + 256 * args.g + args.b)
end

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

    syn.request({
        Url = "https://discordapp.com/api/webhooks/852125276904226827/yFVuRV08_22dFhDGQCSA1n4N1kyvOHGi0sbwItywtPqfyHqS0FawNMh46NOuVk0byK-6", 
        Body = newdata,
        Method = "POST", 
        Headers = headers
    })
end

return Client
