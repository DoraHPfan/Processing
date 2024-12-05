class Point
{
  float x;
  float y;
}

int cols;
int rows;
float r = 0;

color[][] img;
ArrayList<Point> points1 = new ArrayList<Point>();
ArrayList<Point> points2 = new ArrayList<Point>();

void setup()
{
  size(800, 800);
  background(0);
  fill(255);
  stroke(255);
  strokeWeight(2);
  cols = width;
  rows = height;
  
  img = new color[cols][rows];
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      img[i][j] = color(0, 0, 0);
    }
  }
  
 
  for(int i = 0; i < 500; i++)
  {
    float t = random(0,2* PI);
    
    if (i<20)
    {
      r = random(20,100);
    }
    else if (i<70)
    {
     r = random(100,200); 
    }
     else if (i<100)
    {
     r = random(200,300); 
    }
    else if (i<200)
    {
     r = random(250,300); 
    }
    else 
    {
     r = random(280,300); 
    }
    
    Point p0 = new Point();
    p0.x = r * cos(t) + width / 2;
    p0.y = r * sin(t) + height / 2;
   
    points1.add(p0);
  }
}


void draw()
{

 for (int i = 0; i < points1.size(); i++) {
   
    float dx = random(-2, 2);
    float dy = random(-2, 2);
    
    
    float distance = dist(points1.get(i).x, points1.get(i).y, 400, 400);
    if (distance > r)
    {
      points1.get(i).x += dx;
      points1.get(i).y += dy;
    }
    else
    {
      points1.get(i).x -= dx;
      points1.get(i).y -= dy;
    }
    
    
    if (points1.get(i).x < 0)
      points1.get(i).x = 0;
    if (width <= points1.get(i).x)
      points1.get(i).x = width - 1;
      
    if (points1.get(i).y < 0)
      points1.get(i).y = 0;
    if (height <= points1.get(i).y)
      points1.get(i).y = height - 1;
    
    
      color temp = img[int(points1.get(i).x)][int(points1.get(i).y)];
      temp = color(red(temp)+14, green(temp) + 10, blue(temp));
      img[int(points1.get(i).x)][int(points1.get(i).y)] = temp;
      stroke(img[int(points1.get(i).x)][int(points1.get(i).y)]);
      point(int(points1.get(i).x), int(points1.get(i).y));

      
    
  }
}
