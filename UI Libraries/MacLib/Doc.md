## MacLib Loader

```lua
local MacLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Wuhazua/UI-Libs/main/UI%20Libraries/MacLib/Source"))()
```

---

## Functions

```lua
MacLib:Demo() -- Brings up a demo window

MacLib:SetFolder("FolderName") 
-- Sets the folder all configs are saved in.

MacLib:SaveConfig("ConfigName.json") 
-- Saves all element values to a file in the folder you set with :SetFolder().
-- You can ignore elements by setting their .IgnoreConfig to true or not defining a flag.

MacLib:LoadConfig("ConfigName.json") 
-- Loads a config located at the given path.

local list = MacLib:RefreshConfigList() 
-- Returns a table of all saved config names (e.g., {"Legit.json", "Rage.json"})

MacLib:LoadAutoLoadConfig() 
-- Loads the config the user selected to automatically load.
```

> 💡 To insert a pre-made config section, reference the "Adding Tabs" section.

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

## Adding a Global Setting

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

## Displaying a Notification

```lua
Window:Notify({
    Title = "Kuzu Hub",
    Description = "Hello, World!",
    Lifetime = 5
})
```

---

## Creating a Dialog

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

---

## Creating a Tab Group

```lua
local TabGroup = Window:TabGroup()
```

---

## Adding Tabs

```lua
local Tab = TabGroup:Tab({
    Name = "Main",
    Image = "rbxassetid://1234567890" -- Max size: 16x16 pixels
})
```

---

## Adding Sections

```lua
local Section = Tab:Section({
    Side = "Left" -- or "Right"
})
```

---

## Adding Buttons

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

Button.Settings -- table (Callback should always be up-to-date)
```

---

## Adding Inputs

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
Input:GetInput() -- returns current text
Input:UpdatePlaceholder("Enter Name")
Input:UpdateText("SomeText")

Input.Text -- current text value
Input.IgnoreConfig = true
Input.Settings -- table (Callback should always be up-to-date)
```
