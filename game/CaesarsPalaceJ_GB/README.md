# GB Caesars Palace (J)

## Movie

[My first attempt](http://tasvideos.org/userfiles/info/43516332562336831)
([encode](https://www.youtube.com/watch?v=1s6IiPhGWuE))

## Memo

TAS的には500万JPを2回出すだけの簡単な作業。なお、100万JP→500万JPルー
トだと少し遅くなる。

スロットのリール値はコイン投入およびレバー操作のタイミングで決まる。黒
7になるのはフレームカウンタの256通りの値のうち4通りのみ。よって、黒7が
4つ揃う確率は 1/64^1 = 1/16777216。

ブラックジャックはカードの予想が可能。シャッフル結果は前回のデッキとフ
レームカウンタにのみ依存するため、前回のデッキを記録した上で256通りの
結果全てを列挙し、シャッフル直後に配られたカードと照合すれば、その後の
カードが予想できる。
[「GBのゲーム制覇しましょ」Wiki](https://www14.atwiki.jp/gball/pages/571.html)
にツールがある。
