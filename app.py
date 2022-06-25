from flask import Flask, render_template, make_response, jsonify, request
import argparse
def argumentsParser():
    parser = argparse.ArgumentParser()
    parser.add_argument('--built_at', help="set date of built")
    parser.add_argument('--deploy_at', help="set deploy date")
    return parser

app = Flask(__name__)

PORT = 80

def dev_test_script(built_in, deploy_in):
    dev_test = {
        "hello": "world",
        "built_at": built_in,
        "deployed_at": deploy_in
    }
    return dev_test

@app.route("/")
def home():
   return "<h1>Main Page</h1>"

@app.route("/json")
def get_json():
    res = make_response(jsonify(dev_test_script(BUILT_AT,DEPLOY_AT)), 200)
    return res

if __name__ == "__main__":
    parser = argumentsParser()
    args = parser.parse_args()
    # parameters for request
    BUILT_AT = format(args.built_at)
    DEPLOY_AT = format(args.deploy_at)
    print("Server running in port %s"%(PORT))
    app.run(host='0.0.0.0', port=PORT)
