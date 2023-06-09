import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/diet.dart';
import 'package:namer_app/login.dart';
import 'package:namer_app/welcomePage.dart'; // Kept import from `master`
import 'package:provider/provider.dart';
import 'profile.dart';
import 'welcomePage.dart';
import 'membershipPage.dart';
import 'personalTrainerPage.dart';
import 'trainingPage.dart';
import 'barcode_page.dart';
import 'diet.dart';
import 'info.dart';
import 'quote.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'getFit',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
        ),
        initialRoute: '/',
        routes: {
            '/': (context) =>  LoginPage(),
            '/home':(context) => MyHomePage(),

        }
        
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = Home();
        break;
      case 1:
        page = Profile();
        break;
      case 2:
        page =  BarcodePage.generate();//generates barcode from gymID   IT IS RANDOM NOW, CHANGE AFTER SETTING BASE
        break;
      case 3:
        page = MembershipPage();
        break;
      case 4:
        page =  PersonalTrainerPage(
            name: 'Mike Mikowski',
            description : 'Personal trainer with years of experience',
            imageUrl: 'https://athleticsweekly.com/wp-content/uploads/2020/11/PT-image-via-OriGym.jpg',);
        break;
      case 5:
        page = TrainingPlansPage();
        break;
      // test case 6:
      //   page = BarcodeGenerator.generateBarcodeWidget(context);
      //   break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          
          body: Row(children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),

                  NavigationRailDestination(
                    icon: Icon(Icons.person),
                    label: Text('Profile'),
                  ),

                  NavigationRailDestination(
                      icon: Icon(Icons.qr_code), 
                      label: Text('Scan QR')),

                  NavigationRailDestination(icon: 
                  Icon(Icons.card_membership), 
                  label: Text('Membership'),
                  ),

                  NavigationRailDestination(
                      icon: Icon(Icons.directions_run), 
                      label: Text('Personal trainer')),
                      
                      NavigationRailDestination(
                      icon: Icon(Icons.fitness_center), 
                      label: Text('Training plan')),

                  
                  
                  NavigationRailDestination(
                      icon: Icon(Icons.video_collection),
                      label: Text('Video exercises')),

                      NavigationRailDestination(
                        icon: Icon(Icons.restaurant_menu), 
                        label: Text('Diet plan'),),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primary,
                child: page,
              ),
            ),
          ]),
        );
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'getFit',
      home: Scaffold(
        appBar: AppBar(title: Text('Home')),
        body: const Center(child: Text('Explore new things every day !')),
        ),
    );
  }
  
}










