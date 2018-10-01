# Highlight.js Examples

This page is an example (and test) page for the generated HLJS package.

«[Highlight.js PureBASIC Modded Fork](https://github.com/tajmone/highlight.js/tree/PureBASIC)» **!env{hjsModVer}** (!env{hjsModDate}), based on Highlight.js **!env{hjsVer}** (!env{hjsDate}).

PureBASIC v5.00--!env{hjsPBver}.

## Using HLJS

HLJS is capable of auto-detecting languages withing the `<pre><code>` blocks, but it's advaisable to manually define the language -- especially for readability of source code.

To define the language in html, assign the language name to the `class` attribute of the opening `<code>` tag of the `<pre><code>` block that wraps your source code:

!raw
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
``` {.nohighlight}
<pre><code class="languagename">
[...your source code...]
</code></pre>
```
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To define the language in markdown, type the language name after the opening backticks of the fenced code block that wraps your source code:

!raw
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
```` {.nohighlight}
```languagename
[...your source code...]
```
````
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Disable Highlighting (`nohighlight`)

If you want to ensure that `<pre><code>` block is not parsed by HLJS, use "nohighlight" instead of the language name.

A code block set to "nohighlight" will look something like this:

!raw
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
```` {.nohighlight}
```nohighlight
I am a code block with no highlighting.
Highlight.js will ignore me: no parsing, no highlighting tags added.
```
````
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


NOTE: The above block styling doesn't derive by the HLJS generated stylesheet: it relies instead on the CSS definitions of the current document's stylesheet, which defines a background color, padding, and some extra attributes.

It will be up to you to handle its appearance by adding some definitions in you CSS file:

!raw
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
``` {.nohighlight}
pre {.nohighlight} code {
  [...your CSS...]
}
```
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# PureBASIC

PureBASIC CSS Theme based on the original [`purebasic.css`](https://github.com/isagalaev/highlight.js/blob/master/src/styles/purebasic.css) by Tristano Ajmone (extended to include PB mod extra lang token).

``` purebasic
!rawinc(example.pb)
```

## PureBASIC Pseudocode

PureBASIC Pseudocode is used for syntax-usage examples.

!raw
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
``` {.purebasic .pseudocode}
Interface <Name1> [Extends <Name2>]
  [Procedure1]
  [Procedure2]
  ...
EndInterface
```
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To enable PB Pseudocode in html, add "pseudocode" after "purebasic" (separated by a space) in the `class` attribute of the `<code>` tag:

!raw
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
``` {.nohighlight}
<pre class="purebasic pseudocode"><code>
```
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In Pandoc's markdown, you'll have to use this syntax (which might not work with other markdown parsers):

!raw
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
```` {.nohighlight}
  ``` {.purebasic .pseudocode}
````
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For other markdown flavors/parsers, check the relevant documentation. Basically, want you want to achieve is to have both "purebasic" and "pseudocode" to appear as classnames in the final html's `<code>` tag.

<!-- EOF -->
