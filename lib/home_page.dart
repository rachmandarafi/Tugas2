import 'package:flutter/material.dart';
import 'login_page.dart';
import 'vehicle-data.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('Welcome, ${widget.username}!'),
            SizedBox(height: 20),

            // Banner Section
            Image.network(
              'https://via.placeholder.com/600x200', // Ganti dengan URL banner asli
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),

            // Grid Layout for Vehicles (2 columns per row)
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 10, // Space between columns
                  mainAxisSpacing: 10, // Space between rows
                  childAspectRatio:
                      3 / 2, // Adjust the aspect ratio to fit images better
                ),
                itemCount: vehicleList.length,
                itemBuilder: (context, index) {
                  final Vehicle mobil = vehicleList[index];
                  return Card(
                    elevation: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.network(
                            mobil.imageUrls[0],
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          mobil.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(mobil.type),
                        Text(mobil.price),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        child: Icon(Icons.logout),
      ),
    );
  }
}
