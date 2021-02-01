module React where

import Prelude

import Data.Tuple (Tuple(..))
import Effect (Effect)
import Unsafe.Coerce (unsafeCoerce)

foreign import data JSX :: Type
foreign import data CSS :: Type

foreign import renderJSX :: JSX -> Effect Unit

foreign import component :: forall props. String -> (props -> Effect JSX) -> props -> JSX

foreign import element :: forall props. String -> props -> Array JSX -> JSX

foreign import useState_ :: forall state. (forall a b. a -> b -> Tuple a b) -> state -> Effect (Tuple state (state -> state -> Effect Unit))
useState :: forall state. state -> Effect (Tuple state (state -> state -> Effect Unit))
useState = useState_ Tuple

type Canceler = Effect Unit
foreign import useEffect :: forall key. Array key -> Effect Canceler -> Effect Unit

h1_ :: Array JSX -> JSX
h1_ = element "h1" []

h3_ :: Array JSX -> JSX
h3_ = element "h3" []

div :: forall props. props -> Array JSX -> JSX
div = element "div"

div_ :: Array JSX -> JSX
div_ = element "div" []

div' :: String -> Array JSX -> JSX
div' className = element "div" { className }

span_ :: Array JSX -> JSX
span_ = element "span" []

css :: forall r. { | r } -> CSS
css = unsafeCoerce

text :: String -> JSX
text s = element "span" [] [ unsafeCoerce s ]
