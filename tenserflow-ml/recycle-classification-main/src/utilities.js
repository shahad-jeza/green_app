export const drawRect = (detections, ctx) =>{
    detections.forEach(prediction=>{
        // Get prediction results
        const [x, y, width, height] = prediction['bbox'];
        const obj_class = prediction['class'];
        var text = obj_class+' - not recyclable';
        var color = 'red';

        // List of recycle item
        const recycle = ['kite', 'skateboard', 'surfboard', 'tennis racket', 'bottle', 'wine glass', 'cup',
                        'dining table', 'tv', 'laptop', 'mouse', 'remote', 'keyboard', 'cell phone', 
                        'microwave', 'oven', 'toaster', 'book'];

        if (recycle.includes(obj_class)){
            text = obj_class+' - recyclable';
            color = 'green';
        }
        
        

        // Set styling 
        
        ctx.strokeStyle = color
        ctx.font = '40px Arial'
        ctx.fillStyle = color


        // Draw rectangles and text
        ctx.beginPath()
        ctx.fillText(text, x, y)
        ctx.rect(x, y, width, height)
        ctx.stroke()
    })
}