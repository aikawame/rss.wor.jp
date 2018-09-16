<template>
  <div class="default">
    <header>
      <nav class="navbar">
        <div class="container">
          <div class="navbar-brand">
            <a class="navbar-item is-size-3" href="/">
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
    <nuxt/>
    <footer class="footer">
      <div class="container">
        <div class="columns">
          <address class="column is-one-third-desktop">
            <p class="author is-size-3">
              <a href="/">
                <img class="icon-rss" src="/img/icon.svg" alt="RSS愛好会アイコン" aria-hidden="true" />
                <img class="logo-rss" src="/img/logo.svg" alt="RSS愛好会" />
              </a>
            </p>
            <p class="copyright">
              &copy; 2014-2018 <a href="https://worklover.wor.jp/">WorkLover</a>
            </p>
          </address>
          <ul class="column is-one-third-desktop">
            <li>
              <a href="/privacy">
                個人情報保護方針
              </a>
            </li>
            <li>
              <a href="/disclaimer">
                免責事項
              </a>
            </li>
            <li>
              <a href="/inquiry">
                お問い合わせ
              </a>
            </li>
          </ul>
          <div class="column is-one-third-desktop buttons">
            <p class="buttons-twitter has-text-right-tablet">
              <a class="button is-twitter" href="https://twitter.com/intent/follow?screen_name=aikawame" target="blank">
                <i class="icon-twitter" aria-hidden="true"></i>&nbsp;フォロー
              </a>
              <a class="button is-twitter" href="https://twitter.com/share?url=https://rss.wor.jp/&amp;related=aikawame&amp;hashtags=RSS愛好会&amp;text=RSS愛好会" target="blank">
                <i class="icon-twitter" aria-hidden="true"></i>&nbsp;ツイート
              </a>
            </p>
            <p class="buttons-facebook has-text-right-tablet">
              <a class="button is-facebook" href="https://www.facebook.com/sharer/sharer.php?u=https://rss.wor.jp/" target="blank">
                <i class="icon-facebook-f" aria-hidden="true"></i>&nbsp;シェア
              </a>
              <a class="button is-hateb" href="https://b.hatena.ne.jp/entry/https://rss.wor.jp/" target="blank">
                <i class="icon-hateb" aria-hidden="true"></i>&nbsp;ブックマーク
              </a>
            </p>
          </div>
        </div>
      </div>
    </footer>
  </div>
</template>
