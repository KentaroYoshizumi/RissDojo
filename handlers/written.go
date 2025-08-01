package handlers

import (
	"RissDojo/questions"
	"encoding/json"
	"net/http"
)

func GetWritten(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(questions.WrittenQuestions)
}
