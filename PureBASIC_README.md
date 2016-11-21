# Highlight.js / PureBASIC Fork

This branch is a fork of **highlight.js** with differences in the PureBASIC syntax file:

I’ve added in the `purebasic.js` code the “`function_call`” class, to catch Procedure calls — as is customary with PureBASIC IDE syntax coloring — which didn't make it into the official package because **highlight.js** doesn't provide classes for function calls.

Also, the `purebasic.css` file was changed to focus on highilighting PureBASIC syntax *only*, as well as incorporating the “`function_call`” class.
