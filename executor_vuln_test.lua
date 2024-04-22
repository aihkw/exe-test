-- i dont like identing my code okay
-- now you may ask: why in god's name is the code making me want to pull my eyes out? dont ask why... all it matters is it works!
-- made cuz bored

print("\n")

print("Executor Vulnerability Check - Executor: " .. tostring(identifyexecutor()) .. "\nInspired by the UNC Environment Check!\n")
print("✅ - Pass, ⛔ - Fail, ⏺️ - Unknown")
print("Pass means that your executor has successfully blocked/mitigated the vulnerable method, while fail means that your executor is vulnerable to it. Sometimes unknown is for some cases where the executor doesn't support a required function for the test such as hookmetamethod.\n")

local insert = function(str)
-- i only need one blocked function, this doesnt put all blocked functions inside the table datastore we made
-- oh and, im not a fan of normal tables, so i use DataStoreIncrementOptions
getgenv().BLOCKED_FUNCTION = Instance.new("DataStoreIncrementOptions")
BLOCKED_FUNCTION:SetMetadata({ func = str })
end

-- we keep in track of how many results
local pass, fail, unknown = 0, 0, 0

-- no im not gonna make a separate stupid function for printing like the unc test did, im not a fan of writing clean code i write what im the most comfortable with
print("HttpRbxApiService - This service is used by Roblox CoreScripts to send HTTP requests to the Roblox APIs. When called by executors, this can lead to: cookie logging, robux draining, and pretty much everything anyone wanted to do to the account.")

