package handlers

import (
	"context"
	"os"

	"RissDojo/models"

	openai "github.com/sashabaranov/go-openai"
)

func JudgeShortAnswer(q models.Written, userAnswer string) (string, error) {
	client := openai.NewClient(os.Getenv("OPENAI_API_KEY"))
	ctx := context.Background()

	prompt := "問題: " + q.Question + "\n" +
		"模範解答: " + q.Answer + "\n" +
		"ユーザー解答: " + userAnswer + "\n" +
		"この解答が模範解答と意味的に一致しているか、日本語で厳密に○か×で答えてください。"

	resp, err := client.CreateChatCompletion(ctx, openai.ChatCompletionRequest{
		Model: "gpt-4o-mini", // もしくは "gpt-3.5-turbo"
		Messages: []openai.ChatCompletionMessage{
			{
				Role:    "user",
				Content: prompt,
			},
		},
	})
	if err != nil {
		return "", err
	}

	// 返答は resp.Choices[0].Message.Content にテキストで入っている
	return resp.Choices[0].Message.Content, nil
}
