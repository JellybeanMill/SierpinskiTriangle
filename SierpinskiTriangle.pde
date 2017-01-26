int startX = 256;
int startY = 44;
int startlen = 512;
int startRed=255;
int startGreen=255;
int startBlue=255;
double diviConstant = 2.0;
double varyConstant = 2.0;
//ArrayList<Triangle> arraylist = new ArrayList<Triangle>();
public void setup()
{
	noStroke();
	size(1000,600);
}
public void draw()
{
	background(0);
	diviConstant = (mouseX/250)+2.0;
	varyConstant = (mouseY/6.0)+10;
	fill(255+varyGen(),255+varyGen(),255+varyGen());
	triangle(startX,startY+startlen,startX+(startlen/2),startY,startX+startlen,startY+startlen);
	sierpinski(startX,startY,startlen,startRed,startGreen,startBlue);
}
public void sierpinski(int x, int y, int len, float cRed, float cGreen, float cBlue) 
{
	if(len>=4)
	{
		int myXA = (int)(x+(len/4.0));
		int myXB = x;
		int myXC = (int)(x+(len/2.0));
		int myYA = y;
		int myYB = (int)(y+(len/2.0));
		int myYC = (int)(y+(len/2.0));
		int mylen = (int)(len/2);
		float myRed = (float)(cRed/diviConstant);
		float myGreen = (float)(cGreen/diviConstant);
		float myBlue = (float)(cGreen/diviConstant);
		//red triangle
		fill(myRed+varyGen(),cGreen+varyGen(),cBlue+varyGen());
		triangle(myXA,myYA+mylen,myXA+(mylen/2),myYA,myXA+mylen,myYA+mylen);
		sierpinski(myXA,myYA,mylen,myRed,cGreen,cBlue);
		//green triangle
		fill(cRed+varyGen(),myGreen+varyGen(),cBlue+varyGen());
		triangle(myXB,myYB+mylen,myXB+(mylen/2),myYB,myXB+mylen,myYB+mylen);
		sierpinski(myXB,myYB,mylen,cRed,myGreen,cBlue);
		//blue triangle
		fill(cRed+varyGen(),cGreen+varyGen(),myBlue+varyGen());
		triangle(myXC,myYC+mylen,myXC+(mylen/2),myYC,myXC+mylen,myYC+mylen);
		sierpinski(myXC,myYC,mylen,cRed,cGreen,myBlue);
	}
}
public int varyGen()
{
	return (int)((Math.random()*varyConstant)-varyConstant/2.0);
}
/*
class Triangle
{
	private int myX,myY,myLength,myRed,myGreen,myBlue;
	Triangle(int inputX,int inputY,int inputlength,int inputRed, int inputGreen, int inputBlue)
	{
		myX = inputX;
		myY = inputY;
		myLength = inputlength;
		myRed = inputRed;
		myGreen = inputGreen;
		myBlue = inputBlue;
	}
	public void show()
	{

		triangle(x1, y1, x2, y2, x3, y3);
	}
}*/