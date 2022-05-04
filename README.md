# AuditoriumSeatTicketGenerator
講堂用 整理券/入場券 生成システム

# 出力サンプル
![output](https://user-images.githubusercontent.com/87298805/163590052-fb5d6018-2577-4b5f-89e3-b775444775e8.jpg)

# 使い方
## 座席指定
`seats`の定義内容を変更することで、出力したい座席番号をリストで指定します。
座席表リストの生成に関しては、[このスプレッドシート](https://docs.google.com/spreadsheets/d/1LGIUdsHhzDByt2CFFDK_X4iPBvbSSsi_LXgiE-UiFr8/edit)を参照してください。

【例】 A列のみを出力する場合
```
let seats = ["A-11", "A-12", "A-13", "A-14", "A-15", "A-16", "A-17", "A-18", "A-19", "A-20", "A-21", "A-22", "A-23", "A-24", "A-25", "A-26", "A-27", "A-28", "A-29", "A-30", "A-31", "A-32", "A-33", "A-34", "A-35", "A-36", "A-37", "A-38"]
```
## 出力
実行すると、コンソールにパスが出力されます。そのパスに出力結果のPDFが保存されています。

Finderで`⌘` `Shift` `G`のショートカットを利用してパスに移動しましょう。
