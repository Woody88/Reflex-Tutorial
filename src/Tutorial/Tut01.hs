{-# LANGUAGE OverloadedStrings #-}
module Tutorial.Tut01 where

import Reflex.Dom

-- main :: IO ()
-- main = mainWidget $
tut01 :: MonadWidget t m => m ()
tut01 = display =<< count =<< button "ClickMe"
