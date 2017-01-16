Highlight.js Examples
=====================

This page is an example (and test) page for the generated HLJS package.

«[Highlight.js PureBASIC Modded Fork](https://github.com/tajmone/highlight.js/tree/PureBASIC)» **v9.9.0b** (2017/01/17), based on Highlight.js **v9.9.0** (2016/12/13).

Using HLJS
----------

HLJS is capable of auto-detecting languages withing the `<pre><code>` blocks, but it’s advaisable to manually define the language – especially for readability of source code.

To define the language in html, assign the language name to the `class` attribute of the opening `<code>` tag of the `<pre><code>` block that wraps your source code:

``` {.nohighlight}
<pre><code class="languagename">
[...your source code...]
</code></pre>
```

To define the language in markdown, type the language name after the opening backticks of the fenced code block that wraps your source code:

```` {.nohighlight}
```languagename
[...your source code...]
```
````

Disable Highlighting (`nohighlight`)
------------------------------------

If you want to ensure that `<pre><code>` block is not parsed by HLJS, use “nohighlight” instead of the language name.

A code block set to “nohighlight” will look something like this:

``` {.nohighlight}
I am a code block with no highlighting.
Highlight.js will ignore me: no parsing, no highlighting tags added.
```

NOTE: The above block styling doesn’t derive by the HLJS generated stylesheet: it relies instead on the CSS definitions of the current document’s stylesheet, which defines a background color, padding, and some extra attributes.

It will be up to you to handle its appearance by adding some definitions in you CSS file:

``` {.nohighlight}
pre.nohighlight code {
  [...your CSS...]
}
```

PureBASIC
=========

PureBASIC CSS Theme based on the original [`purebasic.css`](https://github.com/isagalaev/highlight.js/blob/master/src/styles/purebasic.css) by Tristano Ajmone (extended to include PB mod extra lang token).

``` {.purebasic}
Enumeration Test 3 Step 10
  #Constant_One ; Will be 3
  #Constant_Two ; Will be 13
EndEnumeration

A.i = #Constant_One
B = A + 3

STRING.s = SomeProcedure("Hello World", 2, #Empty$, #Null$)
ESCAPED_STRING$ = ~"An escaped (\\) string!\nNewline..."

FixedString.s{5} = "12345"

Macro XCase(Type, Text)
  Type#Case(Text)
EndMacro

StrangeProcedureCall ("This command is split " +
                      "over two lines") ; Line continuation example

If B > 3 : X$ = "Concatenation of commands" : Else : X$ = "Using colons" : EndIf

Declare.s Attach(String1$, String2$)

Procedure.s Attach(String1$, String2$)
  ProcedureReturn String1$+" "+String2$
EndProcedure
```

PureBASIC Pseudocode
--------------------

PureBASIC Pseudocode is used for syntax-usage examples.

``` {.purebasic .pseudocode}
Interface <Name1> [Extends <Name2>]
  [Procedure1]
  [Procedure2]
  ...
EndInterface
```

To enable PB Pseudocode in html, add “pseudocode” after “purebasic” (separated by a space) in the `class` attribute of the `<code>` tag:

``` {.nohighlight}
<pre class="purebasic pseudocode"><code>
```

In Pandoc’s markdown, you’ll have to use this syntax (which might not work with other markdown parsers):

`{.nohighlight}`{.purebasic .pseudocode} \`\`\`

For other markdown flavors/parsers, check the relevant documentation. Basically, want you want to achieve is to have both “purebasic” and “pseudocode” to appear as classnames in the final html’s `<code>` tag.
