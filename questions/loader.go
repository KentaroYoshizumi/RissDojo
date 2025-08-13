package questions

import (
	"encoding/json"
	"os"
	"path/filepath"
	"strings"

	"RissDojo/models"
)

// MCQ（選択式）を読み込む
func LoadMCQCategory(category string) ([]models.MCQ, error) {
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

		content, err := os.ReadFile(filepath.Join(dirPath, file.Name()))
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

// Written（記述式）を読み込む
func LoadWrittenCategory(category string) ([]models.Written, error) {
	var questions []models.Written
	dirPath := filepath.Join("questions", "data", category)

	files, err := os.ReadDir(dirPath)
	if err != nil {
		return nil, err
	}

	for _, file := range files {
		if file.IsDir() {
			continue
		}

		// 拡張子が .json のファイルだけ処理
		if !strings.HasSuffix(file.Name(), ".json") {
			continue
		}

		content, err := os.ReadFile(filepath.Join(dirPath, file.Name()))
		if err != nil {
			return nil, err
		}

		var q models.Written
		if err := json.Unmarshal(content, &q); err != nil {
			return nil, err
		}
		questions = append(questions, q)
	}
	return questions, nil
}
