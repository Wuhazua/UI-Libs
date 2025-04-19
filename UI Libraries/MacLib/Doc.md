# MacLib Documentation

## Loader

```lua
local MacLib = loadstring(game:HttpGet("https://github.com/biggaboy212/Maclib/releases/latest/download/maclib.txt"))()
```

---

## Core Functions

```lua
MacLib:Demo() -- Brings up a demo window

MacLib:SetFolder("FolderName")
-- Sets the folder where all configs are saved.

MacLib:SaveConfig("ConfigName.json")
-- Saves all element values to a file.
-- Ignore elements with .IgnoreConfig = true or no flag.

MacLib:LoadConfig("ConfigName.json")
-- Loads a config from the specified file.

local list = MacLib:RefreshConfigList()
-- Returns a table of saved config names, e.g. {"Legit.json", "Rage.json"}

MacLib:LoadAutoLoadConfig()
-- Loads the selected auto-load config.
```

---

## Creating a Window

```lua
local Window = MacLib:Window({
    Title = "Kuzu Hub",
    Subtitle = "Paid | V3.12",
    Size = UDim2.fromOffset(868, 650),
    DragStyle = 1,
    DisabledWindowControls = {},
    ShowUserInfo = true,
    Keybind = Enum.KeyCode.RightControl,
    AcrylicBlur = true,
})
```

---

## Global Setting

```lua
local Global_Setting = Window:GlobalSetting({
    Name = "Moderator Join Alerts",
    Default = false,
    Callback = function(State)
        print("Moderator Join Alerts " .. (State and "Enabled" or "Disabled"))
    end,
})
```

---

## Notification

```lua
Window:Notify({
    Title = "Kuzu Hub",
    Description = "Hello, World!",
    Lifetime = 5
})
```

### Notification Functions

```lua
Notification:UpdateTitle("New Title")
Notification:UpdateDescription("Updated description.")
Notification:Resize(400)
Notification:Cancel()
```

---

## Dialog

```lua
Window:Dialog({
    Title = "Kuzu Hub",
    Description = "Are you sure? This is not reversible and can get you banned in up-to-date servers.",
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
```

### Dialog Functions

```lua
Dialog:UpdateTitle("New Title")
Dialog:UpdateDescription("New description.")
Dialog:Cancel()
```

---

## Tab Group

```lua
local TabGroup = Window:TabGroup()
```

---

## Tabs

```lua
local Tab = TabGroup:Tab({
    Name = "Main",
    Image = "rbxassetid://1234567890" -- Max 16x16 pixels
})
```

### Tab Functions

```lua
Tab:Select()
Tab:InsertConfigSection("Left") -- or "Right"
```

---

## Sections

```lua
local Section = Tab:Section({
    Side = "Left" -- or "Right"
})
```

---

## Buttons

```lua
local Button = Section:Button({
    Name = "Kill All",
    Callback = function()
        print("Killed everyone.")
    end,
})
```

### Button Functions

```lua
Button:UpdateName("New Name")
Button:SetVisiblity(true)
Button.Settings -- table (includes Callback)
```

---

## Inputs

```lua
local Input = Section:Input({
    Name = "Target",
    Placeholder = "Username",
    AcceptedCharacters = "All",
    Callback = function(input)
        print("Target set: " .. input)
    end,
}, "TargetInput")
```

### Input Functions

```lua
Input:UpdateName("New Name")
Input:SetVisiblity(true)
Input:GetInput()
Input:UpdatePlaceholder("Enter Name")
Input:UpdateText("SomeText")

Input.Text
Input.IgnoreConfig = true
Input.Settings -- table (includes Callback)
```

---

## Sliders

```lua
sections.MainSection1:Slider({
    Name = "Walkspeed",
    Default = 16,
    Minimum = 0,
    Maximum = 100,
    DisplayMethod = "Percent",
    Callback = function(Value)
        print("Changed to ".. Value)
    end,
}, "WalkspeedSlider")
```

### Slider Functions

```lua
Slider:UpdateName("New Name")
Slider:SetVisiblity(true)
Slider:UpdateValue(50)
Slider:GetValue()

Slider.Value
Slider.IgnoreConfig = true
Slider.Settings
```

---

## Toggles

```lua
sections.MainSection1:Toggle({
    Name = "Flight",
    Default = false,
    Callback = function(value)
        Window:Notify({
            Title = "Kuzu Hub",
            Description = (value and "Enabled " or "Disabled ") .. "Flight"
        })
    end,
}, "FlightToggle")
```

### Toggle Functions

