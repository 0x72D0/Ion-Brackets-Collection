// MIT-licensed source from:
// https://github.com/neclimdul/hws_openscad_attachments_and_connectors

include <hws_insert_util.scad>

module insert_plug_adv(structure, tolerance = 0, decoration = true)
{
    for (y_pos = [0:len(structure) - 1])
    {
        for (x_pos = [0:len(structure[y_pos]) - 1])
        {
            if (structure[y_pos][x_pos] != 0)
            {
                _draw_insert(structure, x_pos, y_pos, tolerance, decorate = decoration);
            }
        }
    }
}