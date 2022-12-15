//main tab
ArrayList <Flake> mySnowflake; //GLOBAL! EVERYTHING HAS ACCESS TO IT
//int flakeNum = 50;
int spoke = 10;
Flake myFlake;
void setup() {
  size(500, 500);

  mySnowflake = new ArrayList<Flake> ();
  //for (int i = 0; i < flakeNum; i++) {
  //  myFlake = new Flake();
  //  mySnowflake.add(myFlake);
  //}
  myFlake = new Flake();
  mySnowflake.add(myFlake);
}
void draw() {
  background(60);
  //rotate(PI/3);
  translate(width/2, height/2);
  if (!myFlake.ended || !myFlake.stuck) {
    myFlake.move();
  }
  if (myFlake.update()) {
    myFlake = new Flake();
    if (getLastElement().x>=width/2 - getLastElement().fS) {
      noLoop();
    }
    mySnowflake.add(myFlake);
  }
  for (int i = 0; i <spoke; i++)
  {
    rotate(2*PI/spoke);
    showFlakes();
  }
  /*for (Flake f : mySnowflake) {
   f.show();
   }*/
  //System.out.println(mySnowflake.get(mySnowflake.size()-1));
}

Flake getLastElement() {
  int sizeOfSnowflake = mySnowflake.size() - 1;
  Flake lastElement = mySnowflake.get(sizeOfSnowflake);
  return lastElement;
}

void showFlakes() {
  for (Flake f : mySnowflake) {
    f.show();
  }
}


//class tab
/**
 What properties do we need?
 -color: color()
 -x: int
 -y: int
 States
 -stuck: boolean
 -ended: boolean
 What Methods do we need?
 -Move: void
 -Show: void
 */
