import itertools
from staticChessBoard import printChessBoard
from colorSample import bcolors
from pieces import *



WHITE = "white"
BLACK = "black"


class Game:
    def __init__(self):
        self.playersturn = BLACK
        self.message = "\nLets start the game, white moves first"
        self.gameboard = {}
        self.placePieces()
        print("\n\n###################################")
        print("|                                 |")
        print("|                                 |")
        print("|          Chess Program          |")
        print("|                                 |")
        print("|                                 |")
        print("###################################\n\n")
        self.main()
        
    def placePieces(self):
        for i in range(0,8):
            self.gameboard[(i,1)] = Pawn(WHITE,uniDict[WHITE][Pawn],1)
            self.gameboard[(i,6)] = Pawn(BLACK,uniDict[BLACK][Pawn],-1)
        placers = [Rook,Knight,Bishop,Queen,King,Bishop,Knight,Rook]
        for i in range(0,8):
            self.gameboard[(i,0)] = placers[i](WHITE,uniDict[WHITE][placers[i]])
            self.gameboard[((7-i),7)] = placers[i](BLACK,uniDict[BLACK][placers[i]])
        placers.reverse()
        
    def main(self):
        while True:
            self.printBoard()
            print()
            print(bcolors.WARNING + bcolors.BOLD + self.message + bcolors.ENDC)
            if "player won" in self.message:
                break
            print("(Enter the moves like this: a2 b7) ", end="")
            self.message = ""
            startpos,endpos = self.parseInput()
            try:
                target = self.gameboard[startpos]
            except:
                self.message = "> Could not find piece; index probably out of range"
                target = None    
            if target:
                if target.Color != self.playersturn:
                    self.message = "> You aren't allowed to move that piece this turn"
                    continue
                if target.isValid(startpos,endpos,target.Color,self.gameboard):
                    self.message = "> Next players turn"
                    self.gameboard[endpos] = self.gameboard[startpos]
                    del self.gameboard[startpos]
                    self.isCheck()
                    if self.playersturn == BLACK:
                        self.playersturn = WHITE
                    else : self.playersturn = BLACK
                else : 
                    self.message = "> Invalid move"
                    self.message = self.message + " | Avilable Moves " + str(target.availableMoves(startpos[0],startpos[1],self.gameboard))
            else : self.message = "> There is no piece in that space"
        print("Thank you.")
                    
    def isCheck(self):
        king = King
        kingDict = {}
        pieceDict = {BLACK : [], WHITE : []}
        for position,piece in self.gameboard.items():
            if type(piece) == King:
                kingDict[piece.Color] = position
            pieceDict[piece.Color].append((piece,position))
        if not WHITE in kingDict:
            self.message = "> White player won"
            return
        if not BLACK in kingDict:
            self.message = "> Black player won"
            return
        if self.canSeeKing(kingDict[WHITE],pieceDict[BLACK]):
            self.message = "> Black player is in check"
        if self.canSeeKing(kingDict[BLACK],pieceDict[WHITE]):
            self.message = "> White player is in check"
          
    def canSeeKing(self,kingpos,piecelist):
        for piece,position in piecelist:
            if piece.isValid(position,kingpos,piece.Color,self.gameboard):
                return True
                
    def parseInput(self):
        try:
            a,b = input("> ").split()
            a = ((ord(a[0])-97), int(a[1])-1)
            b = (ord(b[0])-97, int(b[1])-1)
            print(a,b)
            return (a,b)
        except:
            print(bcolors.FAIL + "> error decoding input. please try again" + bcolors.ENDC)
            return((-1,-1),(-1,-1))
        
    def printBoard(self):
        printChessBoard(self.gameboard)
                   


uniDict = {WHITE : {Pawn : "♙", Rook : "♖", Knight : "♘", Bishop : "♗", King : "♔", Queen : "♕" }, BLACK : {Pawn : "♟", Rook : "♜", Knight : "♞", Bishop : "♝", King : "♚", Queen : "♛" }}
 
if __name__ == "__main__":       
    Game()
