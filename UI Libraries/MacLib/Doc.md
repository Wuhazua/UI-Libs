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
MacLib:SaveConfig("ConfigName.json")
MacLib:LoadConfig("ConfigName.json")
local list = MacLib:RefreshConfigList()
MacLib:LoadAutoLoadConfig()
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
    Image = "rbxassetid://1234567890"
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
    Side = "Left"
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
Button.Settings
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
Input.Settings
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

## Dropdowns

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

### Dropdown Functions

```lua
Dropdown:UpdateName("New Name")
Dropdown:SetVisiblity(true)
Dropdown:UpdateSelection("AK-47") -- or table for multi
Dropdown:InsertOptions({"SCAR", "Glock"})
Dropdown:RemoveOptions({"AWP"})
Dropdown:IsOption("M4A1")
Dropdown:GetOptions()
Dropdown:ClearOptions()

Dropdown.Value
Dropdown.IgnoreConfig = true
Dropdown.Settings
```

---

## Header

```lua
Section:Header({
    Text = "Main Settings"
}, "HeaderFlag")
```

### Header Functions

```lua
Header:UpdateName("New Name")
Header:SetVisiblity(true)

Header.Settings
```

---

## Paragraph

```lua
Section:Paragraph({
    Header = "Warning",
    Body = "Modifying these settings can impact gameplay."
}, "ParagraphFlag")
```

### Paragraph Functions

```lua
Paragraph:SetVisiblity(true)
Paragraph:UpdateHeader("New Header")
Paragraph:UpdateBody("Updated Body")

Paragraph.Settings
```

---

## Label

```lua
Section:Label({
    Text = "This is a label"
}, "LabelFlag")
```

### Label Functions

```lua
Label:UpdateName("Updated Label")
Label:SetVisiblity(true)

Label.Settings
```

---

## SubLabel

```lua
Section:SubLabel({
    Text = "This is a sublabel"
}, "SubLabelFlag")
```

### SubLabel Functions

```lua
SubLabel:UpdateName("Updated SubLabel")
SubLabel:SetVisiblity(true)

SubLabel.Settings
```

---

## Divider

```lua
Section:Divider()
```

### Divider Functions

```lua
Divider:Remove()
Divider:SetVisiblity(true)
```

---

## Spacer

```lua
Section:Spacer()
```

### Spacer Functions

```lua
Spacer:Remove()
Spacer:SetVisiblity(true)
```

---

**Last Updated: 19/04/2025**
