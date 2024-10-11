from flask import Flask, jsonify
from flask_cors import CORS  # CORSをインポート
import mysql.connector
import pandas as pd

app = Flask(__name__)
CORS(app)  # CORSを適用

# MySQLに接続
conn = mysql.connector.connect(
    host='localhost',
    user='root',
    password='shtky2718',
    database='test_db'  # 使用するデータベース名
)

@app.route('/data', methods=['GET'])
def get_data():
    query = "SELECT * FROM your_table"  # 実際のテーブル名を指定
    df = pd.read_sql(query, conn)  # データを取得
    return df.to_json(orient='records')  # JSON形式で返す

if __name__ == '__main__':
    app.run(debug=True)
