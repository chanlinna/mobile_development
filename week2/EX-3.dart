class CustomDuration {
  final int _milliseconds;

  CustomDuration.milliseconds(this._milliseconds) : assert(_milliseconds >=0, "Duration cannot be negative");

  CustomDuration.fromHours(int hours): this.milliseconds(hours * 3600 * 1000);
  CustomDuration.fromMinutes(int minutes): this.milliseconds(minutes * 60 * 1000);
  CustomDuration.fromSeconds(int seconds): this.milliseconds(seconds * 1000);

  int get ms => _milliseconds;
  double get hours => _milliseconds / 3600000;
  double get minutes => _milliseconds / 60000;
  double get seconds => _milliseconds / 1000;

  bool operator > (CustomDuration other) => _milliseconds > other._milliseconds;
  CustomDuration operator + (CustomDuration other) => CustomDuration.milliseconds(_milliseconds + other._milliseconds);
  CustomDuration operator - (CustomDuration other){
    if(this > other){
      return (CustomDuration.milliseconds(_milliseconds - other._milliseconds));
    }
    else{
      throw Exception("Duration can not be negative!");
    }
  }

  @override 
  String toString(){
    return '$_milliseconds ms';
  }
}

void main(){
  var d1 = CustomDuration.milliseconds(60000);
  var d2 = CustomDuration.fromHours(2);
  var d3 = CustomDuration.fromMinutes(30);
  var d4 = CustomDuration.fromSeconds(100);

  print((d1+d2+d3+d4).seconds);
  print(d2>d3);
  print(d2-d1);
}
