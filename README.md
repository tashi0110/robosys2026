# robosys2026
# SPDX-FileCopyrightText: 2026 Tsubasa Tashiro
ロボットシステム学の課題で作成したコマンド
## Commands

### shiftcalc

アルバイトの月収を計算するコマンドです。

指定した年月と時給、曜日ごとの勤務時間から、その月の勤務日数・合計勤務時間・予想給与を計算します。

## Requirements

- Python 3

## Usage

以下の形式で入力データを作成します。

```text
2026 11 1200
月曜日 5
水曜日 4
金曜日 6
土曜日 8
```

入力形式は次の通りです。

- 1行目：年 月 時給
- 2行目以降：曜日 勤務時間
- 休みの曜日は省略できます。

実行方法：

```bash
./shiftcalc < shifts.txt
```

## Output

```text
month,workdays,total_hours,wage_yen
2026-11,17,97,116400
```

## Testing

テストは以下のコマンドで実行できます。

```bash
./test_shiftcalc.bash
```

テストでは計算結果とエラー処理を確認します。

