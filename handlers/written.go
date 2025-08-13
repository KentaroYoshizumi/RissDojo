package handlers

import (
	"encoding/json"
	"net/http"

	"RissDojo/models"
	"RissDojo/questions"
)

func GetWritten(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")

	var writtenQuestions []models.Written
	for _, q := range questions.WrittenQuestions {
		writtenQuestions = append(writtenQuestions, q)
	}

	json.NewEncoder(w).Encode(writtenQuestions)
}
