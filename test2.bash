#!/bin?bash -xv
#SPDX_FileCopyrightText: 2024 Hyuta Sasaki
#SPDX-Licence-Indentifier: BSD-3-Clause

ng() {
    echo NG at line ${1}
    res=1
}

res=0

#正常なインプット
out=$(echo 1/1 |./omikuji)
[ "${out}" = "今日の運勢は: 大吉" ] || [ "${out}" = "今日の運勢は: 大凶" ] || ng ${LINENO}

out=$(echo 1/2 |./omikuji)
[ "${out}" = "今日の運勢は: 大吉" ] || [ "${out}" = "今日の運勢は: 吉" ] || [ "${out}" = "今日の運勢は: 中吉" ] || [ "${out}" = "今日の運勢は: 小吉" ] || [ "${out}" = "今日の運勢は: 末吉" ] || [ "${out}" = "今日の運勢は: 凶" ] || [ "${out}" = "今日の運勢は: 大凶" ] || ng ${LINENO}

out=$(echo 1/3 |./omikuji)
[ "${out}" = "今日の運勢は: 大吉" ] || [ "${out}" = "今日の運勢は: 凶" ] || [ "${out}" = "今日の運勢は: 大凶" ] || ng ${LINENO}

out=$(echo 1/4 |./omikuji)
[ "${out}" = "今日の運勢は: 大吉" ] || [ "${out}" = "今日の運勢は: 吉" ] || [ "${out}" = "今日の運勢は: 中吉" ] || [ "${out}" = "今日の運勢は: 小吉" ] || [ "${out}" = "今日の運勢は: 末吉" ] || [ "${out}" = "今日の運勢は: 凶" ] || [ "${out}" = "今日の運勢は: 大凶" ] || ng ${LINENO}

out=$(echo 1/5 |./omikuji)
[ "${out}" = "今日の運勢は: 大吉" ] || [ "${out}" = "今日の運勢は: 吉" ] || [ "${out}" = "今日の運勢は: 中吉" ] || [ "${out}" = "今日の運勢は: 小吉" ] || [ "${out}" = "今日の運勢は: 末吉" ] || ng ${LINENO}

out=$(echo 1/6 |./omikuji)
[ "${out}" = "今日の運勢は: 大吉" ] || [ "${out}" = "今日の運勢は: 吉" ] || [ "${out}" = "今日の運勢は: 中吉" ] || [ "${out}" = "今日の運勢は: 小吉" ] || [ "${out}" = "今日の運勢は: 末吉" ] || [ "${out}" = "今日の運勢は: 凶" ] || [ "${out}" = "今日の運勢は: 大凶" ] || ng ${LINENO}

out=$(echo 1/7 |./omikuji)
[ "${out}" = "今日の運勢は: 大吉" ] || [ "${out}" = "今日の運勢は: 吉" ] || [ "${out}" = "今日の運勢は: 中吉" ] || [ "${out}" = "今日の運勢は: 小吉" ] || [ "${out}" = "今日の運勢は: 末吉" ] || [ "${out}" = "今日の運勢は: 凶" ] || [ "${out}" = "今日の運勢は: 大凶" ] || ng ${LINENO}

out=$(echo 1/8 |./omikuji)
[ "${out}" = "今日の運勢は: 大吉" ] || [ "${out}" = "今日の運勢は: 吉" ] || [ "${out}" = "今日の運勢は: 中吉" ] || [ "${out}" = "今日の運勢は: 末吉" ] || [ "${out}" = "今日の運勢は: 凶" ] || [ "${out}" = "今日の運勢は: 大凶" ] || ng ${LINENO} 

#異常なインプット

out=$(echo  |./omikuji)
[ "$?" = 1 ] || ng ${LINENO}
[ "${out}" = "無効な入力です。MM/DDの形式で入力してください。" ] || ng ${LINENO}

out=$(echo 1月1日|./omikuji)
[ "$?" = 1 ] || ng ${LINENO}
[ "${out}" = "無効な入力です。MM/DDの形式で入力してください。" ] || ng ${LINENO}

out=$(./omikuji あ)
[ "$?" = 1 ] || ng ${LINENO}
[ "${out}" = "無効な入力です。MM/DDの形式で入力してください。" ] || ng ${LINENO}

out=$(./omikuji 13/40)
[ "$?" = 1 ] || ng ${LINENO}
[ "${out}" = "月は1~12、日にちは1~31の範囲で入力してください。" ] || ng ${LINENO}

#正しいインプット（数字の前に０）
out=$(echo 01/01 |./omikuji)
[ "${out}" = "今日の運勢は: 大吉" ] || [ "${out}" = "今日の運勢は:大凶" ] || ng${LINENO}

#正しいインプット（数字が全角）
out=$(echo １/１ |./omikuji)
[ "${out}" = "今日の運勢は: 大吉" ] || [ "${out}" = "今日の運勢は: 大凶" ] || ng${LINENO} 

[ "$res" = 0 ] && echo OK
exit $res
