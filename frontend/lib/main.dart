import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import for date formatting

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'City Taxi Pvt',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFE6B300)),
        scaffoldBackgroundColor: Color.fromARGB(255, 153, 153, 153),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _telephoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true; // Toggle for password visibility

  String get currentDate =>
      DateFormat('yyyy-MMMM-dd, EEEE').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'City Taxi Login',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
        backgroundColor: const Color(0xFFE6B300),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Today is: $currentDate',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 20),
            Center(
              child: Image.asset('assets/logo.png', height: 80),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _telephoneController,
                      decoration: InputDecoration(
                        labelText: 'Telephone',
                        border: const OutlineInputBorder(),
                        prefixIcon:
                            const Icon(Icons.phone, color: Color(0xFFE6B300)),
                        labelStyle: const TextStyle(color: Colors.white),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFE6B300)),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your telephone number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: const OutlineInputBorder(),
                        prefixIcon:
                            const Icon(Icons.lock, color: Color(0xFFE6B300)),
                        labelStyle: const TextStyle(color: Colors.white),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFE6B300)),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color(0xFFE6B300),
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Handle login logic here
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: const Color(0xFFE6B300),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 20, // Set font size to 20
                          fontWeight: FontWeight.bold, // Make the text bold
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the Register page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: const Color(0xFFE6B300),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 20, // Set font size to 20
                          fontWeight: FontWeight.bold, // Make the text bold
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to reset password page
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: const Color(0xFFE6B300),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text(
                        'Reset Password',
                        style: TextStyle(
                          fontSize: 20, // Set font size to 20
                          fontWeight: FontWeight.bold, // Make the text bold
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Exit the app
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xFFE6B300),
                        backgroundColor: Colors.black,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text(
                        'Exit',
                        style: TextStyle(
                          fontSize: 20, // Set font size to 20
                          fontWeight: FontWeight.bold, // Make the text bold
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Align(
                      alignment:
                          Alignment.centerRight, // Align text to the right
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.end, // Align text to the end
                        children: [
                          Text(
                            'HotLine : 119',
                            style: TextStyle(
                              color: const Color(0xFFE6B300), // Highlight color
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              letterSpacing: 2.0, // Gap between letters
                              wordSpacing: 4.0, // Space between words
                              decoration: TextDecoration
                                  .none, // Remove default underline
                            ),
                          ),
                          const SizedBox(
                              height: 1), // Space between text and underline
                          Container(
                            height: 3, // Thickness of the underline
                            width: 150, // Adjust width as needed
                            color: Colors.red, // Color of the underline
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    const Text(
                      'LMU-CSE Advanced Software Eng, Group Project',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
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

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'City Taxi Register',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        backgroundColor: const Color(0xFFE6B300),
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 8.0), // Shorter side padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 20),
            Center(
                //  child: Image.asset('assets/logo.png', height: 80,),
                ),
            const SizedBox(height: 25),
            const Text(
              'Welcome to City Taxi (PVT) Ltd!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Image.asset('assets/logo.png', height: 50),
            ),
            const SizedBox(height: 20),
            const Text(
              'We are committed to ensuring you reach your destination safely and efficiently, '
              'or that you drive with ease and support. Register now to start your journey with City Taxi!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 400,
                      margin: const EdgeInsets.only(
                          right: 4.0), // Smaller margin on the right
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 10.0), // Adjust padding inside
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Register as Passenger',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Experience convenience and comfort with our easy-to-use system. Register to:',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            '* Reserve taxis with just a few clicks.\n'
                            '* Get real-time updates on driver and vehicle details.\n'
                            '* Enjoy seamless payment options and receive instant confirmations.',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PassengerRegisterPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: const Color(0xFFE6B300),
                              minimumSize: const Size(double.infinity,
                                  45), // Button with full width
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Passenger Register',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 400,
                      margin: const EdgeInsets.only(
                          left: 4.0), // Smaller margin on the left
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 10.0), // Adjust padding inside
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Register as Driver',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 25),
                          const Text(
                            'Join our team and be part of a company that values your time. Register now to:',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            '* Manage availability and receive trip requests.\n'
                            '* Stay connected with our mobile-friendly platform.\n'
                            '* Receive timely payments for completed trips.',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                //nasviogsate to driver regisor
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DriverBasicInfoPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: const Color(0xFFE6B300),
                              minimumSize: const Size(double.infinity,
                                  45), // Button with full width
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Driver Register',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
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
}

class PassengerRegisterPage extends StatefulWidget {
  @override
  _PassengerRegisterPageState createState() => _PassengerRegisterPageState();
}

class _PassengerRegisterPageState extends State<PassengerRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _nicController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late TextEditingController _emailController;
  late TextEditingController _phoneNoController;
  late TextEditingController _address1Controller;
  late TextEditingController _address2Controller;
  late TextEditingController _zipController;
  late TextEditingController _districtController;
  late TextEditingController _emergencyContactController;
  late TextEditingController _birthdayController;

  String? _gender; //Defalult male
  String? _district; // Default district
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _nicController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNoController = TextEditingController();
    _address1Controller = TextEditingController();
    _address2Controller = TextEditingController();
    _zipController = TextEditingController();
    _districtController = TextEditingController();
    _emergencyContactController = TextEditingController();
    _birthdayController = TextEditingController();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _nicController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _emailController.dispose();
    _phoneNoController.dispose();
    _address1Controller.dispose();
    _address2Controller.dispose();
    _zipController.dispose();
    _districtController.dispose();
    _emergencyContactController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    if (value == null || value.length < 3) {
      return 'Name must be at least 3 characters long';
    }
    return null;
  }

  String? _validateNIC(String? value) {
    if (value == null || (value.length != 10 && value.length != 12)) {
      return 'NIC must be either 10 or 12 characters long';
    }
    if (value.length == 10) {
      if (!RegExp(r'^\d{9}[VX]$').hasMatch(value)) {
        return 'NIC must be 9 digits followed by V or X';
      }
    } else if (value.length == 12) {
      if (!RegExp(r'^\d{12}$').hasMatch(value)) {
        return 'NIC must be 12 digits';
      }
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$')
        .hasMatch(value)) {
      return 'Password must include uppercase, lowercase, and a number';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null ||
        !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
            .hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePhoneNo(String? value) {
    if (value == null ||
        value.length != 10 ||
        !RegExp(r'^\d{10}$').hasMatch(value)) {
      return 'Phone number must be 10 digits';
    }
    return null;
  }

  String? _validateBirthday(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your birthday';
    }

    // Attempt to parse the date
    final DateTime? date = DateFormat('yyyy-MM-dd').parseStrict(value);

    if (date == null) {
      return 'Invalid date format';
    }

    final DateTime today = DateTime.now();
    if (date.isAfter(today)) {
      return 'Future dates are not allowed';
    }

    // Calculate the minimum date (18 years ago from today)
    final DateTime minDate = DateTime(today.year - 18, today.month, today.day);
    if (date.isAfter(minDate)) {
      return 'You must be 18 years old or older';
    }

    return null;
  }

  String? _validateAddress(String? value) {
    if (value == null || value.length < 3) {
      return 'Address and City must be at least 3 characters long';
    }
    return null;
  }

  String? _validateZipCode(String? value) {
    if (value == null ||
        value.length != 5 ||
        !RegExp(r'^\d{5}$').hasMatch(value)) {
      return 'ZIP Code must be 5 digits';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Passenger Registration'),
        backgroundColor: const Color(0xFFE6B300),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 20),
                Center(
                  child: Image.asset('assets/logo.png', height: 80),
                ),
                TextFormField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                    labelStyle:
                        TextStyle(color: Colors.white), // Label text color
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xFFE6B300)), // Border color on focus
                    ),
                  ),
                  style: TextStyle(color: Colors.white), // Text color
                  validator: _validateName,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                    labelStyle:
                        TextStyle(color: Colors.white), // Label text color
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xFFE6B300)), // Border color on focus
                    ),
                  ),
                  style: TextStyle(color: Colors.white), // Text color
                  validator: _validateName,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _nicController,
                  decoration: const InputDecoration(
                    labelText: 'NIC',
                    labelStyle:
                        TextStyle(color: Colors.white), // Label text color
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xFFE6B300)), // Border color on focus
                    ),
                  ),
                  style: TextStyle(color: Colors.white), // Text color
                  validator: _validateName,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: const TextStyle(color: Colors.white),
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE6B300)),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white, //icon colour
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                  style: const TextStyle(color: Colors.white), //pw colour
                  obscureText: !_passwordVisible,
                  validator: _validatePassword,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE6B300)),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  obscureText: !_passwordVisible,
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle:
                        TextStyle(color: Colors.white), // Label text color
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xFFE6B300)), // Border color on focus
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: _validateEmail,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _phoneNoController,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle:
                        TextStyle(color: Colors.white), // Label text color
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xFFE6B300)), // Border color on focus
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: _validatePhoneNo,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  //user must enter BD
                  controller: _birthdayController,
                  decoration: const InputDecoration(
                    labelText: 'Birthday (yyyy-MM-dd)',
                    labelStyle:
                        TextStyle(color: Colors.white), // Label text color
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xFFE6B300)), // Border color on focus
                    ),
                  ),
                  keyboardType: TextInputType.datetime,
                  validator: _validateBirthday,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _gender,
                  items: ['Male', 'Female', 'Other']
                      .map((gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(gender,
                                style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255))), //dropdown color
                          ))
                      .toList(),
                  decoration: const InputDecoration(
                    labelText: 'Gender',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE6B300)),
                    ),
                  ),
                  dropdownColor: Color.fromARGB(
                      255, 0, 0, 0), // Set dropdown menu background color
                  style: const TextStyle(
                      color: Color.fromARGB(
                          255, 143, 142, 142)), // Text color in the dropdown
                  onChanged: (value) {
                    setState(() {
                      _gender = value!;
                    });
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _address1Controller,
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    labelStyle:
                        TextStyle(color: Colors.white), // Label text color
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xFFE6B300)), // Border color on focus
                    ),
                  ),
                  validator: _validateAddress,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _address2Controller,
                  decoration: const InputDecoration(
                    labelText: 'City',
                    labelStyle:
                        TextStyle(color: Colors.white), // Label text color
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xFFE6B300)), // Border color on focus
                    ),
                  ),
                  validator: _validateAddress,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _zipController,
                  decoration: const InputDecoration(
                    labelText: 'ZIP Code',
                    labelStyle:
                        TextStyle(color: Colors.white), // Label text color
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xFFE6B300)), // Border color on focus
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: _validateZipCode,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _district,
                  items: [
                    'Colombo',
                    'Gampaha',
                    'Kalutara',
                    'Kandy',
                    'Matale',
                    'Nuwara Eliya',
                    'Galle',
                    'Matara',
                    'Hambantota',
                    'Jaffna',
                    'Kilinochchi',
                    'Mannar',
                    'Vavuniya',
                    'Mullaitivu',
                    'Batticaloa',
                    'Ampara',
                    'Trincomalee',
                    'Kurunegala',
                    'Puttalam',
                    'Anuradhapura',
                    'Polonnaruwa',
                    'Badulla',
                    'Moneragala',
                    'Ratnapura',
                    'Kegalle',
                  ]
                      .map((district) => DropdownMenuItem(
                            value: district,
                            child: Text(district,
                                style: TextStyle(
                                    color: const Color.fromARGB(
                                        //dropdown font colour
                                        255,
                                        255,
                                        255,
                                        255))),
                          ))
                      .toList(),
                  decoration: const InputDecoration(
                    labelText: 'District',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE6B300)),
                    ),
                  ),
                  dropdownColor: Color.fromARGB(
                      255, 0, 0, 0), // Set dropdown menu background color
                  style: const TextStyle(
                      color: Color.fromARGB(
                          255, 143, 142, 142)), // Text color in the dropdown
                  onChanged: (value) {
                    setState(() {
                      _district = value!;
                    });
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emergencyContactController,
                  decoration: const InputDecoration(
                    labelText: 'Emergency Contact',
                    labelStyle:
                        TextStyle(color: Colors.white), // Label text color
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xFFE6B300)), // Border color on focus
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: _validatePhoneNo,
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE6B300),
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Process the registration
                      // You can handle your registration logic here
                    }
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DriverBasicInfoPage extends StatefulWidget {
  @override
  _DriverBasicInfoPageState createState() => _DriverBasicInfoPageState();
}

