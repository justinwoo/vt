module FrontEnd.UI where

import Prelude

import Calpis as C
import Data.Array as Array
import Data.Foldable (intercalate)
import Data.Maybe (Maybe(..), fromMaybe, maybe)
import Data.Newtype (un)
import Effect (Effect)
import FRP.Event (Event)
import FRP.Event as Event
import FrontEnd.HTTP (prefixUrl)
import FrontEnd.Types (Action(..), AppState, DateString(..), File)
import Global.Unsafe (unsafeEncodeURIComponent)
import React as R
import Types (Path(..))

type Props =
  { appState :: AppState
  , push :: Action -> Effect Unit
  }

mkIconURL :: String -> String
mkIconURL series = "url(\"" <> un C.URL (prefixUrl $ iconsPath) <> "\")"
  where iconsPath = "/icons/" <> unsafeEncodeURIComponent series

ui :: Props -> R.JSX
ui = R.component "UI" \props -> do
  let
    { appState: state } = props
    files = state.files

    header = R.div' "header"
      [ R.div' "info" $ [ R.h3_ [ R.text "Info:" ] ] <> infoLines
      , R.div' "recents" $ [ R.h3_ [ R.text "Recently watched:" ] ] <> recents
      ]

    infoLines = R.span_ <<< pure <<< R.text <$>
      [ "o: open current file"
      , "k: move cursor up"
      , "j: move cursor down"
      , "W/M: mark as watched"
      , "r: refresh"
      , "I: fetch icons and reload page"
      , "files loading: " <> if state.filesLoading then "true" else "false"
      , "icons loading: " <> if state.iconsLoading then "true" else "false"
      , "g, grouped by series: " <> if state.grouped then "true" else "false"
      , "F, filtering watched: " <> if state.filterWatched then "true" else "false"
      ]

    recents = mkRecent <$> Array.take (Array.length infoLines) state.watchedData

    mkRecent { path: Path name } = R.div' "recent" [ R.text name ]

    mkFile :: Int -> File -> R.JSX
    mkFile idx file = fileElement { key: un Path file.name, idx, file, props }

  pure $
    R.div_
      [ R.h1_ [R.text "vidtracker"]
      , header
      , R.div_ $ Array.mapWithIndex mkFile files
      ]

type FileProps =
  { key :: String
  , idx :: Int
  , file :: File
  , props :: Props
  }

fileElement :: FileProps -> R.JSX
fileElement = R.component "FileElement" \{ key, idx, file, props } -> do
  let { appState: state, push } = props
  pure $
    R.div
      { key
      , className: intercalate " "
          [ "file"
          , case state.cursor of
              Just pos | pos == idx -> "cursor"
              _ -> ""
          , case file.watched of
              Just _ -> "done"
              Nothing -> ""
          ]
      , title : "latest watched: " <> fromMaybe "unknown" (show <$> file.latest)
      , onClick: do push (SetCursor idx)
      }
      [ R.div
          { className: "icon"
          , style:
              case file.series of
                Just series -> R.css { backgroundImage: mkIconURL series }
                Nothing -> R.css {}
          } []
      , R.div
          { className: "name"
          , title: (un Path file.name)
          , onClick: do push (LinkClick idx file)
          }
          [ R.text $ un Path file.name ]
      , R.div
          { className: intercalate " "
            [ "watched"
            , maybe "" (const "has-date") file.watched
            ]
          , onClick: do push (WatchedClick idx file)
          }
          [ R.text $ case file.watched of
              Just (DateString date) -> "watched " <> date
              Nothing -> maybe "" (\x -> " last: " <> show x) file.latest
          ]
    ]

view :: Event AppState -> Effect (Event Action)
view appStates = do
  { event, push } <- Event.create

  _ <- Event.subscribe appStates \appState -> do
    R.renderJSX (ui { appState, push })

  pure event
