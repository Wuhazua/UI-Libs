## LinoriaLib Documentation

```lua
local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
```

### Create Window

This example creates a window with specific properties like auto-show and center alignment:

```lua
local Window = Library:CreateWindow({
    Title = 'Example menu',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})
```

## Tabs and Groupboxes

You can add tabs to organize your UI elements. Here's how to add and use tabs:

```lua
local Tabs = {
    Main = Window:AddTab('Main'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local LeftGroupBox = Tabs.Main:AddLeftGroupbox('Groupbox')
```

You can also add a `TabBox`:

```lua
local TabBox = Tabs.Main:AddLeftTabbox() -- Add Tabbox on left side
local Tab1 = TabBox:AddTab('Tab 1')
local Tab2 = TabBox:AddTab('Tab 2')
```

## UI Elements

### Add Toggle

```lua
LeftGroupBox:AddToggle('MyToggle', {
    Text = 'This is a toggle',
    Default = true,
    Tooltip = 'This is a tooltip',
    Callback = function(Value)
        print('[cb] MyToggle changed to:', Value)
    end
})
```

You can also listen for toggle changes:

```lua
Toggles.MyToggle:OnChanged(function()
    print('MyToggle changed to:', Toggles.MyToggle.Value)
end)
```

### Add Button

Create a button with a function callback:

```lua
local MyButton = LeftGroupBox:AddButton({
    Text = 'Button',
    Func = function()
        print('You clicked a button!')
    end,
    Tooltip = 'This is the main button'
})
```

You can add sub-buttons as well:

```lua
local MyButton2 = MyButton:AddButton({
    Text = 'Sub button',
    Func = function()
        print('You clicked a sub button!')
    end,
    DoubleClick = true,
    Tooltip = 'This is the sub button (double click me!)'
})
```

### Add Label

You can add labels to groupboxes:

```lua
LeftGroupBox:AddLabel('This is a label')
LeftGroupBox:AddLabel('This is a label\n\nwhich wraps its text!', true)
```

### Add Slider

Sliders allow users to adjust values:

```lua
LeftGroupBox:AddSlider('MySlider', {
    Text = 'This is my slider!',
    Default = 0,
    Min = 0,
    Max = 5,
    Rounding = 1,
    Compact = false,
    Callback = function(Value)
        print('[cb] MySlider was changed! New value:', Value)
    end
})
```

### Add Input

Add a text input field:

```lua
LeftGroupBox:AddInput('MyTextbox', {
    Default = 'My textbox!',
    Numeric = false,
    Finished = false,
    Text = 'This is a textbox',
    Tooltip = 'This is a tooltip',
    Placeholder = 'Placeholder text',
    Callback = function(Value)
        print('[cb] Text updated. New text:', Value)
    end
})
```

### Add Dropdown

Add a dropdown menu:

```lua
LeftGroupBox:AddDropdown('MyDropdown', {
    Values = { 'This', 'is', 'a', 'dropdown' },
    Default = 1,
    Multi = false,
    Text = 'A dropdown',
    Tooltip = 'This is a tooltip',
    Callback = function(Value)
        print('[cb] Dropdown got changed. New value:', Value)
    end
})
```

### Add Color Picker

You can add a color picker for selecting colors:

```lua
LeftGroupBox:AddLabel('Color'):AddColorPicker('ColorPicker', {
    Default = Color3.new(0, 1, 0),
    Title = 'Some color',
    Transparency = 0,
    Callback = function(Value)
        print('[cb] Color changed!', Value)
    end
})
```

### Add Key Picker

You can add a key picker for selecting keybinds:

```lua
LeftGroupBox:AddLabel('Keybind'):AddKeyPicker('KeyPicker', {
    Default = 'MB2',
    SyncToggleState = false,
    Mode = 'Toggle',
    Text = 'Auto lockpick safes',
    NoUI = false,
    Callback = function(Value)
        print('[cb] Keybind clicked!', Value)
    end,
    ChangedCallback = function(New)
        print('[cb] Keybind changed!', New)
    end
})
```

## UI Features

### Dynamic Watermark

The watermark can dynamically update with stats such as FPS and ping:

```lua
local WatermarkConnection = game:GetService('RunService').RenderStepped:Connect(function()
    FrameCounter += 1
    if (tick() - FrameTimer) >= 1 then
        FPS = FrameCounter
        FrameTimer = tick()
        FrameCounter = 0
    end

    Library:SetWatermark(('LinoriaLib demo | %s fps | %s ms'):format(
        math.floor(FPS),
        math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())
    ))
end)
```

### Menu Keybinding

Set a custom keybinding for opening the menu:

```lua
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })
Library.ToggleKeybind = Options.MenuKeybind
```

## Addons

### ThemeManager

You can apply themes to your UI elements using the `ThemeManager`:

```lua
ThemeManager:SetLibrary(Library)
ThemeManager:ApplyToTab(Tabs['UI Settings'])
```

### SaveManager

The `SaveManager` allows you to save and load UI configurations:

```lua
SaveManager:SetLibrary(Library)
SaveManager:BuildConfigSection(Tabs['UI Settings'])
SaveManager:LoadAutoloadConfig()
```