class _DriverBasicInfoPageState extends State<DriverBasicInfoPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _nicController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _address1Controller = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _passwordVisible = false;
  DateTime? _selectedDate;
  int? _age;
  String? _district;
  String _gender = 'Male'; //defalut male, most drivers are male

  @override
  void dispose() {
    _lastNameController.dispose();
    _nicController.dispose();
    _emailController.dispose();
    _phoneNoController.dispose();
    _address1Controller.dispose();
    _cityController.dispose();
    _zipController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    if (value == null || value.length < 3) {
      return 'Name must be at least 3 characters long';
    }
    return null;
  }

  String? _validateNIC(String? value) {
    if (value == null || (value.length != 10 && value.length != 12)) {
      return 'NIC must be either 10 or 12 characters long';
    }
    if (value.length == 10) {
      if (!RegExp(r'^\d{9}[VX]$').hasMatch(value)) {
        return 'NIC must be 9 digits followed by V or X';
      }
    } else if (value.length == 12) {
      if (!RegExp(r'^\d{12}$').hasMatch(value)) {
        return 'NIC must be 12 digits';
      }
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$')
        .hasMatch(value)) {
      return 'Password must include uppercase, lowercase, and a number';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null ||
        !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
            .hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePhoneNo(String? value) {
    if (value == null ||
        value.length != 10 ||
        !RegExp(r'^\d{10}$').hasMatch(value)) {
      return 'Phone number must be 10 digits';
    }
    return null;
  }

  String? _validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an address';
    }
    return null;
  }

  String? _validateZipCode(String? value) {
    if (value == null || value.isEmpty || !RegExp(r'^\d{5}$').hasMatch(value)) {
      return 'Enter a valid ZIP code';
    }
    return null;
  }

  String? _validateDistrict(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a district';
    }
    return null;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _age = DateTime.now().year - picked.year;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driver Basic Information'),
        backgroundColor: const Color(0xFFE6B300),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 20),
              Center(
                child: Image.asset('assets/logo.png', height: 80),
              ),
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(
                  labelText: 'First Name',
                  labelStyle:
                      TextStyle(color: Colors.white), // Label text color
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFFE6B300)), // Border color on focus
                  ),
                ),
                style: TextStyle(color: Colors.white), // Text color
                validator: _validateName,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                  labelStyle:
                      TextStyle(color: Colors.white), // Label text color
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFFE6B300)), // Border color on focus
                  ),
                ),
                style: TextStyle(color: Colors.white), // Text color
                validator: _validateName,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nicController,
                decoration: const InputDecoration(
                  labelText: 'NIC',
                  labelStyle:
                      TextStyle(color: Colors.white), // Label text color
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFFE6B300)), // Border color on focus
                  ),
                ),
                style: TextStyle(color: Colors.white), // Text color
                validator: _validateNIC,
              ),
              const SizedBox(height: 16),
              TextFormField(
                //driver has to pic from dropdown
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Birthday',
                  labelStyle:
                      TextStyle(color: Colors.white), // Label text color
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFFE6B300)), // Border color on focus
                  ),
                ),
                style: TextStyle(color: Colors.white), // Text color
                onTap: () => _selectDate(context),
                controller: TextEditingController(
                  text: _selectedDate != null
                      ? DateFormat('yyyy-MM-dd').format(_selectedDate!)
                      : '',
                ),
              ),
              const SizedBox(height: 16),
              if (_age != null)
                Text('Age: $_age', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
              if (_age != null && (_age! < 25 || _age! > 55))
                const Text(
                  'Driver age must be between 25 and 55',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _gender,
                items: ['Male', 'Female', 'Other']
                    .map((gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender,
                              style: TextStyle(
                                  color: const Color.fromARGB(
                                      255, 255, 255, 255))), //dropdown color
                        ))
                    .toList(),
                decoration: const InputDecoration(
                  labelText: 'Gender',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE6B300)),
                  ),
                ),
                dropdownColor: Color.fromARGB(
                    255, 0, 0, 0), // Set dropdown menu background color
                style: const TextStyle(
                    color: Color.fromARGB(
                        255, 143, 142, 142)), // Text color in the dropdown
                onChanged: (value) {
                  setState(() {
                    _gender = value!;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _address1Controller,
                decoration: const InputDecoration(
                  labelText: 'Address',
                  labelStyle:
                      TextStyle(color: Colors.white), // Label text color
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFFE6B300)), // Border color on focus
                  ),
                ),
                validator: _validateAddress,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _cityController,
                decoration: const InputDecoration(
                  labelText: 'City',
                  labelStyle:
                      TextStyle(color: Colors.white), // Label text color
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFFE6B300)), // Border color on focus
                  ),
                ),
                validator: _validateAddress,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _zipController,
                decoration: const InputDecoration(
                  labelText: 'ZIP Code',
                  labelStyle:
                      TextStyle(color: Colors.white), // Label text color
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFFE6B300)), // Border color on focus
                  ),
                ),
                validator: _validateZipCode,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _district,
                items: [
                  'Colombo',
                  'Gampaha',
                  'Kalutara',
                  'Kandy',
                  'Matale',
                  'Nuwara Eliya',
                  'Galle',
                  'Matara',
                  'Hambantota',
                  'Jaffna',
                  'Kilinochchi',
                  'Mannar',
                  'Vavuniya',
                  'Mullaitivu',
                  'Batticaloa',
                  'Ampara',
                  'Trincomalee',
                  'Kurunegala',
                  'Puttalam',
                  'Anuradhapura',
                  'Polonnaruwa',
                  'Badulla',
                  'Moneragala',
                  'Ratnapura',
                  'Kegalle',
                ]
                    .map((district) => DropdownMenuItem(
                          value: district,
                          child: Text(district,
                              style: TextStyle(
                                  color: const Color.fromARGB(
                                      //dropdown font colour
                                      255,
                                      255,
                                      255,
                                      255))),
                        ))
                    .toList(),
                decoration: const InputDecoration(
                  labelText: 'District',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE6B300)),
                  ),
                ),
                dropdownColor: Color.fromARGB(
                    255, 0, 0, 0), // Set dropdown menu background color
                style: const TextStyle(
                    color: Color.fromARGB(
                        255, 143, 142, 142)), // Text color in the dropdown
                onChanged: (value) {
                  setState(() {
                    _district = value!;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle:
                      TextStyle(color: Colors.white), // Label text color
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFFE6B300)), // Border color on focus
                  ),
                ),
                validator: _validateEmail,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneNoController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  labelStyle:
                      TextStyle(color: Colors.white), // Label text color
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFFE6B300)), // Border color on focus
                  ),
                ),
                validator: _validatePhoneNo,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Colors.white),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.white, //icon colour
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
                style: const TextStyle(color: Colors.white), //Pw colour

                validator: _validatePassword,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE6B300)),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                obscureText: !_passwordVisible,
                validator: (value) {
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: const Color(0xFFE6B300), // Text color
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                    // Process the form data here
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Define the DrivingLicensePage as needed
class DrivingLicensePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driving License Information'),
        backgroundColor: const Color(0xFFE6B300),
      ),
      body: Center(
        child: const Text('Driving License Page Content'),
      ),
    );
  }
}
