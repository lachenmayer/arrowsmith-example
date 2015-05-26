module Stamps where

import Graphics.Element exposing (..)
import Graphics.Collage exposing (..)
import Mouse

main = Signal.map scene clickLocations

scene locs = collage 200 200 []
