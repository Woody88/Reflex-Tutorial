{-# LANGUAGE RecursiveDo #-}
{-# LANGUAGE OverloadedStrings #-}
module Tutorial.Tut08 where
import Reflex.Dom

{- Function leftmost
  Now we want a second button to decrement our counter.
  To combine the events of the 2 buttons we use the function leftmost:
  leftmost :: Reflex t => [Event t a] -> Event t a
  If an event in the array of the first parameter occurs, the function leftmost returns this event.
   If two ore more events in the array occur simultaneously, the function leftmost returns the leftmost of all the simultaneously occuring events.
-}

tut08 :: MonadWidget t m => m ()
tut08 = do
  rec el "h2" $ text "Combining Events with leftmost"
      counts <- foldDyn (+) (0 :: Int) $ leftmost [1 <$ evIncr, -1 <$ evDecr]
      el "div" $ display counts
      evIncr <- button "Increment"
      evDecr <- button "Decrement"
  return ()
