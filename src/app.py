from flask import Flask, jsonify, render_template
import requests

app = Flask(__name__)

@app.route('/', methods=['GET'])
def hello_world_and_joke():
    # Get Chuck Norris joke
    chuck_joke_response = requests.get('https://api.chucknorris.io/jokes/random')
    if chuck_joke_response.status_code == 200:
        joke_data = chuck_joke_response.json()
        joke = joke_data["value"]
    else:
        joke = "Failed to fetch Chuck Norris joke"
    
    # Return "Hello, World!" and the Chuck Norris joke
    return render_template('index.html', joke=joke)


# Health check
@app.route('/health')
def health():
    return 'Im Healthy :)', 200

if __name__ == '__main__':
    app.run("0.0.0.0",debug=True)
