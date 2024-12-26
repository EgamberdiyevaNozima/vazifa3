import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

// Define the GoRouter for page navigation
final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const CategoriesPage(),
    ),
    GoRoute(
      path: '/page2',
      builder: (context, state) => const HomePage(),
    ),
  ],
);

void main() => runApp(const RecipeApp());

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router, // Integrate the GoRouter with MaterialApp
      debugShowCheckedModeBanner: false,
    );
  }
}

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C0F0D),
      extendBody: true,
      appBar: AppBar(
        leadingWidth: 50,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Center(
            child: SizedBox(
              width: 21,
              height: 14,
              child: SvgPicture.asset(
                "assets/back-arrow.svg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: const Text(
          "Categories",
          style: TextStyle(
            color: Color(0xFFFD5D69),
          ),
        ),
        actions: const [
          AppBarActionItem(
            image: "assets/notification.svg",
            width: 12,
            height: 17,
          ),
          SizedBox(width: 5),
          AppBarActionItem(
            image: "assets/search.svg",
            width: 14,
            height: 18,
          ),
          SizedBox(width: 20)
        ],
        centerTitle: true,
        backgroundColor: const Color(0xFF1C0F0D),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MainCategoryItem(image: "assets/seafood.png", text: "Seafood"),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CategoryItem(image: "assets/lunch.png", text: "Lunch"),
              CategoryItem(image: "assets/breakfast.png", text: "Breakfast"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CategoryItem(image: "assets/dinner.png", text: "Dinner"),
              CategoryItem(image: "assets/vegan.png", text: "Vegan"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CategoryItem(image: "assets/dessert.png", text: "Dessert"),
              CategoryItem(image: "assets/drinks.png", text: "Drinks"),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 281,
          height: 56,
          decoration: BoxDecoration(
            color: const Color(0xFFFD5D69),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: SvgPicture.asset("assets/home.svg"),
                onPressed: () {
                  context.go("/page2");
                },
              ),
              SvgPicture.asset("assets/community.svg"),
              SvgPicture.asset("assets/categories.svg"),
              SvgPicture.asset("assets/profile.svg"),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarActionItem extends StatelessWidget {
  const AppBarActionItem({
    super.key,
    required this.image,
    required this.width,
    required this.height,
  });

  final String image;
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: const Color(0xFFFFC6C9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: SizedBox(
          width: width,
          height: height,
          child: SvgPicture.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.image, required this.text});

  final String image, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SizedBox(
            width: 159,
            height: 145,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
        ),
      ],
    );
  }
}

class MainCategoryItem extends StatelessWidget {
  const MainCategoryItem({super.key, required this.image, required this.text});

  final String image, text;

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
        ),
        const SizedBox(height: 6),
        Center(
          child: SizedBox(
            width: 356,
            height: 149,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1C0F0D),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff1C0F0D),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi! Dianee",
              style: TextStyle(
                color: Color(0xFFFD5D69),
                fontSize: 26,
              ),
            ),
            Text(
              "What are you cooking today",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            height: 28,
            width: 28,
            decoration: const BoxDecoration(
              color: Color(0xffFFC6C9),
              borderRadius: BorderRadius.all(Radius.circular(14)),
            ),
            child: Center(
              child: SvgPicture.asset(
                "assets/tiramisu.png",
                width: 18,
                height: 18,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            height: 28,
            width: 28,
            decoration: const BoxDecoration(
              color: Color(0xffFFC6C9),
              borderRadius: BorderRadius.all(Radius.circular(14)),
            ),
            child: Center(
              child: SvgPicture.asset(
                "assets/search.svg",
                width: 18,
                height: 18,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Text(
                "Trending Recipe",
                style: TextStyle(
                  color: Color(0xffFD5D69),
                  fontSize: 15,
                ),
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: -60,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xff2C1A18),
                      border: Border.all(color: Colors.red),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(18),
                        bottomRight: Radius.circular(18),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Salami and cheese pizza",
                              style: TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/clock.svg",
                                  width: 12,
                                  height: 12,
                                ),
                                const SizedBox(width: 5),
                                const Text(
                                  "30min",
                                  style: TextStyle(
                                    color: Color(0xffEC888D),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "This is a quick overview of the ingredients...",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                            Row(
                              children: [
                                const Text(
                                  "5",
                                  style: TextStyle(
                                    color: Color(0xffEC888D),
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                SvgPicture.asset(
                                  "assets/star.svg",
                                  width: 12,
                                  height: 12,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}





//







// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
//
// final GoRouter router = GoRouter(
//   routes: [
//     GoRoute(
//       path: '/',
//       builder: (context, state) => Page1(),
//     ),
//     GoRoute(
//       path: '/page2',
//       builder: (context, state) => Page2(),
//     ),
//   ],
// );
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routerConfig: router,
//     );
//   }
// }
//
// class Page1 extends StatelessWidget {
//   const Page1({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text("Salom, Navigation!"),
//       ),
//       floatingActionButton: ElevatedButton(
//         onPressed: () => context.go('/page2'),
//         child: Text("+"),
//       ),
//       // floatingActionButton: ElevatedButton(onPressed: (), child: child),
//     );
//   }
// }
//
// class Page2 extends StatelessWidget {
//   const Page2({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text("Ikkinchi sahifa!"),
//       ),
//       floatingActionButton: ElevatedButton(
//         onPressed: () => context.go('/'),
//         child: Text("+"),
//       ),
//       // floatingActionButton: ElevatedButton(onPressed: (), child: child),
//     );
//   }
// }
//
//
//
