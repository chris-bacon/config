import Neovim

import qualified Neovim.Example.Plugin as Example
import qualified HaskellFormatImport as HFI

main :: IO ()
main = do
    neovim defaultConfig
        { plugins = plugins defaultConfig ++ [ Example.plugin, HFI.plugin ]
        }
