from flask import Flask, send_file
from pymongo import MongoClient
from bson.json_util import dumps

app = Flask(__name__)

client = MongoClient('mongo',27017,connect=False)
db = client.ghc #database connector


#--mongo
@app.route("/productdata", methods=['GET'])
def list_shopping():
    my_list = []
    collection=db['product']
    cursor = collection.find({})
    for document in cursor:
        print(document)    
        my_list.append(document)
    return dumps(my_list)

@app.route("/productdata/<int:num>", methods=['GET'])
def shopping_num(num):
    my_list = []
    collection=db['product']
    cursor = collection.find({})
    for document in cursor:
        if document['num'] == str(num):
            print(document)    
            my_list.append(document)
    return dumps(my_list)


@app.route("/")
def main():
    return send_file('./static/index.html')

if __name__ == "__main__":
    app.run(host='0.0.0.0', debug=True,port=80)
