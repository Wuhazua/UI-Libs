## MacLib Loader

```lua
local MacLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Wuhazua/UI-Libs/main/UI%20Libraries/MacLib/Source"))()
```

---

## Functions

```lua
MacLib:Demo() -- Brings up a demo window

MacLib:SetFolder("FolderName")
-- Sets the folder where all configs are saved.

MacLib:SaveConfig("ConfigName.json")
-- Saves all element values to a file.
-- You can ignore elements with .IgnoreConfig = true or no flag.

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

### Notification Functions

```lua
Notification:UpdateTitle("New Title")
Notification:UpdateDescription("Updated description.")
Notification:Resize(400) -- Only X; Y is auto-determined
Notification:Cancel()
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

### Dialog Functions

```lua
Dialog:UpdateTitle("New Title")
Dialog:UpdateDescription("New description.")
Dialog:Cancel()
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
    Image = "rbxassetid://1234567890" -- Max 16x16 pixels
})
```

### Tab Functions

```lua
Tab:Select()
Tab:InsertConfigSection("Left") -- or "Right"
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

Button.Settings -- table (includes Callback)
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
Input:GetInput() -- Returns current text
Input:UpdatePlaceholder("Enter Name")
Input:UpdateText("SomeText")

Input.Text -- Current text value
Input.IgnoreConfig = true
Input.Settings -- table (includes Callback)
```

## Adding Sliders
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

## Funtions
:UpdateName(<string>)
:SetVisiblity(<boolean>)
:UpdateValue(<number>)
:GetValue(: number)

.Value : number
.IgnoreConfig <boolean>
.Settings : table -- Not everything may be updated, but Callback should be correct.

## Adding Toggles
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

## Functions
:UpdateName(<string>)
:SetVisiblity(<boolean>)
:UpdateState(<boolean>)
:GetState(: boolean)

.State : boolean
.IgnoreConfig <boolean>
.Settings : table -- Not everything may be updated, but Callback should be correct.

## Adding Keybinds
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


