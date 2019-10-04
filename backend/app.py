from flask import Flask, jsonify, request
app = Flask(__name__)


#jobs
@app.route('/create_job', methods=["POST"])
def create_job():
    return "Requested successfully added!"

@app.route('/get_all_job')
def get_all_job():
    import json
    with open('data.json') as json_file:
        data = json.load(json_file)
    return jsonify(data)   

@app.route('/get_job/<user_id>')
def get_job(user_id):
    import json
    with open('data.json') as json_file:
        data = json.load(json_file)
    result = []
    for job in data:
        if job['user']['userID'] == user_id:
            result.append(job)
    return jsonify(result)   


# schedule
@app.route('/create_schedule')
def create_schedule():
    import json
    import requests
    with open('data.json') as json_file:
        data = json.load(json_file)

    postal = "486036 | "
    for job in data:
        postal = postal + job['destination']['postal'] + " | "


    google_api_url = 'https://maps.googleapis.com/maps/api/distancematrix/json?units=kilometers&origins={}&destinations={}&key=AIzaSyCFpvrzkQ-5Qo98lF-tqAotfMDfideK0PE'
    res = requests.get(google_api_url.format(postal, postal))



    return jsonify(res.json())


@app.route('/get_schedule')
def get_schedule():
    import json
    with open('data2.json') as json_file2:
        data2 = json.load(json_file2)

    return jsonify(data2)



if __name__ == '__main__':
    app.run(host='0.0.0.0')
