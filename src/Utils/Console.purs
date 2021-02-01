module Console where

import Prelude

import Effect (Effect)

foreign import log :: forall a. a -> Effect Unit
foreign import log2 :: forall a b. a -> b -> Effect Unit
