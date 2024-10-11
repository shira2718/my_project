from flask import Flask, render_template
import pandas as pd
import matplotlib.pyplot as plt
import io
import base64

app = Flask(__name__)

@app.route('/')
def index():
    # CSVデータを読み込む
    df = pd.read_csv('your_file.csv')

    # グラフの作成
    plt.figure(figsize=(10, 5))
    plt.plot(df['Column1'], df['Column2'])  # 必要に応じてカラム名を変更
    plt.title('CSV Data Chart')
    plt.xlabel('Column1')  # 必要に応じて変更
    plt.ylabel('Column2')  # 必要に応じて変更

    # グラフを画像として保存
    img = io.BytesIO()
    plt.savefig(img, format='png')
    img.seek(0)
    plot_url = base64.b64encode(img.getvalue()).decode('utf8')
    
    return render_template('index.html', plot_url=plot_url)

if __name__ == '__main__':
    app.run(debug=True)