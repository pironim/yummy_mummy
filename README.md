# yummy_mummy
## take care about your locales.

This Gem is all about analyzing your yaml files

Initial problem is missing translation
I try to collect tasks and other things suitable for CI and local testing.

Currently it has only one rake task compare_yml.
I'll add functionality with new ideas.

we can compare keys and values easily if it will be a string with dots
it's kind of strategy to compare keys.
```
  en                               pl
    'index.title' => 'some value'   'index.title' => 'some other value'
```
