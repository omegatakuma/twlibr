Twitterライブラリ by Scheme
===========================
+ OAuth認証未実装Twitterライブラリ!!!!!!!!!!

使い方
------

	% git clone git@github.com:omegatakuma/twlibr.git twlibr
	% cd twlibr
	% make

+ `(use libr.twitter)`でuseできる。

### ステータス取得 ###

**基本的なステータスを取得**

`status user cmd`

+ `user`はスクリーンネーム
+ `cmd`は`tweet``bio``local``url``list``timezone``follow``follower``fav`のどれかを指定。

### フォロー一覧取得 ###

**フォロー一覧をリストで取得**

`follow-get user`

+ OAuth認証をしていないのでおそらくAPI制限にかかる。

### フォロワー一覧取得 ###

**フォロワー一覧をリストで取得**

`follower-get user`

+ OAuth認証をしていないのでおそらくAPI制限にかかる。

### ツイート取得 ###

**ツイートn個をリストで取得**

`tweet-get user n`

+ `user`はスクリーンネーム
+ `n`は取得する数

### ふぁぼ取得 ###

**ふぁぼn個をリストで取得**

`fav-get user n`

+ `user`はスクリーンネーム
+ `n`は取得する数


Version
--------

### Ver 1.1 ###
+ `bio``local``url``list``timezone`を追加

### Ver 1.0 ###
+ 動作するのかな((((；ﾟДﾟ))))ｶﾞｸｶﾞｸﾌﾞﾙﾌﾞﾙ
