from colorSample import bcolors



def printHeader(color = bcolors.ENDC):
    print(color + " --- ", end='')


def printBox(color = bcolors.ENDC, marble = ' ', marbleColor = bcolors.ENDC):
    print(color + "| "+ marbleColor + marble + color + " |", end= '')


def printChessBoard(gameboard):
    for j in range(9):
        printHeader(bcolors.OKGREEN)
    print()
    for j in range(9):
        printBox(bcolors.OKGREEN, str(j))
    print()
    for j in range(9):
        printHeader(bcolors.OKGREEN)
    print()
    for i in range(8):
        for j in range(9):
            if j == 0:
                printHeader(bcolors.OKGREEN)
                continue
            if j%2 == 1:
                printHeader(bcolors.OKBLUE)
            else:
                printHeader()
        print()
        printBox(bcolors.OKGREEN, chr(i+97))
        for j in range(8):
            item = gameboard.get((i,j)," ")
            item = str(item)
            if j%2 == 0:
                printBox(bcolors.OKBLUE, item)
            else:
                printBox(marble=item)
        print()
        for j in range(9):
            if j == 0:
                printHeader(bcolors.OKGREEN)
                continue
            if j%2 == 1:
                printHeader(bcolors.OKBLUE)
            else:
                printHeader()
        print()
