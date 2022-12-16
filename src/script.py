import os
import sys
from datetime import datetime, timedelta

import pyotp
import pyperclip
from dotenv import load_dotenv


def main(copy=False):
    try:
        seconds = int(sys.argv[1])
    except (ValueError, IndexError):
        seconds = 0

    load_dotenv()
    otp = pyotp.TOTP(os.getenv("OTP_SECRET")).at(
        datetime.now() + timedelta(seconds=seconds)
    )

    print(otp)
    if copy:
        pyperclip.copy(otp)


if __name__ == "__main__":
    main()
