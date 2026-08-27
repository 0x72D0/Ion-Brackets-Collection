// Named parts keep the hook's individual shapes identifiable in the OpenSCAD
// preview tree.
use <threadlib/threadlib.scad>

BORDER_HEIGTH = 100;
LEDGE_HEIGHT = 100;

module back_ledge(
    baseHeight,
    width,
    thickness,
    thread_designator = "M8",
    thread_turns = 4,
    thread_lead_in = 0.25,
    thread_fn = 48
)
{
    // Force the threaded subtraction to display as finished geometry in F5
    // preview instead of showing the complex negative cutter in green.
    render(convexity = 10)
    difference()
    {
        union()
        {
            translate([0, -(BORDER_HEIGTH+(thickness)), baseHeight-(LEDGE_HEIGHT+thickness)])
            rotate([90,0,0])
            linear_extrude(thickness)
            square([width, LEDGE_HEIGHT+thickness]);
        }

        // The back ledge is a vertical plate. The hole starts on the
        // hook-facing side and runs through the ledge toward the rear.
        translate([
            width / 2,
            -(BORDER_HEIGTH + thickness - thread_lead_in),
            baseHeight - ((LEDGE_HEIGHT + thickness) / 2)
        ])
        rotate([90,0,0])
        tap(
            thread_designator,
            turns = thread_turns,
            fn = thread_fn
        );
    }
}

module back_border(baseHeight, width, thickness)
{
    translate([0, -(BORDER_HEIGTH+(thickness)), baseHeight-thickness])
    linear_extrude(thickness)
    square([width, BORDER_HEIGTH]);
}

module front_plate(baseHeight, width, thickness)
{
    rotate([90,0,0])
    linear_extrude(thickness)
    square([width, baseHeight]);
}

module GeneralIonHook(
    baseHeight,
    width,
    thickness,
    thread_designator = "M8",
    thread_turns = 4,
    thread_lead_in = 0.25,
    thread_fn = 48
)
{
    union()
    {
        back_ledge(
            baseHeight,
            width,
            thickness,
            thread_designator,
            thread_turns,
            thread_lead_in,
            thread_fn
        );
        back_border(baseHeight, width, thickness);
        front_plate(baseHeight, width, thickness);
    }
}