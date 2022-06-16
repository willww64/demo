import os
import signal
import sys
from time import sleep


def terminate(sig, frame):
    sys.exit()


if __name__ == "__main__":
    if os.getenv("HANDLE_SIGTERM") == "true":
        signal.signal(signal.SIGTERM, terminate)
    while True:
        sleep(1)
