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
  ```
     en:                                            pl:
       title: 'Hello #{name} meet you in %{place}'    title: 'Hello %{full_name} meet you in %{some_place}'
  ```
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

7. Values can be a little bit different
   its a question about code style
   single quotes, missing quotes, double quotes.
   in fact it's a question about quotes.
   The same quotes can improve readability
   Potential problem different language can have a problems with no quotes
   for example (special symbol for PL locale)

8. add missing keys to specific locale. - align locales
   problem can be complex - missing keys only or different tree structure.
   I believe this also require sorting and adding.
   maybe it can be visualized.

9. General problem for lib is what you want to compare?
   * files?
   * loaded tree?
   * yml.erb?(not sure somebody use it)
   * js locales ? (is there any difference maybe yml level is the same)

10. Missing special symbols like column or semicolumn(analyze values content)
  or question mark.
  ```
    en:                          pl:
      greeting: 'Hello or not?'    greeting: 'Hello or not hello hmm.'
  ```

11. Generate keys from specific view can be usefull.
    you type I18n.t('one.another')
    and than rake task create missing keys based on view
    not sure it is very usefull but can be helpfull at the begining.
    for ex. project does not have locales at all.
    mindless localization .. hm.. currently it's an idea.

12. Another check - detect common words.
    good candidates - yes, no, title and many separate words.
    just warn user about such overkill like
   ```
     Man you can simplify your locales. nothing specific about yes or no.
   ```

