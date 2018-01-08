{-# LANGUAGE OverloadedStrings #-}
module Main where
import Language.Javascript.JSaddle.Warp
import Reflex.Dom.Core (mainWidget)
import Reflex.Dom hiding (mainWidget, run)
-- import Reflex.Dom
import Tutorial.Tut01
import Tutorial.Tut02
import Tutorial.Tut03
import Tutorial.Tut04

main :: IO ()
main = run 3000 $ mainWidget $ app

app :: Widget x ()
app = el "div" $ do
    elClass "h1" "mainTitle" $ text "Hello Reflex!"
    t01 <- newWidget tut01
    t02 <- newWidget tut02
    t03 <- newWidget tut03
    t04 <- newWidget tut04
    t05 <- newWidget tut05
    return ()


tut05 :: MonadWidget t m => m ()
tut05 = el "h1" $ text "Compile Tut05 separately and execute main."

hrEl :: Widget x ()
hrEl = el "hr" blank

newWidget :: Widget x () -> Widget x ()
newWidget widget = do
    hrEl
    widget
