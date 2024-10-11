import mysql.connector
import pandas as pd

# データベース接続情報
config = {
    'user': 'root',  # MySQLのユーザー名
    'password': 'shtky2718',  # MySQLのパスワード
    'host': 'localhost',  # MySQLのホスト名
    'database': 'test_db',  # 使用するデータベース名
}

# データベースに接続
connection = mysql.connector.connect(**config)

# SQLクエリを実行
query = "SELECT * FROM users"
df = pd.read_sql(query, connection)

# データベース接続を閉じる
connection.close()

# HTMLテーブルを生成
html_table = df.to_html(index=False, border=1)

# HTMLファイルに書き込む
with open("output.html", "w", encoding="utf-8") as file:
    file.write(html_table)

print("HTMLファイルが作成されました。")
