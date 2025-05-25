import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainScreen(),
  ));
}

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<String> _titles = ['Home', 'News', 'TrackBox', 'Projects'];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      drawer: ProfileDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: const Color.fromRGBO(20, 20, 20, 1),
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromRGBO(128, 128, 128, 1),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 24),
            activeIcon: Icon(Icons.home, size: 24),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined, size: 24),
            activeIcon: Icon(Icons.article, size: 24),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.audiotrack_outlined, size: 24),
            activeIcon: Icon(Icons.audiotrack, size: 24),
            label: 'TrackBox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outline, size: 24),
            activeIcon: Icon(Icons.work, size: 24),
            label: 'Projects',
          ),
        ],
      ),
      body: _selectedIndex == 0
          ? Frame123260Widget(
        openDrawerCallback: () {
          _scaffoldKey.currentState?.openDrawer();
        },
        onMusicCardTap: (title) {
          if (title == 'Music Production') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MusicProductionSongsScreen(),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlackScreen(title: title),
              ),
            );
          }
        },
      )
          : BlackScreen(title: _titles[_selectedIndex]),
    );
  }
}

class Frame123260Widget extends StatelessWidget {
  final VoidCallback openDrawerCallback;
  final void Function(String title) onMusicCardTap;

  const Frame123260Widget({
    super.key,
    required this.openDrawerCallback,
    required this.onMusicCardTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Top Gradient Section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.centerLeft,
                colors: [
                  Color.fromRGBO(169, 1, 64, 1),
                  Color.fromRGBO(85, 1, 32, 1),
                ],
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 11),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromRGBO(47, 47, 57, 1),
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.search,
                                  color: Color.fromRGBO(97, 97, 107, 1),
                                  size: 20),
                              SizedBox(width: 8),
                              Text(
                                'Search',
                                style: TextStyle(
                                  color: Color.fromRGBO(97, 97, 107, 1),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 19),
                      GestureDetector(
                        onTap: openDrawerCallback,
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundColor: Color.fromRGBO(47, 47, 57, 1),
                          child: Icon(Icons.person,
                              color: Colors.white, size: 24),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Centered Text with Book Now
                Column(
                  children: const [
                    Text(
                      'Claim your',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          height: 1.375),
                    ),
                    SizedBox(height: 13),
                    Text(
                      'Free Demo',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          height: 0.5),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'for custom Music Production',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          height: 1.375),
                    ),
                    SizedBox(height: 20),
                    BookNowButton(),
                  ],
                ),

                const SizedBox(height: 20),

                // Decorative icons instead of images
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Icon(Icons.music_note,
                          color: Colors.white54, size: 40),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 30),
                      child: Icon(Icons.graphic_eq,
                          color: Colors.white54, size: 40),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Hire hand-picked Pros for popular music services',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: MyMusicServicesWidget(
              onCardTap: onMusicCardTap,
            ),
          ),
        ],
      ),
    );
  }
}

class BookNowButton extends StatelessWidget {
  const BookNowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
      ),
      child: const Text(
        'Book Now',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 13,
          height: 1.7,
        ),
      ),
    );
  }
}

class MyMusicServicesWidget extends StatelessWidget {
  final void Function(String title) onCardTap;

  const MyMusicServicesWidget({super.key, required this.onCardTap});

  Widget musicCard(
      String title, String subtitle, IconData iconData, Color iconColor) {
    return GestureDetector(
      onTap: () {
        onCardTap(title);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 11),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromRGBO(32, 33, 38, 1),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(47, 47, 57, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(iconData, color: iconColor, size: 24),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios,
                color: Colors.white54, size: 16),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        musicCard('Music Production', 'Custom instrumentals & film scoring',
            Icons.piano, const Color(0xFFFF7575)),
        musicCard('Mixing & Mastering', 'Make your tracks Radio-ready',
            Icons.tune, const Color(0xFF179F98)),
        musicCard('Lyrics Writing', 'Turn feelings into lyrics',
            Icons.edit_note, const Color(0xFFCCBE27)),
        musicCard('Vocals', 'Vocals that bring your lyrics to life',
            Icons.mic_external_on, const Color(0xFFB354DC)),
      ],
    );
  }
}

class BlackScreen extends StatelessWidget {
  final String title;

  const BlackScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 22),
      ),
    );
  }
}

class ProfileDrawer extends StatelessWidget {
  final String userName = 'Vj Bundela';
  final String userEmail = 'vjbundela25@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(20, 20, 20, 1),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white24,
                child: Icon(Icons.person, size: 40, color: Colors.white),
              ),
              const SizedBox(height: 20),
              Text(
                userName,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(height: 4),
              Text(
                userEmail,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
              const Spacer(),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.white70),
                title:
                const Text('Logout', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Logged out (demo)')),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// New screen to show list of 10 songs for Music Production
class MusicProductionSongsScreen extends StatelessWidget {
  final List<String> songs = [
    "Song One",
    "Song Two",
    "Song Three",
    "Song Four",
    "Song Five",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Music Production Songs'),
        backgroundColor: const Color.fromRGBO(169, 1, 64, 1),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: songs.length,
        separatorBuilder: (_, __) => const Divider(color: Colors.white24),
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.music_note, color: Colors.white),
            title: Text(
              songs[index],
              style: const TextStyle(color: Colors.white),
            ),
            onTap: () {
              // You can add action on song tap if you want
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Playing: ${songs[index]} (demo)')),
              );
            },
          );
        },
      ),
    );
  }
}
