# Highlight.js / PureBASIC Fork

>   This branch is a fork of **highlight.js** with differences in the PureBASIC
>   syntax file:

>   I’ve added in the `purebasic.js` code the “`function_call`” class, to catch
>   Procedure calls — as is customary with PureBASIC IDE syntax coloring — which
>   didn't make it into the official package because **highlight.js** doesn't
>   provide classes for function calls.

>   Also, the `purebasic.css` file was changed to focus on highilighting
>   PureBASIC syntax *only*, as well as incorporating the “`function_call`”
>   class.

Highlight.js is a syntax highlighter written in JavaScript. It works in the
browser as well as on the server. It works with pretty much any markup, doesn’t
depend on any framework and has automatic language detection.

## Getting Started

The bare minimum for using highlight.js on a web page is linking to the library
along with one of the styles and calling
[initHighlightingOnLoad](http://highlightjs.readthedocs.org/en/latest/api.html#inithighlightingonload):

``` html
<link rel="stylesheet" href="/path/to/styles/default.css">
<script src="/path/to/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script>
```

This will find and highlight code inside of `<pre><code>` tags; it tries to
detect the language automatically. If automatic detection doesn’t work for you,
you can specify the language in the `class` attribute:

``` html
<pre><code class="html">...</code></pre>
```

The list of supported language classes is available in the [class
reference](http://highlightjs.readthedocs.org/en/latest/css-classes-reference.html).
Classes can also be prefixed with either `language-` or `lang-`.

To disable highlighting altogether use the `nohighlight` class:

``` html
<pre><code class="nohighlight">...</code></pre>
```

## Custom Initialization

When you need a bit more control over the initialization of highlight.js, you
can use the
[highlightBlock](http://highlightjs.readthedocs.org/en/latest/api.html#highlightblock-block)
and
[configure](http://highlightjs.readthedocs.org/en/latest/api.html#configure-options)
functions. This allows you to control *what* to highlight and *when*.

Here’s an equivalent way to calling
[initHighlightingOnLoad](http://highlightjs.readthedocs.org/en/latest/api.html#inithighlightingonload)
using jQuery:

``` javascript
$(document).ready(function() {
  $('pre code').each(function(i, block) {
    hljs.highlightBlock(block);
  });
});
```

You can use any tags instead of `<pre><code>` to mark up your code. If you don't
use a container that preserve line breaks you will need to configure
highlight.js to use the `<br>` tag:

``` javascript
hljs.configure({useBR: true});

$('div.code').each(function(i, block) {
  hljs.highlightBlock(block);
});
```

For other options refer to the documentation for
[configure](http://highlightjs.readthedocs.org/en/latest/api.html#configure-options).

## Web Workers

You can run highlighting inside a web worker to avoid freezing the browser
window while dealing with very big chunks of code.

In your main script:

``` javascript
addEventListener('load', function() {
  var code = document.querySelector('#code');
  var worker = new Worker('worker.js');
  worker.onmessage = function(event) { code.innerHTML = event.data; }
  worker.postMessage(code.textContent);
})
```

In worker.js:

``` javascript
onmessage = function(event) {
  importScripts('<path>/highlight.pack.js');
  var result = self.hljs.highlightAuto(event.data);
  postMessage(result.value);
}
```

## Getting the Library

You can get highlight.js as a hosted, or custom-build, browser script or as a
server module. Right out of the box the browser script supports both AMD and
CommonJS, so if you wish you can use RequireJS or Browserify without having to
build from source. The server module also works perfectly fine with Browserify,
but there is the option to use a build specific to browsers rather than
something meant for a server. Head over to the [download
page](https://highlightjs.org/download/) for all the options.

**Note:** the library is not supposed to work straight from the source on
GitHub; it requires building. If none of the pre-packaged options work for you
refer to the [building
documentation](http://highlightjs.readthedocs.org/en/latest/building-testing.html).

Also, if you are using something like almond, you need to use the optimizer to
give the module a name. The basic example would be:

```
r.js -o name=hljs paths.hljs=/path/to/highlight out=highlight.js
```

## License

Highlight.js is released under the BSD License. See
[LICENSE](https://github.com/isagalaev/highlight.js/blob/master/LICENSE) file
for details.

## Links

The official site for the library is at <https://highlightjs.org/>.

Further in-depth documentation for the API and other topics is at
<http://highlightjs.readthedocs.org/>.

Authors and contributors are listed in the
[AUTHORS.en.txt](https://github.com/isagalaev/highlight.js/blob/master/AUTHORS.en.txt)
file.
