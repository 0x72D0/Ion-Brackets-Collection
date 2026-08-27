use <../Library/hws_openscad_attachments_and_connectors.scad>
include <../Library/GeneralIonHook.scad>

/* [Hook Parameters] */
WIDTH = 50;
BASE_HEIGHT = 100;
THICKNESS = 5;

/* [Honeycomb Wall Storage Connector] */
HWS_CONNECTOR_TOLERANCE = 0;
HWS_CONNECTOR_OVERLAP = 0.5;
CONNECTOR_HEIGHT = BASE_HEIGHT * 0.25;

// The front plate of GeneralIonHook occupies y = -THICKNESS..0.  The HWS
// connector is anchored near its front face with a small overlap so changing
// THICKNESS does not consume the connector's usable length inside the plate.
// Its insertion axis is +Z, so -90 degrees around X points it toward +Y while
// leaving the hook opening clear.
CONNECTOR_X = WIDTH / 2;
CONNECTOR_Y = -min(THICKNESS, HWS_CONNECTOR_OVERLAP);
CONNECTOR_Z = CONNECTOR_HEIGHT;

module hook_body()
{
    GeneralIonHook(BASE_HEIGHT, WIDTH, THICKNESS);
}

module honeycomb_wall_connector()
{
    translate([ CONNECTOR_X, CONNECTOR_Y, CONNECTOR_Z ])
    rotate([ -90, 0, 0 ])
    insert_plug_adv([[1]], tolerance = HWS_CONNECTOR_TOLERANCE, decoration = false);
}

union()
{
    hook_body();
    honeycomb_wall_connector();
}
