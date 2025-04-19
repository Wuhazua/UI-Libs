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

> 💡 To insert a pre-made config section, see the "Adding Tabs" section.

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

> Last Updated: 19/04/2025
