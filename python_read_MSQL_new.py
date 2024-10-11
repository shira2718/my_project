from flask import Flask, jsonify, make_response
from flask_cors import CORS
import mysql.connector
import pandas as pd
import time

app = Flask(__name__)
CORS(app)

# MySQLに接続
def get_db_connection():
    return mysql.connector.connect(
        host='localhost',
        user='root',
        password='shtky2718',
        database='test_db'  # 使用するデータベース名
    )

@app.route('/data', methods=['GET'])
def get_data():
    conn = get_db_connection()  # データベース接続
    query = "SELECT * FROM your_table"  # 実際のテーブル名を指定
    
    try:
        df = pd.read_sql(query, conn)
        # コンソールにデータを出力
        print(df)  # DataFrameをコンソールに出力
        
        response = make_response(df.to_json(orient='records'))
        response.headers['Cache-Control'] = 'no-cache, no-store, must-revalidate'  # キャッシュを無効にする
        response.headers['Pragma'] = 'no-cache'
        response.headers['Expires'] = '0'
        
        return response
    finally:
        conn.close()  # 接続を閉じる

if __name__ == '__main__':
    app.run(debug=True)
