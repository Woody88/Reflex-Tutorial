{-# LANGUAGE OverloadedStrings #-}
module Tutorial.Tut02 where
import Reflex.Dom


tut02 :: MonadWidget t m => m ()
tut02 = do
  el "h1" $ text "Welcome to Reflex-Dom"
  el "div" $ do
    el "p" $ text "Reflex-Dom is:"
    el "ul" $ do
      el "li" $ text "Fun"
      el "li" $ text "Not difficult"
      el "li" $ text "Efficient"
