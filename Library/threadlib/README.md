# Vendored threadlib dependencies

This directory contains the OpenSCAD threadlib implementation and its required
dependencies so the models can be opened without a separate global library
installation.

- threadlib: https://github.com/adrianschlatter/threadlib
- thread profile: https://github.com/MisterHW/IoP-satellite/tree/master/OpenSCAD%20bottle%20threads
- scad-utils: https://github.com/openscad/scad-utils
- list-comprehension-demos: https://github.com/openscad/list-comprehension-demos

The models use the standard threadlib API: `tap("M8", ...)` for the internal
thread and `bolt("M8", ...)` for the matching external thread.