--[[
  Interface test demo for use in Maclib product showcase / screenshots.
  Simply a showcase, this contains no game altering code besides the interface itself.
]]

local MacLib = require(script.Parent.MacLib:Clone())

local Window = MacLib:Window({
	Title = "Karpiware 6.1.0",
	Subtitle = "Build - Paid (Stable) | Universal",
	Size = UDim2.fromOffset(868, 652),
	DragStyle = 1,
	DisabledWindowControls = {},
	ShowUserInfo = true,
	Keybind = Enum.KeyCode.RightControl,
	AcrylicBlur = true,
})

local globalSettings = {
	UIBlurToggle = Window:GlobalSetting({
		Name = "UI Blur",
		Default = Window:GetAcrylicBlurState(),
		Callback = function(bool)
			Window:SetAcrylicBlurState(bool)
			Window:Notify({
				Title = Window.Settings.Title,
				Description = (bool and "Enabled" or "Disabled") .. " UI Blur",
				Lifetime = 5
			})
		end,
	}),
	NotificationToggler = Window:GlobalSetting({
		Name = "Notifications",
		Default = Window:GetNotificationsState(),
		Callback = function(bool)
			Window:SetNotificationsState(bool)
			Window:Notify({
				Title = Window.Settings.Title,
				Description = (bool and "Enabled" or "Disabled") .. " Notifications",
				Lifetime = 5
			})
		end,
	}),
	ShowUserInfo = Window:GlobalSetting({
		Name = "Show User Info",
		Default = Window:GetUserInfoState(),
		Callback = function(bool)
			Window:SetUserInfoState(bool)
			Window:Notify({
				Title = Window.Settings.Title,
				Description = (bool and "Showing" or "Redacted") .. " User Info",
				Lifetime = 5
			})
		end,
	})
}

local tabGroups = {
	Aim = Window:TabGroup(),
	World = Window:TabGroup(),
	Other = Window:TabGroup()
}

local tabs = {
	Ragebot = tabGroups.Aim:Tab({ Name = "Ragebot", Image = "rbxassetid://99275039709063" }),
	AntiAim = tabGroups.Aim:Tab({ Name = "Anti Aim", Image = "rbxassetid://121700697298748" }),
	
	Visuals = tabGroups.World:Tab({ Name = "Visuals", Image = "rbxassetid://104811813262009" }),
	Skins = tabGroups.World:Tab({ Name = "Skins", Image = "rbxassetid://88238578565569" }),
	
	Miscellaneous = tabGroups.Other:Tab({ Name = "Miscellaneous", Image = "rbxassetid://71732494649961" }),
	Configs = tabGroups.Other:Tab({ Name = "Configs", Image = "rbxassetid://110807522910450" }),
	Scripts = tabGroups.Other:Tab({ Name = "Scripts", Image = "rbxassetid://125500743878117" })
}

local sections = {
	RageBotSection1 = tabs.Ragebot:Section({ Side = "Left" }),
	RageBotSection2 = tabs.Ragebot:Section({ Side = "Left" }),
	RageBotSection3 = tabs.Ragebot:Section({ Side = "Right" }),
	RageBotSection4 = tabs.Ragebot:Section({ Side = "Right" }),
	
	AntiAimSection1 = tabs.AntiAim:Section({ Side = "Left" }),
}

-----------------
---- RAGEBOT ----
-----------------

--[[ SECTION 1 ]]
sections.RageBotSection1:Toggle({
	Name = "Master switch",
	Default = false,
}, "MasterSwitch")

sections.RageBotSection1:Toggle({
	Name = "Silent aim",
	Default = true,
}, "SilentAim")

sections.RageBotSection1:Slider({
	Name = "Field of view",
	Default = 180,
	Minimum = 50,
	Maximum = 180,
	DisplayMethod = "Degrees",
	Precision = 0,
}, "FieldOfView")

