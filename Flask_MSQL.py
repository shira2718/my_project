from flask import Flask, jsonify
import mysql.connector
import pandas as pd  # Pandasもインポート

app = Flask(__name__)

# MySQLからデータを取得
def get_data_from_mysql():
    conn = mysql.connector.connect(
            host='localhost',
            user='root',
            password='shtky2718',
            database='test_db'
    )
    cursor = conn.cursor(dictionary=True)

        # SQLクエリ
    query = "SELECT * FROM your_table"  # 実際のテーブル名を指定

        # Pandasを使ってデータを取得
    df = pd.read_sql(query, conn)  # クエリを実行してデータフレームに読み込む

    cursor.close()  # カーソルを閉じる
    conn.close()    # 接続を閉じる
    return df  # データフレームを返す

# Flaskのエンドポイント
@app.route('/data', methods=['GET'])
def data():
    data = get_data_from_mysql()
    return jsonify(data.to_dict(orient='records'))  # データフレームをJSONに変換して返す

if __name__ == '__main__':
    app.run(debug=True)