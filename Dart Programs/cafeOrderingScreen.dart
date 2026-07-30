import 'package:flutter/material.dart';

void main() {
  runApp(const SmartCafeApp());
}

class SmartCafeApp extends StatelessWidget {
  const SmartCafeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Café',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
      ),
      home: const CafeteriaOrderScreen(),
    );
  }
}

class CafeteriaOrderScreen extends StatefulWidget {
  const CafeteriaOrderScreen({super.key});

  @override
  State<CafeteriaOrderScreen> createState() => _CafeteriaOrderScreenState();
}

class _CafeteriaOrderScreenState extends State<CafeteriaOrderScreen> {
  String selectedCategory = 'Burger';
  final List<String> categories = [
    'Burger',
    'Pizza',
    'Sandwich',
    'Cold Coffee',
    'French Fries'
  ];
  final Map<String, Map<String, dynamic>> categoryItems = {
    'Burger': {
      'name': 'Veg Burger',
      'desc': 'Delicious veg burger with fresh veggies and cheese.',
      'price': '₹120',
      'image': 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=500&q=80',
    },
    'Pizza': {
      'name': 'Margherita Pizza',
      'desc': 'Classic pizza with extra mozzarella and fresh basil.',
      'price': '₹199',
      'image': 'https://images.unsplash.com/photo-1604382355076-af4b0eb60143?auto=format&fit=crop&w=500&q=80',
    },
    'Sandwich': {
      'name': 'Grilled Sandwich',
      'desc': 'Crispy toasted sandwich stuffed with vegetables.',
      'price': '₹99',
      'image': 'https://images.unsplash.com/photo-1528735602780-2552fd46c7af?auto=format&fit=crop&w=500&q=80',
    },
    'Cold Coffee': {
      'name': 'Classic Cold Coffee',
      'desc': 'Chilled creamy coffee blended with rich chocolate syrup.',
      'price': '₹110',
      'image': 'https://images.unsplash.com/photo-1517701604599-bb29b565090c?auto=format&fit=crop&w=500&q=80',
    },
    'French Fries': {
      'name': 'Peri Peri Fries',
      'desc': 'Crispy golden fries tossed in spicy peri peri seasoning.',
      'price': '₹89',
      'image': 'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?auto=format&fit=crop&w=500&q=80',
    },
  };

  int quantity = 1;
  bool orderPlaced = false;
  bool showSpecialPopup = true;

  @override
  Widget build(BuildContext context) {
    var currentItem = categoryItems[selectedCategory]!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Café', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.maybePop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Choose Category',
                  style: TextStyle(fontSize: 14, color: Colors.deepPurple, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.deepPurple.shade200, width: 1.5),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedCategory,
                      isExpanded: true,
                      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.deepPurple),
                      items: categories.map((String category) {
                        return DropdownMenuItem<String>(
                          value: category,
                          child: Row(
                            children: [
                              const Text('🍔', style: TextStyle(fontSize: 20)),
                              const SizedBox(width: 12),
                              Text(category, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCategory = newValue!;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Selected Item',
                  style: TextStyle(fontSize: 14, color: Colors.deepPurple, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          currentItem['image'],
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  currentItem['name'],
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                PopupMenuButton<String>(
                                  icon: const Icon(Icons.more_vert, color: Colors.grey),
                                  onSelected: (value) {},
                                  itemBuilder: (BuildContext context) => [
                                    const PopupMenuItem(value: 'cheese', child: Text('🧀 Add Cheese')),
                                    const PopupMenuItem(value: 'sauce', child: Text('🌶️ Extra Sauce')),
                                    const PopupMenuItem(value: 'nutrition', child: Text('🌱 View Nutrition')),
                                    const PopupMenuItem(value: 'share', child: Text('🔗 Share Item')),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              currentItem['desc'],
                              style: const TextStyle(fontSize: 12, color: Colors.grey, height: 1.2),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              currentItem['price'],
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Quantity',
                  style: TextStyle(fontSize: 14, color: Colors.deepPurple, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade50,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.remove, color: Colors.deepPurple),
                        onPressed: () {
                          setState(() {
                            if (quantity > 1) quantity--;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        '$quantity',
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade100,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.add, color: Colors.deepPurple),
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      elevation: 2,
                    ),
                    onPressed: () {
                      setState(() {
                        orderPlaced = true;
                      });
                    },
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text('Place Order', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.deepPurple,
                      side: const BorderSide(color: Colors.deepPurple, width: 1.5),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Item saved for later!')),
                      );
                    },
                    icon: const Icon(Icons.bookmark_border),
                    label: const Text('Save for Later', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: TextButton.icon(
                    onPressed: () {
                      setState(() {
                        quantity = 1;
                      });
                    },
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    label: const Text('Clear Selection', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
          Positioned(
            bottom: orderPlaced ? 90 : 24,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: Colors.deepPurple,
              onPressed: () {
                setState(() {
                  showSpecialPopup = true;
                });
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.restaurant, size: 18),
                  Text("Today's", style: TextStyle(fontSize: 9)),
                  Text("Special", style: TextStyle(fontSize: 9)),
                ],
              ),
            ),
          ),
          if (showSpecialPopup)
            Positioned(
              bottom: orderPlaced ? 90 : 90,
              left: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 15,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Text('🎉', style: TextStyle(fontSize: 32)),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Today's Special", style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 16)),
                          Text("Veg Burger", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          Text("₹99", style: TextStyle(color: Colors.grey, fontSize: 13)),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.grey),
                      onPressed: () {
                        setState(() {
                          showSpecialPopup = false;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          if (orderPlaced)
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.green.shade600,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 8),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.white),
                        SizedBox(width: 12),
                        Text(
                          'Order Placed Successfully!',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          orderPlaced = false;
                        });
                      },
                      child: const Text(
                        'DISMISS',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}