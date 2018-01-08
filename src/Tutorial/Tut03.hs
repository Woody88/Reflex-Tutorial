{-# LANGUAGE OverloadedStrings #-}
module Tutorial.Tut03 where

import           Reflex.Dom
import qualified Data.Text as T
import qualified Data.Map as Map
import           Data.Monoid ((<>))
-- Function elAttr ---

tut03 :: MonadWidget t m => m ()
tut03 = do
  el "h1" $ text "A link to Google in a new tab"
  elAttr "a" attrs $ text "Google!"

attrs :: Map.Map T.Text T.Text
attrs = ("target" =: "_black") <> ("href" =: "http://google.com")
