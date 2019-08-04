
import os
import logging
from dotenv import load_dotenv
load_dotenv()
logging.basicConfig(format='%(asctime)s %(message)s',
                    filename='hello.log', level=logging.INFO)

if os.getenv("BUILD") == "debug":
    debug = True
else:
    debug = False

hello = "Hello World!"

if debug:
    logging.info("Debug environment started")
    hello = "debug: " + hello
else:
    logging.info("Release environment started")

print(hello)
logging.info("Printed the message")

if os.getenv("PASSWORD") is not None:
    print("Using the password acquired from os.getenv('PASSWORD')")
    logging.info("The password was aquired")
