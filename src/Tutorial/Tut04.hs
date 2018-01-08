{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecursiveDo #-}

module Tutorial.Tut04 where

import Reflex.Dom
import qualified Data.Text as T
import qualified Data.Map as Map
import           Data.Monoid ((<>))

{- All the above functions allow us to define DOM elements with static attributes. But you cannot change the attributes while the program is running!
   With the function elDynAttr, as the name says, you can specify dynamic attributes, that change during program execution. It has the following type:
   elDynAttr :: (...) => Text -> Dynamic t (Map Text Text) -> m a -> m a
   toggle :: (...) => Bool -> Event t a -> m (Dynamic t Bool)
   (<$>) :: Functor f => (a -> b) -> f a -> f b

-}
tut04 :: MonadWidget t m => m ()
tut04 = do
  rec
    dynBool <- toggle False evClick -- Dynamic t Bool
    let dynAttrs = attrs <$> dynBool -- now becomes Dynamic t (Map Text Text)
    elDynAttr "h1" dynAttrs $ text "Changing color"
    evClick <- button "Change Color"
  return ()

attrs :: Bool -> Map.Map T.Text T.Text
attrs b = "style" =: ("color: " <> color b)
  where color True = "red"
        color _    = "green"
