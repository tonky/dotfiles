import XMonad
import XMonad.Hooks.ManageHelpers

main = do
    xmonad $ defaultConfig
        { terminal = "urxvtc"
        , modMask = mod4Mask
        , borderWidth = 1
        , manageHook = composeOne [
            isFullscreen -?> doFullFloat
            ]
        }
