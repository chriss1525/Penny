#!/usr/bin/env python
# -*- coding: utf-8 -*-

import africastalking
import secret

# TODO: Initialize Africa's Talking

africastalking.initialize(
    username= secret.USERNAME,
    api_key= secret.API_KEY
)

# sms = africastalking.SMS

class send_sms():

    def __init__(self, message, recipients):
        self.message = message
        self.recipients = recipients

    sms = africastalking.SMS

    # def send(self):
        
        #TODO: Send message
    def sending(self):
        try:
            response = self.sms.send(self.message, self.recipients)
            print (response)
        except Exception as e:
            print (f'Houston, we have a problem: {e}') 
