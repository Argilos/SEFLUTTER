import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: dietPage(),
    );
  }
}

class dietPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Plans'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Meal Plan for Gaining Weight',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Meal 1:\n- 2 whole eggs cooked in olive oil\n- 2 slices of whole-grain toast with avocado spread\n- 1 cup of Greek yogurt with mixed berries and a drizzle of honey\n- 1 glass of whole milk\n\nSnack:\n- 1 handful of mixed nuts (almonds, walnuts, cashews)\n- 1 banana\n\nMeal 2:\n- Grilled chicken breast\n- 1 cup of quinoa or brown rice\n- Steamed vegetables (broccoli, carrots, and peas)\n- 1 small salad with mixed greens, cherry tomatoes, and olive oil dressing\n\nSnack:\n- 1 cup of cottage cheese with pineapple chunks\n\nMeal 3:\n- Baked salmon fillet\n- Sweet potato mashed with butter\n- Sautéed spinach with garlic\n- 1 slice of whole-grain bread\n\nSnack:\n- 1 protein shake with whole milk, banana, and peanut butter',
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 20.0),
              Flexible(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Meal Plan for Losing Weight',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Meal 1:\n- 1 cup of oatmeal cooked with water\n- 1 scoop of protein powder mixed in the oatmeal\n- 1 small apple\n- 1 cup of green tea\n\nSnack:\n- 1 small handful of almonds\n- 1 medium orange\n\nMeal 2:\n- Grilled chicken breast\n- 1 cup of quinoa or brown rice\n- Steamed vegetables (broccoli, cauliflower, and bell peppers)\n- 1 small salad with mixed greens, cucumber, and balsamic vinegar dressing\n\nSnack:\n- 1 cup of Greek yogurt with sliced strawberries\n\nMeal 3:\n- Baked white fish (cod, tilapia, or sole)\n- 1 cup of roasted Brussels sprouts\n- 1/2 cup of cooked quinoa or brown rice\n- 1 slice of whole-grain bread\n\nSnack:\n- 1 small carrot with hummus dip',
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
