# Diff

Custom theme by Tristano Ajmone, loosely inspired on [GitHub Compare View](https://github.com/blog/612-introducing-github-compare-view) ([see an example](https://github.com/tajmone/highlight.js/commit/cef34e110a2f1f302fed624db2aa39e45aacc8a9)).

``` {.diff}
Index: languages/ini.js
===================================================================
--- languages/ini.js    (revision 199)
+++ languages/ini.js    (revision 200)
@@ -1,8 +1,7 @@
 hljs.LANGUAGES.ini =
 {
   case_insensitive: true,
-  defaultMode:
-  {
+  defaultMode: {
     contains: ['comment', 'title', 'setting'],
     illegal: '[^\\s]'
   },

*** /path/to/original timestamp
--- /path/to/new      timestamp
***************
*** 1,3 ****
--- 1,9 ----
+ This is an important
+ notice! It should
+ therefore be located at
+ the beginning of this
+ document!

! compress the size of the
! changes.

  It is important to spell
```

# Makefile

> **NOTE**: Currently there is no custom CSS definition for this language.

``` {.makefile}
# Makefile

BUILDDIR      = _build
EXTRAS       ?= $(BUILDDIR)/extras

.PHONY: main clean

main:
    @echo "Building main facility..."
    build_main $(BUILDDIR)

clean:
    rm -rf $(BUILDDIR)/*
```

# JSON

> **NOTE**: Currently there is no custom CSS definition for this language.

``` {.json}
[
  {
    "title": "apples",
    "count": [12000, 20000],
    "description": {"text": "...", "sensitive": false}
  },
  {
    "title": "oranges",
    "count": [17500, null],
    "description": {"text": "...", "sensitive": false}
  }
]
```

<!-- EOF -->
