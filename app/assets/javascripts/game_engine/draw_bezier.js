function drawBezier(img, context, points, max_t) {
	
	context.lineWidth = 0.5;
	context.strokeStyle = "red";
	
	// Begin new path
	context.beginPath();
	context.moveTo(points[0].x, points[0].y);
	var x,y;
	// Draw spline segemnts	
	for (var t = 0.01; t <= max_t; t += 0.01) {
		x = Math.pow(1 - t, 3) * points[0].x + 
			3 * t * Math.pow(1 - t, 2) * points[1].x +
			3 * Math.pow(t, 2) * (1 - t) * points[2].x +
			Math.pow(t, 3) * points[3].x;
		y = Math.pow(1 - t, 3) * points[0].y + 
			3 * t * Math.pow(1 - t, 2) * points[1].y +
			3 * Math.pow(t, 2) * (1 - t) * points[2].y +
			Math.pow(t, 3) * points[3].y;
			
		//context.lineTo(x,y);			
	}
	context.drawImage(img,x-(img.width/2),y-(img.height/2));
	// Stroke path
	context.stroke();
}