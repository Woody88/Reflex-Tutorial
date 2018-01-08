{-# LANGUAGE RecursiveDo, OverloadedStrings #-}
module Tutorial.Tut07 where

import Reflex.Dom


{- foldDyn :: (...) => (a -> b -> b) -> b -> Event t a -> m (Dynamic t b)
 we will now define own Counter with foldDyn function, it works like foldr
 (<$) :: a -> f b -> f a
 display :: (Show a, ... ) => Dynamic t a -> m ()
-}

tut07 :: MonadWidget t m => m ()
tut07 = do
  rec el "h2" $ text "Count as a fold"
      numbs <- foldDyn (+) (0 :: Int) (1 <$ evIncr)-- We have to specify the type of the initial value. The compiler does not know whether we want to count up numbers of type Int or Integer or even Float.
      el "div" $ display numbs
      evIncr <- button "Increment"
  return ()
