import subprocess


def text_split(text):
    new_text = text.split()
    new_text_len = len(new_text)
    if new_text_len < 2:
        return new_text[0]
    elif new_text_len == 2:
        return text
    else:
        return " ".join(new_text[0:2]) + "..."

def main():
    st = subprocess.getoutput("mpc")
    lin = st.split("\n")
    if len(lin) > 1:
        sn_status = lin[1]
        duration = lin[1].split()
        if "paused" in sn_status:
            print(lin[0].split("-")[-1] + " [paused]")
        elif "playing" in sn_status:
            print(lin[0].split("-")[-1] + "   " + duration[2])
        else:
            print("stopped")
    else:
        title = subprocess.getoutput("spotify-now -i %title -p 'paused' -e stopped")
        if title == "paused" or title == "stopped":
            print(title)
        elif title == "":
            print("empty")
        else:
            artist = subprocess.getoutput("spotify-now -i '%artist'")
            new_title = text_split(title)
            new_artist = text_split(artist)
            print(new_title + ' - ' + new_artist)


if __name__ == "__main__":
    main()
