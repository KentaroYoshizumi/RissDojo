package main

import (
	"RissDojo/questions"
	"fmt"
)

func main() {
	q := questions.MCQQuestions[0]

	fmt.Println("問題:", q.Question)
	fmt.Println("選択肢:")
	for i, c := range q.Options {
		fmt.Printf("%s. %s\n", []string{"ア", "イ", "ウ", "エ"}[i], c)
	}
	fmt.Printf("正解: %s\n", q.Answer)
	fmt.Println("解説:", q.Explain)
}
