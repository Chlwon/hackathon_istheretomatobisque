import 'dart:math';
import 'package:flutter/material.dart';
import 'package:istheretomatobisque/result_screen.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:istheretomatobisque/voting_provider.dart';
import 'dininghall.dart';
import 'package:provider/provider.dart';
import 'pet.dart';
// import 'package:chaquopy/chaquopy.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => VotingProvider(),
      child: const Tomatobisque(),
    )
  );
}

class User {
  final String username;
  final String password;

  User(
    this.username,
    this.password,
  );
}

class Tomatobisque extends StatelessWidget {
  const Tomatobisque({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Naviation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartPage(title: "Welcome!"),
    );
  }
}

class StartPage extends StatelessWidget {
  const StartPage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 136, 28, 28),
        title: Text(title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //login button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LogIn(title: 'Welcome Back!');
                  }));
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: const Color.fromARGB(255, 136, 28, 28),
                ),
                child: const Text(
                  'LOG IN',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),  
                ),
              ),
              const SizedBox(height: 16),
              //sign up button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SignUp(title: "Welcome! Let's Get Started");
                  }));
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: const Color.fromARGB(255, 136, 28, 28),
                ),
                child: const Text(
                  'SIGN UP',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),  
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class LogIn extends StatelessWidget {
  const LogIn({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 136, 28, 28),
        title: Text(title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //input username
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none
                  ),
                  labelText: 'Username',
                fillColor: const Color.fromARGB(255, 231, 210, 210),
                filled: true,
                prefixIcon: const Icon(Icons.person)),
              ),
              const SizedBox(height: 16),
              //input password
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none
                  ),
                  labelText: 'Password',
                fillColor: const Color.fromARGB(255, 231, 210, 210),
                filled: true,
                prefixIcon: const Icon(Icons.key_rounded)),
              ),
              const SizedBox(height: 16),
              //finish login button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Navigating();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: const Color.fromARGB(255, 136, 28, 28),
              ),
                child: const Text('Log In',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),  
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [const Text("Don't have an account? "),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const SignUp(title: "Welcome! Let's Get Started");
                      }));
                    },
                    child: const Text("Sign Up", 
                      style: TextStyle(color: Color.fromARGB(255, 136, 28, 28)),)
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUp extends StatefulWidget {
  const SignUp({super.key, required this.title});
  final String title;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  List<String> data = [];
  Map<User, List<dynamic>> database = {};
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signUp() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      var user = User(username, password);
      List<String> clothes = [];
      database[user] = [0, clothes, 0];
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const Navigating();
      }));
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your username and password.'))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 136, 28, 28),
        title: Text(widget.title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //input username
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none
                  ),
                  labelText: 'Username',
                fillColor: const Color.fromARGB(255, 231, 210, 210),
                filled: true,
                prefixIcon: const Icon(Icons.person)),
              ),
              const SizedBox(height: 16),

              //input password
              TextField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none
                  ),
                  labelText: 'Password',
                  fillColor: const Color.fromARGB(255, 231, 210, 210),
                  filled: true,
                  prefixIcon: const Icon(Icons.key_rounded)
                  ),
                ),
              const SizedBox(height: 16),
              
              //sign up button
              ElevatedButton(
                onPressed: _signUp,
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: const Color.fromARGB(255, 136, 28, 28),
              ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),  
                ),
              ),
              const SizedBox(height: 16),

              //log in redirect text button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const LogIn(title: 'Welcome Back!');
                        }));
                      },
                      child: const Text(
                        "Log In", 
                        style: TextStyle(color: Color.fromARGB(255, 136, 28, 28)),)
                      )
                    ],
              ),
            ],
         ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});
  final String title;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 136, 28, 28),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //bisque availability 
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const TomatobisquePage(title: 'Tomato Bisque???');
                }));
              },
              child: Container(
                width: double.infinity,
                height: 100,
                color: Color.fromARGB(255, 223, 100, 21),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/pixelsoup.png',height:27),
                    const SizedBox(width: 15),
                    Text(
                    'Is there Tomato Bisque Soup today?\nClick to Vote!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 253, 243, 237),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    ),
                    const SizedBox(width: 15),
                    Image.asset('assets/pixelsoup.png',height:27),
                  ],
            ),
            ),
            ),
            const SizedBox(height: 24),

            //dining hall buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const FrankPage(title: 'Franklin Dining Commons');
                }));
              },
              onLongPress: () {
                Image.asset('assets/franklin _resized_0.jpg');
              },
              child: const Text('The Goat🐐'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const HampPage(title: 'Hampshire Dining Commons');
                }));
              },
              onLongPress: () {
                Image.asset('assets/Untitled.jpg');
              },
              child: const Text('Juice🧃'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const WooPage(title: 'Worcester Dining Commons');
                }));
              },
              onLongPress: () {
                Image.asset('assets/worcester_commons_new_0.jpg');
              },
              child: const Text('Maggot🐛'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const BerkPage(title: 'Berkshire Dining Commons');
                }));
              },
              onLongPress: () {
                Image.asset('assets/berkshire _resized_0.jpg');
              },
              child: const Text('Rat🐀'),
            ),
            const SizedBox(height: 16),
          ]
        )
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: SizedBox(
          height: 60.0,
          width: 60.0,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SquirrelPage(title: 'Squirrel', numDrops:5);
                }));
              },
              child: const Icon(Icons.pets),
            ),
          ),
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    ); 
  }
}

