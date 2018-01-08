{-# LANGUAGE OverloadedStrings #-}
module Main where
import           Language.Javascript.JSaddle.Warp
import           Reflex.Dom.Core (mainWidget)
import           Reflex.Dom hiding (mainWidget, run)
import qualified Data.Text as T
import           Data.Monoid ((<>))
-- import Reflex.Dom
import Tutorial.Tut01
import Tutorial.Tut02
import Tutorial.Tut03
import Tutorial.Tut04
import Tutorial.Tut07
import Tutorial.Tut08
import Tutorial.Tut09
import Tutorial.Tut10
import Tutorial.Tut11
import Tutorial.Tut12

main :: IO ()
main = run 3000 $ mainWidget $ app

app :: MonadWidget t m => m ()
app = el "div" $ do
    elClass "h1" "mainTitle" $ text "Hello Reflex!"
    t01 <- newWidget tut01 "1"
    t02 <- newWidget tut02 "2"
    t03 <- newWidget tut03 "3"
    t04 <- newWidget tut04 "4"
    t05 <- newWidget tut05 "5"
    t06 <- newWidget tut06 "6"
    t07 <- newWidget tut07 "7"
    t08 <- newWidget tut08 "8"
    t08 <- newWidget tut09 "9"
    t10 <- newWidget tut10 "10"
    t11 <- newWidget tut11 "11"
    t12 <- newWidget tut12 "12"
    return ()


tut06 :: MonadWidget t m => m ()
tut06 = el "h1" $ text "Compile Tut06 separately and execute main."


tut05 :: MonadWidget t m => m ()
tut05 = el "h1" $ text "Compile Tut05 separately and execute main."

hrEl :: MonadWidget t m => m ()
hrEl = el "hr" blank

newWidget :: MonadWidget t m => m () -> T.Text -> m ()
newWidget widget tut = do
    hrEl
    el "h1" $ text ("Tut " <> tut)
    widget
