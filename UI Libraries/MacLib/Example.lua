--[[
  Interface test demo for use in Maclib product showcase / screenshots.
  Simply a showcase, this contains no game altering code besides the interface itself.
]]

local MacLib = loadstring(game:HttpGet("https://github.com/biggaboy212/Maclib/releases/latest/download/maclib.txt"))()

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
	AntiAimSection2 = tabs.AntiAim:Section({ Side = "Left" }),
	AntiAimSection3 = tabs.AntiAim:Section({ Side = "Right" }),
	AntiAimSection4 = tabs.AntiAim:Section({ Side = "Right" }),
	
	VisualsSection1 = tabs.Visuals:Section({ Side = "Left" }),
	VisualsSection2 = tabs.Visuals:Section({ Side = "Left" }),
	VisualsSection3 = tabs.Visuals:Section({ Side = "Right" }),
	VisualsSection4 = tabs.Visuals:Section({ Side = "Right" }),
	
	SkinsSection1 = tabs.Skins:Section({ Side = "Left" }),
	SkinsSection2 = tabs.Skins:Section({ Side = "Left" }),
	SkinsSection3 = tabs.Skins:Section({ Side = "Right" }),
	SkinsSection4 = tabs.Skins:Section({ Side = "Right" }),
	
	MiscellaneousSection1 = tabs.Miscellaneous:Section({ Side = "Left" }),
	MiscellaneousSection2 = tabs.Miscellaneous:Section({ Side = "Left" }),
	MiscellaneousSection3 = tabs.Miscellaneous:Section({ Side = "Right" }),
	MiscellaneousSection4 = tabs.Miscellaneous:Section({ Side = "Right" }),
	
	ScriptsSection1 = tabs.Scripts:Section({ Side = "Left" }),
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
	Options = {
		"Force Head",
		"Force Body",
		"Force Legs",
		"Force Arms",
		"Adaptive Targeting",
		"Dynamic Adjustment",
		"Max Damage",
		"Low HP Priority"
	},
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
	Options = {
		"All", 
		"Head", 
		"Chest", 
		"Lower Chest", 
		"Stomach", 
		"Pelvis"
	},
}, "Hitboxes")

sections.RageBotSection3:Dropdown({
	Name = "Multipoints",
	Multi = true,
	Required = false,
	Search = true,
	Options = {
		"All", 
		"Head", 
		"Chest", 
		"Lower Chest", 
		"Stomach", 
		"Pelvis"
	},
}, "Multipoints")

