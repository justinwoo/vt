local upstream = import 'packages.jsonnet';

upstream {
  calpis:
    {
      dependencies: ['prelude']
      ,
      repo: 'https://github.com/justinwoo/purescript-calpis.git'
      ,
      version: 'v0.1.0',
    }
  ,
  bonjiri:
    {
      dependencies: ['prelude']
      ,
      repo: 'https://github.com/justinwoo/purescript-bonjiri.git'
      ,
      version: 'v0.7.0',
    },
}