class TomatobisquePage extends StatelessWidget {
  const TomatobisquePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final votingProvider = Provider.of<VotingProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 136, 28, 28),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Do you see Tomato Bisque Soup at...',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            for (int location = 1; location <= 4; location++) ...[
              Text(
                '${votingProvider.getLocationName(location)}:',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Consumer<VotingProvider>(
                builder: (context, vote, child) {
                  final candidates = vote.getCandidatesForLocation(location);
                  final selectedId = vote.getSelectedCandidate(location);
                  return Column(
                    children: candidates.map((candidate) {
                      final isVote = selectedId == candidate.id;
                      return ListTile(
                        title: Text(candidate.name),
                        trailing: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isVote ? Colors.green : Colors.white,
                          ),
                          onPressed: () => vote.vote(location, candidate.id),
                          child: Text(
                            'Vote',
                            style: TextStyle(
                              color: isVote ? Colors.green : Colors.black,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ResultScreen()),
                );
              },
              child: const Text("View Results"),
            ),
          ],
        ),
      ),
    );
  }
}

class _RandomImage extends StatelessWidget {
  final double left;
  final double top;
  final double width;
  final double height;
  final String imagePath;
  final VoidCallback onTap; // callback when tapped

  const _RandomImage({
    required Key key,
    required this.left,
    required this.top,
    required this.width,
    required this.height,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: GestureDetector(
        onTap: onTap,
        child: Image.asset(
          imagePath,
          width: width,
          height: height,
        ),
      ),
    );
  }
}

class SquirrelPage extends StatefulWidget {
  const SquirrelPage({super.key, required this.title, required this.numDrops,});
  final String title;
  final int numDrops;

  @override
  State<SquirrelPage> createState() => _SquirrelPageState();
}

class _SquirrelPageState extends State<SquirrelPage> with SingleTickerProviderStateMixin {
  final Random _random = Random();
  final List<List<String>> _animations = [
    [
      'assets/blink/IMG_1750.png', 
      'assets/blink/IMG_1750 1.png',
      'assets/blink/IMG_1750 2.png',
      'assets/blink/IMG_1750 3.png',
      'assets/blink/IMG_1750 4.png',
      'assets/blink/IMG_1750 6.png',
      'assets/blink/IMG_1750 7.png',
    ],
    [
      'assets/electrocution/IMG_1746.png',
      'assets/electrocution/IMG_1746 1.png',
      'assets/electrocution/IMG_1746 2.png',
      'assets/electrocution/IMG_1746 3.png',
      'assets/electrocution/IMG_1746 4.png',
      'assets/electrocution/IMG_1746 5.png',
    ],
    [
      'assets/jumpsquash/IMG_1748.png',
      'assets/jumpsquash/IMG_1748 1.png',
      'assets/jumpsquash/IMG_1748 2.png',
    ],
    [
      'assets/roll/IMG_1749.png',
      'assets/roll/IMG_1749 1.png',
      'assets/roll/IMG_1749 2.png',
      'assets/roll/IMG_1749 3.png',
      'assets/roll/IMG_1749 4.png',
    ],
    [
      'assets/squash/IMG_1754.png',
      'assets/squash/IMG_1754 1.png',
    ],
    [
      'assets/squat/IMG_1751.png',
      'assets/squat/IMG_1751 1.png',
    ],
  ];
  late List<String> _currentAnimationFrames;
  final List<_RandomImage> _images = [];

  @override
  void initState() {
    super.initState();
    _pickRandomAnimation();
    _spawnImages(widget.numDrops);
  }

void _spawnImages(int count) {
  for (int i = 0; i < count; i++) {
    // Use a local key for each image
    final key = UniqueKey();
    _images.add(
      _RandomImage(
        key: key,
        left: _random.nextDouble() * 300,
        top: _random.nextDouble() * 500,
        width: 80,
        height: 80,
        imagePath: 'assets/pixilart-drawing.png',
        onTap: () {
          // Remove this image from the list
          setState(() {
            _images.removeWhere((img) => img.key == key);
          });
        },
      ),
    );
  }
  setState(() {});
}



