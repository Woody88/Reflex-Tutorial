{-# LANGUAGE OverloadedStrings #-}
module Tutorial.Tut11 where

import Reflex.Dom

{- Predefined Input Widgets
   Text Input Fields
   The function to create a text input element is:
   textInput :: (...) => TextInputConfig t -> m (TextInput t)
    def return a TextInputConfig default
    never :: Event t a It's an event, that never occurs.
    constDyn :: Reflex t => a -> Dynamic t a
    To create a Dynamic map we can use the function constDyn
    textInput def { _textInputConfig_initialValue = "0"}
    However Reflex-dom uses lenses to give us syntactic sugar to populate these configuration records.
   With the two combinators (&) and (.~). we can write:
   textInput $ def & textInputConfig_initialValue .~ "input"
   Note that the underscore (_) in front of _textInputConfig has gone
   value :: TextInput -> Dynamic t Text.
-}

tut11 :: MonadWidget t m => m ()
tut11 = el "div" $ do
   el "h2" $ text "Simple Text Input"
   ti <- textInput def
   dynText $ value ti
