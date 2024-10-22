from flask import Flask, request, jsonify
from flask_cors import CORS
import mysql.connector
import pandas as pd
import io

app = Flask(__name__)
CORS(app, supports_credentials=True)  # CORSを適用

@app.route('/upload', methods=['POST'])
def upload_csv():
    file = request.files['file']  # フォームからCSVファイルを取得
    if not file:
        return jsonify({'error': 'No file provided'}), 400

    # CSVデータを読み込む
    df = pd.read_csv(io.StringIO(file.stream.read().decode("UTF-8")))

    try:
        # MySQLに接続
        conn = mysql.connector.connect(
            host='localhost',
            user='root',
            password='shtky2718',
            database='test_db'
        )
        
        cursor = conn.cursor()

        # テーブル内のデータを削除
        delete_query = "DELETE FROM your_table"  # 実際のテーブル名を指定
        cursor.execute(delete_query)

        # 新しいデータを挿入するためのREPLACE文を準備
        replace_query = """
        REPLACE INTO your_table (column1, column2, column3) 
        VALUES (%s, %s, %s)
        """
        
        # データをMySQLに置き換えるロジック
        for index, row in df.iterrows():
            cursor.execute(replace_query, (row['column1'], row['column2'], row['column3']))

        conn.commit()  # すべての挿入が完了した後にコミット
        return jsonify({'success': True}), 200

    except mysql.connector.Error as err:
        return jsonify({'error': str(err)}), 500

    finally:
        if cursor:
            cursor.close()
        if conn:
            conn.close()

if __name__ == '__main__':
    app.run(port=5001, debug=True)