import mysql.connector
import pandas as pd

# MySQLに接続
conn = mysql.connector.connect(
    host='localhost',
    user='root',
    password='shtky2718',
    database='test_db'  # 使用するデータベース名
)

# データの取得
# SQLクエリ
query = "SELECT * FROM your_table"  # 実際のテーブル名を指定

# Pandasを使ってデータを取得
df = pd.read_sql(query, conn)  # クエリを実行してデータフレームに読み込む

# 接続を閉じる
conn.close()

