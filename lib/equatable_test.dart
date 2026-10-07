import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class EquatableTest extends StatefulWidget {
  const EquatableTest({super.key});

  @override
  State<EquatableTest> createState() => _EquatableTestState();
}

class _EquatableTestState extends State<EquatableTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Person person=Person(name: 'Zaib', age: 23);
          Person person1=Person(name: 'Zaib', age: 23);

           print(person.hashCode.toString());
            print(person1.hashCode.toString());

          // print(person1==person);
          print(person==person1);

        }
        ),
    );
  }
}


class Person  extends Equatable{
  final String name;
  final int age;
  
  const Person({required this.name, required this.age});

  @override
  // TODO: implement props
  List<Object?> get props => [name, age];


//after downloade the package of the equatable we will not write this code otherwise we will write this code
  // @override
  // bool operator ==(Object other) =>
  // identical(this, other) ||
  // other is Person &&
  // runtimeType == other.runtimeType &&
  // name == other.name &&
  // age == other.age;

  // @override
  // int get hashCode=>name.hashCode ^ age.hashCode;
  
    
}