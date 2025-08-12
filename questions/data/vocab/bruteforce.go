package vocab

import "RissDojo/models"

var ShortAnswerQuestions = []models.ShortAnswer{
	{
		ID:             1,
		Question:       "「ブルートフォースアタック」とは何ですか？",
		AnswerKeywords: []string{"総当たり", "全てのパスワード", "鍵", "試す"},
		ModelAnswer:    "ブルートフォースアタックは、全ての可能なパスワードや鍵を総当たりで試す攻撃手法です。",
	},
}
