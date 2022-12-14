-- Settings
DEFAULT_SETTINGS = {
    ["MSG_TIME"] = 5;
    ["CHANNELS_ENABLED"] = {
        [12] = true,
		[13] = true,
		[7] = false,
		[39] = true,
		[28] = true,
		[29] = true,
		[30] = true,
		[31] = true,
		[32] = true,
		[5] = true,
		[6] = true,
		[11] = true,
		[40] = true,
		[42] = true,
		[23] = true,
		[41] = true
    };
    ["POSITION"] = {
        ["X"] = 735;
        ["Y"] = 400;
    };
    ["POSITION_LOCKED"] = true;
    ["DEBUG"] = false;
};

SETTINGS = {};

SettingsFileName = "Esy_ChatNotif_Settings";
SettingsDataScope = Turbine.DataScope.Character;

function LoadSettings()
    local loadedSettings = Turbine.PluginData.Load(SettingsDataScope, SettingsFileName);

    if (type(loadedSettings) == 'table') then
        SETTINGS = loadedSettings;
    else
        SETTINGS = DEFAULT_SETTINGS;
    end
    if SETTINGS.DEBUG then Turbine.Shell.WriteLine("> Settings Loaded") end
end

function SaveSettings()
    Turbine.PluginData.Save(SettingsDataScope, SettingsFileName, SETTINGS);
    if SETTINGS.DEBUG then Turbine.Shell.WriteLine("> Settings Saved") end
end

function RegisterForUnload()
    -- Will save settings when the plugin is unloaded
    Turbine.Plugin.Unload = function(sender, args)
        SaveSettings();
    end
end
