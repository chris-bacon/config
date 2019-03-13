{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_my_nvim_hs (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/chrisbacon/.config/nvim/.stack-work/install/x86_64-linux/nightly-2019-03-13/8.6.4/bin"
libdir     = "/home/chrisbacon/.config/nvim/.stack-work/install/x86_64-linux/nightly-2019-03-13/8.6.4/lib/x86_64-linux-ghc-8.6.4/my-nvim-hs-0.1.0.0-GhHWC9sUzV3bi85bnKCZW-my-nvim-hs"
dynlibdir  = "/home/chrisbacon/.config/nvim/.stack-work/install/x86_64-linux/nightly-2019-03-13/8.6.4/lib/x86_64-linux-ghc-8.6.4"
datadir    = "/home/chrisbacon/.config/nvim/.stack-work/install/x86_64-linux/nightly-2019-03-13/8.6.4/share/x86_64-linux-ghc-8.6.4/my-nvim-hs-0.1.0.0"
libexecdir = "/home/chrisbacon/.config/nvim/.stack-work/install/x86_64-linux/nightly-2019-03-13/8.6.4/libexec/x86_64-linux-ghc-8.6.4/my-nvim-hs-0.1.0.0"
sysconfdir = "/home/chrisbacon/.config/nvim/.stack-work/install/x86_64-linux/nightly-2019-03-13/8.6.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "my_nvim_hs_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "my_nvim_hs_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "my_nvim_hs_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "my_nvim_hs_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "my_nvim_hs_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "my_nvim_hs_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
