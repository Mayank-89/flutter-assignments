import 'package:flutter/material.dart';
void main() {
  runApp(const UserPreferencesApp());
}

class UserPreferencesApp extends StatelessWidget {
  const UserPreferencesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Preferences',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const UserPreferencesScreen(),
    );
  }
}

class UserPreferencesScreen extends StatefulWidget {
  const UserPreferencesScreen({super.key});

  @override
  State<UserPreferencesScreen> createState() => _UserPreferencesScreenState();
}

class _UserPreferencesScreenState extends State<UserPreferencesScreen> {
  bool isNotificationsEnabled = true;
  int selectedThemeIndex = 1;

  String selectedGender = 'Female';
  bool isAcceptedTerms = true;
  double fontSizeValue = 20.0;
  String selectedInterest = 'Flutter';
  final List<String> interests = ['Flutter', 'AI', 'Web Development', 'Game Development'];


  bool showSuccessBanner = true;

  int currentStep = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Preferences', style: TextStyle(fontWeight: FontWeight.bold)),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.deepPurple.shade50, shape: BoxShape.circle),
                  child: const Icon(Icons.notifications_none, color: Colors.deepPurple),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Enable Notifications', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          const Text('Notifications : ', style: TextStyle(color: Colors.grey, fontSize: 13)),
                          Text(
                            isNotificationsEnabled ? 'Enabled' : 'Disabled',
                            style: TextStyle(color: isNotificationsEnabled ? Colors.green : Colors.red, fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Switch(
                  value: isNotificationsEnabled,
                  activeColor: Colors.deepPurple,
                  onChanged: (bool value) {
                    setState(() {
                      isNotificationsEnabled = value;
                    });
                  },
                ),
              ],
            ),
            const Divider(height: 32),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.deepPurple.shade50, shape: BoxShape.circle),
                  child: const Icon(Icons.palette_outlined, color: Colors.deepPurple),
                ),
                const SizedBox(width: 12),
                const Text('Choose Theme', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 12),
            Center(
              child: ToggleButtons(
                isSelected: [selectedThemeIndex == 0, selectedThemeIndex == 1],
                onPressed: (int index) {
                  setState(() {
                    selectedThemeIndex = index;
                  });
                },
                borderRadius: BorderRadius.circular(16),
                selectedColor: Colors.white,
                fillColor: Colors.deepPurple,
                color: Colors.black87,
                constraints: const BoxConstraints(minHeight: 45, minWidth: 150),
                children: const [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.wb_sunny_outlined, size: 18),
                      SizedBox(width: 8),
                      Text('Light', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.nightlight_round, size: 18),
                      SizedBox(width: 8),
                      Text('Dark', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 48.0),
              child: Row(
                children: [
                  const Text('Selected Mode : ', style: TextStyle(color: Colors.grey, fontSize: 13)),
                  Text(
                    selectedThemeIndex == 0 ? 'Light' : 'Dark',
                    style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ],
              ),
            ),
            const Divider(height: 32),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.deepPurple.shade50, shape: BoxShape.circle),
                  child: const Icon(Icons.person_outline, color: Colors.deepPurple),
                ),
                const SizedBox(width: 12),
                const Text('Select Gender', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Radio<String>(
                      value: 'Male',
                      groupValue: selectedGender,
                      activeColor: Colors.deepPurple,
                      onChanged: (String? value) {
                        setState(() {
                          selectedGender = value!;
                        });
                      },
                    ),
                    const Text('Male'),
                  ],
                ),
                Row(
                  children: [
                    Radio<String>(
                      value: 'Female',
                      groupValue: selectedGender,
                      activeColor: Colors.deepPurple,
                      onChanged: (String? value) {
                        setState(() {
                          selectedGender = value!;
                        });
                      },
                    ),
                    const Text('Female'),
                  ],
                ),
                Row(
                  children: [
                    Radio<String>(
                      value: 'Other',
                      groupValue: selectedGender,
                      activeColor: Colors.deepPurple,
                      onChanged: (String? value) {
                        setState(() {
                          selectedGender = value!;
                        });
                      },
                    ),
                    const Text('Other'),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48.0),
              child: Row(
                children: [
                  const Text('Selected Gender : ', style: TextStyle(color: Colors.grey, fontSize: 13)),
                  Text(selectedGender, style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 13)),
                ],
              ),
            ),
            const Divider(height: 32),
            Row(
              children: [
                Checkbox(
                  value: isAcceptedTerms,
                  activeColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  onChanged: (bool? value) {
                    setState(() {
                      isAcceptedTerms = value ?? false;
                    });
                  },
                ),
                const Text('I accept the ', style: TextStyle(fontSize: 15)),
                const Text('Terms & Conditions', style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 15)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48.0),
              child: Row(
                children: [
                  const Text('Status : ', style: TextStyle(color: Colors.grey, fontSize: 13)),
                  Text(
                    isAcceptedTerms ? 'Accepted' : 'Not Accepted',
                    style: TextStyle(color: isAcceptedTerms ? Colors.green : Colors.red, fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ],
              ),
            ),
            const Divider(height: 32),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.deepPurple.shade50, shape: BoxShape.circle),
                  child: const Icon(Icons.text_format, color: Colors.deepPurple),
                ),
                const SizedBox(width: 12),
                const Text('Font Size ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const Text('(Sample Text)', style: TextStyle(color: Colors.grey, fontSize: 13)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('10', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                Expanded(
                  child: Slider(
                    value: fontSizeValue,
                    min: 10,
                    max: 30,
                    activeColor: Colors.deepPurple,
                    inactiveColor: Colors.deepPurple.shade100,
                    onChanged: (double value) {
                      setState(() {
                        fontSizeValue = value;
                      });
                    },
                  ),
                ),
                const Text('30', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                const SizedBox(width: 12),
                Text('Current Size : ${fontSizeValue.toInt()}', style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                'Flutter is Awesome!',
                style: TextStyle(fontSize: fontSizeValue, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
            ),
            const Divider(height: 32),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.deepPurple.shade50, shape: BoxShape.circle),
                  child: const Icon(Icons.favorite_border, color: Colors.deepPurple),
                ),
                const SizedBox(width: 12),
                const Text('Choose Your Interests ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const Text('(Select One)', style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8.0,
              children: interests.map((interest) {
                bool isSelected = selectedInterest == interest;
                return ChoiceChip(
                  label: Text(interest),
                  selected: isSelected,
                  selectedColor: Colors.deepPurple.shade50,
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.deepPurple : Colors.black87,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: isSelected ? Colors.deepPurple : Colors.deepPurple.shade200,
                    ),
                  ),
                  onSelected: (bool selected) {
                    setState(() {
                      selectedInterest = interest;
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Row(
                children: [
                  const Text('Selected Interest : ', style: TextStyle(color: Colors.grey, fontSize: 13)),
                  Text(selectedInterest, style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 13)),
                ],
              ),
            ),
            const Divider(height: 32),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.deepPurple.shade50, shape: BoxShape.circle),
                  child: const Icon(Icons.flash_on, color: Colors.deepPurple),
                ),
                const SizedBox(width: 12),
                const Text('Quick Actions', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const Spacer(),
                ActionChip(
                  avatar: const Icon(Icons.refresh, color: Colors.deepPurple, size: 16),
                  label: const Text('Reset', style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.deepPurple.shade200),
                  ),
                  onPressed: () {
                    setState(() {
                      isNotificationsEnabled = true;
                      selectedThemeIndex = 1;
                      selectedGender = 'Female';
                      isAcceptedTerms = true;
                      fontSizeValue = 20.0;
                      selectedInterest = 'Flutter';
                      showSuccessBanner = false;
                    });
                  },
                ),
                const SizedBox(width: 8),
                ActionChip(
                  avatar: const Icon(Icons.save, color: Colors.white, size: 16),
                  label: const Text('Save', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () {
                    setState(() {
                      showSuccessBanner = true;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (showSuccessBanner)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.green.shade600,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.check, color: Colors.green, size: 16),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Preferences Saved Successfully!',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          showSuccessBanner = false;
                        });
                      },
                      child: const Text('DISMISS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            const Divider(height: 32),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.deepPurple.shade50, shape: BoxShape.circle),
                  child: const Icon(Icons.list_alt, color: Colors.deepPurple),
                ),
                const SizedBox(width: 12),
                const Text('Profile Completion', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.deepPurple,
                      child: const Text('1', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 4),
                    const Text('Personal Details', style: TextStyle(fontSize: 11, color: Colors.deepPurple, fontWeight: FontWeight.bold)),
                  ],
                ),
                Container(width: 80, height: 3, color: Colors.deepPurple),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.deepPurple,
                      child: const Text('2', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 4),
                    const Text('Preferences', style: TextStyle(fontSize: 11, color: Colors.deepPurple, fontWeight: FontWeight.bold)),
                  ],
                ),
                Container(width: 80, height: 3, color: Colors.grey.shade300),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.grey.shade300,
                      child: const Text('3', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 4),
                    const Text('Finish', style: TextStyle(fontSize: 11, color: Colors.grey)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.deepPurple,
                      side: const BorderSide(color: Colors.deepPurple),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {},
                    child: const Text('CANCEL', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      setState(() {
                        if (currentStep < 3) currentStep++;
                      });
                    },
                    child: const Text('CONTINUE', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}