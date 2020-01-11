{ sources = [ "src/**/*.purs", "test/**/*.purs" ]
, name = "my-project"
, dependencies =
    [ "aff"
    , "bonjiri"
    , "calpis"
    , "choco-pie"
    , "console"
    , "debug"
    , "effect"
    , "makkori"
    , "naporitan"
    , "react-basic"
    , "simple-json"
    , "simple-json-utils"
    , "string-parsers"
    , "test-unit"
    ]
, packages = ./packages.dhall
}
