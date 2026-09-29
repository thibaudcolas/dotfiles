-- Personal Hyprland look'n'feel overrides for Omarchy.
--
-- Deployed to ~/.config/hypr/looknfeel.lua by linux/install.sh. The analogue of
-- the macOS appearance preferences in macos.sh; only the keys set here override
-- Omarchy's defaults.
-- See https://wiki.hypr.land/Configuring/Basics/Variables/#general

hl.config({
  general = {
    -- No gaps between windows or borders.
    gaps_in = 0,
    gaps_out = 0,
    border_size = 0,
  },
})

-- https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/
hl.config({
  scrolling = {
    -- Fill the screen edge-to-edge: no side padding around columns.
    column_width = 1.0,
  },
})
