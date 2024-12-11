import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/product.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // List of products in the inventory
  final List<Product> products = [
    Product(
      name: 'Water Pipe',
      description:
          'Proprietorship based firm, involved as the "Manufacturer" of HDPE Pipes, PVC Pipe, and much more. All our products are getting widely acclaimed among the large clientele for their exclusive designs, superior quality, and reliability. Apart from this, our ability to maintain timelines as well as quality in the assortment, providing cost-effective solutions and assurance to make timely shipment of the orders placed by customers have assisted us positioning our name in the list of top-notch companies of the industry..',
      price: 600,
      quantity: 50,
      imageUrl: 'assets/images/pipe.png', // Local image path
    ),
    Product(
      name: 'Hand Pump',
      description:
          'This handpump is made of mild steel material it is the corrosion resistance and durable. With a double-acting liquid piston, it has a high positive displacement with low wear and tears. The long handle design can be easily operated under the groundwater while standing in the well or near the water source. The manual hand pump is made of high-quality mild steel with corrosion resistance, corrosion resistance, and high strength',
      price: 10000,
      quantity: 30,
      imageUrl: 'assets/images/hand_pump.jpg', // Local image path
    ),
    Product(
      name: 'Water Tap',
      description:
          'Premium PTMT Construction: Made from high-quality PTMT (Polytetrafluoroethylene) material, ensuring durability, corrosion resistance, and longevity.2-in-1 Design: Features a versatile two-way bib cock design, allowing for dual water outlets for enhanced functionality in kitchen or bathroom settings.',
      price: 200,
      quantity: 100,
      imageUrl: 'assets/images/jaguar-water-tap.jpg', // Local image path
    ),
    Product(
      name: 'Mseal',
      description:
          'Ready to use – One component tile grout, tile sealant and crack filler which is easy to apply. Can repair, seal any cracks up to 5mm.Eco-friendly – Dr Fixit Kwik n Ezee is a Non-Hazardous, eco-friendly sealant. It is a water based, non- organic volatile tile grout and sealant that is safe for home use and DIY tile sealing purposes. Usage of gloves recommended to avoid hassles of cleaning post use.',
      price: 30,
      quantity: 500,
      imageUrl: 'assets/images/mseal.jpg', // Local image path
    ),
    Product(
      name: 'Water Pump Motor',
      description:
          'Performance - The 0.5 HP Crompton CHAMP PLUS II Single Phase Residential water pump with Self-Priming Regenerative Operation to make it efficient in repeated intermittent operations. High Flow Rate with 1950 Litres per hour & max. Head is 21 Meter.',
      price: 2899,
      quantity: 29,
      imageUrl: 'assets/images/water-pump-motor.jpg', // Local image path
    ),
    Product(
      name: 'Thread Seal Tape',
      description: 'Thread Seal Tapes are made of Polytetrafluoroethylene Film',
      price: 2899,
      quantity: 29,
      imageUrl: 'assets/images/water_tape.jpg', // Local image path
    ),
  ];

  String username = '';

  @override
  void initState() {
    super.initState();
    _getUsername();
  }

  // Get the stored username
  void _getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUsername = prefs.getString('username') ?? '';
    setState(() {
      username = savedUsername;
    });
  }

  // Remove the user from the logged-in state and go to login screen
  void _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Display welcome message with username
            Text(
              'Welcome, $username!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Product list
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          // Display product image
                          Image.asset(
                            product.imageUrl, // Using local image from assets
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  product.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Price: \₹ ${product.price.toStringAsFixed(2)}',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.green),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Quantity: ${product.quantity}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: const Color.fromARGB(
                                          255, 135, 191, 219)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
