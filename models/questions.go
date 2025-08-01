package models

type MCQ struct {
	ID       int      `json:"id"`
	Question string   `json:"question"`
	Options  []string `json:"options"`
	Answer   string   `json:"answer"`
	Explain  string   `json:"explain"`
}

type Written struct {
	ID      int    `json:"id"`
	Prompt  string `json:"prompt"`
	Answer  string `json:"answer"`
	Explain string `json:"explain"`
}
