include <../Library/GeneralIonHook.scad>

WIDTH = 100;
BASE_HEIGHT = 100;
HOLE_DIAMETER = 10;
HOLE_X_OFFSET = 50;
HOLE_HEIGHT = 50;
THICKNESS = 5;

difference()
{
    GeneralIonHook(BASE_HEIGHT, WIDTH, THICKNESS);
    translate([HOLE_X_OFFSET ,0, HOLE_HEIGHT])
    rotate([90, 0, 0])
    linear_extrude(THICKNESS)
    circle(HOLE_DIAMETER);
}