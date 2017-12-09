# NES Astro Robo Sasa

## Movie

* [TASVideos](http://tasvideos.org/Game/nes-astro-robo-sasa.html)
* [My first testrun](movie/AstroRoboSasa-tas-any-0.1.fm2.xz)

## Possible improvement

10面で単独壁抜けができれば短縮になる(現行TASでは2P壁抜けで妥協している)。
11,12面では簡単に成功するので、ラグが関係しているのかも。

特定のタイミングで風船を割ったりポーズをかけたりするとBGMが止まること
がある([参考ムービー](movie/AstroRoboSasa-bgmstop.fm2.xz))。これの発生
条件を詳しく調べればラグ軽減に役立つかも。

フレームカウンタの値によって微妙に動きが変わるので、厳密な最適化のため
にはステージ開始時のフレームカウンタの値を何通りも試すことが必要。


