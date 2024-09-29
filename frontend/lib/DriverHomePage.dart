import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DriverHomePage extends StatelessWidget {
  final String driverName;

  DriverHomePage({required this.driverName});

  @override
  Widget build(BuildContext context) {
    // Get the current date
    String currentDate =
        DateFormat('yyyy-MMMM-dd, EEEE').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hi, $driverName!',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color(0xFFE6B300), // Golden yellow
        centerTitle: true,
        toolbarHeight: 80,
        elevation: 5,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Current date
              Text(
                'Today is: $currentDate',
                style: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 20),

              // Logo
              Center(
                child: Image.asset('assets/logo.png', height: 100),
              ),
              const SizedBox(height: 20),

              // "Let’s Ride" button
              _buildMenuButton(
                context,
                icon: Icons.drive_eta,
                label: 'Let’s Ride',
                onPressed: () {
                  // Navigate or handle Ride press
                },
              ),
              const SizedBox(height: 30),

              // About section
              _buildAboutSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildMenuButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 30, color: Colors.white),
      label: Text(
        label,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFE6B300),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 10,
        shadowColor: Colors.grey.withOpacity(0.5),
      ),
    );
  }

  Widget _buildAboutSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About City Taxi (PVT) Ltd',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'City Taxi (PVT) Ltd is a leading transportation service provider that focuses on offering reliable, convenient, and affordable taxi services...',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 10),
          const Text(
            '- Our Mission: At City Taxi, our mission is to ensure passengers can travel safely, comfortably, and efficiently to their destinations.',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 10),
          const Text(
            'Why Choose City Taxi?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            '- Performance: We prioritize getting passengers where they need to be promptly and safely.\n'
            '- Superior Service: City Taxi is dedicated to delivering exceptional customer service.\n'
            '- Quality: Clean and well-maintained vehicles with experienced drivers ensure a great ride.\n',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 6,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildVerticalButton(
              context,
              icon: Icons.home,
              label: 'Home',
              onPressed: () {
                // Reload this Page
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => DriverHomePage(driverName: driverName),
                ));
              },
            ),
            _buildVerticalButton(
              context,
              icon: Icons.local_activity,
              label: 'Activities',
              onPressed: () {
                // Handle Activities button press
              },
            ),
            _buildVerticalButton(
              context,
              icon: Icons.notifications,
              label: 'Notifications',
              onPressed: () {
                // Handle Notifications button press
              },
            ),
            _buildVerticalButton(
              context,
              icon: Icons.car_repair,
              label: 'Add Vehicle',
              onPressed: () {
                // Handle Add Vehicle button press
              },
            ),
            const SizedBox(height: 200),
            _buildVerticalButton(
              context,
              icon: Icons.person,
              label: 'Profile',
              onPressed: () {
                // Handle Profile button press
              },
            ),
          ],
        ),
      ),
      color: const Color(0xFFE6B300),
    );
  }

  Widget _buildVerticalButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, color: Colors.black),
          onPressed: onPressed,
          iconSize: 30,
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.black, fontSize: 14),
        ),
      ],
    );
  }
}
