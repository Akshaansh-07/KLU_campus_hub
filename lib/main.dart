import 'package:flutter/material.dart';

void main() {
  runApp(const StudentCampusApp());
}

class StudentCampusApp extends StatelessWidget {
  const StudentCampusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KLU Campus Hub',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F6FA),
        useMaterial3: true,
      ),

      home: const CampusHomePage(),
    );
  }
}

class CampusHomePage extends StatefulWidget {
  const CampusHomePage({super.key});

  @override
  State<CampusHomePage> createState() => _CampusHomePageState();
}

class _CampusHomePageState extends State<CampusHomePage> {
  int currentIndex = 0;
  int registeredActivities = 0;

  // ============================================================
  // NAVIGATION
  // ============================================================

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  // ============================================================
  // REGISTER ACTIVITY
  // ============================================================

  void registerActivity() {
    setState(() {
      registeredActivities++;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Activity registered successfully!'),
      ),
    );
  }

  // ============================================================
  // HOME PAGE
  // ============================================================

  Widget homePage() {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/background_image.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(18, 20, 18, 90),
          child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ------------------------------------------------------
          // WELCOME CARD
          // ------------------------------------------------------

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 34,
                    color: Colors.orange,
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Welcome back!',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Akshaansh Gupta',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'Computer Science',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),

