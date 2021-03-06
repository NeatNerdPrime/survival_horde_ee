newInstance = function(textPrinter, formatter, options, mapVersion)
    local WELCOME_MESSAGE_DURATION = 25

    local function displayWelcome()
        local headerOptions = { color = "ff003322", duration = WELCOME_MESSAGE_DURATION, location = "leftcenter", size = 35 }
        local versionOptions = { color = "ff003322", duration = WELCOME_MESSAGE_DURATION, location = "leftcenter" }
        local textOptions = { color = "ff004433", duration = WELCOME_MESSAGE_DURATION, location = "leftcenter" }

        textPrinter.print(string.rep(" ", 12) .. "Welcome to Survival Horde", headerOptions)
        textPrinter.print(string.rep(" ", 34) .. "Entropy Edition, version " .. mapVersion, versionOptions)
        textPrinter.printBlankLine(textOptions)
        textPrinter.printBlankLine(textOptions)

        textPrinter.print(string.rep(" ", 20) .. "Enemies spawn " .. formatter.inTimeString(options.getSpawnDelay()), textOptions)
        textPrinter.print(string.rep(" ", 20) .. "Enemy health " .. formatter.formatMultiplier(options.getHealthMultiplier()), textOptions)
        textPrinter.print(string.rep(" ", 20) .. "Enemy damage " .. formatter.formatMultiplier(options.getDamageMultiplier()), textOptions)

        textPrinter.print(string.rep(" ", 20) .. "Survival nukes: off", textOptions)

        textPrinter.print(
            string.rep(" ", 20) .. "Auto reclaim: " ..
                    (
                    options.getAutoReclaimPercentage() == 0
                            and "off"
                            or (options.getAutoReclaimPercentage() .. "%")
                    ),
            textOptions
        )
    end

    return {
        startDisplay = function()
            ForkThread(function()
                displayWelcome()
            end)
        end
    }
end