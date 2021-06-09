import os


print("Current Working Directory " , os.getcwd())


# for mac os.chdir("/home/varun/temp")
# for windows os.chdir('C:\\Users\\anan4615\\Documents\\UNIX\\')
def search(filename, txt):
        data = []

        with open(filename) as f:
            f=f.readlines()
            for line in f:
                if txt in line:
                    data.append(line)
        return data