/// @desc Draw Application Surface

surface_resize(application_surface, Width*Scaling, Height*Scaling);

if ( DrawApplicationSurface and application_surface_is_enabled() )   { application_surface_draw_enable(false) }
if ( !DrawApplicationSurface and !application_surface_is_enabled() ) {	application_surface_draw_enable(true) };

if ( DrawApplicationSurface ) {	_drawApplicationSurface(0, 0, Width, Height, Scaling); };