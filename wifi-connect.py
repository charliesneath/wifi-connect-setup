from flask import Flask, request, jsonify, redirect
from threading import Thread, Event
import queue
import time
import sys
import os
import subprocess

app = Flask(__name__)


def main():
    """Start the wifi-connect application..

    This will create a wifi access point that can be used to set
    the wifi network that the device should connect to.
    """

    print('Starting wifi-connect...')
    subprocess.call([
        'sudo', 'wifi-connect',
        '--portal-ssid', 'rpi-wifi-setup',
        '--portal-passphrase', 'meteorology',])

    # Script continues after wifi connection has been established.
    # NOTE: the wifi-connect process will not continue unless
    # the wifi credentials were correct.
    print('Internet connection established.')
    return True


if __name__ == "__main__":

    try:
        main()
    except KeyboardInterrupt:
        sys.exit(0)
