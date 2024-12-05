class Point
{
  float x;
  float y;
}

int cols;
int rows;

color[][] img;
ArrayList<Point> points1 = new ArrayList<Point>();

void setup()
{
  size(800, 800);
  background(0);
  fill(255);
  strokeWeight(2);
  cols = width;
  rows = height;
  
  img = new color[cols][rows];
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      img[i][j] = color(0, 0, 0);
    }
  }
  
  // Equiangular spirál paraméterek
  float a = 50;  // Kezdősugár
  float b = 0.15; // Növekedési tényező
  
  // Pontok generálása a spirál mentén
  for (int i = 0; i < 500; i++) {
    float theta = random(0, 4 * PI); // Szög (nagyobb tartomány a több fordulathoz)
    float r = a * exp(b * theta);    // Sugár kiszámítása
    
    // Polárkoordináták átváltása Descartes-koordinátákra
    float x = r * cos(theta);
    float y = r * sin(theta);
    
    Point p0 = new Point();
    p0.x = x + width / 2; // Középre helyezés
    p0.y = y + height / 2; // Középre helyezés
   
    points1.add(p0);
  }
}

void draw()
{
  // Pontok frissítése és rajzolása
  for (int i = 0; i < points1.size(); i++) {
    float dx = random(-2, 2);
    float dy = random(-2, 2);
    
    Point p = points1.get(i);
    p.x = constrain(p.x + dx, 0, width - 1);
    p.y = constrain(p.y + dy, 0, height - 1);
    
    // Színek frissítése és rajzolás
    color temp = img[int(p.x)][int(p.y)];
    temp = color(red(temp) + 14, green(temp) + 10, blue(temp));
    img[int(p.x)][int(p.y)] = temp;
    stroke(img[int(p.x)][int(p.y)]);
    point(int(p.x), int(p.y));
  }
}
