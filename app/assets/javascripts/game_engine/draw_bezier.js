function drawBezier(img, context, points, max) {
	var x,y;

	context.moveTo(points[0].x, points[0].y);
	
	x = Math.pow(1 - max, 3) * points[0].x + 
		3 * max * Math.pow(1 - max, 2) * points[1].x +
		3 * Math.pow(max, 2) * (1 - max) * points[2].x +
		Math.pow(max, 3) * points[3].x;

	y = Math.pow(1 - max, 3) * points[0].y + 
		3 * max * Math.pow(1 - max, 2) * points[1].y +
		3 * Math.pow(max, 2) * (1 - max) * points[2].y +
		Math.pow(max, 3) * points[3].y;
			
	context.drawImage(img,x-(img.width/2),y-(img.height/2));
}