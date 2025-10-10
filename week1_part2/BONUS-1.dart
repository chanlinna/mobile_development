enum Direction { north, east, south, west }

class Robot {
  int x;
  int y;
  Direction direction;

  Robot(this.x, this.y, this.direction);

  void turnRight() {
    switch (direction) {
      case Direction.north:
        direction = Direction.east;
        break;
      case Direction.east:
        direction = Direction.south;
        break;
      case Direction.south:
        direction = Direction.west;
        break;
      case Direction.west:
        direction = Direction.north;
        break;
    }
  }
  void turnLeft(){
    switch (direction) {
      case Direction.north:
        direction = Direction.west;
        break;
      case Direction.west:
        direction = Direction.south;
        break;
      case Direction.south:
        direction = Direction.east;
        break;
      case Direction.east:
        direction = Direction.north;
        break;
    }
  }
  void advance(){
    switch (direction) {
      case Direction.north:
        y += 1;
        break;
      case Direction.east:
        x += 1;
        break;
      case Direction.south:
        y -= 1;
        break;
      case Direction.west:
        x -= 1;
        break;
    }
  }

  void move(String actions){
    for (var a in actions.split('')){
      if(a == 'R'){
        turnRight();
      }
      else if (a == 'L'){
        turnLeft();
      }
      else if ( a == 'A'){
        advance();
      }
    }
  }

  String get directionName => direction.toString().split('.').last.toUpperCase();

}
 
void main() {
  // Initial position {7, 3} and facing north
  int x = 7;
  int y = 3;
  Direction direction = Direction.north;

  // Example instruction sequence
  const instructions = "RAALAL";

  // Process the instructions and get the final position and direction
  Robot r1 = Robot(x, y, direction);
  r1.move(instructions);

  // Print the final position and direction
  print("Final position:  {${r1.x}, ${r1.y}}");
  print("Facing:  ${r1.directionName}");
}
