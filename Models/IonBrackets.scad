include <../Library/GeneralBracket.scad>

BRACKET_WIDTH = 100;
NUMBER_OF_BRACKET = 2;
THICKNESS = 5;

translate([BRACKET_WIDTH, 0, BracketHeight(NUMBER_OF_BRACKET)])
rotate([90,180,0])
GeneralBracket(NUMBER_OF_BRACKET, BRACKET_WIDTH, THICKNESS);