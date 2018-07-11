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
        <link rel="stylesheet" href="/_nuxt/app.css" />
        <title><xsl:value-of select="/rdf:RDF/rss:channel/rss:title" /></title>
      </head>
      <body>
        <div class="default">
          <header>
            <nav class="navbar">
              <div class="container">
                <div class="navbar-brand">
                  <a class="navbar-item is-size-3" href="https://rss.wor.jp/">
                    <img class="icon-rss" src="/img/icon.svg" alt="RSS愛好会アイコン" aria-hidden="true" />
                    <img class="logo-rss" src="/img/logo.svg" alt="RSS愛好会" />
                  </a>
                </div>
                <div class="navbar-menu">
                  <div class="navbar-end">
                    <span class="navbar-item">
                      <a class="button" href="https://worklover.wor.jp/">
                        <img class="logo-worklover" src="/img/logo_worklover.svg" alt="ワクラバ" />
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
              <section class="subscription container">
                <xsl:variable name="channel-link" select="(/rdf:RDF/rss:channel/rss:altlink)" />
                <p class="buttons-feed-reader buttons">
                  <a class="button is-small is-feedly" href="https://feedly.com/i/subscription/feed%2F{$channel-link}" target="blank">
                    <i class="fab fa-twitter" />&#160;Feedlyで購読
                  </a>
                  <a class="button is-small is-inoreader" href="http://www.inoreader.com/feed/{$channel-link}" target="blank">
                    <i class="fab fa-twitter" />&#160;Inoreaderで購読
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
            </section>
          </article>
          <footer class="footer">
            <div class="container">
              <div class="columns">
                <address class="column is-one-third-desktop">
                  <p class="author is-size-3">
                    <a href="https://rss.wor.jp/">
                      <img class="icon-rss" src="/img/icon.svg" alt="RSS愛好会アイコン" aria-hidden="true" />
                      <img class="logo-rss" src="/img/logo.svg" alt="RSS愛好会" />
                    </a>
                  </p>
                  <p class="copyright">
                    &#169; 2014-2018 <a href="https://worklover.wor.jp/">WorkLover</a>
                  </p>
                </address>
                <ul class="column is-one-third-desktop">
                  <li>
                    <a href="https://worklover.wor.jp/privacy.html">
                      個人情報保護方針
                    </a>
                  </li>
                  <li>
                    <a href="https://worklover.wor.jp/disclaimer.html">
                      免責事項
                    </a>
                  </li>
                  <li>
                    <a href="https://docs.google.com/forms/d/e/1FAIpQLSdcdNlZSANueBFqjTZQzVrQsxoqalHm8c_Jdg6K3lBrieu9DQ/viewform?usp=sf_link">
                      お問い合わせ
                    </a>
                  </li>
                </ul>
                <div class="column is-one-third-desktop buttons">
                  <p class="buttons-twitter has-text-right-tablet">
                    <a class="button is-twitter" href="https://twitter.com/intent/follow?screen_name=aikawame" target="_blank">
                      <i class="fab fa-twitter" />&#160;フォロー
                    </a>
                    <a class="button is-twitter" href="https://twitter.com/share?url=https://rss.wor.jp/&amp;related=aikawame&amp;hashtags=RSS愛好会&amp;text=RSS愛好会" target="_blank">
                      <i class="fab fa-twitter" />&#160;ツイート
                    </a>
                  </p>
                  <p class="buttons-facebook has-text-right-tablet">
                    <a class="button is-facebook" href="https://www.facebook.com/sharer/sharer.php?u=https://rss.wor.jp/" target="_blank">
                      <i class="fab fa-facebook-f" />&#160;シェア
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
