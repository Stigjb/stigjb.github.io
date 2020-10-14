<!DOCTYPE html>

◊(require pollen/core txexpr)
◊(define here-title (or (select-from-metas 'title here) (symbol->string here)))

◊(define mathjax-script
  '(script ((id "MathJax-script")
            (src "https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js")
            (async ""))))

◊(define hljs-script
  '((link ((rel "stylesheet")
           (href "//cdn.jsdelivr.net/gh/highlightjs/cdn-release@10.1.2/build/styles/default.min.css")))
    (script ((src "//cdn.jsdelivr.net/gh/highlightjs/cdn-release@10.1.2/build/highlight.min.js")))
    (script "hljs.initHighlightingOnLoad();")))

◊->html{
  ◊html[#:lang "nb"]{
    ◊`(head
      (meta ((charset "utf-8")))
      (meta ((name "viewport") (content "width=device-width, initial-scale=1")))

      ◊,title{◊|here-title| | Stig Johan|}

      (link ((rel "icon") (href "/favicon.png")))
      (link ((rel "stylesheet") (href "/styles.css")))
      (link ((rel "stylesheet") (href "https://fonts.googleapis.com/css2?family=Fira+Mono:wght@400;700&family=IBM+Plex+Serif:ital,wght@0,400;0,700;1,400&display=swap")))

      ◊,(if (select-from-metas 'mathjax here) mathjax-script "")
      ◊,@(if (select-from-metas 'hljs here) hljs-script '()))

    ◊body{
      ◊header[#:class "header"]{
        ◊div[#:class "header-inner"]{
          ◊h1[here-title]
          ◊p{Stig Johan Berggren}}}

      ◊`(main (article ,@(get-elements doc)))

      ◊footer[#:class "footer"]{
        ◊div[#:class "footer-inner"]{
          ◊div[#:class "footer-nav"]{
            ◊a[#:href "/"]{Forside}
            ◊a[#:href "/kolofon.html"]{Kolofon}}
          ◊div[#:class "footer-some"]{
            ◊a[#:href "https://github.com/stigjb"]{Github}
            ◊a[#:href "https://twitter.com/stigjohan"]{Twitter}
            ◊a[#:href "https://snabelen.no/@stig"]{Mastodon}}}}}}}
