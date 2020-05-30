from flask import Flask

#parse("Ruby File Header.rb")
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello World!'

if __name__ == '__main__':
    app.run()
