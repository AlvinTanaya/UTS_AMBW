import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'UTS AMBW',
        theme: ThemeData(useMaterial3: true),
        home: BottomNavBar(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
}

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Discovery(),
    BookMark(),
    TopFoodie(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: 'Discovery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events_outlined),
            label: 'Top Foodie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.amber,
            size: 40,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          },
        ),
        title: Text(
          'Sydney CBD',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            //THAI STYLE
            Stack(
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://recipes.net/wp-content/uploads/2023/05/spicy-thai-noodle-soup-recipe_9695cec873938bd99c81ac7f80f05653.jpeg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.transparent
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Thai Style',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          '12 Places',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Row(
                    children: [
                      Icon(Icons.circle,
                          size: 8, color: Colors.white.withOpacity(0.9)),
                      SizedBox(width: 8),
                      Icon(Icons.circle,
                          size: 8, color: Colors.white.withOpacity(0.5)),
                      SizedBox(width: 8),
                      Icon(Icons.circle,
                          size: 8, color: Colors.white.withOpacity(0.5)),
                      SizedBox(width: 8),
                      Icon(Icons.circle,
                          size: 8, color: Colors.white.withOpacity(0.5)),
                    ],
                  ),
                ),
              ],
            ),
            //MOSTT
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(16, 0, 0, 0),
              title: Text(
                'Most Popular',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              trailing: TextButton(
                child: Text(
                  'See all',
                  style: TextStyle(color: Colors.lightBlue),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => seeAllMostPopular()),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                height: 203,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: MostPopularItem1(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: MostPopularItem2(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: MostPopularItem3(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: MostPopularItem4(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: MostPopularItem5(),
                    ),
                  ],
                ),
              ),
            ),

            ListTile(
              contentPadding: EdgeInsets.fromLTRB(16, 0, 0, 0),
              title: Text(
                'Most Deals',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              trailing: TextButton(
                child: Text(
                  'See all',
                  style: TextStyle(color: Colors.lightBlue),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => seeAllMealDeals()),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.5),
              child: SizedBox(
                height: 212,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: MealDealsItem1(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: MealDealsItem2(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: MealDealsItem3(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: MealDealsItem4(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: MealDealsItem5(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Discovery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.amber,
            size: 40,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          },
        ),
        title: Text(
          'Sydney CBD',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Text(
          'Jl. Siwalankerto No.121-131',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class BookMark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.amber,
            size: 40,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          },
        ),
        title: Text(
          'Sydney CBD',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Text(
          'BookMark',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class TopFoodie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.amber,
            size: 40,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          },
        ),
        title: Text(
          'Sydney CBD',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Text(
          'Pad Thai is Delicious',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.amber,
            size: 40,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          },
        ),
        title: Text(
          'Sydney CBD',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Text(
          'Alvin Tanaya C14210276',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class seeAllMostPopular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.amber,
            size: 40,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          },
        ),
        title: Text(
          'Most popular',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return getMostPopularItem(index + 1);
        },
      ),
    );
  }

  Widget getMostPopularItem(int index) {
    switch (index) {
      case 1:
        return MostPopularItem1();
      case 2:
        return MostPopularItem2();
      case 3:
        return MostPopularItem3();
      case 4:
        return MostPopularItem4();
      case 5:
        return MostPopularItem5();
      default:
        return Container();
    }
  }
}

class MostPopularItem1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.0,
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(
                'https://cdn.tasteatlas.com//Images/Dishes/e0335282a16644079d6de02902a8b4e9.jpg?w=905&h=510',
                width: double.infinity,
                height: 120,
                fit: BoxFit.cover,
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 10),
                title: Text(
                  'Khao Soi',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '122 Queen Street',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      'Egg Noodle, Thailand',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MostPopularItem2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.0,
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(
                'https://cdn.tasteatlas.com//images/dishes/ad3ef1fb39eb42958e7462961951e45c.jpg?w=905&h=510',
                width: double.infinity,
                height: 120,
                fit: BoxFit.cover,
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 10),
                title: Text(
                  'Pad Thai',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '111 Queen Street',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      'Noodles, Radish',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MostPopularItem3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.0,
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(
                'https://cdn.tasteatlas.com//images/dishes/b15b41daa6ef4b99b4b5df0a2d1a90e2.jpg?w=905&h=510',
                width: double.infinity,
                height: 120,
                fit: BoxFit.cover,
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 10),
                title: Text(
                  'Phat si-io',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '181 Queen Street',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      'Noodles, Garlic',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MostPopularItem4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.0,
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(
                'https://cdn.tasteatlas.com//images/dishes/22220fdde92f49b8b7792f021677a86a.jpg?w=905&h=510',
                width: double.infinity,
                height: 120,
                fit: BoxFit.cover,
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 10),
                title: Text(
                  'Pad kee mao',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '152 Queen Street',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      'Noodles, Corn',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MostPopularItem5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.0,
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(
                'https://cdn.tasteatlas.com//images/dishes/c498c608efc243a3ba8aa68e109aea01.jpg?w=905&h=510',
                width: double.infinity,
                height: 120,
                fit: BoxFit.cover,
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 10),
                title: Text(
                  'kuai-tiao ruea',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '198 Queen Street',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      'Noodles, Pork',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class seeAllMealDeals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.amber,
            size: 40,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          },
        ),
        title: Text(
          'Most Deals',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return getMealDealsItem(index + 1);
        },
      ),
    );
  }

  Widget getMealDealsItem(int index) {
    switch (index) {
      case 1:
        return MealDealsItem1();
      case 2:
        return MealDealsItem2();
      case 3:
        return MealDealsItem3();
      case 4:
        return MealDealsItem4();
      case 5:
        return MealDealsItem5();
      default:
        return Container();
    }
  }
}

class MealDealsItem1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.0,
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(
                'https://cdn.tasteatlas.com//images/dishes/fc1bc5cb4e82401a9cd97cc6c2c08290.jpg?w=905&h=510',
                width: double.infinity,
                height: 120,
                fit: BoxFit.cover,
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 10),
                title: Text(
                  'Yam Wun Sen',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '256 Queen Street',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      'Noodles, Shrimp',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MealDealsItem2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.0,
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(
                'https://cdn.tasteatlas.com//images/dishes/39c1ad299a114909a96a72a238e7c13a.jpg?w=905&h=510',
                width: double.infinity,
                height: 120,
                fit: BoxFit.cover,
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 10),
                title: Text(
                  'Khanom chin',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '871 Queen Street',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      'Shrimp, Fish',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MealDealsItem3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.0,
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(
                'https://cdn.tasteatlas.com//images/dishes/e396a8d718554d568eeec4e26a945785.jpg?w=905&h=510',
                width: double.infinity,
                height: 120,
                fit: BoxFit.cover,
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 10),
                title: Text(
                  'Mee Krob',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '671 Queen Street',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      'Noodles, Fish',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MealDealsItem4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.0,
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(
                'https://cdn.tasteatlas.com//images/dishes/e13ebd4a08bf4e828546e8654a5e5e16.jpg?w=905&h=510',
                width: double.infinity,
                height: 120,
                fit: BoxFit.cover,
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 10),
                title: Text(
                  'Goong ob woon',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '541 Queen Street',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      'Bacon, Shallots',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MealDealsItem5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.0,
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(
                'https://cdn.tasteatlas.com//Images/Dishes/5ac53d8672b64782bac0bae2e93ac448.jpg?w=905&h=510',
                width: double.infinity,
                height: 120,
                fit: BoxFit.cover,
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 10),
                title: Text(
                  'Yen ta fo',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '747 Queen Street',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      'Fish balls, Squid',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
