package main

import (
	"bufio"
	"fmt"
	"log"
	"math/rand"
	"os"
	"strings"
	"time"

	"RissDojo/questions"
)

func main() {
	rand.Seed(time.Now().UnixNano())

	categoryMap := map[string]string{
		"1": "am1",
		"2": "am2",
		"3": "pm",
	}

	fmt.Println("出題カテゴリを選んでください:")
	fmt.Println("1: 午前Ⅰ")
	fmt.Println("2: 午前Ⅱ")
	fmt.Println("3: 午後")
	fmt.Print("番号を入力: ")

	reader := bufio.NewReader(os.Stdin)
	input, _ := reader.ReadString('\n')
	input = strings.TrimSpace(input)

	category, ok := categoryMap[input]
	if !ok {
		fmt.Println("⚠️ 無効な入力です。終了します。")
		return
	}

	mcqs, err := questions.LoadCategoryQuestions(category)
	if err != nil {
		log.Fatal("❌ 問題の読み込みに失敗:", err)
	}
	if len(mcqs) == 0 {
		fmt.Println("⚠️ このカテゴリには問題が登録されていません。")
		return
	}

	q := mcqs[rand.Intn(len(mcqs))]

	fmt.Println("\n📝 問題:", q.Question)
	fmt.Println("選択肢:")
	for i, c := range q.Options {
		fmt.Printf("%s. %s\n", []string{"ア", "イ", "ウ", "エ"}[i], c)
	}
	fmt.Printf("✅ 正解: %s\n", q.Answer)
	fmt.Println("💡 解説:", q.Explain)
}
