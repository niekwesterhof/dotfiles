import os
import re

directories: list = []
files: list = []
extention: list = []
index: int = 1
path = os.getcwd()


def atoi(text):
    return int(text) if text.isdigit() else text


def natural_keys(text):
    """
    alist.sort(key=natural_keys) sorts in human order
    http://nedbatchelder.com/blog/200712/human_sorting.html
    (See Toothy's implementation in the comments)
    """
    return [atoi(c) for c in re.split(r"(\d+)", text)]


def change_name():
    directories = []
    for name in os.listdir():
        if os.path.isdir(name):
            directories.append(name)
    for name in directories:
        index = 1
        files = []
        for filename in os.listdir(os.getcwd() + "/" + name + "/"):
            files.append(filename)
        files.sort(key=natural_keys)
        for check in files:
            if check.startswith(name + " - "):
                x = check.split(name + " - ")
                x = x[1].split(".")
                index = int(x[0])
                index = index + 1
        for check in files:
            if not check.startswith(name + " - "):
                extention = check.split(".")
                os.rename(
                    name + "/" + check,
                    name + "/" + name + " - " + str(index) + "." + extention[1].lower(),
                )
                index = index + 1


os.chdir("/home/niek/Documents/Verbouwing/Foto's/")
change_name()
os.chdir("/home/niek/Documents/Verbouwing/Facturen/")
change_name()
os.chdir(path)
