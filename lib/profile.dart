import 'package:flutter/material.dart';
import 'dart:math';
import 'barcode_page.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RandomGymID randomGymID = RandomGymID();
    int generatedGymID = randomGymID.generateRandomNumber();
    return MaterialApp(
      title: 'Profile',
      home: Scaffold(
        appBar: AppBar(title: Text('Home')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text('Personal information'),
            SizedBox(height: 20),
            ClientName('John'),
            ClientSurname('Johnes'),
            ClientGymID(generatedGymID),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Password: ********'),
            ),
          ],
        ),
      ),
    );
  }
}

class ClientName extends StatelessWidget {
  final String name;

  const ClientName(this.name);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('Name: $name'),
    );
  }
}

class ClientSurname extends StatelessWidget {
  final String surname;

  const ClientSurname(this.surname);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('Surname: $surname'),
    );
  }
}

class ClientGymID extends StatelessWidget {
  final int gymID;

  const ClientGymID(this.gymID);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('GymID: $gymID'),
    );
  }
}

class RandomGymID {
  Random _random = Random();

  int generateRandomNumber() {
    int randomNumber = _random.nextInt(90000000) + 10000000;
    return randomNumber;
  }
}
