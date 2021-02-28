<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:rss="http://purl.org/rss/1.0/"
                xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                xmlns:dc="http://purl.org/dc/elements/1.1/">
  <xsl:output method="html" />
  <xsl:template match="/">
    <html>
      <head>
        <meta data-n-head="true" name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="https://rss.wor.jp/_nuxt/app.css" />
        <link rel="icon" type="image/x-icon" href="https://rss.wor.jp/favicon.ico" />
        <script async="async" src="https://www.googletagmanager.com/gtag/js?id=UA-1744748-8" />
        <script>
          window.dataLayer = window.dataLayer || [];
          function gtag(){dataLayer.push(arguments);}
          gtag('js', new Date());
          gtag('config', 'UA-1744748-8');
        </script>
        <script async="async" src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js" />
        <title><xsl:value-of select="/rdf:RDF/rss:channel/rss:title" /> - RSS愛好会</title>
      </head>
      <body>
        <div class="default">
          <header>
            <nav class="navbar">
              <div class="container">
                <div class="navbar-brand">
                  <a class="navbar-item is-size-3" href="https://rss.wor.jp/">
                    <img class="icon-rss" src="https://rss.wor.jp/img/icon.svg" alt="RSS愛好会アイコン" aria-hidden="true" />
                    <img class="logo-rss" src="https://rss.wor.jp/img/logo.svg" alt="RSS愛好会" />
                  </a>
                </div>
                <div class="navbar-menu">
                  <div class="navbar-end">
                    <span class="navbar-item">
                      <a class="button" href="https://worklover.wor.jp/">
                        <img class="logo-worklover" src="https://rss.wor.jp/img/logo_worklover.svg" alt="ワクラバ" />
                      </a>
                    </span>
                  </div>
                </div>
              </div>
            </nav>
          </header>
          <article id="feed" class="page">
            <section class="hero is-primary">
              <div class="hero-body has-text-centered">
                <h1 class="title has-text-weight-normal">
                  <span class="has-text-weight-normal"><xsl:value-of select="/rdf:RDF/rss:channel/rss:title" /></span>
                </h1>
              </div>
            </section>
            <section class="contents">
              <section class="ad container">
                <ins class="adsbygoogle" style="display:block" data-ad-client="ca-pub-0248545174327416" data-ad-slot="5977540638" data-ad-format="auto" />
                <script>
                  (adsbygoogle = window.adsbygoogle || []).push({});
                </script>
              </section>
              <section class="subscription container">
                <xsl:variable name="encoded-url" select="(/rdf:RDF/rss:channel/@encoded)" />
                <xsl:variable name="self-url" select="(/rdf:RDF/rss:channel/@rdf:about)" />
                <p class="buttons-feed-reader buttons">
                  <a class="button is-small is-feedly" href="https://feedly.com/i/subscription/feed%2F{$encoded-url}" target="blank">
                    <i class="icon-feedly" aria-hidden="true" />&#160;Feedlyで購読
                  </a>
                  <a class="button is-small is-inoreader" href="http://www.inoreader.com/feed/{$self-url}" target="blank">
                    <i class="icon-inoreader" aria-hidden="true" />&#160;Inoreaderで購読
                  </a>
                </p>
              </section>
              <section class="articles container">
                <h2 class="title is-4">
                  最新記事一覧
                </h2>
                <xsl:for-each select="/rdf:RDF/rss:item">
                  <xsl:variable name="item-link" select="rss:link" />
                  <xsl:variable name="date" select="dc:date"/>
                  <section class="article box">
                    <h3>
                      <a href="{$item-link}"><xsl:value-of select="rss:title" /></a>
                    </h3>
                    <p>
                      <xsl:value-of select="substring($date, 1, 10)"/>&#160;<xsl:value-of select="substring($date, 12, 5)"/>
                    </p>
                    <p>
                      <xsl:value-of select="rss:description" />
                    </p>
                  </section>
                </xsl:for-each>
              </section>
              <section class="ad container">
                <ins class="adsbygoogle" style="display:block" data-ad-client="ca-pub-0248545174327416" data-ad-slot="8622502386" data-ad-format="auto" />
                <script>
                  (adsbygoogle = window.adsbygoogle || []).push({});
                </script>
              </section>
              <section class="notice container">
                <h2 class="title is-4">
                  注意事項
                </h2>
                <ul>
                  <li>
                    本サービスに対する異常なトラフィックを検知した場合、アクセス遮断等の措置を実施する場合があります。
                  </li>
                  <li>
                    記事本文の配信については、著作権やトラフィック等の観点から実施しておりませんのでご了承ください。
                  </li>
                  <li>
                    本サービスは、配信するフィードに運営者からのお知らせを挿入する場合があります。
                  </li>
                </ul>
              </section>
            </section>
          </article>
          <footer class="footer">
            <div class="container">
              <div class="columns">
                <address class="column is-one-third-desktop">
                  <p class="author is-size-3" style="margin:0.25rem 0 0.75rem">
                    <a href="https://rss.wor.jp/">
                      <img class="icon-rss" src="https://rss.wor.jp/img/icon.svg" alt="RSS愛好会アイコン" aria-hidden="true" />
                      <img class="logo-rss" src="https://rss.wor.jp/img/logo.svg" alt="RSS愛好会" />
                    </a>
                  </p>
                  <p class="copyright">
                    &#169; 2014 <a href="https://worklover.wor.jp/">WorkLover</a>
                  </p>
                </address>
                <ul class="column is-one-third-desktop">
                  <li>
                    <a href="https://rss.wor.jp/about">
                      RSS愛好会について
                    </a>
                  </li>
                  <li>
                    <a href="https://rss.wor.jp/privacy">
                      個人情報保護方針
                    </a>
                  </li>
                  <li>
                    <a href="https://rss.wor.jp/disclaimer">
                      免責事項
                    </a>
                  </li>
                  <li>
                    <a href="https://rss.wor.jp/announce">
                      お知らせ
                    </a>
                  </li>
                  <li>
                    <a href="https://rss.wor.jp/inquiry">
                      お問い合わせ
                    </a>
                  </li>
                </ul>
                <div class="column is-one-third-desktop buttons">
                  <p class="buttons-twitter has-text-right-tablet">
                    <a class="button is-twitter" href="https://twitter.com/intent/follow?screen_name=aikawame" target="blank">
                      <i class="icon-twitter" aria-hidden="true" />&#160;フォロー
                    </a>
                    <a class="button is-twitter" href="https://twitter.com/share?url=https://rss.wor.jp/&amp;related=aikawame&amp;hashtags=RSS愛好会&amp;text=RSS愛好会" target="blank">
                      <i class="icon-twitter" aria-hidden="true" />&#160;ツイート
                    </a>
                  </p>
                  <p class="buttons-facebook has-text-right-tablet">
                    <a class="button is-facebook" href="https://www.facebook.com/sharer/sharer.php?u=https://rss.wor.jp/" target="blank">
                      <i class="icon-facebook" aria-hidden="true" />&#160;シェア
                    </a>
                    <a class="button is-hateb" href="https://b.hatena.ne.jp/entry/https://rss.wor.jp/" target="blank">
                      <i class="icon-hateb" aria-hidden="true" />&#160;ブックマーク
                    </a>
                  </p>
                </div>
              </div>
            </div>
          </footer>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
