# NES Bokosuka Wars

## Movie

* Takanawa氏のムービー
  [1](http://tasvideos.org/userfiles/info/41289430800559246),
  [2](http://tasvideos.org/userfiles/info/41323980399663048)
* [TASVideos](http://tasvideos.org/Game/nes-bokosuka-wars.html)
* TASVideos [Submission #5640](http://tasvideos.org/5640S.html)
* TASVideos [Submission #3866](http://tasvideos.org/3866S.html)

## Reference

* [くまぞーのページ](http://kumazo.sugoihp.com/bokosukawars/menu.htm)

## Memo

起動時にRAM初期化を行っておらず、乱数もRAM初期値に依存している。よっ
て、エミュレータにより動作が異なる。

乱数がキャリービットに依存しているため、予測はなかなか面倒そう。

5周目になると仲間なしでは通れない(落とし穴と障害物で完全に道が塞がって
いる)地形も出てくることがある。城の入口前に大量の落とし穴があることも。

戦闘についてはアセンブリを参照。戦闘力の差が30以上なら必勝と思われる。
