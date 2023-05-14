import 'package:flutter/material.dart';




class PersonalTrainerPage extends StatelessWidget{
  final String name;
  final String description;
  final String imageUrl;

  PersonalTrainerPage({
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Personal Trainer'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 18),
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(imageUrl),
            ),
            SizedBox(height: 18),
            Text(
              name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              
            ),
            SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),

            SizedBox(height: 18),
            ElevatedButton(
              onPressed: (){
                //booking
              },
              child: Text('Book Personal Trainer'),
            )

          ],
        ),
      ),
    );
  }
}

