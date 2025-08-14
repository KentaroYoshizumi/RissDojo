#!/usr/bin/env bash
set -euo pipefail

# スクリプトのあるディレクトリとリポジトリルートを求める（実行場所に依存しない）
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

TARGET_DIR="$REPO_ROOT/questions/data/vocab"
NESTED_DIR="$TARGET_DIR/questions/data/vocab"

echo "Repo root : $REPO_ROOT"
echo "Target dir: $TARGET_DIR"

# 必要なディレクトリを作成
mkdir -p "$TARGET_DIR"

# もし二重に掘られた配下があれば、そこから .json を引き上げる（上書きしない）
if [ -d "$NESTED_DIR" ]; then
  echo "Found nested dir: $NESTED_DIR"
  echo "Moving JSONs up to: $TARGET_DIR"
  find "$NESTED_DIR" -type f -name "*.json" -exec mv -n "{}" "$TARGET_DIR/" \;
  echo "Removing nested 'questions' directory under $TARGET_DIR"
  rm -rf "$TARGET_DIR/questions"
else
  echo "No nested dir found: $NESTED_DIR"
fi

# 念のため、さらに深い入れ子が無いかスキャンし、見つかれば順次引き上げ
# 例：questions/data/vocab/**/questions/data/vocab のようなパターンも拾う
FOUND_NESTS=0
while read -r d; do
  [ -z "$d" ] && continue
  echo "Found additional nested dir: $d"
  find "$d" -type f -name "*.json" -exec mv -n "{}" "$TARGET_DIR/" \;
  rm -rf "$(dirname "$d")"   # 直上の questions ディレクトリを削除
  FOUND_NESTS=1
done < <(find "$TARGET_DIR" -type d -path "*/questions/data/vocab" 2>/dev/null || true)

if [ "$FOUND_NESTS" -eq 0 ]; then
  echo "No additional nested dirs found."
fi

echo "Final check: list $TARGET_DIR"
ls -1 "$TARGET_DIR" | wc -l
ls -1 "$TARGET_DIR" | head -n 30

echo "Done."