task.spawn(function()
local s, e = pcall(function() game:GetService("HttpRbxApiService"):PostAsync() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ PostAsync")
else
pass += 1
print("  ✅ PostAsync")
insert(' game:GetService("HttpRbxApiService"):PostAsync()')
end
end)
task.wait()
task.spawn(function()
local s, e = pcall(function() game:GetService("HttpRbxApiService"):PostAsyncFullUrl() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ PostAsyncFullUrl")
else
pass += 1
print("  ✅ PostAsyncFullUrl")
insert(' game:GetService("HttpRbxApiService"):PostAsyncFullUrl()')
end
end)
task.wait()
task.spawn(function()
local s, e = pcall(function() game:GetService("HttpRbxApiService"):GetAsync() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ GetAsync")
else
pass += 1
print("  ✅ GetAsync")
insert(' game:GetService("HttpRbxApiService"):GetAsync()')
end
end)
task.wait()
task.spawn(function()
local s, e = pcall(function() game:GetService("HttpRbxApiService"):GetAsyncFullUrl() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ GetAsyncFullUrl")
else
pass += 1
print("  ✅ GetAsyncFullUrl")
insert(' game:GetService("HttpRbxApiService"):GetAsyncFullUrl()')
end
end)
task.wait()
task.spawn(function()
local s, e = pcall(function() game:GetService("HttpRbxApiService"):RequestAsync() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ RequestAsync")
else
pass += 1
print("  ✅ RequestAsync")
insert(' game:GetService("HttpRbxApiService"):RequestAsync()')
end
end)
task.wait()
print("ScriptContext - One function in this service creates a CoreScript to the desired location. This has been used in bypassing executor's security especially the approach that James Napora took in his GitHub gist, parenting a CoreScript to an actor to run malicious code.")
task.spawn(function()
local s, e = pcall(function() game:GetService("ScriptContext"):AddCoreScriptLocal() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ AddCoreScriptLocal")
else
pass += 1
print("  ✅ AddCoreScriptLocal")
end
end)
task.wait()
print("BrowserService - A service meant to be used by Roblox CoreScripts. This can load something like a direct download url and auto download stuff into the exploiter's device, load any urls with their browser etc.")
task.spawn(function()
local s, e = pcall(function() game:GetService("BrowserService"):EmitHybridEvent() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ EmitHybridEvent")
else
pass += 1
print("  ✅ EmitHybridEvent")
insert(' game:GetService("BrowserService"):EmitHybridEvent()')
end
end)
task.wait()
task.spawn(function()
local s, e = pcall(function() game:GetService("BrowserService"):ExecuteJavaScript() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ ExecuteJavaScript")
else
pass += 1
print("  ✅ ExecuteJavaScript")
insert(' game:GetService("BrowserService"):ExecuteJavaScript()')
end
end)
task.wait()
task.spawn(function()
local s, e = pcall(function() game:GetService("BrowserService"):OpenBrowserWindow() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ OpenBrowserWindow")
else
pass += 1
print("  ✅ OpenBrowserWindow")
insert(' game:GetService("BrowserService"):OpenBrowserWindow()')
end
end)
task.wait()
task.spawn(function()
local s, e = pcall(function() game:GetService("BrowserService"):OpenNativeOverlay() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ OpenNativeOverlay")
else
pass += 1
print("  ✅ OpenNativeOverlay")
insert(' game:GetService("BrowserService"):OpenNativeOverlay()')
end
end)
task.wait()
task.spawn(function()
local s, e = pcall(function() game:GetService("BrowserService"):ReturnToJavaScript() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ ReturnToJavaScript")
else
pass += 1
print("  ✅ ReturnToJavaScript")
insert(' game:GetService("BrowserService"):ReturnToJavaScript()')
end
end)
task.wait()
task.spawn(function()
local s, e = pcall(function() game:GetService("BrowserService"):SendCommand() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ SendCommand")
else
pass += 1
print("  ✅ SendCommand")
insert(' game:GetService("BrowserService"):SendCommand()')
end
end)


-- as i deepen into the code, i realize... maybe i should've made a function for this and not write task.spawn again and again... but its too late.


task.wait()
print("MarketplaceService - A service in Roblox used for purchases in games. Robux Drainers can use VirtualInputManager to autoclick a prompt and drain robux, or use the other functions to directly drain robux.")
task.spawn(function()
local s, e = pcall(function() game:GetService("MarketplaceService"):GetRobuxBalance() end)
if s then
fail += 1
warn("  ⛔ GetRobuxBalance | Output: " .. tostring(e))
else
pass += 1
print("  ✅ GetRobuxBalance")
insert(' game:GetService("MarketplaceService"):GetRobuxBalance()')
end
end)
task.wait()
task.spawn(function()
local s, e = pcall(function() game:GetService("MarketplaceService"):PerformPurchase() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ PerformPurchase")
else
pass += 1
print("  ✅ PerformPurchase")
insert(' game:GetService("MarketplaceService"):PerformPurchase()')
end
end)
task.wait()
task.spawn(function()
local s, e = pcall(function() game:GetService("MarketplaceService"):PerformPurchaseV2() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ PerformPurchaseV2")
else
pass += 1
print("  ✅ PerformPurchaseV2")
insert(' game:GetService("MarketplaceService"):PerformPurchaseV2()')
end
end)
task.wait()
task.spawn(function()
local s, e = pcall(function() game:GetService("MarketplaceService"):PromptBundlePurchase() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ PromptBundlePurchase")
else
pass += 1
print("  ✅ PromptBundlePurchase")
insert('game:GetService("MarketplaceService"):PromptBundlePurchase() ')
end
end)
task.wait()
task.spawn(function()
local s, e = pcall(function() game:GetService("MarketplaceService"):PromptGamePassPurchase() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ PromptGamePassPurchase")
else
pass += 1
print("  ✅ PromptGamePassPurchase")
insert(' game:GetService("MarketplaceService"):PromptGamePassPurchase()')
end
end)
task.wait()
task.spawn(function()
local s, e = pcall(function() game:GetService("MarketplaceService"):PromptProductPurchase() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ PromptProductPurchase")
else
pass += 1
print("  ✅ PromptProductPurchase")
insert(' game:GetService("MarketplaceService"):PromptProductPurchase()')
end
end)
task.wait()
task.spawn(function()
local s, e = pcall(function() game:GetService("MarketplaceService"):PromptPurchase() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ PromptPurchase")
else
pass += 1
print("  ✅ PromptPurchase")
insert(' game:GetService("MarketplaceService"):PromptPurchase()')
end
end)
task.wait()
task.spawn(function()
local s, e = pcall(function() game:GetService("MarketplaceService"):PromptRobloxPurchase() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ PromptRobloxPurchase")
else
pass += 1
print("  ✅ PromptRobloxPurchase")
insert(' game:GetService("MarketplaceService"):PromptRobloxPurchase()')
end
end)
task.wait()
task.spawn(function()
local s, e = pcall(function() game:GetService("MarketplaceService"):PromptThirdPartyPurchase() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ PromptThirdPartyPurchase")
else
pass += 1
print("  ✅ PromptThirdPartyPurchase")
insert(' game:GetService("MarketplaceService"):PromptThirdPartyPurchase()')
end
end)
task.wait()
print("HttpService - All functions in HttpService prevents you from sending authenticated requests to Roblox APIs except one. RequestInternal.")
task.spawn(function()
local s, e = pcall(function() game:GetService("HttpService"):RequestInternal() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ RequestInternal")
else
pass += 1
print("  ✅ RequestInternal")
insert('game:GetService("HttpService"):RequestInternal() ')
end
end)
task.wait()
print("GuiService - A service in Roblox for GUI related things. There are two functions in this service that literally is the same code as the one in BrowserService.")
task.spawn(function()
local s, e = pcall(function() game:GetService("GuiService"):OpenBrowserWindow() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ OpenBrowserWindow")
else
pass += 1
print("  ✅ OpenBrowserWindow")
insert('game:GetService("GuiService"):OpenBrowserWindow() ')
end
end)
task.wait()
task.spawn(function()
local s, e = pcall(function() game:GetService("GuiService"):OpenNativeOverlay() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ OpenNativeOverlay")
else
pass += 1
print("  ✅ OpenNativeOverlay")
insert(' game:GetService("GuiService"):OpenNativeOverlay()')
end
end)
task.wait()
print("OpenCloudService - A service that is less known by the community, there is one function that can send authenticated requests to the Roblox APIs.")
task.spawn(function()
local s, e = pcall(function() game:GetService("OpenCloudService"):HttpRequestAsync() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ HttpRequestAsync")
else
pass += 1
print("  ✅ HttpRequestAsync")
insert(' game:GetService("OpenCloudService"):HttpRequestAsync()')
end
end)
task.wait()
print("CoreGui - This service (yes, CoreGui is considered service) has very minor vulnerabilities to the point where I'm not sure if it can be considered as a vulnerability. But pretty sure these can be spammed and fill the user's storage so I'm putting these here.")
task.spawn(function()
local s, e = pcall(function() game:GetService("CoreGui"):TakeScreenshot() end)
if s then
fail += 1
warn("  ⛔ TakeScreenshot")
else
pass += 1
print("  ✅ TakeScreenshot")
insert(' game:GetService("CoreGui"):TakeScreenshot()')
end
end)
task.wait()
task.spawn(function()
local s, e = pcall(function() game:GetService("CoreGui"):ToggleRecording() end)
if s then
fail += 1
warn("  ⛔ ToggleRecording")
else
pass += 1
print("  ✅ ToggleRecording")
insert(' game:GetService("CoreGui"):ToggleRecording()')
end
end)
task.wait()
print("MessageBusService - A service in Roblox used internally, but is the main priority of bad actors to achieve RCE or Remote Code Execution vulnerabilities in executors.")
task.spawn(function()
local s, e = pcall(function() game:GetService("MessageBusService"):Call() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ Call")
else
pass += 1
print("  ✅ Call")
insert(' game:GetService("MessageBusService"):Call()')
end
end)
task.wait()
task.spawn(function()
local s, e = pcall(function() game:GetService("MessageBusService"):GetLast() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ GetLast")
else
pass += 1
print("  ✅ GetLast")
insert(' game:GetService("MessageBusService"):GetLast()')
end
end)
task.wait()
task.spawn(function()
local s, e = pcall(function() game:GetService("MessageBusService"):GetMessageId() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ GetMessageId")
else
pass += 1
print("  ✅ GetMessageId")
insert('game:GetService("MessageBusService"):GetMessageId() ')
end
end)
task.wait()
task.spawn(function()
local s, e = pcall(function() game:GetService("MessageBusService"):GetProtocolMethodRequestMessageId() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ GetProtocolMethodRequestMessageId")
else
pass += 1
print("  ✅ GetProtocolMethodRequestMessageId")
insert(' game:GetService("MessageBusService"):GetProtocolMethodRequestMessageId()')
end
end)
task.wait()
task.spawn(function()
local s, e = pcall(function() game:GetService("MessageBusService"):GetProtocolMethodResponseMessageId() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ GetProtocolMethodResponseMessageId")
else
pass += 1
print("  ✅ GetProtocolMethodResponseMessageId")
insert('game:GetService("MessageBusService"):GetProtocolMethodResponseMessageId() ')
end
end)
task.wait()
task.spawn(function()
local s, e = pcall(function() game:GetService("MessageBusService"):MakeRequest() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ MakeRequest")
else
pass += 1
print("  ✅ MakeRequest")
insert(' game:GetService("MessageBusService"):MakeRequest()')
end
end)
task.wait()
task.spawn(function()
local s, e = pcall(function() game:GetService("MessageBusService"):Publish() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ Publish")
else
pass += 1
print("  ✅ Publish")
insert('game:GetService("MessageBusService"):Publish() ')
end
end)
task.wait()
task.spawn(function()
local s, e = pcall(function() game:GetService("MessageBusService"):PublishProtocolMethodRequest() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ PublishProtocolMethodRequest")
else
pass += 1
print("  ✅ PublishProtocolMethodRequest")
insert(' game:GetService("MessageBusService"):PublishProtocolMethodRequest()')
end
end)
task.wait()
task.spawn(function()
local s, e = pcall(function() game:GetService("MessageBusService"):PublishProtocolMethodResponse() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ PublishProtocolMethodResponse")
else
pass += 1
print("  ✅ PublishProtocolMethodResponse")
insert('game:GetService("MessageBusService"):PublishProtocolMethodResponse() ')
end
end)
task.wait()
task.spawn(function()
local s, e = pcall(function() game:GetService("MessageBusService"):Subscribe() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ Subscribe")
else
pass += 1
print("  ✅ Subscribe")
insert(' game:GetService("MessageBusService"):Subscribe()')
end
end)
task.wait()
task.spawn(function()
local s, e = pcall(function() game:GetService("MessageBusService"):SubscribeToProtocolMethodRequest() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ SubscribeToProtocolMethodRequest")
else
pass += 1
print("  ✅ SubscribeToProtocolMethodRequest")
insert(' game:GetService("MessageBusService"):SubscribeToProtocolMethodRequest()')
end
end)
task.wait()
task.spawn(function()
local s, e = pcall(function() game:GetService("MessageBusService"):SubscribeToProtocolMethodResponse() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ SubscribeToProtocolMethodResponse")
else
pass += 1
print("  ✅ SubscribeToProtocolMethodResponse")
insert(' game:GetService("MessageBusService"):SubscribeToProtocolMethodResponse()')
end
end)
task.wait()
print("DataModel - The DataModel represents 'game', It's the root of Roblox's parent-child hierarchy. But of course, there are some minor and major vulnerabilities that can be abused here.")
task.spawn(function()
local s, e = pcall(function() game:Load() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ Load")
else
pass += 1
print("  ✅ Load")
insert(' game:Load()')
end
end)
task.wait()
task.spawn(function()
local s, e = pcall(function() game:OpenScreenshotsFolder() end)
if s then
fail += 1
warn("  ⛔ OpenScreenshotsFolder")
else
pass += 1
print("  ✅ OpenScreenshotsFolder")
insert('game:OpenScreenshotsFolder() ')
end
end)
task.wait()
task.spawn(function()
local s, e = pcall(function() game:GetService("CoreGui"):OpenVideosFolder() end)
if s then
fail += 1
warn("  ⛔ OpenVideosFolder")
else
pass += 1
print("  ✅ OpenVideosFolder")
insert('game:GetService("CoreGui"):OpenVideosFolder() ')
end
end)
task.wait()
print("OmniRecommendationsService - One function of this service can be used to send an HTTP request to a Roblox API.")
task.spawn(function()
local s, e = pcall(function() game:GetService("OmniRecommendationsService"):MakeRequest() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ MakeRequest")
else
pass += 1
print("  ✅ MakeRequest")
insert('game:GetService("OmniRecommendationsService"):MakeRequest() ')
end
end)
task.wait()
print("Players - There are functions in game:GetService('Players') that can be used to report the LocalPlayer. And a script could make the LocalPlayer say words that are against the ToS, getting the LocalPlayer terminated.")
task.spawn(function()
local s, e = pcall(function() game:GetService("Players"):ReportAbuse() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ ReportAbuse")
else
pass += 1
print("  ✅ ReportAbuse")
insert('game:GetService("Players"):ReportAbuse() ')
end
end)
task.wait()
task.spawn(function()
local s, e = pcall(function() game:GetService("Players"):ReportAbuseV3() end)
if e == "Argument 1 missing or nil" then
fail += 1
warn("  ⛔ ReportAbuseV3")
else
pass += 1
print("  ✅ ReportAbuseV3")
insert('game:GetService("Players"):ReportAbuseV3() ')
end
end)
task.wait()
print("Custom HTTP Functions - Executors usually have a custom function for sending HTTP requests, and sometimes the function would send authenticated requests to the Roblox APIs.")
print("If one of them shows your Robux balance, your executor is vulnerable!")
task.spawn(function()
local s, e = pcall(function() getgenv().REQUEST_RESULT = request({ Url = "https://economy.roblox.com/v1/user/currency", Method = "GET" }) end)
if e == ":1: attempt to call a nil value" then
unknown += 1
print("  ⏺️ request (Executor does not support request function)")
task.wait(99999999999) -- shouldnt yield the other threads
end
if not s then
-- i am just going to assume it got blocked?
pass += 1
print("  ✅ request | Function call went error: " .. tostring(e))
task.wait(99999999999) -- shouldnt yield the other threads
end
local str = tostring(REQUEST_RESULT.Body)
local pattern = '^{"robux":'
local st, en = string.find(str, pattern)
if st == 1 then
fail += 1
warn("  ⛔ request | Robux API Output: " .. str)
else
pass += 1
print("  ✅ request")
end
end)
task.wait(0.3)
task.spawn(function()
local s, e = pcall(function() getgenv().GAME_HTTPGET_RESULT = game:HttpGet("https://economy.roblox.com/v1/user/currency") end)
if e == ":1: attempt to call a nil value" then
unknown += 1
print("  ⏺️ game:HttpGet (Executor does not support game:HttpGet function)")
task.wait(99999999999) -- shouldnt yield the other threads
end
if not s then
-- i am just going to assume it got blocked?
pass += 1
print("  ✅ game:HttpGet | Function call went error: " .. tostring(e))
task.wait(99999999999) -- shouldnt yield the other threads
end
local str = tostring(GAME_HTTPGET_RESULT)
local pattern = '^{"robux":'
local st, en = string.find(str, pattern)
if st == 1 then
fail += 1
warn("  ⛔ game:HttpGet | Robux API Output: " .. str)
else
pass += 1
print("  ✅ game:HttpGet")
end
end)
task.wait(0.3)
task.spawn(function()
local s, e = pcall(function() getgenv().GAME_HTTPPOST_RESULT = game:HttpPost("https://economy.roblox.com/v1/purchases/products/41762", '{"expectedCurrency":1,"expectedPrice":0,"expectedSellerId":116444}') end)
if e == ":1: attempt to call a nil value" then
getgenv().GAME_HTTPPOST_FINISHED = true
unknown += 1
print("  ⏺️ game:HttpPost (Executor does not support game:HttpPost function)")
task.wait(99999999999) -- shouldnt yield the other threads
end
if not s then
-- i am just going to assume it got blocked?
getgenv().GAME_HTTPPOST_FINISHED = true
pass += 1
print("  ✅ game:HttpPost | Function call went error: " .. tostring(e))
task.wait(99999999999) -- shouldnt yield the other threads
end
if game:GetService("MarketplaceService"):PlayerOwnsAsset(game.Players.LocalPlayer, 1589257) then
fail += 1
getgenv().GAME_HTTPPOST_FINISHED = true
warn("  ⛔ game:HttpPost | Request was sent to Roblox API to buy a free T-Shirt, and user now owns the T-Shirt. Executor may be vulnerable. Asset ID: 1589257 | Roblox API Response: " .. tostring(GAME_HTTPPOST_RESULT))
else
pass += 1
getgenv().GAME_HTTPPOST_FINISHED = true
print("  ✅ game:HttpPost | Everything went correctly I think... API Response: " .. tostring(GAME_HTTPPOST_RESULT))
end
end)
repeat task.wait() until GAME_HTTPPOST_FINISHED
task.wait(1)
task.wait(1.5)
task.wait()
print("Blocked Function Protection Bypass - Moving onto vulnerabilities that let bad actors bypass the security of your executor.")
task.spawn(function()
for i, v in pairs(BLOCKED_FUNCTION:GetMetadata()) do
getgenv().FUNCTION_TO_CALL = tostring(v)
end
if type(FUNCTION_TO_CALL) == "nil" then
warn("  ⛔ Cancelled. Either getgenv().FUNCTION_TO_CALL was removed from the environment, or your executor is vulnerable to every single vulnerability.")
task.wait(9999999999999)
end
local s, e = pcall(function() loadstring(tostring(FUNCTION_TO_CALL))() end)
pcall(function()
getrenv().loadstring = getgenv().loadstring
getrenv().getgenv = getgenv().getgenv
getrenv()._set = clonefunction(setthreadidentity)
local old old = hookmetamethod(game, "__index", function(a, b) task.spawn(function() _set(7) task.wait(0.1)
getgenv().s1, e1 = pcall(function() loadstring(tostring(FUNCTION_TO_CALL))() end)
end) hookmetamethod(game, "__index", old) return old(a, b) end)
end)
task.wait(0.1)
if e == e1 then
print("  ✅ Escaping Executor's Environment & Running as LocalScript")
else
if e1 == "Argument 1 missing or nil" then
warn("  ⛔ Escaping Executor's Environment & Running as LocalScript")
else
print("  ⏺️ Escaping Executor's Environment & Running as LocalScript - Something went wrong... But I'm not quite sure what... Here's the original output: `" .. tostring(e) .. "` then here's the output after escaping environment: `" .. tostring(e1) .. "`")
end
end
end)
print("  ⏺️ (No Test) Using hookmetamethod to stop metamethod hooks - There was a case like in Electron V3 where the executor's security was just quite literally hookmetamethod. You used to be able to use hookmetamethod to unhook blocked functions and bypass the security.")
task.wait(2.5)




local rate = math.round(pass / (pass + fail + unknown) * 100)
local outOf = pass .. " out of " .. (pass + fail + unknown)
print("\n")
print("Vulnerability Check Summary - " .. tostring(identifyexecutor()))
print("✅ Tested with a " .. rate .. "% vulnerability mitigations rate (" .. outOf .. ")")
print("⛔ " .. fail .. " vulnerabilities not mitigated")
print("⏺️ " .. unknown .. " vulnerabilities not tested")
