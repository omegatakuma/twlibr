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

基本的なステータスを取得**(tweet数・follow数・follower数・fav数)**

`status user cmd`

+ `user`は**ユーザー名**
+ `cmd`は**tweet数**・**follow数**・**follower数**・**fav数**

### フォロー一覧取得 ###

フォロー一覧をリストで取得

`follow-get user`

+ OAuth認証をしていないのでおそらくAPI制限にかかる。

### フォロワー一覧取得 ### 

フォロワー一覧をリストで取得

`follower-get user`

+ OAuth認証をしていないのでおそらくAPI制限にかかる。

### ツイート取得 ### 

ツイートn個をリストで取得

`tweet-get user n`

+ `user`はスクリーンネーム
+ `n`は取得する数

### ふぁぼ取得 ###
---------
ふぁぼn個をリストで取得

`fav-get user n`

+ `user`はスクリーンネーム
+ `n`は取得する数


### Ver 1.0 ###
+ 動作するのかな((((；ﾟДﾟ))))ｶﾞｸｶﾞｸﾌﾞﾙﾌﾞﾙ
