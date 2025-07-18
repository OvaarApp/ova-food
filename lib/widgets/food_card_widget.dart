import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/screens/detail_screen.dart';
import 'package:food_app/theme/app_color.dart';
import 'package:food_app/theme/app_text_style.dart';
import '../models/food.dart';

class FoodCatBuilder extends StatelessWidget {
  final String? svgPath;
  final String? imagePath;
  final bool isSelected;

  const FoodCatBuilder({
    super.key,
    this.svgPath,
    this.imagePath,
    this.isSelected = false,
  }) : assert(
          (svgPath != null) ^
              (imagePath != null), // XOR: only one must be non-null
          'You must provide either svgPath or imagePath, but not both.',
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        color: isSelected ? AppColor.second : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: svgPath != null
            ? SvgPicture.asset(
                svgPath!,
                height: 30,
                width: 30,
              )
            : Image.asset(
                imagePath!,
                height: 30,
                width: 30,
              ),
      ),
    );
  }
}

class FoodCardBuilder extends StatefulWidget {
  final Food food;

  const FoodCardBuilder({super.key, required this.food});

  @override
  State<FoodCardBuilder> createState() => _FoodCardBuilderState();
}

class _FoodCardBuilderState extends State<FoodCardBuilder> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 600),
            reverseTransitionDuration: const Duration(milliseconds: 400),
            pageBuilder: (context, animation, secondaryAnimation) =>
                DetailScreen(food: widget.food),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SharedAxisTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                transitionType: SharedAxisTransitionType.scaled,
                // or .horizontal / .vertical
                child: child,
              );
            },
          ),
        ),
        child: SizedBox(
          width: 220,
          child: Stack(
            children: [
              // Background container at the bottom
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 20, right: 20),
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.third,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.food.name,
                        style: AppTextStyle.medium(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.food.description,
                        style: AppTextStyle.small(color: Colors.grey)
                            .copyWith(fontSize: 14),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${widget.food.price.toStringAsFixed(2)}',
                            style: AppTextStyle.medium(
                                fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            style: IconButton.styleFrom(
                                backgroundColor: Colors.grey),
                            onPressed: () {
                              setState(() {
                                widget.food.isFav = !widget.food.isFav;
                              });
                            },
                            icon:  widget.food.isFav ?Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )  : Icon(
                              Icons.favorite_border_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Centered image at the top
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  widget.food.imagePath,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodCardBuilder2 extends StatelessWidget {
  final Food food;

  const FoodCardBuilder2({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 600),
          reverseTransitionDuration: const Duration(milliseconds: 400),
          pageBuilder: (context, animation, secondaryAnimation) =>
              DetailScreen(food: food),
          transitionsBuilder:
              (context, animation, secondaryAnimation, child) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.scaled,
              // or .horizontal / .vertical
              child: child,
            );
          },
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(left: 16),
        height: 200,
        width: double.infinity,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 300,
                padding: EdgeInsets.all(20),
                height: 150,
                decoration: BoxDecoration(
                    color: AppColor.third,
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Text(
                      food.name,
                      style: AppTextStyle.medium(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      food.description,
                      style: AppTextStyle.small(color: Colors.grey)
                          .copyWith(fontSize: 14),
                    ),
                    Text(
                      '\$${food.price.toStringAsFixed(2)}',
                      style: AppTextStyle.medium(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                food.imagePath,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
