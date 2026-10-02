-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function ()
  hl.exec_cmd('waybar')
  hl.exec_cmd('awww-daemon')
  hl.exec_cmd('gentoo-pipewire-launcher')
  hl.exec_cmd('copyq --start-server')
  hl.exec_cmd('firefox', { workspace = 2 })
end)

