import os

import pyotp
import pyperclip


def main():
    otp = pyotp.TOTP(os.getenv("OTP_SECRET")).now()

    print(otp)
    pyperclip.copy(otp)


if __name__ == "__main__":
    main()
