module.exports = {
  /*
  ** Headers of the page
  */
  head: {
    title: 'RSS愛好会 - 産経・読売・日経新聞などのRSSフィードを配信',
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: '産経・読売・日経新聞などのRSSフィードを配信しています。' },
      { hid: 'keywords', name: 'keywords', content: 'RSS,新聞,ニュース,産経,SANKEI,読売,YOMIURI,日経,NIKKEI,ロイター,Reuters,ブルームバーグ,Bloomberg' },
      { property: 'og:type', content: 'website' },
      { property: 'og:site_name', content: 'RSS愛好会' },
      { property: 'og:title', content: 'RSS愛好会' },
      { property: 'og:url', content: 'https://rss.wor.jp/' },
      { property: 'og:image', content: 'https://rss.wor.jp/img/ogp.png' },
      { property: 'og:image:width', content: '1200' },
      { property: 'og:image:height', content: '630' },
      { property: 'og:description', content: '産経・読売・日経新聞などのRSSフィードを配信しています。' },
      { name: 'twitter:card', content: 'summary_large_image' },
      { name: 'twitter:site', content: '@aikawame' }
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }
    ]
  },
  /*
  ** Customize the progress bar color
  */
  loading: { color: '#3B8070' },
  /*
  ** Build configuration
  */
  build: {
    extractCSS: true,
    filenames: {
      css: 'app.css?v=[contenthash]'
    },
    // v2では不要になる
    vendor: ['axios'],
    /*
    ** Run ESLint on save
    */
    extend (config, { isDev, isClient }) {
      if (isDev && isClient) {
        config.module.rules.push({
          enforce: 'pre',
          test: /\.(js|vue)$/,
          loader: 'eslint-loader',
          exclude: /(node_modules)/
        })
      }
    }
  },
  css: [
    '~/assets/css/default.scss',
    '~/assets/css/icon.css'
  ],
  generate: {
    fallback: true
  },
  modules: [
    ['@nuxtjs/google-adsense', { id: 'ca-pub-0248545174327416', analyticsUacct: 'UA-1744748-8', analyticsDomainName: 'rss.wor.jp' }],
    ['@nuxtjs/google-analytics', { id: 'UA-1744748-8' }],
    '@nuxtjs/sitemap'
  ],
  sitemap: {
    hostname: 'https://rss.wor.jp',
    generate: true
  }
};
