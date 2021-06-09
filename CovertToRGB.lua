local Color3 = {}

function Color3.ConvertRGB(args)
    return tonumber(65536 * args.r + 256 * args.g + args.b)
end

return Color3
