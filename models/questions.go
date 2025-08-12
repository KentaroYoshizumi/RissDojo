package models

type MCQ struct {
	ID       int
	Question string
	Options  []string
	Answer   string
	Explain  string
}

// 記述式（ShortAnswer）用
type ShortAnswer struct {
	ID             int
	Question       string
	AnswerKeywords []string // 正答判定用のキーワード
	ModelAnswer    string   // AI判定用の模範解答
}

type Written struct {
	ID          int
	Prompt      string
	Explain     string
	Question    string // 問題文
	Answer      string // 正答（AI判定用の模範解答）
	Explanation string // 解説
	Category    string // カテゴリー（vocabなど）
}
