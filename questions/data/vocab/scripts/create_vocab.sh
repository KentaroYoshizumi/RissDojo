#!/bin/bash
set -e

OUTPUT_DIR="/Users/kentaroyoshizumi/Desktop/RissDojo/questions/data/vocab"
mkdir -p "$OUTPUT_DIR"

# 単語リスト: filename|word|description
VOCAB_LIST=(
  "waterfall_model|ウォーターフォールモデル|開発工程を上流から下流に順に進める直線的な開発手法。"
  "spiral_model|スパイラルモデル|反復的にリスクを評価しながら開発を進めるモデル。"
  "prototyping|プロトタイピング|試作システムを作成し、利用者のフィードバックを得ながら開発する手法。"
  "evolutionary_model|進化的モデル|システムを段階的に拡張・改善しながら完成させる開発手法。"
  "inspection|インスペクション|仕様書やコードを正式な手順でレビューし、欠陥を検出する活動。"
  "walkthrough|ウォークスルー|開発者が主体となり、非公式に成果物を確認するレビュー手法。"
  "agile|アジャイル|短い開発サイクルを繰り返し、柔軟に要求変化へ対応する開発手法。"
  "iteration|イテレーション|アジャイル開発で用いられる短期間の反復開発サイクル。"
  "extreme_programming|エクストリームプログラミング|アジャイル開発の代表的手法で、ペアプログラミングやテスト駆動開発を重視する。"
  "devops|DevOps|開発(Dev)と運用(Ops)を統合し、迅速なリリースと継続改善を実現する文化や手法。"
  "mashup|マッシュアップ|複数のサービスやデータを組み合わせて新しいサービスを作る手法。"
  "doa|DOA(Data Oriented Approach)|データを中心にシステムを設計する開発手法。"
  "dfd|DFD(Data Flow Diagram)|データの流れを図式化してシステムを分析・設計する手法。"
  "object_oriented|オブジェクト指向|データと処理を一体化したオブジェクトを基本単位とする設計思想。"
  "encapsulation|カプセル化|データと処理を外部から隠蔽し、オブジェクトの独立性を保つ仕組み。"
  "polymorphism|ポリモーフィズム|同じ操作でもオブジェクトの型に応じて異なる動作をする性質。"
  "inheritance|インヘリタンス|既存のクラスを基に新しいクラスを定義し、機能を継承する仕組み。"
  "jis_x_25010|JIS X 25010|ソフトウェア製品の品質モデルを定めた国際規格の日本語版。"
  "tdd|テスト駆動開発|テストコードを先に書き、それを満たす実装を行う開発手法。"
  "uml|UML|統一モデリング言語。システムの構造や挙動を表現する標準的な図式表記法。"
)

# JSONファイル作成ループ
for item in "${VOCAB_LIST[@]}"; do
  IFS='|' read -r fname word desc <<< "$item"
  file="$OUTPUT_DIR/$fname.json"
  printf '{\n  "word": "%s",\n  "description": "%s"\n}\n' "$word" "$desc" > "$file"
  echo "Created: $file"
done
