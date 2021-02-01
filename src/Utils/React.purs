module React where

import Prelude

import Data.Tuple (Tuple(..))
import Effect (Effect)
import Effect.Uncurried (EffectFn1, mkEffectFn1, runEffectFn1)
import Unsafe.Coerce (unsafeCoerce)

foreign import data JSX :: Type
foreign import data CSS :: Type

foreign import renderJSX :: JSX -> Effect Unit

foreign import component_ :: forall props. String -> (EffectFn1 props JSX) -> (props -> JSX)
component :: forall props. String -> (props -> Effect JSX) -> (props -> JSX)
component tag effect =
  component_ tag $ mkEffectFn1 effect

foreign import element :: forall props. String -> props -> Array JSX -> JSX

foreign import key :: String -> JSX -> JSX

foreign import useState_ :: forall state. state -> Effect { state :: state, update :: EffectFn1 (state -> state) Unit }
useState :: forall state. state -> Effect (Tuple state ((state -> state) -> Effect Unit))
useState init = do
  { state, update } <- useState_ init
  let
    updater :: (state -> state) -> Effect Unit
    updater fn = do
      runEffectFn1 update fn
  pure $ Tuple state updater

type Canceler = Effect Unit
foreign import useEffect :: forall key. Array key -> Effect Canceler -> Effect Unit

h1_ :: String -> JSX
h1_ s = element "h1" { key: s } [ text s ]

h3_ :: String -> JSX
h3_ s = element "h3" { key: s } [ text s ]

div :: forall props. props -> Array JSX -> JSX
div = element "div"

div_ :: Array JSX -> JSX
div_ = element "div" []

div' :: String -> Array JSX -> JSX
div' className = element "div" { className, key: className }

css :: forall r. { | r } -> CSS
css = unsafeCoerce

text :: String -> JSX
text s = element "span" { key: s } [ unsafeCoerce s ]
