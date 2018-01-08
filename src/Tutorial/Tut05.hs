{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

module Tutorial.Tut05 where

import Reflex.Dom
import Data.FileEmbed

{- adding css with function mainWidgetWithCss
  library called 'file-embed', contains a function embedFile that allows you, during compilation, to embed the contents of a file into your source code
  This function uses a GHC feature called Template Haskell. need an additional import (Data.FileEmbed).
-}

main :: IO ()
main = mainWidgetWithCss css bodyElement
  where css = $(embedFile "../assets/css/simple.css")

bodyElement :: MonadWidget t m => m ()
bodyElement = el "div" $ do
  el "h1" $ text "This title should be green"
  return ()
