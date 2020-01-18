let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.13.5-20200103/packages.dhall sha256:0a6051982fb4eedb72fbe5ca4282259719b7b9b525a4dda60367f98079132f30

in    upstream
    ⫽ { calpis =
          { dependencies = [ "prelude" ]
          , repo = "https://github.com/justinwoo/purescript-calpis.git"
          , version = "v0.1.0"
          }
      , bonjiri =
          { dependencies = [ "prelude" ]
          , repo = "https://github.com/justinwoo/purescript-bonjiri.git"
          , version = "v0.7.0"
          }
      }
