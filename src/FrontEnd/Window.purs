module FrontEnd.Window where

import Prelude

import Data.Foldable (traverse_)
import Data.Maybe (Maybe(..))
import Data.Monoid (guard)
import Effect (Effect)
import Effect.Ref as Ref
import FRP.Event (Event)
import FRP.Event as Event
import FrontEnd.Types (Direction(..), KeyboardEvent(..), ScrollEvent(..))
import Types (Path)

foreign import addWindowKeyListener :: (String -> Effect Unit) -> Effect Unit
foreign import refreshPage :: Effect Unit
foreign import scrollIntoView :: Path -> Effect Unit
foreign import scrollToTop :: Effect Unit
foreign import getDateTime :: Effect Number

window :: Event ScrollEvent -> Effect (Event KeyboardEvent)
window scrollEvent = do
  {event, push} <- Event.create

  prevTimeRef <- Ref.new 0.0

  addWindowKeyListener \key -> do
    let
      mAction =
        case key of
          "o" -> Just OpenEvent
          "k" -> Just $ DirectionEvent Up
          "j" -> Just $ DirectionEvent Down
          "F" -> Just ToggleFilterWatched
          "W" -> Just MarkEvent
          "M" -> Just MarkEvent
          "r" -> Just RefreshEvent
          "I" -> Just FetchIconsEvent
          "g" -> Just ToggleGroupedEvent
          _ -> Nothing

    prevTime <- Ref.read prevTimeRef
    currTime <- getDateTime

    let timediff = currTime - prevTime

    guard (timediff > 40.0) do
      traverse_ push mAction
      Ref.modify_ (\_ -> currTime) prevTimeRef

  void $ Event.subscribe scrollEvent case _ of
    ScrollFileIntoView file -> do
      scrollIntoView file.name

  pure event
