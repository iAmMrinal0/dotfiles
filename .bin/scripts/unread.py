import configparser
import imaplib


def main():
    try:
        config = configparser.ConfigParser()
        config.read("/home/warlord/.bin/scripts/mail_config.ini")
        obj = imaplib.IMAP4_SSL("imap.gmail.com", "993")
        obj.login(config["mail"]["mail_id"], config["mail"]["mail_password"])
        obj.select()
        unread = len(obj.search(None, "UnSeen")[1][0].split())
        print(unread)
    except:
        print("0")


if __name__ == '__main__':
    main()
