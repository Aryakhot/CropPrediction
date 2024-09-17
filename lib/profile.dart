import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';
import 'signup.dart'; // Import the sign-up page
import 'profile.dart';
import 'homepage.dart';
import 'chatbot.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
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

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 3; // Set to 3 to highlight the Profile tab
  bool isSignedIn = false; // Simulating user sign-in status. You can replace this with actual authentication check.

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate based on the selected index
    switch (index) {
      case 0:
      // Navigate to the AgroConnectScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AgroConnectScreen()),
        );
        break;
      case 1:
      // Stay on the Chat screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ChatBotScreen()),
        );
        break;
      case 2:
      // Add navigation logic for the Weather screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AgroConnectScreen()),
        );
        break;
      case 3:
      // Add navigation logic for the Profile screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
        break;
      default:
      // Handle default or unexpected cases
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AgroConnect'),
        backgroundColor: const Color(0xFF07480E),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Account',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),

            // Show a user icon with a fancy question mark if not signed in
            Center(
              child: isSignedIn
                  ? FluttermojiCircleAvatar(radius: 60)
                  : const UserIconWithFancyQuestionMark(), // Fancy user icon
            ),
            const SizedBox(height: 10),

            // If the user is not signed in, show the "Join Community" message and Sign Up button
            if (!isSignedIn)
              Column(
                children: [
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      'Join AgroConnect Community',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SignUpPage()), // Navigate to Sign Up page
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        backgroundColor: const Color(0xFF07480E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            else
              Column(
                children: [
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      'User ID: 123456',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const ProfileInfoField(label: 'Name', value: 'John Doe'),
                  const ProfileInfoField(label: 'Age', value: '30'),
                  const ProfileInfoField(label: 'Gender', value: 'Male'),
                  const ProfileInfoField(
                      label: 'Address', value: '123 Agro Street, Farmville'),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Update info action
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        backgroundColor: const Color(0xFF07480E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Update Info',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),

            const Spacer(),


            // Align the AgroConnect text and chatbot button at the same level
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ensures even spacing between elements
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.center, // Center the text within its space
                    child: Text(
                      'AgroConnect',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),

                // ElevatedButton(
                //   onPressed: () => _navigateChatbotSequence(
                //       context), // Correct function call
                //   style: ElevatedButton.styleFrom(
                //     padding: const EdgeInsets.all(
                //         15), // Ensures the button looks square
                //     backgroundColor: const Color(0xFF07480E), // Button color
                //     shape: RoundedRectangleBorder(
                //       borderRadius:
                //       BorderRadius.circular(12), // Rounded corners
                //     ),
                //     minimumSize:
                //     const Size(50, 50), // Square shape with rounded edges
                //   ),
                //   child:
                //   const Icon(Icons.chat, color: Colors.white), // Icon for the button
                // ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => _onItemTapped(0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home,
                    size: 35,
                    color:
                    _selectedIndex == 0 ? const Color(0xFF07480E) : Colors.grey,
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                      color: _selectedIndex == 0 ? const Color(0xFF07480E) : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => _onItemTapped(1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.chat,
                    size: 35,
                    color:
                    _selectedIndex == 1 ? const Color(0xFF07480E) : Colors.grey,
                  ),
                  Text(
                    'Chat',
                    style: TextStyle(
                      color: _selectedIndex == 1 ? const Color(0xFF07480E) : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => _onItemTapped(2),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cloud,
                    size: 35,
                    color:
                    _selectedIndex == 2 ? const Color(0xFF07480E) : Colors.grey,
                  ),
                  Text(
                    'Weather',
                    style: TextStyle(
                      color: _selectedIndex == 2 ? const Color(0xFF07480E) : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => _onItemTapped(3),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    size: 35,
                    color:
                    _selectedIndex == 3 ? const Color(0xFF07480E) : Colors.grey,
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(
                      color: _selectedIndex == 3 ? const Color(0xFF07480E) : Colors.grey,
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

// Define the ProfileInfoField widget
class ProfileInfoField extends StatelessWidget {
  final String label;
  final String value;

  const ProfileInfoField({
    required this.label,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label:',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

// Define the UserIconWithFancyQuestionMark widget
class UserIconWithFancyQuestionMark extends StatelessWidget {
  const UserIconWithFancyQuestionMark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black12, width: 2),
      ),
      child: CircleAvatar(
        radius: 60,
        backgroundColor: Colors.grey.shade300,
        child: const Text(
          '?',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}