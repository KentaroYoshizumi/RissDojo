#!/bin/bash

# カテゴリディレクトリの作成
mkdir -p questions/data/am1
mkdir -p questions/data/am2
mkdir -p questions/data/pm

# サンプル問題1（午前Ⅰ）
cat <<EOF > questions/data/am1/q1.json
{
  "id": 1,
  "question": "情報セキュリティにおいて『CIA』のAは何を意味するか？",
  "options": [
    "ア. 認可",
    "イ. 可用性",
    "ウ. 認証",
    "エ. 責任追跡性"
  ],
  "answer": "イ",
  "explain": "CIAのAは『Availability（可用性）』を意味する。"
}
EOF

# サンプル問題2（午前Ⅱ）
cat <<EOF > questions/data/am2/q1.json
{
  "id": 2,
  "question": "OSI参照モデルの第3層はどれか？",
  "options": [
    "ア. ネットワーク層",
    "イ. データリンク層",
    "ウ. トランスポート層",
    "エ. セッション層"
  ],
  "answer": "ア",
  "explain": "第3層は『ネットワーク層』で、IPなどが該当する。"
}
EOF

# サンプル問題3（午後）
cat <<EOF > questions/data/pm/q1.json
{
  "id": 3,
  "question": "システム運用におけるジョブ管理の目的として適切なものはどれか？",
  "options": [
    "ア. システム障害の検出と修復",
    "イ. 定期的なバッチ処理のスケジューリングと監視",
    "ウ. ネットワークトラフィックの最適化",
    "エ. 不正アクセスの遮断"
  ],
  "answer": "イ",
  "explain": "ジョブ管理は、定期的な処理の実行計画や監視が主な目的。"
}
EOF

echo "✅ ディレクトリとサンプル問題ファイルを作成しました。"