```lua
Toggle:UpdateName("New Name")
Toggle:SetVisiblity(true)
Toggle:UpdateState(true)
Toggle:GetState()

Toggle.State
Toggle.IgnoreConfig = true
Toggle.Settings
```

---

## Keybinds

```lua
sections.MainSection1:Keybind({
    Name = "Reset Inventory",
    Callback = function(binded)
        Window:Notify({
            Title = "Kuzu Hub",
            Description = "Successfully Reset Inventory",
            Lifetime = 3
        })
    end,
    onBinded = function(bind)
        Window:Notify({
            Title = "Kuzu Hub",
            Description = "Rebinded Reset Inventory to "..tostring(bind.Name),
            Lifetime = 3
        })
    end,
}, "ResetInventoryBind")
```

### Keybind Functions

```lua
Keybind:UpdateName("New Name")
Keybind:SetVisiblity(true)
Keybind:Unbind()
Keybind:Bind(Enum.KeyCode.X)
Keybind:GetBind()

Keybind.Bind
Keybind.IgnoreConfig = true
Keybind.Settings
```

---

## Colorpicker

```lua
sections.MainSection1:Colorpicker({
    Name = "ESP Color",
    Default = Color3.fromRGB(255,0,0),
    Alpha = 0,
    Callback = function(color, alpha)
        local r, g, b = math.round(color.R * 255), math.round(color.G * 255), math.round(color.B * 255)
        local formattedColor = string.format("%d, %d, %d", r, g, b)

        Window:Notify({
            Title = "Kuzu Hub",
            Description = string.format("Changed ESP Color\nColor: %s\nAlpha: %.2f", formattedColor, alpha),
            Lifetime = 3
        })
    end,
}, "ESPColorToggle")
```

### Colorpicker Functions

```lua
Colorpicker:UpdateName("New Name")
Colorpicker:SetVisibility(true)
Colorpicker:SetColor(Color3.new(1, 0, 0))
Colorpicker:SetAlpha(0.5)

Colorpicker.Color
Colorpicker.Alpha
Colorpicker.IgnoreConfig = true
Colorpicker.Settings
```

---

# Dropdowns
```lua
sections.MainSection1:Dropdown({
	Name = "Give Weapons",
	Search = true,
	Multi = true,
	Required = false,
	Options = {"AK-47", "M4A1", "Desert Eagle", "AWP", "MP5", "SPAS-12"},
	Default = {"M4A1", "AWP"},
	Callback = function(Value)
		local Values = {}
		for _, State in next, Value do
			if State then
				table.insert(Values, _)
			end
		end
		print("Selected Weapons:", table.concat(Values, ", "))
	end,
}, "GiveWeaponsDropdown")
```

## Functions
:UpdateName(<string>)
:SetVisiblity(<boolean>)
:UpdateSelection(<string or number or table>) -- string/number for single, table for multi
:InsertOptions(<table>)
:RemoveOptions(<table>)
:IsOption(<string>: boolean)
:GetOptions(: table) -- Returns a table of every option and if it's true or false (Example: {"Option 1" = true, "Option 2" = false, "Option 3" = false} etc..)
:ClearOptions()

.Value : string or table
.IgnoreConfig <boolean>
.Settings : table -- Not everything may be updated, but Callback should be correct.

## Creating a header
Section:Header({
  Text <string>
}, <string or nil> Flag)

## functions
:UpdateName(<string>)
:SetVisiblity(<boolean>)

.Settings : table -- Not everything may be updated, but Callback should be correct.

## creating a paragrahp
Section:Paragraph({
  Header <string>
  Body <string>
}, <string or nil> Flag)

## functions
:SetVisiblity(<boolean>)
:UpdateHeader(<string>)
:UpdateBody(<string>)

.Settings : table -- Not everything may be updated, but Callback should be correct.

## creating a label
Section:Label({
  Text <string>
}, <string or nil> Flag)

## functions
:UpdateName(<string>)
:SetVisiblity(<boolean>)

.Settings : table -- Not everything may be updated, but Callback should be correct.

## creating a sub label
Section:SubLabel({
  Text <string>
}, <string or nil> Flag)

# functions
:UpdateName(<string>)
:SetVisiblity(<boolean>)

.Settings : table -- Not everything may be updated, but Callback should be correct.

# divider
Section:Divider()

# divider functions
:Remove()
:SetVisiblity(<boolean>)

# creating a spacer
Section:Spacer()

# functions 
:Remove()
:SetVisiblity(<boolean>)

Last Updated: 19/04/2025
