Highlight.js / PureBASIC Fork
=============================

    HLJS v9.8.0 «New York»
    Branch Update: November 23, 2016

This branch is a fork of [**highlight.js**](https://highlightjs.org/) with some differences in the way PureBASIC syntax is rendered.

Furthermore, in [`/pb-prebuilt/`](./pb-prebuilt/) you’ll find some pre-built HLJS packages, with PureBASIC (modded) syntax being the central language in all of them.

For detailed info on the PureBASIC modded syntax differences, and on the prebuilt packages, read [`/pb-prebuilt/README.md`](./pb-prebuilt/README.md).

------------------------------------------------------------------------

<!-- #toc -->
-   [Difference from Official HLJS](#difference-from-official-hljs)
-   [Pre-Built Packages](#pre-built-packages)
-   [Additional Files And Folders](#additional-files-and-folders)
-   [Acknowledgments and Credits](#acknowledgments-and-credits)
-   [Branch History](#branch-history)

<!-- /toc -->

------------------------------------------------------------------------

Difference from Official HLJS
=============================

This branch is a fork of [**highlight.js**](https://highlightjs.org/) with some differences in the PureBASIC syntax file:

-   I’ve added in the `purebasic.js` code the “`function_call`” class, to catch Procedure calls — as is customary with PureBASIC IDE syntax coloring — which didn’t make it into the official package because **highlight.js** doesn’t provide classes for function calls.

-   Also, the `purebasic.css` file was changed to focus on highilighting PureBASIC syntax *only*, as well as incorporating the “`function_call`” class.

Here you’ll also find some pre-built highlight.js packages, with a combination of different language syntaxes chosen for common work scenarios.

Pre-Built Packages
==================

In the [`/pb-prebuilt/`](./pb-prebuilt/) folder you’ll find some pre-built HLJS packages, with PureBASIC (modded) syntax being the central language in all of them.

Additional Files And Folders
============================

The `PureBASIC` branch adds some folders and files to **highlight.js** `master` branch:

-   [`/pb-prebuilt/`](./pb-prebuilt/) – contains some pre-built HLJS packages (with modded PureBASIC syntax) and stylesheets with multi-language themes:
    -   [`/hljs-pb-only/`](./pb-prebuilt/hljs-pb-only/) – HLJS + CSS with only PureBASIC syntax and theme.
    -   [`/hljs-pb-dev1/`](./pb-prebuilt/hljs-pb-dev1/) – HLJS + CSS with PureBASIC plus some common syntaxes and themes related to PB developement.
    -   [`/hljs-pb-dev2/`](./pb-prebuilt/hljs-pb-dev2/) – Additional syntaxes on top of the previous package.
    -   [`/hljs-all/`](./pb-prebuilt/hljs-all/) – HLJS + CSS with all available syntaxes and theme.
    -   [`/css/`](./pb-prebuilt/css/) – The language-specific themes in individual CSS stylesheet – which are used for creating the final packages’s stylesheet.
    -   [`/resources/`](./resources/) – Resources for HTML documents (CSS, images, etc.).
-   [`/pb-prebuilder/`](./pb-prebuilder/) – Scripts and resources required during the creation of pre-built packages, their stylesheets and example files.
-   `pb-prebuild.bat` – The batch script that auto-magically creates the pre-built packages. Requires the following apps:
    -   [Pandoc](http://pandoc.org/)
    -   [clean-css](https://www.npmjs.com/package/clean-css) (Node.js)

Acknowledgments and Credits
===========================

See: [`/pb-prebuilt/README.md`](./pb-prebuilt/README.md#acknowledgments-and-credits).

Branch History
==============

-   `2016/11/23`
    -   Updated to **highlight.js** v9.8.0 “New York”.
    -   Added `pb-prebuilt` packages to the repo.
    -   Created CSS Theme for **Diff** syntax.
-   `2016/04/07`
    -   Forked Branch publication date.
    -   Created PureBASIC syntax and theme.
    -   **highlight.js** v9.3.0 (2016-04-05).

