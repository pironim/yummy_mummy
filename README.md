# yummy_mummy
## take care about your locales.

This Gem is all about analyzing your yaml files

Initial problem is missing translation
I try to collect tasks and other things suitable for CI and local testing.

Currently it has only one rake task compare_yml.
I'll add functionality with new ideas.

### Typical problems with locales - need to think about

1. Number of keys different - two ways comparison
     for example en locale has 3 main branches and pl loacale only two
```
    en:                   pl:
      index: 'index'        index: 'index'
      show: 'blah blah'     --------------
      alert: alert          alert: 'alert'
```

2. Missing variable for interpolation different
     I saw this problem on my current project
```
    en:                             pl:
      index: 'Hello man %{name}'      index: 'Hello man %{full_name}'
```

3. Different number of uniq variable names
     en:                                            pl:
       title: 'Hello #{name} meet you in %{place}'    title: 'Hello %{full_name} meet you in %{some_place}'
     hard to detect correct maybe we should have a primary translation

4. Views has plain text without I18N ..
```
     index.jst.ejs
      <h1>Hello World!!</h1>
```
     problem is wide because we have many different templates.
     at least need to do something with
```
       .jst.ejs
       .jst.hamlc
       .erb
       .haml
       .erb.js
       .haml.coffee
```

     static analysis for plain text..
     well maybe plain text is easy to find quoted or not depends on language

5. Problems above but against three different locales(files)
     how to compare en, pl, es, ru and show results!
     complex comparison
     can be divided into several pieces - one to one
     and find all combinations and compare results..
     kind of diff. (server page - yard has server and we can have it)

6. Another small problem for reviewer - sort in the same way
     or resort existing locale to match specific..
     It can be usefull if you want to review it with your eyes
     another task resort locale like specific one(at least existing keys)
