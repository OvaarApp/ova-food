import 'package:flutter/material.dart';
import 'package:food_app/theme/app_text_style.dart';
import 'package:food_app/widgets/apply_padding.dart';

import '../models/food.dart';
import '../widgets/food_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Food> foodList = [
      Food(
        imagePath: 'assets/images/chicken.png',
        gifPath: 'chicken.gif',
        name: 'Chicken Briyani',
        description: 'With ultimate combo',
        price: 24.00,
        describe:
        'A rich and flavorful dish made with marinated chicken, fragrant basmati rice, and a blend of aromatic spices. Perfect for a hearty meal with a satisfying finish.',
        minute: 35,
      ),
      Food(
        imagePath: 'assets/images/stew.png',
        gifPath: 'stew.gif',
        name: 'Spicy Meat Stew',
        description: 'Simmered in rich tomato sauce',
        price: 18.50,
        describe:
        'A mouthwatering stew made with tender chunks of meat, sautéed onions, red bell peppers, and a thick tomato sauce. Ideal for spice lovers and hearty meal fans.',
        minute: 40,
      ),

      Food(
        imagePath: 'assets/images/pasta2.png',
        gifPath: 'pasta1.gif',
        name: 'Shrimp Pasta',
        description: 'Hot with fish',
        price: 22.75,
        describe:
        'Tender shrimp sautéed with chili flakes and fresh vegetables, served over perfectly cooked pasta in a zesty seafood sauce. A delight for seafood lovers.',
        minute: 28,
      ),
      Food(
        imagePath: 'assets/images/paneer.png',
        gifPath: 'paneer.gif',
        name: 'Paneer Tikka',
        description: 'Hot and spicy',
        price: 22.75,
        describe:
        'Chunks of paneer marinated in a spicy yogurt blend and grilled to perfection. Served with mint chutney and onions for a mouth-watering vegetarian treat.',
        minute: 20,
      ),
    ];

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...applyPadding([
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu_rounded,
                    size: 30,
                  ),
                  Container(
                    height: 60,
                    width: 45,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(5))),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.black,
                      size: 26,
                    ),
                  ),
                ],
              ),
              Text(
                'Delicious Food',
                style: AppTextStyle.xl(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Text(
                'We made fresh and healthy food',
                style: AppTextStyle.small(color: Colors.grey),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FoodCatBuilder(
                    svgPath: 'assets/icons/burger.svg',
                  ),
                  FoodCatBuilder(
                    imagePath: 'assets/icons/ice-cream.png',
                  ),
                  FoodCatBuilder(
                    imagePath: 'assets/icons/lemonade.png',
                  ),
                  FoodCatBuilder(
                    isSelected: true,
                    imagePath: 'assets/icons/restaurant.png',
                  ),
                ],
              ),
            ]),
            SizedBox(
                height: 400,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodList.length - 1,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  itemBuilder: (context, index) {
                    final food = foodList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: FoodCardBuilder(food: food),
                    );
                  },
                )),
            FoodCardBuilder2(food: foodList.last),
          ],
        ),
      )),
    );
  }
}
