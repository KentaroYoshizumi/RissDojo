package handlers

import (
	"RissDojo/questions"
	"encoding/json"
	"net/http"
)

func GetMCQ(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(questions.MCQQuestions)
}
