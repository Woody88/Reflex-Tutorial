{-# LANGUAGE RecursiveDo #-}
{-# LANGUAGE OverloadedStrings #-}
module Tutorial.Tut10 where

import Reflex.Dom

{- Now in addition to the increment and decrement buttons, we want a third button to reset the counter to zero.
  A better approach is to use events, that carry functions as payloads. We transform
  the payload of the event of the increment button to the function (+ 1),
  the payload of the event of the decrement button to the function (+ (-1)),
  the payload of the event of the reset button to the function const 0.

  As a fold function we then use normal function application ($) to apply the transformed function to the current value of our counter.
-}

tut10 :: MonadWidget t m => m ()
tut10 = do
  el "h2" $ text "Using foldDyn with function application"
  rec dynNum <- foldDyn ($) (0 :: Int) $ leftmost [(+ 1) <$ evIncr, (+ (-1)) <$ evDecr, const 0 <$ evReset]
      el "div" $ display dynNum
      evIncr <- button "Increment"
      evDecr <- button "Decrement"
      evReset <- button "Reset"
  return ()
