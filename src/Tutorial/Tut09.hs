{-# LANGUAGE RecursiveDo #-}
{-# LANGUAGE OverloadedStrings #-}
module Tutorial.Tut09 where

import Reflex.Dom

{- Assume, it would be possible to click in the above example both buttons simultaneously.
    If we click both buttons together, the function leftmost returns only evIncr and we loose evDecr. In situations, where we are not allowed to loose events, we can use the function mergeWith.
    The function mergeWith has the following type:
    mergeWith :: Reflex t => (a -> a -> a) -> [Event t a] -> Event t a
    It uses a function of type (a -> a -> a) to combine the payloads of all simultaneously occuring events.
-}

tut09 :: MonadWidget t m => m ()
tut09 = do
  rec el "h2" $ text "Combining Events with mergeWith and foldDyn"
      dynCount <- foldDyn (+) (0 :: Int)  (mergeWith (+) [1 <$ evIncr, -1 <$ evDecr])
      el "div" $ display dynCount
      evIncr <- button "Increment"
      evDecr <- button "Decrement"
  return ()
