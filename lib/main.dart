import 'package:flutter/material.dart';
import 'package:flutter/src/material/floating_action_button.dart';
import 'change_password_page.dart';
import 'feedback_page.dart';
import 'signup_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Parking App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: LoginPage(),
      routes: {
        '/signup': (context) => SignupPage(),
      }
    );
  }
}

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isForgotPasswordVisible = false;

  void login() {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    if (email == 'nuraisyah@gmail.com' && password == 'nuraisyah') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } else {
      setState(() {
        isForgotPasswordVisible = true;
      });
    }
  }

  void forgotPassword() {
    // Implement the forgot password logic here
    // You can navigate to a new page or show a dialog
    print('Forgot Password');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        elevation: 100.50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(360)),

      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(
              Icons.car_rental_outlined,
              size: 100,
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),

            Visibility(
              visible: isForgotPasswordVisible,
              child: TextButton(
                onPressed: forgotPassword,
                child: Text(
                  'Wrong username or password',
                  style: TextStyle(
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: login,
              child: Text('Login'),
            ),

            // Add your login form widgets here
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text(
                'No account? Sign up here.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {

  // int _selectedIndex = 0;
  //void _onItemapped(int index){
  // setState((){
  //  _selectedIndex = 0;
  //}
  // );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Parking Pro'),
          actions: [
            IconButton(
              icon: Icon(Icons.settings), onPressed: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Settings'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.lock),
                  title: Text('Change Password'),
                  onTap: () {
                    Navigator.pop(context);
                    // Navigate to ChangePasswordPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangePasswordPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Log Out'),
                    onTap: () {
                      Navigator.pop(context);
                      // Log out functionality
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                ),
              ],
            ),
          );
        },
      );
    },
    ),

            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'myFavourite') {
                  // Handle "My Favourite" item
                } else if (value == 'history') {
                  // Handle "History" item
                }
              },
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  value: 'myFavourite',
                  child: Row(
                    children: [
                      Icon(Icons.favorite, color: Colors.red),
                      SizedBox(width: 8),
                      Text('My Favourite'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'history',
                  child: Row(
                    children: [
                      Icon(Icons.history, color: Colors.black54),
                      SizedBox(width: 8),
                      Text('History'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person,
                size: 50,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ),
                  );
                },
                child: Text('View Profile'),
              ),
              Icon(
                Icons.location_on_outlined,
                color: Colors.blue,
                size: 50,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ParkingMapPage(),
                    ),
                  );
                }, child: Text('Find Parking'),

              ),
              Icon(
                Icons.notifications_active_outlined,
                color: Colors.green,
                size: 50,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FeedbackPage(),
                    ),
                  );
                },child:Text('Notification'),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          elevation: 8.0,
          child: Icon(Icons.home),
          onPressed: (){
            print('HI');
          },


          /* bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon:Icon(Icons.home),
              //title: Text('Home'),
          ),
        BottomNavigationBarItem(
          icon:Icon(Icons.bookmark_border_outlined),
          //title: Text('Home'),
        ),
      BottomNavigationBarItem(
        icon:Icon(Icons.calendar_month),
        //title: Text('Home'),
      ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.yellow,
        onTap: _onItemapped,*/

        )
    );

  }
}

class ParkingMapPage extends StatefulWidget {
  @override
  _ParkingMapPageState createState() => _ParkingMapPageState();
}

class _ParkingMapPageState extends State<ParkingMapPage> {
  List<String> availableSlots = [
    'A1',
    'A2',
    'B1',
    'B2',
    'C1',
    'C2',
    'D1',
    'D2',
  ];
  String selectedSlot = 'A1';

  void selectSlot(String slot) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Parking'),
          content: Text('Do you want to park in slot $slot?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('Confirm'),
              onPressed: () {
                setState(() {
                  selectedSlot = slot;
                });
                Navigator.pop(context);
                showParkingConfirmationDialog();
              },
            ),
          ],
        );
      },
    );
  }

  void showParkingConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Parking Confirmation'),
          content: Text('You have successfully parked in slot $selectedSlot.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context);
                navigateToHomePage();
              },
            ),
          ],
        );
      },
    );
  }

  void navigateToHomePage() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false,
    );
  }

  void showHistoryMenu() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Parking History'),
          content: Text('Display the parking history here.'),
          actions: [
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildSlotButton(String slot) {
    final isSelected = slot == selectedSlot;
    final backgroundColor = isSelected ? Colors.green : Colors.grey;

    return ElevatedButton(
      onPressed: () {
        selectSlot(slot);
      },
      style: ElevatedButton.styleFrom(
        primary: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(
        slot,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parking Map'),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: showHistoryMenu,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'AEON Mall Parking',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              children: availableSlots.map((slot) {
                return buildSlotButton(slot);
              }).toList(),
            ),
            SizedBox(height: 20),
            Text(
              selectedSlot.isNotEmpty ? 'Selected Slot: $selectedSlot' : 'No Slot Selected',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  double accountBalance = 100.0;

  void reloadBalance() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Reload Balance'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text('Online Banking'),
                onTap: () {
                  // Handle online banking top-up
                  // Implement the logic for online banking top-up here
                  Navigator.pop(context);
                  // Show a success dialog or perform any necessary actions
                  print('Online Banking top-up selected');
                },
              ),

              ListTile(
                leading: Icon(Icons.credit_card),
                title: Text('Visa Card'),
                onTap: () {
                  // Handle Visa card top-up
                  // Implement the logic for Visa card top-up here
                  Navigator.pop(context);
                  // Show a success dialog or perform any necessary actions
                  print('Visa Card top-up selected');
                },
              ),
            ],
          ),
        );
      },
    );

    setState(() {
      // Simulating balance reload
      accountBalance += 50.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.blue,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.person_pin,
                  size: 80,
                  color: Colors.white,
                ),
                SizedBox(height: 10),
                Text(
                  'Welcome, Nur Aisyah!',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(height: 5),
                Text(
                  'nuraisyah@gmail.com',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),

          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Account Balance: \$${accountBalance.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: reloadBalance,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.monetization_on),
                        SizedBox(width: 8),
                        Text('Reload balance'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  icon: Icon(Icons.logout),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.home),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
