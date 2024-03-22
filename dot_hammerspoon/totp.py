import argparse
import keyring
import pyotp

# keyring.set_password("rajavel_microsoft_totp", "rajavel_microsoft_totp", "<secret>")
# keyring.set_password("rajavel_authn_totp", "rajavel_authn_totp", "<secret>")

parser = argparse.ArgumentParser()
parser.add_argument("key")
args = parser.parse_args()

secret = keyring.get_password(args.key, args.key)
totp = pyotp.TOTP(secret)
print(totp.now())