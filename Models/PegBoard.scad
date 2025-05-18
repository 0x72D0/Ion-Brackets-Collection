include <../Library/GeneralBracket.scad>

GENERAL_THICKNESS = 5;
BRACKETS_WIDTH = 50;
NUMBER_OF_BRACKET = 2;
PEG_BOARD_WIDTH = 200;
PEG_BOARD_Z = 250;
PEG_BOARD_HOLE_DIAMETER = 4.8;
PEG_BOARD_HOLE_SPACING = 30;
PEG_BOARD_CIRCLE_DEFINITION = 10;

union()
{
    translate([(BRACKETS_WIDTH/2)+(PEG_BOARD_WIDTH/2), 0, PEG_BOARD_Z])
    rotate([90,180,0])
    GeneralBracket(NUMBER_OF_BRACKET, BRACKETS_WIDTH, GENERAL_THICKNESS*3);
    rotate([90,0,0])
    PegBoard(PEG_BOARD_WIDTH,PEG_BOARD_Z,PEG_BOARD_HOLE_DIAMETER,PEG_BOARD_HOLE_SPACING,PEG_BOARD_CIRCLE_DEFINITION,GENERAL_THICKNESS);
}

module PegBoard(width, height, hole_diameter, hole_spacing, circle_definition, thickness)
{
    hole_dim = hole_diameter + hole_spacing;
    number_hole_height = floor(height / hole_dim)-1;
    number_hole_width = floor(width / hole_dim)-1;
    
    hole_height = (number_hole_height*hole_dim);
    hole_width = (number_hole_width*hole_dim);
    
    hole_height_offset = (height - hole_height)/2;
    hole_width_offset = (width - hole_width)/2;
    
    linear_extrude(thickness)
    difference()
    {
        square([width,height]);
        for(hole_y = [0:number_hole_height])
        {
            for(hole_x = [0:number_hole_width])
            {
                translate([hole_width_offset+(hole_dim*hole_x), hole_height_offset+(hole_dim*hole_y)])
                circle(d=hole_diameter, $fn=circle_definition);
            }
        }
    }
    
    
}