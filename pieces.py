from piece import Piece

chessCardinals = [(1,0),(0,1),(-1,0),(0,-1)]
chessDiagonals = [(1,1),(-1,1),(1,-1),(-1,-1)]


def knightList(x,y,int1,int2):
    return [(x+int1,y+int2),(x-int1,y+int2),(x+int1,y-int2),(x-int1,y-int2),(x+int2,y+int1),(x-int2,y+int1),(x+int2,y-int1),(x-int2,y-int1)]


def kingList(x,y):
    return [(x+1,y),(x+1,y+1),(x+1,y-1),(x,y+1),(x,y-1),(x-1,y),(x-1,y+1),(x-1,y-1)]


class Knight(Piece):
    def availableMoves(self,x,y,gameboard, Color = None):
        if Color is None : Color = self.Color
        return [(xx,yy) for xx,yy in knightList(x,y,2,1) if self.noConflict(gameboard, Color, xx, yy)]
 

class Rook(Piece):
    def availableMoves(self,x,y,gameboard ,Color = None):
        if Color is None : Color = self.Color
        return self.AdNauseum(x, y, gameboard, Color, chessCardinals)
   

class Bishop(Piece):
    def availableMoves(self,x,y,gameboard, Color = None):
        if Color is None : Color = self.Color
        return self.AdNauseum(x, y, gameboard, Color, chessDiagonals)
 

class Queen(Piece):
    def availableMoves(self,x,y,gameboard, Color = None):
        if Color is None : Color = self.Color
        return self.AdNauseum(x, y, gameboard, Color, chessCardinals+chessDiagonals)
   

class King(Piece):
    def availableMoves(self,x,y,gameboard, Color = None):
        if Color is None : Color = self.Color
        return [(xx,yy) for xx,yy in kingList(x,y) if self.noConflict(gameboard, Color, xx, yy)]
    

class Pawn(Piece):
    def __init__(self,color,name,direction):
        self.name = name
        self.Color = color
        self.direction = direction

    def availableMoves(self,x,y,gameboard, Color = None):
        if Color is None : Color = self.Color
        answers = []
        if (x+1,y+self.direction) in gameboard and self.noConflict(gameboard, Color, x+1, y+self.direction) : answers.append((x+1,y+self.direction))
        if (x-1,y+self.direction) in gameboard and self.noConflict(gameboard, Color, x-1, y+self.direction) : answers.append((x-1,y+self.direction))
        if (x,y+self.direction) not in gameboard and Color == self.Color : answers.append((x,y+self.direction))
        return answers
