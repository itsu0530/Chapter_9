
//line parameters
float linexa,linexb;
float lineLength;
float lineCenterA,lineCenterB;
float lineSpeed;
boolean aU,aD,bU,bD,startG;
//ball parameters
float ballX,ballY;
float BallSpeedX,BallSpeedY;
float BallSize;



void setup() {

	size(900,900);
	frameRate(150);
	background(255);
	fill(0);
	textSize(20);
	textAlign(CENTER);
	
	//line 
	strokeWeight(4);
	linexa =30;
	linexb =870;
	lineLength = 70;
	lineCenterA= 450;
	lineCenterB= 450; 
	line(linexa, lineCenterA+lineLength/2, linexa, lineCenterA-lineLength/2);
	line(linexb, lineCenterB+lineLength/2, linexb, lineCenterB-lineLength/2);
	
	//ball
	BallSpeedX =random(2, 3);
	BallSpeedY =random(-3, 3);
	
	BallSize= 16;
	ballX = width/2;
	ballY = height/2;
	ellipse(ballX, ballY, BallSize, BallSize);

	noLoop();

}


void draw() {		

	background(255);
	if(ballX == width/2 && ballY == height/2){
		textSize(50);
		text("push G",450,200);
	}
	lineMove();
	Ballmove();
	Judge();
}
	


 void keyPressed() {
	if(key=='w')	 aU = true;	
	if(key=='s')	 aD = true;	
	if(keyCode==UP)	 bU = true;	
	if(keyCode==DOWN)bD = true;	
	if(key=='g')	 loop();
}
void keyReleased() {
	if(key=='w')     aU = false;	
	if(key=='s')     aD = false;	
	if(keyCode==UP)  bU = false;	
	if(keyCode==DOWN)bD = false;
}


void lineMove(){

	lineSpeed=4;
	
	if(aU)lineCenterA-=lineSpeed;
	if(aD)lineCenterA+=lineSpeed;
	if(bU)lineCenterB-=lineSpeed;
	if(bD)lineCenterB+=lineSpeed;
	
	line(linexa, lineCenterA+lineLength/2, linexa, lineCenterA-lineLength/2);
	line(linexb, lineCenterB+lineLength/2, linexb, lineCenterB-lineLength/2);
}


void Ballmove(){

	ellipseMode(CENTER);
	ballX+=BallSpeedX;
	ballY+=BallSpeedY;
	float SpeedError = random(-1,1);

	if(ballY<BallSize || ballY>height-BallSize){
		BallSpeedY*= -1;
		BallSpeedX*=1.05;
	}
	ellipse(ballX, ballY,BallSize ,BallSize );

	if(ballX<=linexa && ballX>=linexa-BallSize){
		if(ballY<lineCenterA+lineLength/2 &&ballY>=lineCenterA-lineLength/2){
		BallSpeedX*= -1;
		BallSpeedY+=SpeedError;
		
		}
	}
	if(ballX>=linexb && ballX<=linexb+BallSize){
		if(ballY<=lineCenterB+lineLength/2 && ballY>=lineCenterB-lineLength/2){
		BallSpeedX*= -1;
		BallSpeedY+=SpeedError;
		}

	}
}

void Judge(){
	if(ballX<BallSize){
		background(255);
		fill(255,0,0);
		noStroke();
		rect(17,0,3,height);
		textSize(40);
		
		text("Finished",width/2,height/2);
		fill(0);
		text("WIN",830,height/2);
		noLoop();

	}
		if(ballX>width-BallSize){
		background(255);
		fill(255,0,0);
		noStroke();
		rect(880,0,3,height);
		textSize(40);
		text("Finished",width/2,height/2);
		fill(0);
		text("WIN",70,height/2);
		noLoop();
	}
}

