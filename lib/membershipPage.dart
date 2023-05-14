import 'package:flutter/material.dart';






class MembershipPage extends StatefulWidget{
  @override
  _MembershipPageState createState() => _MembershipPageState();
}

class _MembershipPageState extends State<MembershipPage>{
  double _progressValue = 0.0;

  @override
  void initState(){
    super.initState();
    _updateProgress();
  }

  void _updateProgress() {
    DateTime now = DateTime.now();
    int daysInMonth = DateTime(now.year, now.month  + 1, 0).day;
    int daysRemaining = daysInMonth - now.day;
    setState(() {
      _progressValue = 1.0 - (daysRemaining / daysInMonth);
    });
  }

  @override
  Widget build(BuildContext contex){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Remaining membership'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Membership expires at end of the month: ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
             ),
            ), 
          ),

            

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                      color: Colors.grey[300]!,
                      width: 2.0,),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),

                    Container(
                  height: 20.0,
                  width: _progressValue * (MediaQuery.of(context).size.width - 32.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10.0),
                    )
                  )
                ],
              )
            ),
            Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              '${(_progressValue * 100).toInt()}% complete',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
            ),
            ),
        ],
      ),
    );
  }
}