  void _pickRandomAnimation() {
    final random = Random();
    _currentAnimationFrames =
        _animations[random.nextInt(_animations.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SizedBox.expand(
        child: Stack(
          children: [
            const SizedBox(height: 20),
            Center(
              child: FrameAnimation(
                animations: _animations,
                width: 400,
                height: 400, 
              ),
            ),
            const SizedBox(height: 20),
            ..._images,
          ],
        ),
      ),
    );
  }
}


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.title});
  final String title;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final List<String> imageOptions = [
    'assets/pixelsoup.png',
    'assets/blink/IMG_1750 2.png',
    'assets/electrocution/IMG_1746 3.png',
    'assets/fall/IMG_1752.png',
    'assets/jumpsquash/IMG_1748 2.png',
    'assets/roll/IMG_1749 4.png',
    'assets/squat/IMG_1751 1.png',
    'assets/walk/IMG_1745 3.png',
    'assets/squash/IMG_1754 1.png',
  ];
  
  String selectedImage = 'assets/pixelsoup.png';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 136, 28, 28),
        title: Text(widget.title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,),
        ),
        automaticallyImplyLeading: false,
      ),

      body: Column(
  children: [
    const SizedBox(height: 20),
    
    // chosen image
    Image.asset(
      selectedImage,
      height: 150,
    ),

    const SizedBox(height: 20),

    //scroll grid of options
    Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: imageOptions.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // three per row
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final imagePath = imageOptions[index];
          final isSelected = imagePath == selectedImage;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedImage = imagePath;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected ? Colors.green : Colors.grey.shade400,
                  width: isSelected ? 3 : 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    ),
  ],
),



      /*
      body: Stack(
        alignment: Alignment.center,
        children: [
          //hovering pfp
          Positioned(
            top: (MediaQuery.of(context).size.height * 0.2), 
            child: Image.asset(
              selectedImage,height: 100,),
          ),

          Positioned(
            bottom: 0,
            left: 16,
            right: 16,
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: imageOptions.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // three per row
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final imagePath = imageOptions[index];
                final isSelected = imagePath == selectedImage;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedImage = imagePath;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSelected
                            ? Colors.green
                            : Colors.grey.shade400,
                        width: isSelected ? 3 : 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      */
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: SizedBox(
          height: 60.0,
          width: 60.0,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SquirrelPage(title: 'Squirrel', numDrops:5);
                }));
              },
              child: const Icon(Icons.pets),
            ),
          ),
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

class Navigating extends StatefulWidget {
  const Navigating({Key? key}) : super(key: key);

  @override
  State<Navigating> createState() => _NavigatingState();
}

class _NavigatingState extends State<Navigating> {
  int _selectedIndex = 0;
  final List<List<String>> _animations = [
    [
      'assets/blink/IMG_1750.png', 
      'assets/blink/IMG_1750 1.png',
      'assets/blink/IMG_1750 2.png',
      'assets/blink/IMG_1750 3.png',
      'assets/blink/IMG_1750 4.png',
      'assets/blink/IMG_1750 6.png',
      'assets/blink/IMG_1750 7.png',
    ],
    [
      'assets/electrocution/IMG_1746.png',
      'assets/electrocution/IMG_1746 1.png',
      'assets/electrocution/IMG_1746 2.png',
      'assets/electrocution/IMG_1746 3.png',
      'assets/electrocution/IMG_1746 4.png',
      'assets/electrocution/IMG_1746 5.png',
    ],
    [
      'assets/fall/IMG_1752.png',
      'assets/fall/IMG_1752 1.png',
    ],
    [
      'assets/jumpsquash/IMG_1748.png',
      'assets/jumpsquash/IMG_1748 1.png',
      'assets/jumpsquash/IMG_1748 2.png',
    ],
    [
      'assets/roll/IMG_1749.png',
      'assets/roll/IMG_1749 1.png',
      'assets/roll/IMG_1749 2.png',
      'assets/roll/IMG_1749 3.png',
      'assets/roll/IMG_1749 4.png',
    ],
    [
      'assets/squash/IMG_1754.png',
      'assets/squash/IMG_1754 1.png',
    ],
    [
      'assets/squat/IMG_1751.png',
      'assets/squat/IMG_1751 1.png',
    ],
    [
      'assets/walk/IMG_1745.png',
      'assets/walk/IMG_1745 1.png',
      'assets/walk/IMG_1745 2.png',
      'assets/walk/IMG_1745 3.png',
    ],
  ];

  late List<String> _currentAnimationFrames;

  @override
  void initState() {
    super.initState();
    _pickRandomAnimation();
  }

  void _pickRandomAnimation() {
    final random = Random();
    _currentAnimationFrames =
        _animations[random.nextInt(_animations.length)];
  }
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pickRandomAnimation(); // pick new animation when switching tabs
    });
  }

  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(title: 'Home'),
    SettingsPage(title: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _widgetOptions.elementAt(_selectedIndex),
          Positioned(
            bottom: 10,
            left: MediaQuery.of(context).size.width / 2 - 75,
            child: FrameAnimation(
              animations: _animations,
              width: 150,
              height: 150, 
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.red,
        unselectedItemColor: const Color.fromARGB(255, 151, 103, 100),
      ),
    );
  } 
}