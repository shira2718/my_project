from flask import Flask, jsonify, make_response
from flask_cors import CORS
import mysql.connector
import pandas as pd
import os

app = Flask(__name__)
CORS(app)

# MySQLに接続
def get_db_connection():
    return mysql.connector.connect(
        host=os.getenv('MYSQLHOST'),        # 環境変数からホスト名を取得
        user=os.getenv('MYSQLUSER'),        # 環境変数からユーザー名を取得
        password=os.getenv('MYSQLPASSWORD'), # 環境変数からパスワードを取得
        database=os.getenv('MYSQLDATABASE')  # 環境変数からデータベース名を取得
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
