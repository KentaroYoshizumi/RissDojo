package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"

	"RissDojo/handlers"
	"RissDojo/questions/data/vocab"
)

func main() {
	// 今回はvocabカテゴリーの1問目
	q := vocab.ShortAnswerQuestions[0]

	fmt.Println("問題:", q.Question)
	fmt.Print("解答を入力してください: ")

	reader := bufio.NewReader(os.Stdin)
	userAnswer, _ := reader.ReadString('\n')
	userAnswer = strings.TrimSpace(userAnswer)

	// AIで採点
	result, err := handlers.JudgeShortAnswer(q, userAnswer)
	if err != nil {
		fmt.Println("採点エラー:", err)
		return
	}

	fmt.Println("採点結果:", result)
}