sections.RageBotSection1:Toggle({
	Name = "Override resolver",
	Default = true,
}, "OverrideResolver")

--[[ SECTION 2 ]]
sections.RageBotSection2:Toggle({
	Name = "Autowall",
	Default = false,
}, "Autowall")

sections.RageBotSection2:Slider({
	Name = "Hitchance",
	Default = 55,
	Minimum = 0,
	Maximum = 100,
	DisplayMethod = "Percent",
	Precision = 0,
}, "HitChance")

sections.RageBotSection2:Toggle({
	Name = "Static point scale",
	Default = true,
}, "StaticPointScale")

sections.RageBotSection2:Slider({
	Name = "Head scale",
	Default = 39,
	Minimum = 0,
	Maximum = 100,
	DisplayMethod = "Percent",
	Precision = 0,
}, "HeadScale")

sections.RageBotSection2:Slider({
	Name = "Body scale",
	Default = 82,
	Minimum = 0,
	Maximum = 100,
	DisplayMethod = "Percent",
	Precision = 0,
}, "BodyScale")

sections.RageBotSection2:Dropdown({
	Name = "Force conditions",
	Multi = true,
	Required = false,
	Search = true,
	Options = {"Option 1", "Option 2", "Option 3"},
}, "ForceConditions")

--[[ SECTION 3 ]]
sections.RageBotSection3:Slider({
	Name = "Minimum damage",
	Default = 39,
	Minimum = 0,
	Maximum = 100,
	DisplayMethod = "Value",
	Precision = 0,
}, "MinimumDamage")

sections.RageBotSection3:Toggle({
	Name = "Automatic penetration",
	Default = true,
}, "AutomaticPenetration")

sections.RageBotSection3:Toggle({
	Name = "Force body aim",
	Default = true,
}, "ForceBodyAim")

sections.RageBotSection3:Toggle({
	Name = "Force safe point",
	Default = true,
}, "ForceSafePoint")

sections.RageBotSection3:Dropdown({
	Name = "Hitboxes",
	Multi = true,
	Required = false,
	Search = true,
	Options = {"Option 1", "Option 2", "Option 3"},
}, "Hitboxes")

sections.RageBotSection3:Dropdown({
	Name = "Multipoints",
	Multi = true,
	Required = false,
	Search = true,
	Options = {"Option 1", "Option 2", "Option 3"},
}, "Multipoints")

sections.RageBotSection3:Dropdown({
	Name = "Auto stop conditions",
	Multi = true,
	Required = false,
	Search = true,
	Options = {"Option 1", "Option 2", "Option 3"},
}, "AutoStopConditions")

--[[ SECTION 4 ]]
sections.RageBotSection4:Toggle({
	Name = "Double tap",
	Default = false,
}, "DoubleTap")

sections.RageBotSection4:Toggle({
	Name = "Hide shots",
	Default = true,
}, "HideShots")

sections.RageBotSection4:Slider({
	Name = "Exploit fake lag limit",
	Default = 14,
	Minimum = 1,
	Maximum = 14,
	DisplayMethod = "Value",
	Precision = 0,
}, "ExploitFakeLagLimit")

------------------
---- ANTI AIM ----
------------------

--[[ SECTION 1 ]]
sections.AntiAimSection1:Button({
	Name = "Dialog",
	Callback = function()
		Window:Dialog({
			Title = Window.Settings.Title,
			Description = "Lorem ipsum odor amet, consectetuer adipiscing elit. Eros vestibulum aliquet mattis, ex platea nunc.",
			Buttons = {
				{
					Name = "Confirm",
					Callback = function()
						print("Confirmed!")
					end,
				},
				{
					Name = "Cancel"
				}
			}
		})
	end,
}, "DialogTestButton")


-- // INITIALIZE \\ --
tabs.Ragebot:Select()

MacLib:SetFolder("Maclib")
tabs.Configs:InsertConfigSection("Left")
MacLib:LoadAutoLoadConfig()
