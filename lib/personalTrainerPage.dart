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

  void _showContactInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Contact Information'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Phone Number: +123456789'),
              SizedBox(height: 8),
              Text('Email: mikemikowski@example.com'),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

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
                _showContactInfo(context);
              },
              child: Text('Book Personal Trainer'),
            )

          ],
        ),
      ),
    );
  }
}

