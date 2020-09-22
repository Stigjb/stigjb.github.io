<!DOCTYPE html>
◊(define title (or (select-from-metas 'title here) (symbol->string here)))
<html lang="nb">
<head>
  <meta charset="UTF-8">
  <title>◊|title| – Stig Berggren</title>
  <link rel="icon" href="/favicon.png">
  <link rel="stylesheet"
      href="//cdn.jsdelivr.net/gh/highlightjs/cdn-release@10.1.2/build/styles/default.min.css">
  <link rel="stylesheet" href="/styles.css">
  <link href="https://fonts.googleapis.com/css2?family=Fira+Mono:wght@400;700&family=IBM+Plex+Serif:ital,wght@0,400;0,700;1,400&display=swap" rel="stylesheet">
  <script src="//cdn.jsdelivr.net/gh/highlightjs/cdn-release@10.1.2/build/highlight.min.js"></script>
  <script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
  <script>hljs.initHighlightingOnLoad();</script>
</head>
<body>
  <div class="header">
    <div class="header-inner">
      <h1>◊|title|</h1>
      <p>Stig Berggren</p>
    </div>
  </div>
  <article>
    ◊(->html doc #:splice? #t)
  </article>
  <div class="footer">
    <ul>
      <li><a href="/">Hjem</a></li>
      <li><a href="https://github.com/stigjb">Github</a></li>
      <li><a href="https://twitter.com/stigjohan">Twitter</a></li>
      <li><a href="/kolofon.html">Kolofon</a></li>
    </ul>
  </div>
</body>
</html>
