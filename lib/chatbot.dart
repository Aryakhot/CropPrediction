import 'package:flutter/material.dart';
// Import your home screen
import 'homepage.dart'; // Replace with the actual path to your AgroConnectScreen file
import 'profile.dart';
class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({Key? key}) : super(key: key);

  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final List<Map<String, dynamic>> messages = [];
  final TextEditingController _controller = TextEditingController();
  int _selectedIndex = 1; // Initialize with 1 if the Chat screen is active by default

  void sendMessage(String message) {
    if (message.isEmpty) return;
    setState(() {
      messages.insert(0, {"data": 0, "message": message});
    });
    _controller.clear();

    // Mocking bot response for demo
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        messages.insert(0, {"data": 1, "message": "This is a bot response."});
      });
    });
  }

  // Handle bottom navigation item tap
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
        title: const Text(
          'AgroGPT', // Adjusted to your app's title
          style: TextStyle(
            fontSize: 20, // Match font size with Plantix app
            fontWeight: FontWeight.bold,
            color: Colors.white, // Match AppBar color style
          ),
        ),
        backgroundColor: const Color(0xFF07480E), // Consistent with other pages
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // Add your refresh logic here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Warning message at the top
          Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.orange[100],
            child: const Text(
              'This is the beginning of a conversation with AgroGPT. This is a new service and prone to errors. Take a critical look at answers given.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                bool isUserMessage = messages[index]['data'] == 0;
                return Align(
                  alignment:
                  isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isUserMessage ? Colors.green[200] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      messages[index]['message'],
                      style: const TextStyle(
                        fontSize: 16, // Consistent font size
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Input field at the bottom
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      hintText: "Ask a question?",
                      hintStyle: const TextStyle(
                        fontSize: 16, // Matching font size
                        color: Colors.black54,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(color: Color(0xFF07480E)),
                      ),
                      contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Color(0xFF07480E)),
                  onPressed: () {
                    sendMessage(_controller.text);
                  },
                ),
              ],
            ),
          ),
        ],
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
                    'Home',
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
                    'Chat',
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
                    'Weather',
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
                    'Profile',
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

  Widget _buildNavBarItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 24,
            color: _selectedIndex == index ? const Color(0xFF07480E) : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color:
              _selectedIndex == index ? const Color(0xFF07480E) : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}