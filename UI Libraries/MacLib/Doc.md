## MacLib Loader

```lua
local MacLib = loadstring(game:HttpGet("https://github.com/biggaboy212/Maclib/releases/latest/download/maclib.txt"))()
```
## Functions
```lua
:Demo() -- Brings up a demo window

:SetFolder(<string> Folder) -- Sets the folder all configs are saved in.
:SaveConfig(<string> Path) -- Saves all element values to a file in the folder you set with :SetFolder(), you can ignore certain elements by setting their .IgnoreConfig to true, or simply not defining a flag.
:LoadConfig(<string> Path) -- Loads a config located at path.
:RefreshConfigList(: table) -- Returns a table of all saved config names ( eg. {"Legit.json", "Rage.json"} )
:LoadAutoLoadConfig() -- Loads the config the user selected to automatically load.
--// To insert a pre-made config section, reference the "Adding tabs" page.
```
