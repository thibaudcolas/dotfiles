-- Personal Hyprland input overrides for Omarchy.
--
-- Deployed to ~/.config/hypr/input.lua by linux/install.sh. This file is
-- loaded by ~/.config/hypr/hyprland.lua after Omarchy's defaults, so only the
-- keys set here override them — keyboard layout detection, mouse sensitivity
-- and the rest still come from Omarchy.
-- See https://wiki.hypr.land/Configuring/Basics/Variables/#input

hl.config({
  input = {
    -- Faster keyboard repeat, ported from the macOS `KeyRepeat` preferences.
    -- Omarchy's defaults are 40 / 250.
    repeat_rate = 60,
    repeat_delay = 200,

    touchpad = {
      -- Tap to click (macOS: "Tap to click").
      tap_to_click = true,

      -- No "natural" (inverse) scrolling, matching macOS.
      natural_scroll = false,

      -- Two-finger right-click, rather than the lower-right corner.
      clickfinger_behavior = true,
    },
  },

  misc = {
    -- With the lid closed the panel must stay dark: key presses and mouse
    -- motion (e.g. an idle external mouse) would otherwise re-enable DPMS
    -- even while the session is locked.
    key_press_enables_dpms = false,
    mouse_move_enables_dpms = false,
  },
})
