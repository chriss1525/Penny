#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
from flask import Flask, request
from send_sms import send_sms

app = Flask(__name__)

#TODO: create send messages route
@app.route('/send', methods=['POST'])
def send():
    data = request.get_json()
    message = data['message']
    recipients = data['recipients']
    send_sms(message, recipients).sending()
    # print(message, recipients)
    return "Message sent successfully"


#TODO: create delivery reports route.

if __name__ == "__main__":
    #TODO: Call send message function
    # send_sms().sending()
    
    app.run(debug=True, port = os.getenv('PORT', 5000))

