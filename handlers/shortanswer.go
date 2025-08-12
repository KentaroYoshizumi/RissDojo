package handlers

import (
	"context"
	"fmt"
	"os"

	"RissDojo/models"
	//"github.com/openai/openai-go" // OpenAI公式Go SDK
)

func JudgeShortAnswer(q models.ShortAnswer, userAnswer string) (string, error) {
	client := openai.NewClient(os.Getenv("OPENAI_API_KEY"))

	prompt := fmt.Sprintf(`
以下の模範解答とユーザーの解答を比較し、「正解」「部分的に正しい」「不正解」のいずれかで返してください。
また、一言で理由も述べてください。

模範解答:
%s

ユーザーの解答:
%s
`, q.ModelAnswer, userAnswer)

	resp, err := client.Chat.Completions.New(context.Background(), openai.ChatCompletionNewParams{
		Model: openai.F(openai.ChatModelGPT4oMini),
		Messages: openai.F([]openai.ChatCompletionMessageParam{
			{
				Role: openai.F(openai.ChatCompletionMessageRoleUser),
				Content: openai.F([]openai.ChatCompletionContentPartUnion{
					openai.ChatCompletionContentPartText{Text: openai.F(prompt)},
				}),
			},
		}),
	})
	if err != nil {
		return "", err
	}

	return *resp.Choices[0].Message.Content[0].(openai.ChatCompletionContentPartText).Text, nil
}
