module Stamps where

import Graphics.Element exposing (..)
import Graphics.Collage exposing (..)
import Mouse

main : Signal Element
main =
  Signal.map (scene (200, 200)) clickLocations

clickLocations : Signal (List (Int,Int))
clickLocations =
  foldp (::) [] (sampleOn Mouse.clicks Mouse.position)

scene : (Int,Int) -> List (Int,Int) -> Element
scene (w,h) locs =
  let drawPentagon (x,y) =
          ngon 5 20
            |> filled (hsla (toFloat x) 0.9 0.6 0.7)
            |> move (toFloat x - toFloat w/2, toFloat h/2 - toFloat y)
            |> rotate (toFloat x)
  in
      layers [ collage w h (List.map drawPentagon locs)
             , plainText "Click to stamp a pentagon."
             ]
