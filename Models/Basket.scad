include <../Library/GeneralBracket.scad>

GENERAL_THICKNESS = 5;
GENERAL_WIDTH = 150;
GENERAL_HEIGHT = 250;
BASKET_Z = 50;
NUMBER_OF_BRACKET = 3;

union()
{
    translate([GENERAL_WIDTH, 0, BracketHeight(NUMBER_OF_BRACKET)])
    rotate([90,180,0])
    GeneralBracket(NUMBER_OF_BRACKET, GENERAL_WIDTH, GENERAL_THICKNESS);
    linear_extrude(GENERAL_THICKNESS)
    square([GENERAL_WIDTH, GENERAL_HEIGHT]);
    translate([0, GENERAL_HEIGHT, GENERAL_THICKNESS])
    rotate([90, 0, 0])
    linear_extrude(GENERAL_THICKNESS)
    square([GENERAL_WIDTH, BASKET_Z]);
    translate([0, 0, GENERAL_THICKNESS])
    rotate([90, 0, 90])
    linear_extrude(GENERAL_THICKNESS)
    square([GENERAL_HEIGHT, BASKET_Z]);
    translate([GENERAL_WIDTH-GENERAL_THICKNESS, 0, GENERAL_THICKNESS])
    rotate([90, 0, 90])
    linear_extrude(GENERAL_THICKNESS)
    square([GENERAL_HEIGHT, BASKET_Z]);
    translate([0,0,BASKET_Z+GENERAL_THICKNESS])
    rotate([90, 0, 90])
    linear_extrude(GENERAL_THICKNESS)
    polygon([[0,0],[0,BracketHeight(NUMBER_OF_BRACKET)-BASKET_Z-GENERAL_THICKNESS],[GENERAL_HEIGHT,0]]);
    translate([GENERAL_WIDTH-GENERAL_THICKNESS,0,BASKET_Z+GENERAL_THICKNESS])
    rotate([90, 0, 90])
    linear_extrude(GENERAL_THICKNESS)
    polygon([[0,0],[0,BracketHeight(NUMBER_OF_BRACKET)-BASKET_Z-GENERAL_THICKNESS],[GENERAL_HEIGHT,0]]);
}