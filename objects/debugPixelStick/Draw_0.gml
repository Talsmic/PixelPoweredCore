var colour = true;

if ( !DrawMode ) {
	for ( var i=0; i<=Height; i+= PixelHeight ) {
		for ( var j=0; j<=Width; j+= PixelWidth ) {
			colour = _toggle(colour);
			drawPlane(x+j*PixelWidth,y+i*PixelHeight,PixelWidth,PixelHeight,Colour[colour],Alpha);
			};
		};
	};