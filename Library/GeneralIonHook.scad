BORDER_HEIGTH = 100;
LEDGE_HEIGHT = 100;

module GeneralIonHook(baseHeight, width, thickness)
{
    union()
    {
        translate([0, -(BORDER_HEIGTH+(thickness)), baseHeight-(LEDGE_HEIGHT+thickness)])
        rotate([90,0,0])
        linear_extrude(thickness)
        square([width, LEDGE_HEIGHT+thickness]);
        translate([0, -(BORDER_HEIGTH+(thickness)), baseHeight-thickness])
        linear_extrude(thickness)
        square([width, BORDER_HEIGTH]);
        rotate([90,0,0])
        linear_extrude(thickness)
        square([width, baseHeight]);
    }
}