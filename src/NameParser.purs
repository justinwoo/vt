module NameParser where

import Data.Maybe (Maybe(..))

type Parsed =
  { name :: String
  , episode :: Int
  }

foreign import parseTitle_ :: Maybe Parsed -> (Parsed -> Maybe Parsed) -> String -> Maybe Parsed

parseTitle :: String -> Maybe Parsed
parseTitle = parseTitle_ Nothing Just