sections.RageBotSection3:Dropdown({
	Name = "Auto stop conditions",
	Multi = true,
	Required = false,
	Search = true,
	Options = {
		"Fire Rate Based", 
		"Acceleration Based", 
		"Velocity Based"
	},
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
sections.AntiAimSection1:Toggle({
	Name = "Enable Anti Aim",
	Default = false,
}, "EnableAntiAim")

sections.AntiAimSection1:Slider({
	Name = "Yaw Offset",
	Default = 180,
	Minimum = 0,
	Maximum = 360,
	DisplayMethod = "Degrees",
	Precision = 0,
}, "YawOffset")

sections.AntiAimSection1:Dropdown({
	Name = "Jitter Mode",
	Multi = false,
	Required = true,
	Search = true,
	Default = 1,
	Options = {"Off", "Projectile Avoidance","Random X", "Random Y", "Random XY"},
}, "JitterMode")

sections.AntiAimSection1:Colorpicker({
	Name = "Indicator Color",
	Default = Color3.fromRGB(255,87,51),
	Alpha = 0.75,
}, "IndicatorColor")

--[[ SECTION 2 ]]
sections.AntiAimSection2:Slider({
	Name = "Pitch Offset",
	Default = 89,
	Minimum = 0,
	Maximum = 178,
	DisplayMethod = "Degrees",
	Precision = 0,
}, "PitchOffset")

sections.AntiAimSection2:Keybind({
	Name = "Manual Override",
}, "ManualOverride")

sections.AntiAimSection2:Label({
	Text = "Desync Amount"
})

sections.AntiAimSection2:Slider({
	Name = "Desync Strength",
	Default = 50,
	Minimum = 0,
	Maximum = 100,
	DisplayMethod = "Percent",
	Precision = 0,
}, "DesyncStrength")

sections.AntiAimSection2:Toggle({
	Name = "Invert Yaw",
	Default = true,
}, "InvertYaw")

sections.AntiAimSection2:Toggle({
	Name = "Disable Hitbox",
	Default = false,
}, "DisableHitbox")

--[[ SECTION 3 ]]
sections.AntiAimSection3:Toggle({
	Name = "Enable Fake Lag",
	Default = true,
}, "EnableFakeLag")

sections.AntiAimSection3:Slider({
	Name = "Fake Lag Limit",
	Default = 5,
	Minimum = 0,
	Maximum = 20,
	DisplayMethod = "Value",
	Precision = 0,
}, "FakeLagLimit")

sections.AntiAimSection3:Dropdown({
	Name = "Fake Lag Type",
	Multi = false,
	Required = true,
	Search = true,
	Default = 4,
	Options = {"Off", "Random", "Ping Based", "Adaptive"},
}, "FakeLagType")

sections.AntiAimSection3:Keybind({
	Name = "Freestanding",
}, "Freestanding")

sections.AntiAimSection3:Dropdown({
	Name = "Freestand Method",
	Multi = false,
	Required = true,
	Search = true,
	Default = 1,
	Options = {"Thickness Based", "Damage Based"},
}, "FreestandMethod")

--[[ SECTION 4 ]]
sections.AntiAimSection4:Label({
	Text = "Desync Jitter"
})

sections.AntiAimSection4:Toggle({
	Name = "Desync Enabled",
	Default = true,
}, "DesyncEnabled")

sections.AntiAimSection4:Slider({
	Name = "Desync Ping",
	Default = 700,
	Minimum = 100,
	Maximum = 1000,
	DisplayMethod = "Value",
	Precision = 0,
}, "DesyncPing")

sections.AntiAimSection4:Dropdown({
	Name = "Desync Method",
	Multi = false,
	Required = true,
	Search = true,
	Default = 2,
	Options = {
		"Static Desync",
		"Adaptive Desync",
		"Randomized Desync",
		"Opposite Desync"
	},
}, "DesyncMethod")

sections.AntiAimSection4:Slider({
	Name = "Desync Min Offset",
	Default = 25,
	Minimum = 1,
	Maximum = 100,
	DisplayMethod = "Value",
	Precision = 0,
}, "DesyncMinOffset")

-----------------
---- VISUALS ----
-----------------

--[[ SECTION 1 ]]
sections.VisualsSection1:Toggle({
	Name = "ESP Master Toggle",
	Default = true,
}, "ESPMasterToggle")

sections.VisualsSection1:Keybind({
	Name = "ESP Keybind",
}, "ToggleESP")

sections.VisualsSection1:Toggle({
	Name = "Team Check",
	Default = true,
}, "TeamCheck")

sections.VisualsSection1:Colorpicker({
	Name = "Box Color",
	Default = Color3.fromRGB(255, 255, 0),
	Alpha = 0.8
}, "BoxColor")

sections.VisualsSection1:Toggle({
	Name = "Custom Crosshair",
	Default = true,
}, "CustomCrosshair")

sections.VisualsSection1:Input({
	Name = "Crosshair Image ID",
	Placeholder = "Image ID here"
}, "CrosshairImageID")

--[[ SECTION 2 ]]
sections.VisualsSection2:Toggle({
	Name = "Enable Chams",
	Default = false,
}, "EnableChams")

sections.VisualsSection2:Colorpicker({
	Name = "Chams Color",
	Default = Color3.fromRGB(0, 255, 0),
	Alpha = 0.7
}, "ChamsColor")

sections.VisualsSection2:Dropdown({
	Name = "Chams Type",
	Multi = false,
	Required = true,
	Search = true,
	Default = 1,
	Options = {
		"Viewport",
		"Drawing Library",
		"SurfaceGUI"
	},
}, "ChamsType")

sections.VisualsSection2:Dropdown({
	Name = "Chams Refresh Rate",
	Multi = false,
	Required = true,
	Search = true,
	Default = 1,
	Options = {
		"Unlimited",
		"24 FPS",
		"30 FPS",
		"48 FPS",
		"60 FPS",
		"80 FPS",
		"120 FPS",
		"240 FPS",
	},
}, "ChamsRefreshRate")

--[[ SECTION 3 ]]
sections.VisualsSection3:Toggle({
	Name = "Glow Master Toggle",
	Default = true,
}, "GlowMasterToggle")

sections.VisualsSection3:Keybind({
	Name = "Glow Keybind",
}, "GlowKeybind")

sections.VisualsSection3:Dropdown({
	Name = "Glow Type",
	Multi = false,
	Required = true,
	Search = true,
	Default = 1,
	Options = {
		"Outline",
		"Inline",
		"Center"
	},
}, "GlowType")

sections.VisualsSection3:Colorpicker({
	Name = "Glow Color",
	Default = Color3.fromRGB(0, 0, 255),
	Alpha = 0
}, "GlowColor")

sections.VisualsSection3:Slider({
	Name = "Glow Radius",
	Default = 10,
	Minimum = 1,
	Maximum = 20,
	DisplayMethod = "Value",
	Precision = 0,
}, "GlowRadius")

--[[ SECTION 4 ]]
sections.VisualsSection4:Toggle({
	Name = "Enable Outlines",
	Default = true,
}, "ShowPlayerOutlines")

sections.VisualsSection4:Colorpicker({
	Name = "Outline Color",
	Default = Color3.fromRGB(255,255,255),
	Alpha = 0.8,
}, "OutlineColor")

sections.VisualsSection4:Dropdown({
	Name = "Health Bar Type",
	Multi = false,
	Required = true,
	Search = true,
	Default = 1,
	Options = {
		"Vertical",
		"Horizontal"
	},
}, "HealthBarType")

sections.VisualsSection4:Colorpicker({
	Name = "Health Bar Color (Alive)",
	Default = Color3.fromRGB(0, 255, 0),
}, "AliveHealthBarColor")

sections.VisualsSection4:Colorpicker({
	Name = "Health Bar Color (Dead)",
	Default = Color3.fromRGB(255, 0, 0),
}, "DeadHealthBarColor")

---------------
---- SKINS ----
---------------

--[[ SECTION 1 ]]
sections.SkinsSection1:Toggle({
	Name = "Enable Skins",
	Default = true,
}, "EnableSkins")

sections.SkinsSection1:Dropdown({
	Name = "Weapon Selection",
	Multi = true,
	Required = false,
	Search = true,
	Default = {"AK-47"},
	Options = {
		"AK-47", 
		"M4A1", 
		"Desert Eagle", 
		"AWP", 
		"MP5", 
		"SPAS-12",
		"M4A4",
		"FAMAS",
		"P90",
		"UMP-45",
		"MAC-10",
		"CZ75-Auto",
		"Tec-9",
		"Glock-18",
		"Nova",
		"Negev",
		"PP-Bizon",
		"MAG-7",
		"R8 Revolver",
		"SCAR-20",
		"SG 553",
		"AUG",
		"M249",
		"MP7",
		"UMP45",
	}
}, "WeaponSelection")

sections.SkinsSection1:Dropdown({
	Name = "Skins",
	Multi = false,
	Required = true,
	Search = true,
	Default = 1,
	Options = {
		"AK-47 | Redline",
		"AWP | Asiimov",
		"M4A4 | Howl",
		"Desert Eagle | Blaze",
		"Glock-18 | Fade",
		"Karambit | Doppler",
		"M9 Bayonet | Crimson Web",
		"Butterfly Knife | Tiger Tooth",
		"AK-47 | Fire Serpent",
		"StatTrak™ M4A1-S | Hyper Beast",
		"P90 | Trigon",
		"USP-S | Kill Confirmed",
		"Mac-10 | Neon Rider",
		"FAMAS | Valence",
		"CZ75-Auto | Victoria",
		"P250 | Bone Mask",
		"AWP | Dragon Lore",
		"M4A1-S | Printstream",
		"MP7 | Akimbo",
		"M4A4 | Radiation Hazard"
	}
}, "Skins")

sections.SkinsSection1:Colorpicker({
	Name = "Skin Color (Tint)",
	Default = Color3.fromRGB(255,255,255),
}, "SkinTint")

--[[ SECTION 2 ]]
sections.SkinsSection2:Slider({
	Name = "Wear Level",
	Default = 0,
	Minimum = 0,
	Maximum = 100,
	DisplayMethod = "Percent",
	Precision = 0,
}, "WearLevel")

sections.SkinsSection2:Toggle({
	Name = "StatTrak Counter",
	Default = false,
}, "StatTrakCounter")

sections.SkinsSection2:Keybind({
	Name = "Toggle Skins",
}, "ToggleSkins")

sections.SkinsSection2:Dropdown({
	Name = "Skin Finish",
	Multi = false,
	Required = false,
	Search = true,
	Default = 1,
	Options = {
		"Glossy",
		"Matte",
		"Patterned",
		"Damaged",
		"StatTrak",
		"Minimal Wear",
		"Factory New",
		"Battle-Scarred",
		"Well-Worn"
	}
}, "SkinFinish")

sections.SkinsSection2:Slider({
	Name = "Sticker Opacity",
	Default = 100,
	Minimum = 0,
	Maximum = 100,
	DisplayMethod = "Percent",
	Precision = 0,
}, "StickerOpacity")

sections.SkinsSection2:Toggle({
	Name = "Enable Knife Skins",
	Default = true,
}, "EnableKnifeSKins")

--[[ SECTION 3 ]]
sections.SkinsSection3:Colorpicker({
	Name = "Sticker Color (Tint)",
	Default = Color3.fromRGB(255,215,0),
	Alpha = 0.9
}, "StickerColor")

sections.SkinsSection3:Slider({
	Name = "Sticker Wear",
	Default = 0,
	Minimum = 0,
	Maximum = 100,
	DisplayMethod = "Percent",
	Precision = 0,
}, "StickerWear")

sections.SkinsSection3:Dropdown({
	Name = "Sticker Type",
	Multi = false,
	Required = false,
	Search = true,
	Default = 1,
	Options = {
		"Classic",
		"Unroll (Animated)",
		"Fade-in (Animated)",
	}
}, "StickerType")

sections.SkinsSection3:Input({
	Name = "Sticker Text",
	Placeholder = "Enter text...",
}, "StickerText")

--[[ SECTION 4 ]]
sections.SkinsSection4:Input({
	Name = "Pattern Index",
	Placeholder = "Enter index...",
}, "PatternIndex")

sections.SkinsSection4:Slider({
	Name = "Pattern Strength",
	Default = 50,
	Minimum = 0,
	Maximum = 100,
	DisplayMethod = "Percent",
	Precision = 0,
}, "PatternStrength")

sections.SkinsSection4:Slider({
	Name = "Pattern Opacity",
	Default = 100,
	Minimum = 0,
	Maximum = 100,
	DisplayMethod = "Percent",
	Precision = 0,
}, "PatternOpacity")

sections.SkinsSection4:Slider({
	Name = "Skin Opacity",
	Default = 100,
	Minimum = 0,
	Maximum = 100,
	DisplayMethod = "Percent",
	Precision = 0,
}, "SkinOpacity")

sections.SkinsSection4:Button({
	Name = "Apply Changes",
	Callback = function()
		Window:Notify({
			Title = Window.Settings.Title,
			Description = "Applied Skins",
			Lifetime = 5
		})
	end,
})

sections.SkinsSection4:Dropdown({
	Name = "Weapon Type",
	Multi = false,
	Required = false,
	Search = true,
	Default = 1,
	Options = {
		"Rifle",
		"Pistol",
		"Shotgun",
		"SMG",
		"Sniper",
		"Machine Gun",
		"Melee",
		"Launcher",
		"Crossbow",
		"Bow"
	}
}, "WeaponType")

-----------------------
---- MISCELLANEOUS ----
-----------------------

--[[ SECTION 1 ]]
sections.MiscellaneousSection1:Toggle({
	Name = "Auto-Phrase",
	Default = false,
}, "AutoPhrase")

sections.MiscellaneousSection1:Slider({
	Name = "Phrase Delay",
	Default = 1,
	Minimum = 0,
	Maximum = 5,
	DisplayMethod = "Value",
	Precision = 1,
}, "JumpHeight")

sections.MiscellaneousSection1:Dropdown({
	Name = "Phrases",
	Multi = true,
	Required = true,
	Search = true,
	Default = {"ur bad kid", "try harder", "gg ez"},
	Options = {
		"ur bad kid",
		"try harder",
		"gg ez",
		"clutch or kick"
	}
}, "Phrases")

sections.MiscellaneousSection1:Input({
	Name = "Insert Phrase",
	Placeholder = "Enter Phrase...",
}, "InsertPhrase")

--[[ SECTION 2 ]]
sections.MiscellaneousSection2:Toggle({
	Name = "Bunny Hop Master Switch",
	Default = false,
}, "BunnyHopMasterSwitch")

sections.MiscellaneousSection2:Keybind({
	Name = "Bunny Hop Keybind",
}, "BunnyHopKeybind")

sections.MiscellaneousSection2:Slider({
	Name = "Jump Delay",
	Default = 1,
	Minimum = 0,
	Maximum = 5,
	DisplayMethod = "Value",
	Precision = 3,
}, "JumpDelay")

sections.MiscellaneousSection2:Toggle({
	Name = "Ground Detection",
	Default = true,
}, "GroundDetection")

sections.MiscellaneousSection2:Slider({
	Name = "Jump Height",
	Default = 50,
	Minimum = 1,
	Maximum = 100,
	DisplayMethod = "Percent",
	Precision = 0,
}, "JumpHeight")

sections.MiscellaneousSection2:Slider({
	Name = "Air Control",
	Default = 87,
	Minimum = 0,
	Maximum = 100,
	DisplayMethod = "Percent",
	Precision = 0,
}, "AirControl")

--[[ SECTION 3 ]]
sections.MiscellaneousSection3:Slider({
	Name = "Movement Speed",
	Default = 16,
	Minimum = 1,
	Maximum = 200,
	DisplayMethod = "Value",
	Precision = 0,
}, "MovementSpeed")

sections.MiscellaneousSection3:Slider({
	Name = "Jump Power",
	Default = 50,
	Minimum = 1,
	Maximum = 500,
	DisplayMethod = "Value",
	Precision = 0,
}, "JumpPower")

sections.MiscellaneousSection3:Toggle({
	Name = "Auto Jump",
	Default = true,
}, "AutoJump")

sections.MiscellaneousSection3:Toggle({
	Name = "Fast Weapon Switch",
	Default = true,
}, "AutoJump")

sections.MiscellaneousSection3:Toggle({
	Name = "No Fall Damage",
	Default = true,
}, "AutoJump")

sections.MiscellaneousSection3:Slider({
	Name = "Camera FOV",
	Default = 70,
	Minimum = 50,
	Maximum = 120,
	DisplayMethod = "Degrees",
	Precision = 0,
}, "CameraFOV")

--[[ SECTION 4 ]]
sections.MiscellaneousSection4:Toggle({
	Name = "Auto Accept Trades",
	Default = true,
}, "AutoAcceptTrades")

sections.MiscellaneousSection4:Dropdown({
	Name = "Auto Accept Conditions",
	Multi = true,
	Required = true,
	Search = true,
	Options = {
		"Items of Equal Value",
		"Item Condition Matches",
		"Specific Item Selected",
		"Exact Item Match",
		"Player Level Matches",
		"Trade Offer from Trusted User",
		"Minimum Item Value Met",
		"Item Type Match (e.g., skins, cases)",
		"No Items in Pending Trade",
		"Trade Accept Time (e.g., after 5 seconds)"
	}
}, "AutoAcceptConditions")

sections.MiscellaneousSection4:Slider({
	Name = "Minimum Value",
	Minimum = 0,
	Maximum = 1000,
	Default = 50,
	DisplayMethod = "Value",
	Precision = 0,
	Suffix = "$"
}, "MinimumTradeValue")

sections.MiscellaneousSection4:Dropdown({
	Name = "Auto Accept Categories",
	Multi = true,
	Required = true,
	Search = true,
	Options = {
		"Skins",
		"Cases",
		"Stickers",
		"Key",
		"Souvenir Items",
		"Gloves",
		"Other",
	}
}, "AutoAcceptItemCategories")

----------------
---- CONFIG ----
----------------

--[[ SECTION 1 ]]
tabs.Configs:InsertConfigSection("Left")

-----------------
---- SCRIPTS ----
-----------------

--[[ SECTION 1 ]]
sections.ScriptsSection1:Input({
	Name = "LUA Code",
	Placeholder = "Enter Code...",
}, "LuaCode")

sections.ScriptsSection1:Button({
	Name = "Run Code",
	Callback = function()
		Window:Dialog({
			Title = "Warning",
			Description = "Are you sure? We are not responsible for any punishment via warning/ban/etc.. that you get from running this code.",
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
})

-- // INITIALIZE \\ --
tabs.Ragebot:Select()
