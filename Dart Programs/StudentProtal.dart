import 'package:flutter/material.dart';

void main() {
  runApp(const StudentPortalApp());
}

class StudentPortalApp extends StatelessWidget {
  const StudentPortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Student Information Portal",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const StudentPortalScreen(),
    );
  }
}

class StudentPortalScreen extends StatefulWidget {
  const StudentPortalScreen({super.key});

  @override
  State<StudentPortalScreen> createState() =>
      _StudentPortalScreenState();
}

class _StudentPortalScreenState
    extends State<StudentPortalScreen> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Student Information Portal",
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.more_vert),
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [

            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [

                    Row(
                      children: const [

                        CircleAvatar(
                          radius: 18,
                          backgroundColor:
                          Colors.deepPurple,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),

                        SizedBox(width: 10),

                        Text(
                          "Student Details",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.deepPurple,
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 15),

                    buildInfoRow(
                      Icons.person,
                      "Student Name",
                      "Harshit",
                    ),

                    Divider(),

                    buildInfoRow(
                      Icons.email,
                      "Email",
                      "harshit@gmail.com",
                    ),

                    Divider(),

                    buildInfoRow(
                      Icons.phone,
                      "Mobile",
                      "+91 9876543210",
                    ),

                    Divider(),

                    buildInfoRow(
                      Icons.badge,
                      "Roll Number",
                      "CS202501",
                    ),

                    Divider(),

                    buildInfoRow(
                      Icons.language,
                      "College Website",
                      "www.fluttercollege.com",
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 15),

            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [

                    Row(
                      children: const [

                        CircleAvatar(
                          radius: 18,
                          backgroundColor:
                          Colors.deepPurple,
                          child: Icon(
                            Icons.table_chart,
                            color: Colors.white,
                          ),
                        ),

                        SizedBox(width: 10),

                        Text(
                          "Student Marksheet",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 15),

                    Table(
                      border: TableBorder.all(
                        color: Colors.grey.shade300,
                      ),

                      children:[

                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                          ),
                          children: [

                            tableHeader("Subject"),
                            tableHeader("Max"),
                            tableHeader("Obtained"),
                          ],
                        ),

                        TableRow(
                          children: [
                            tableCell("Mathematics"),
                            tableCell("100"),
                            tableCell("95"),
                          ],
                        ),

                        TableRow(
                          children: [
                            tableCell("Science"),
                            tableCell("100"),
                            tableCell("90"),
                          ],
                        ),

                        TableRow(
                          children: [
                            tableCell("English"),
                            tableCell("100"),
                            tableCell("88"),
                          ],
                        ),

                        TableRow(
                          children: [
                            tableCell("Computer"),
                            tableCell("100"),
                            tableCell("98"),
                          ],
                        ),

                        TableRow(
                          children: [
                            tableCell("Hindi"),
                            tableCell("100"),
                            tableCell("85"),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    Row(
                      children: [

                        Expanded(
                          child: summaryCard(
                            Icons.assignment,
                            "Total Marks",
                            "456 / 500",
                            Colors.deepPurple,
                          ),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child: summaryCard(
                            Icons.percent,
                            "Percentage",
                            "91.2%",
                            Colors.green,
                          ),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child: summaryCard(
                            Icons.star,
                            "Grade",
                            "A+",
                            Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                ),
                onPressed: showStudentActions,
                icon: const Icon(Icons.list),
                label: const Text(
                  "Show Student Actions",
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                ["Home", "Profile", "Settings"][index],
              ),
            ),
          );
        },
        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }

//==========================
// Bottom Sheet
//==========================

  void showStudentActions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius:
        BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              const Text(
                "Student Actions",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),

              const SizedBox(height: 15),

              actionTile(Icons.email, "Send Email"),
              actionTile(Icons.phone, "Call Student"),
              actionTile(Icons.location_on, "View Address"),
              actionTile(Icons.share, "Share Profile"),
              actionTile(Icons.download, "Download Marksheet"),

              ListTile(
                leading: const Icon(
                  Icons.close,
                  color: Colors.red,
                ),
                title: const Text("Close"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
  //==========================
  // Student Detail Row
  //==========================

  Widget buildInfoRow(
      IconData icon,
      String title,
      String value,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [

          Icon(icon, size: 20),

          const SizedBox(width: 12),

          Expanded(
            flex: 2,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          Expanded(
            flex: 3,
            child: SelectableText(
              value,
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //==========================
  // Summary Card
  //==========================

  Widget summaryCard(
      IconData icon,
      String title,
      String value,
      Color color,
      ) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 8,
        ),
        child: Column(
          children: [

            Icon(
              icon,
              color: color,
              size: 28,
            ),

            const SizedBox(height: 8),

            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 5),

            Text(
              value,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //==========================
  // Bottom Sheet Action Tile
  //==========================

  Widget actionTile(
      IconData icon,
      String title,
      ) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.deepPurple,
      ),
      title: Text(title),
      onTap: () {

        Navigator.pop(context);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            content: Text("$title Successfully!"),
            action: SnackBarAction(
              label: "UNDO",
              textColor: Colors.white,
              onPressed: () {},
            ),
          ),
        );
      },
    );
  }
}

//==========================
// Table Header
//==========================

Widget tableHeader(String text) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: Center(
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

//==========================
// Table Cell
//==========================

Widget tableCell(String text) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: Center(
      child: Text(text),
    ),
  );
}