package questions

import (
	"encoding/json"
	"os"
	"path/filepath"

	"RissDojo/models"
)

func LoadCategoryQuestions(category string) ([]models.MCQ, error) {
	var questions []models.MCQ

	dirPath := filepath.Join("questions", "data", category)

	files, err := os.ReadDir(dirPath)
	if err != nil {
		return nil, err
	}

	for _, file := range files {
		if file.IsDir() {
			continue
		}

		content, err := os.ReadFile(filepath.Join(dirPath, file.Name())) // ← ここが新しい書き方
		if err != nil {
			return nil, err
		}

		var q models.MCQ
		if err := json.Unmarshal(content, &q); err != nil {
			return nil, err
		}
		questions = append(questions, q)
	}
	return questions, nil
}
