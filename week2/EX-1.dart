enum Skill { FLUTTER, DART, OTHER }

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skill;
  final Address _address;
  int _yearsOfExperience;

  Employee(this._name, this._baseSalary, this._skill, this._address, this._yearsOfExperience);

  //named constructor
  Employee.mobileDeveloper(String name, double baseSalary, Address address, int yearsOfExperience)
                          : this(name, baseSalary, [Skill.FLUTTER, Skill.DART], address, yearsOfExperience);
  Employee.other(String name, double baseSalary, Address address, int yearsOfExperience)
                          : this(name, baseSalary, [Skill.OTHER], address, yearsOfExperience);                      

  //salary computer function
  double computeSalary(){
    double salary = _baseSalary + (_yearsOfExperience * 2000);

    for (var s in _skill){
      switch (s){
        case Skill.FLUTTER:
          salary += 5000;
          break;
        case Skill.DART:
          salary += 3000;
          break;
        case Skill.OTHER:
          salary += 1000;;
          break;
      }
    }
    return salary;
  }

  void printDetails() {
    print('Employee: $_name \nBase Salary: \$${_baseSalary} \nSalary: \$${computeSalary()} \nSkill: ${_skill.map((s)=>s.name)} \nAddress: $_address \nYears of experience: $yearsOfExperience');
  }

  //getter
  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skill => _skill;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;
}

class Address{
  final String street;
  final String city;
  final String zipCode;

  Address(this.street, this.city, this.zipCode);

  @override
  String toString(){
    return '$street, $city, $zipCode';
  }
}

void main() {
  var a1 = Address('6A st', 'Phnom Penh', '123');
  var emp1 = Employee.other('Sokea', 40000, a1, 2);
  emp1.printDetails();

  var emp2 = Employee.mobileDeveloper('Ronan', 45000, a1, 10);
  emp2.printDetails();
}