          // ------------------------------------------------------
          // ANNOUNCEMENT
          // ------------------------------------------------------

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.notifications_active,
                    color: Colors.orange,
                  ),
                ),

                const SizedBox(width: 12),

                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Campus Announcement',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Registration for upcoming events is now open.',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // ------------------------------------------------------
          // QUICK ACCESS
          // ------------------------------------------------------

          const Text(
            'Quick Access',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
            childAspectRatio: 3.5,
            children: [
              quickAccessCard(
                Icons.library_books,
                'Library',
              ),
              quickAccessCard(
                Icons.map,
                'Campus Map',
              ),
              quickAccessCard(
                Icons.calendar_month,
                'Calendar',
              ),
              quickAccessCard(
                Icons.event,
                'Events',
              ),
            ],
          ),

          const SizedBox(height: 15),

          // ------------------------------------------------------
          // UPCOMING ACTIVITIES
          // ------------------------------------------------------

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Upcoming Activities',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
                child: const Text('View All'),
              ),
            ],
          ),

          const SizedBox(height: 8),

          activityCard(
            'Programming Workshop',
            '24 September 2026',
            Icons.computer,
          ),

          activityCard(
            'Career Fair',
            '28 September 2026',
            Icons.work,
          ),

          activityCard(
            'Sports Competition',
            '2 October 2026',
            Icons.sports_soccer,
          ),
        ],
          ),
      ),
    );
  }

  // ============================================================
  // QUICK ACCESS CARD
  // ============================================================

  Widget quickAccessCard(
      IconData icon,
      String title,
      ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.1),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Icon(
              icon,
              color: Colors.orange,
              size: 18,
            ),
          ),

          const SizedBox(width: 7),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }


  // ============================================================
  // ACTIVITY CARD
  // ============================================================

  Widget activityCard(
      String title,
      String date,
      IconData icon,
      ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.1),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(
              icon,
              color: Colors.orange,
              size: 27,
            ),
          ),

          const SizedBox(width: 13),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  date,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          ElevatedButton(
            onPressed: registerActivity,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 9,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('Register'),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // ACTIVITIES PAGE
  // ============================================================

  Widget activitiesPage() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(18, 20, 18, 90),
      children: [
        const Text(
          'Campus Events',
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 5),

        const Text(
          'Explore activities happening around Vijayawada.',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        ),

        const SizedBox(height: 22),

        activityCard(
          'Programming Workshop',
          '24 September 2026 • Computer Lab',
          Icons.computer,
        ),

        activityCard(
          'Career Fair',
          '28 September 2026 • Main Hall',
          Icons.work,
        ),

        activityCard(
          'Sports Competition',
          '2 October 2026 • Sports Centre',
          Icons.sports_soccer,
        ),

        activityCard(
          'Photography Club',
          '5 October 2026 • Student Centre',
          Icons.camera_alt,
        ),
      ],
    );
  }

  // ============================================================
  // PROFILE PAGE
  // ============================================================

  Widget profilePage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(18, 25, 18, 90),
      child: Column(
        children: [
          // ------------------------------------------------------
          // PROFILE PHOTO
          // ------------------------------------------------------

          const CircleAvatar(
            radius: 55,
            backgroundColor: Colors.orange,
            child: CircleAvatar(
              radius: 51,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.orange,
              ),
            ),
          ),

          const SizedBox(height: 15),

          const Text(
            'Akshaansh Gupta',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          const Text(
            'Bachelor of Computer Science',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),

          const SizedBox(height: 25),

          // ------------------------------------------------------
          // STUDENT INFORMATION
          // ------------------------------------------------------

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: const [
                ListTile(
                  leading: Icon(
                    Icons.badge,
                    color: Colors.orange,
                  ),
                  title: Text('Student ID'),
                  subtitle: Text('2026123456'),
                ),

                Divider(height: 1),

                ListTile(
                  leading: Icon(
                    Icons.school,
                    color: Colors.orange,
                  ),
                  title: Text('Programme'),
                  subtitle: Text(
                    'Bachelor of Computer Science',
                  ),
                ),

                Divider(height: 1),

                ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.orange,
                  ),
                  title: Text('Email'),
                  subtitle: Text(
                    'akshaanshgupta@kluniversity.in',
                  ),
                ),

                Divider(height: 1),

                ListTile(
                  leading: Icon(
                    Icons.calendar_month,
                    color: Colors.orange,
                  ),
                  title: Text('Semester'),
                  subtitle: Text('Semester 5'),
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),

          // ------------------------------------------------------
          // REGISTERED ACTIVITIES
          // ------------------------------------------------------

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.event_available,
                  color: Colors.white,
                  size: 32,
                ),

                const SizedBox(height: 8),

                const Text(
                  'Activities Registered',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  '$registeredActivities',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // MAIN BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    Widget currentPage;

    if (currentIndex == 0) {
      currentPage = homePage();
    } else if (currentIndex == 1) {
      currentPage = activitiesPage();
    } else {
      currentPage = profilePage();
    }

    return Scaffold(
      // ----------------------------------------------------------
      // APP BAR
      // ----------------------------------------------------------

      appBar: AppBar(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'KLU Campus Hub',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'No new notifications',
                  ),
                ),
              );
            },
          ),
        ],
      ),

      // ----------------------------------------------------------
      // DRAWER
      // ----------------------------------------------------------

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.orange,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: Colors.orange,
                      size: 32,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    'Akshaansh Gupta',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 3),

                  Text(
                    'Artifical Intelligence',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            // Home
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Home'),
              selected: currentIndex == 0,
              onTap: () {
                setState(() {
                  currentIndex = 0;
                });

                Navigator.pop(context);
              },
            ),

            // Activities
            ListTile(
              leading: const Icon(Icons.event_outlined),
              title: const Text('Activities'),
              selected: currentIndex == 1,
              onTap: () {
                setState(() {
                  currentIndex = 1;
                });

                Navigator.pop(context);
              },
            ),

            // Profile
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('Profile'),
              selected: currentIndex == 2,
              onTap: () {
                setState(() {
                  currentIndex = 2;
                });

                Navigator.pop(context);
              },
            ),

            const Divider(),

            // Settings
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Settings selected',
                    ),
                  ),
                );
              },
            ),

            // Help
            ListTile(
              leading: const Icon(Icons.help_outline),
              title: const Text('Help'),
              onTap: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Help Centre selected',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      // ----------------------------------------------------------
      // BODY
      // ----------------------------------------------------------

      body: currentPage,

      // ----------------------------------------------------------
      // FLOATING ACTION BUTTON
      // ----------------------------------------------------------

      floatingActionButton: FloatingActionButton.extended(
        onPressed: registerActivity,
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        tooltip: 'Register Activity',
        icon: const Icon(Icons.add),
        label: const Text('Register'),
      ),

      // ----------------------------------------------------------
      // BOTTOM NAVIGATION
      // ----------------------------------------------------------

      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: changePage,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.event_outlined),
            selectedIcon: Icon(Icons.event),
            label: 'Activities',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
