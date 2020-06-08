import 'dart:math';

class Bicycle {
  int cadence;
  int _speed = 0;
  int gear;

  Bicycle(this.cadence, this.gear);

  @override
  String toString() => 'Bicycle: $_speed mph';

  int get speed => _speed;

  void applyBrake(int decrement) {
    _speed -= decrement;
  }

  void speedUp(int increment) {
    _speed += increment;
  }
}

class Point {
  final int x;
  final int y;
  const Point(this.x, this.y);
}

class Rectangle {
  Point origin;
  int width;
  int height;
  Rectangle({this.origin = const Point(0, 0), this.width = 0, this.height = 0});

  @override
  String toString() =>
      'Origin: (${origin.x}, ${origin.y}), width: $width, height: $height';
}

abstract class Shape {
  factory Shape(String type) {
    if (type == 'circle') return Circle(2);
    if (type == 'square') return Square(2);
    throw 'Can\'t create $type.';
  }
  num get area;
}

class Circle implements Shape {
  final num radius;
  Circle(this.radius);
  num get area => pi * pow(radius, 2);
}

class Square implements Shape {
  final num side;
  Square(this.side);
  num get area => pow(side, 2);
}

class CircleMock implements Circle {
  num area;
  num radius;
}

String scream(int length) => "A${'a' * length}h!";

main(List<String> args) {
  var bike = Bicycle(2, 1);
  bike.speedUp(12);
  print(bike);
  print("\n\n--------------------------------\n\n");
  print(Rectangle(origin: const Point(10, 20), width: 100, height: 200));
  print(Rectangle(origin: const Point(10, 10)));
  print(Rectangle(width: 200));
  print(Rectangle());
  print("\n\n--------------------------------\n\n");
  final circle = Shape('circle');
  final square = Shape('square');
  print(circle.area);
  print(square.area);
  print("\n\n--------------------------------\n\n");
  final values = [1, 2, 3, 5, 10, 50];
  print(values.map(scream));
  values.map(scream).forEach(print);
  values.skip(1).take(3).map(scream).forEach(print);
}
