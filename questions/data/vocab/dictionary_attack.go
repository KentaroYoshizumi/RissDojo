package vocab

import "RissDojo/models"

var DictionaryAttack = models.Written{
	ID:          2, // 既存問題と重複しないIDにする
	Question:    "辞書攻撃とは何ですか？",
	Answer:      "あらかじめ用意した単語リストを使ってパスワードや鍵を試す攻撃方法。",
	Explanation: "辞書攻撃は、事前に作成した単語リスト（辞書）を使い、パスワードや暗号鍵を順番に試す攻撃手法です。ブルートフォースより効率的ですが、辞書にないパスワードには無効です。",
	Category:    "vocab",
}
