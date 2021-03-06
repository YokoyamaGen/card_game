# ババ抜き
 
基本的な機能を実装したRubyで動くババ抜きゲームです
 
## アプリ概要
 
ババ抜きの以下ルールを実装  
1. ゲームの中でのあなたのプレイヤー名を日本語で入力していただきます
2. 審判があなたと対戦相手である太郎さんにカードを配ります   
3. 配られた手札のカードでペアになるものがあれば、手札からカードを捨てます 
4. あなたは太郎さんの手札から1枚カードを選択します
5. 引いたカードが手札のカードとペアになるものがあれば、手札からカードを捨てます
6. 太郎さんがあなたの手札からカードを1枚引き、ペアのものがあれば手札からカードを捨てます  
7. 手札のカードが相手よりも早く無くなった方が勝ちとなります

## 機能

**Rubyのみで制作したアプリとなります**

- 機能1　ゲームの中でプレイヤー名を日本語で自由に入力可能  
- 機能2　プレイヤー名を誤って日本語以外の数字・ローマ字入力した場合、再入力を促す機能を実装
- 機能3　対戦相手の手札からカードを選択可能
- 機能4　誤って対戦相手の手札枚数よりも多い数字を入力した場合、再入力を促す機能を実装
 
## 使い方
 
1. ターミナルで実行。アプリのディレクトリ上で`ruby main.rb`で実行  
2. 画面のメッセージに従い、プレイヤー名の入力、相手の手札を選択
 
## インストール
 
```
$ git clone https://github.com/YokoyamaGen/card_game.git
$ cd card_game
$ ruby main.rb
```
 
## 作者
 
[横山　元)  
 
## ライセンス

This project is licensed free.  
ご自由にご利用ください
