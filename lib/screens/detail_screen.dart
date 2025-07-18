import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/models/food.dart';
import 'package:food_app/theme/app_text_style.dart';
import 'package:food_app/widgets/apply_padding.dart';

class DetailScreen extends StatefulWidget {
  final Food food;

  const DetailScreen({super.key, required this.food});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: AnimationLimiter( // Enables staggered animations
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...applyPadding([
                  AnimationConfiguration.staggeredList(

                    position: 0,
                    duration: const Duration(milliseconds: 600),
                    child: SlideAnimation(
                      horizontalOffset: -50.0,
                      child: FadeInAnimation(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(CupertinoIcons.back, size: 30),
                            ),
                            const Icon(Icons.more_vert, size: 30),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
                AnimationConfiguration.staggeredList(
                  position: 1,
                  duration: const Duration(milliseconds: 700),
                  child: ScaleAnimation(
                    scale: 1.4,
                    curve: Curves.easeOutBack,
                    child: FadeInAnimation(
                      child: Center( // Ensures the GIF is centered horizontally
                        child: Image.asset(
                          widget.food.gifPath != null ? 'assets/gif/${widget.food.gifPath}': widget.food.imagePath,
                          fit: BoxFit.contain,
                          width: double.infinity,
                          height: 440,
                        ),
                      ),
                    ),
                  ),
                ),
                ...applyPadding([
                  const SizedBox(height: 20),

                  // Title + Timer
                  AnimationConfiguration.staggeredList(
                    position: 2,
                    duration: const Duration(milliseconds: 600),
                    child: SlideAnimation(
                      horizontalOffset: -30,
                      child: FadeInAnimation(
                        child: Row(
                          children: [
                            Text(
                              widget.food.name,
                              style: AppTextStyle.large(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            SvgPicture.asset(
                              'assets/icons/clock.svg',
                              color: Colors.white,
                              height: 40,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '${widget.food.minute}Mins',
                              style: AppTextStyle.medium(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Description
                  AnimationConfiguration.staggeredList(
                    position: 3,
                    duration: const Duration(milliseconds: 600),
                    child: SlideAnimation(
                      verticalOffset: 30,
                      child: FadeInAnimation(
                        child: Text(
                          widget.food.describe,
                          style: AppTextStyle.small(color: Colors.white)
                              .copyWith(fontSize: 18),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Price + Buttons
                  AnimationConfiguration.staggeredList(
                    position: 4,
                    duration: const Duration(milliseconds: 600),
                    child: SlideAnimation(
                      verticalOffset: 40,
                      child: FadeInAnimation(
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total Price',
                                  style: AppTextStyle.large(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '\$${widget.food.price}',
                                  style: AppTextStyle.medium(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                              style: IconButton.styleFrom(
                                  backgroundColor: Colors.white),
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
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Container(
                              height: 60,
                              width: 170,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Add to cart',
                                    style: AppTextStyle.small(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                    style: IconButton.styleFrom(
                                        backgroundColor: Colors.black),
                                    onPressed: () {},
                                    icon: const Icon(Icons.add,
                                        size: 20, color: Colors.white),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}