#!/usr/bin/env bash
set -euo pipefail

actual=$(cat <<'EOF' | ./shiftcalc
2026 11 1200
月曜日 5
水曜日 4
金曜日 6
土曜日 8
EOF
)

expected=$(cat <<'EOF'
month,workdays,total_hours,wage_yen
2026-11,17,97,116400
EOF
)

if [[ "$actual" != "$expected" ]]; then
    echo "計算テスト失敗" >&2
    echo "期待値:" >&2
    echo "$expected" >&2
    echo "実際の結果:" >&2
    echo "$actual" >&2
    exit 1
fi

tmp_out=$(mktemp)
tmp_err=$(mktemp)
trap 'rm -f "$tmp_out" "$tmp_err"' EXIT

if printf '2026 13 1200\n' | ./shiftcalc >"$tmp_out" 2>"$tmp_err"; then
    echo "エラーテスト失敗: 不正な月を受け付けました" >&2
    exit 1
fi

if [[ -s "$tmp_out" ]]; then
    echo "エラーテスト失敗: エラー時に標準出力へ出力されました" >&2
    exit 1
fi

if ! grep -q '月は1〜12' "$tmp_err"; then
    echo "エラーテスト失敗: 標準エラー出力を確認してください" >&2
    exit 1
fi

echo "shiftcalc tests passed"
