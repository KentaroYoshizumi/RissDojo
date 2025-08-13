package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"

	"RissDojo/handlers"
	"RissDojo/questions"
)

func main() {
	// 動的にvocabカテゴリーの記述式問題を読み込む
	questions, err := questions.LoadWrittenCategory("vocab")
	if err != nil {
		fmt.Println("問題読み込みエラー:", err)
		return
	}
	if len(questions) == 0 {
		fmt.Println("問題がありません。")
		return
	}

	q := questions[0]

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
