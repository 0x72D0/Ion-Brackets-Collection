HOLE_HEIGHT = 13;
HOLE_THICKNESS = 7;
WOOD_SLAB_HEIGHT = 27;

function BracketHeight(number_of_bracket) = ((HOLE_HEIGHT + WOOD_SLAB_HEIGHT)*(number_of_bracket))+ HOLE_HEIGHT;

module GeneralBracket(number_of_bracket, width, thickness)
{
    height = BracketHeight(number_of_bracket);
    
    linear_extrude(thickness)
    square([width,height]);
    
    for(i = [0:number_of_bracket-1])
        translate([0,(HOLE_HEIGHT + WOOD_SLAB_HEIGHT)*i, thickness])
        linear_extrude(HOLE_THICKNESS)
        square([width, HOLE_HEIGHT]);
}