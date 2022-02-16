import sys
import requests
from JSONLibrary import JSONLibrary
from requests.auth import HTTPBasicAuth


class APILibrary(object):
    curdir = sys.path[0]

    def get_users(self, base_url):
        try:
            request_headers = {'Token': 'MzMyNjQyMzAzODMwNjk1Mzg1MDU4OTA3MTEyMDM3MTQ2NDg5Mzg2',
                               'Content-Type': 'application/json'}
            response = requests.get(base_url, headers=request_headers)
            response.raise_for_status()
        except requests.exceptions.HTTPError as err:
            raise AssertionError(
                "Expected GET {0} request to succeed with code: {1} but it was: {2}. \n\nDetails for reason: {3}".format(
                    base_url, requests.codes.ok, err, response.content))
        return response

    def register_user(self, base_url, rnum):
        try:
            data_post = JSONLibrary().load_json_from_file(self.curdir + '/user_data.json')
            data_post_obj = JSONLibrary().update_value_to_json(data_post, '$.username', rnum)
            response = requests.post(base_url, json=data_post_obj)
            response.raise_for_status()
        except requests.exceptions.HTTPError as err:
            raise AssertionError(
                "Expected POST {0} request to succeed with code: {1} but it was: {2}. \n\nDetails for reason: {3}".format(
                    base_url, requests.codes.ok, err, response.content))
        return response

    def get_personal_info_of_users(self, base_url, token):
        try:
            request_headers = {'Token': token,
                               'Content-Type': 'application/json'}
            response = requests.get(base_url, headers=request_headers)
            response.raise_for_status()
        except requests.exceptions.HTTPError as err:
            raise AssertionError(
                "Expected GET {0} request to succeed with code: {1} but it was: {2}. \n\nDetails for reason: {3}".format(
                    base_url, requests.codes.ok, err, response.content))
        return response

    def authenticate_user(self, url, username):
        try:
            data_post = JSONLibrary().load_json_from_file(self.curdir + '/user_data.json')
            password = JSONLibrary().get_value_from_json(data_post, '$.password')
            response = requests.get(url, auth=HTTPBasicAuth(username, password[0]))
            token = JSONLibrary().get_value_from_json(response.json(), '$.token')
            response.raise_for_status()
        except requests.exceptions.HTTPError as err:
            raise AssertionError(
                "Expected GET {0} request to succeed with code: {1} but it was: {2}. \n\nDetails for reason: {3}".format(
                    url, requests.codes.ok, err, response.content))
        return token

    def update_personal_info_of_a_user(self, base_url, token):
        try:
            request_headers = {'Token': token,
                               'Content-Type': 'application/json'}
            data_post = JSONLibrary().load_json_from_file(self.curdir + '/update_data.json')
            response = requests.put(base_url, json=data_post, headers=request_headers)
            response.raise_for_status()
        except requests.exceptions.HTTPError as err:
            raise AssertionError(
                "Expected PUT {0} request to succeed with code: {1} but it was: {2}. \n\nDetails for reason: {3}".format(
                    base_url, requests.codes.ok, err, response.content))
        return response
