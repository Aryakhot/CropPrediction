import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'profile.dart';
import 'chatbot.dart';
//import 'signup.dart';
import 'weather.dart';

class AgroConnectScreen extends StatefulWidget {
  @override
  _AgroConnectScreenState createState() => _AgroConnectScreenState();
}

class _AgroConnectScreenState extends State<AgroConnectScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigation logic based on index
    if (index == 3) {
      // Navigate to ProfilePage when Profile icon is tapped
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfilePage()),
      );
    }
    if (index == 0) {
      // Replace the current AgroConnectScreen to avoid showing the back button
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AgroConnectScreen()),
      );
    }
    if (index == 1) {
      // Navigate to ProfilePage when Profile icon is tapped
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatBotScreen()),
      );
    }
    if (index == 2) {
      // Navigate to ProfilePage when Profile icon is tapped
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WeatherScreen()),
      );
    }
    // Add more conditions for other indices if navigation is needed
  }
  void _navigateChatbotSequence(BuildContext context) {
// Adjust the pages and their sequence as per your actual app pages
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChatBotScreen()), // Replace with the first page you want to open
    ).then((_) {
      // Add subsequent navigations if needed
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AgroConnect',
          style: TextStyle(
            fontSize: 20, // Match font size with Plantix app
            color: Colors.white, // Match AppBar color style
          ),
        ),
        automaticallyImplyLeading: false, // Prevents the back arrow
        backgroundColor: const Color(0xFF07480E),
        actions: [
          IconButton(
            icon: const Icon(Icons.language, color: Colors.white),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('change Language'.tr),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: const Text('English'),
                          onTap: () {
                            var locale = const Locale('en', 'US');
                            Get.updateLocale(locale); // Switch to English
                            Get.back(); // Close the dialog
                          },
                        ),
                        ListTile(
                          title: const Text('हिन्दी'),
                          onTap: () {
                            var locale = const Locale('hi', 'IN');
                            Get.updateLocale(locale); // Switch to Spanish
                            Get.back(); // Close the dialog
                          },
                        ),
                        ListTile(
                          title: const Text('मराठी'),
                          onTap: () {
                            var locale = const Locale('mr', 'IN');
                            Get.updateLocale(locale); // Switch to Spanish
                            Get.back(); // Close the dialog
                          },
                        ),
                        ListTile(
                          title: const Text('ಕನ್ನಡ'),
                          onTap: () {
                            var locale = const Locale('kn', 'IN');
                            Get.updateLocale(locale); // Switch to Spanish
                            Get.back(); // Close the dialog
                          },
                        ),
                        // Add more languages as needed
                      ],
                    ),
                  );
                },
              );

              // Action for language selection
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bgimagee.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  'WELCOME!'.tr,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                    color: Color(0xFFFFFFFF),
                    fontFamily: 'Playfair Display',
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // Action for weather card tap
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => WeatherScreen()),
                          );

                        },
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF74EBD5), Color(0xFFACB6E5)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child:  Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Today, Mumbai'.tr,
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Thunderstorm, 4mm Rainfall'.tr,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.air,
                                            size: 18,
                                            color: Colors.black54,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            '16 km/h'.tr,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Icon(
                                            Icons.water_drop,
                                            size: 18,
                                            color: Colors.black54,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            'Humidity: 80%'.tr,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.cloud,
                                        size: 50,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        '24°C'.tr,
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Divider(color: Colors.black26, thickness: 1),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.sunny,
                                        color: Colors.black54,
                                        size: 30,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        '6:30 AM'.tr,
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                      Text(
                                        'Sunrise'.tr,
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.nights_stay,
                                        color: Colors.black54,
                                        size: 30,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        '6:45 PM'.tr,
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                      Text(
                                        'Sunset'.tr,
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.north,
                                        color: Colors.black54,
                                        size: 30,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'NE'.tr,
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                      Text(
                                        'Wind Dir.'.tr,
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Updated Disease Detection Card
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // Action for disease detection tap
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFFCB69F), Color(0xFF8B5E3C)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child:  Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Disease Detection'.tr,
                                        style: TextStyle(
                                          fontSize: 26,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.camera_alt,
                                            size: 22,
                                            color: Colors.white70,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            'Capture'.tr,
                                            style: TextStyle(
                                              fontSize: 24,
                                              color: Colors.white70,
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          Icon(
                                            Icons.upload,
                                            size: 22,
                                            color: Colors.white70,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            'Upload'.tr,
                                            style: TextStyle(
                                              fontSize: 24,
                                              color: Colors.white70,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.medical_services,
                                        size: 50,
                                        color: Colors.white54,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Divider(color: Colors.white30, thickness: 1),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.warning,
                                        color: Colors.white70,
                                        size: 30,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Detect'.tr,
                                        style: TextStyle(color: Colors.white70),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.local_hospital,
                                        color: Colors.white70,
                                        size: 30,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Treat'.tr,
                                        style: TextStyle(color: Colors.white70),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.info,
                                        color: Colors.white70,
                                        size: 30,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Learn'.tr,
                                        style: TextStyle(color: Colors.white70),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight, // Aligns the button to the right
                      child: ElevatedButton(
                        onPressed: () => _navigateChatbotSequence(context), // Correct function call
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15), // Ensures the button looks square
                          backgroundColor: const Color(0xFF07480E), // Button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // Rounded corners
                          ),
                          minimumSize: const Size(50, 50), // Square shape with rounded edges
                        ),
                        child: const Icon(Icons.chat, color: Colors.white), // Icon for the button
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => _onItemTapped(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home,
                    size: 35,
                    color: _selectedIndex == 0
                        ? const Color(0xFF07480E)
                        : Colors.grey,
                  ),
                  Text(
                    'Home'.tr,
                    style: TextStyle(
                      color: _selectedIndex == 0
                          ? const Color(0xFF07480E)
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => _onItemTapped(1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.chat,
                    size: 35,
                    color: _selectedIndex == 1
                        ? const Color(0xFF07480E)
                        : Colors.grey,
                  ),
                  Text(
                    'Chat'.tr,
                    style: TextStyle(
                      color: _selectedIndex == 1
                          ? const Color(0xFF07480E)
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => _onItemTapped(2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cloud,
                    size: 35,
                    color: _selectedIndex == 2
                        ? const Color(0xFF07480E)
                        : Colors.grey,
                  ),
                  Text(
                    'Weather'.tr,
                    style: TextStyle(
                      color: _selectedIndex == 2
                          ? const Color(0xFF07480E)
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => _onItemTapped(3), // This will trigger the navigation
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    size: 35,
                    color: _selectedIndex == 3
                        ? const Color(0xFF07480E)
                        : Colors.grey,
                  ),
                  Text(
                    'Profile'.tr,
                    style: TextStyle(
                      color: _selectedIndex == 3
                          ? const Color(0xFF07480E)
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}