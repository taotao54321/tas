# NES Wizardry: Proving Grounds of the Mad Overlord

## Movie

* [TASVideos](http://tasvideos.org/Game/nes-wizardry-proving-grounds-of-the-mad-overlord.html)

現行TASはFCEUX用なので、実機では正しく再生されないはず
([参考記事](http://taotao54321.hatenablog.com/entry/20110514/1305378508))。

## Possible improvement

キャラメイクを行わず、初期の THIEF, CLERIC で攻略できれば1～2秒程度速
くなりうる。ただしその場合、WERDNA に攻撃を当てるために SCROLL of
DARKNESS が必要。具体的な手順は以下の通り:

* B4F で SWORD of SLICING を入手(THIEF に持たせる)
* B9F で SCROLL of DARKNESS, RING of MOVEMENT, DAGGER of THIEVES を入
  手(全て THIEF に持たせる。おそらく乱数調整がかなり難しい)
* THIEF を NINJA にして SWORD of SLICING を装備させる
* WERDNA 戦1ターン目で SCROLL of DARKNESS を使う。これで WERDNA にクリ
  ティカルが通るようになる(約 0.05%)

WERDNA のお供を処理する際はクリティカルよりディスペルの方がメッセージ
表示が速いので、SCROLL of DARKNESS は THIEF に持たせるべき。

その他、ラグや乱数調整の最適化を頑張れば1秒くらいは縮まるかも。


