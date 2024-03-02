import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

bool rememberMe = false;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'basic app',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Homescreen(),
    );
  }
}

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0249A7),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 0), // Adjust spacing between images
                _buildRotatedImage(
                    'assets/images/hero1.jpg',
                    100,
                    100,
                    BoxFit.contain,
                    -0.4), // Rotate hero1 anticlockwise by 0.4 radians
                SizedBox(width: 50), // Adjust spacing between images
                _buildRotatedImage('assets/images/hero3.jpg', 100, 100,
                    BoxFit.cover, -.2), // No rotation for hero3
              ],
            ),
            SizedBox(height: 40), // Adjust spacing between rows
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 30), // Adjust spacing between images
                _buildRotatedImage(
                    'assets/images/hero3.jpg',
                    100,
                    100,
                    BoxFit.cover,
                    .4), // No rotation for hero3 (second occurrence)
                SizedBox(width: 30), // Adjust spacing between images
                _buildRotatedImage('assets/images/hero2.jpg', 200, 200,
                    BoxFit.cover, -0.3), // No rotation for hero2
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 50), // Adjust spacing between images and text
                  Text(
                    "Let's Get",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 0), // Adjust spacing between images and text
                  Text(
                    "Started!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 0), // Set the right margin to 60
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 20), // Adjust spacing between images and text
                  Text(
                    "A penny saved is a penny earned",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 30,
                        right: 30), // Set the left and right margin to 20
                    child: SizedBox(
                      height: 50,
                      width: 600,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Adjust the border radius
                          ),
                        ),
                        child: Text("Join Now",
                            style: TextStyle(
                              color: Color(0xFF0249A7),
                              fontSize: 20,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                      height:
                          10), // Adjust spacing between the button and the text
                  TextButton(
                    onPressed: () {
                      // Navigate to the login page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      'Already have an account? Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
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

  Widget _buildRotatedImage(
      String asset, double height, double width, BoxFit fit, double angle) {
    return Transform.rotate(
      angle:
          angle, // Angle in radians, negative for anticlockwise rotation, positive for clockwise rotation
      child: _buildRoundedImage(asset, height, width, fit),
    );
  }

  Widget _buildRoundedImage(
      String asset, double height, double width, BoxFit fit) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        asset,
        height: height,
        width: width,
        fit: fit,
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Hi Welcome back!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Hello again, you have been missed',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email address',
                  hintText: 'Enter your email address',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  suffixIcon: Icon(Icons.visibility),
                  border: OutlineInputBorder(),
                ),
                obscureText: true, // Hide password
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Checkbox(
                    value: rememberMe,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = value!;
                      });
                    },
                  ),
                  Text('Remember me'),
                ],
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: SizedBox(
                  height: 50,
                  width: 600,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0249A7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10), // Adjust the border radius
                      ),
                    ),
                    child: Text("Login",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Register',
                        style: TextStyle(
                          color: Color(0xFF0249A7),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool agree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Create Account',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Start saving money today!',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email address',
                  hintText: 'Enter your email address',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    width: 90,
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey), // Border color
                      borderRadius: BorderRadius.circular(5.0), // Border radius
                    ),
                    padding: EdgeInsets.all(8.0), // Padding inside container
                    child: Text(
                      '+91',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Mobile number',
                        hintText: 'Enter your phone number',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Pass word',
                  hintText: 'Enter your password',
                  suffixIcon: Icon(Icons.visibility),
                  border: OutlineInputBorder(),
                ),
                obscureText: true, // Hide password
              ),
              SizedBox(height: 50),
              // Define a boolean variable to track the checkbox state

// Inside the build method:
              Row(
                children: [
                  Checkbox(
                    value:
                        agree, // Set the value based on the rememberMe variable
                    onChanged: (value) {
                      // Update the rememberMe variable when the checkbox state changes
                      setState(() {
                        agree = value!;
                      });
                    },
                  ),
                  Text('I agree to the terms and conditions'),
                ],
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.only(
                    left: 30, right: 30), // Set the left and right margin to 20
                child: SizedBox(
                  height: 50,
                  width: 600,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0249A7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10), // Adjust the border radius
                      ),
                    ),
                    child: Text("Sign Up",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ), // Adjust spacing between the button and the text
              TextButton(
                onPressed: () {
                  // Navigate to the login page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(
                      color: Colors.black, // Default text color
                      fontSize: 16,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: Color(0xFF0249A7), // Blue text color
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
