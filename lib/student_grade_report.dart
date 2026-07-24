void main() {

  List<String> students = ["Rahul", "Priya", "Aman", "Sneha", "Karan"];

  Map<String, int> studentMarks = {
    "Rahul": 85,
    "Priya": 72,
    "Aman": 91,
    "Sneha": 65,
    "Karan": 38,
  };

  print("--- Displaying Students using 'for' loop ---");
  for (int i = 0; i < students.length; i++) {
    print("Student ${i + 1}: ${students[i]}");
  }

  print("\n--- Displaying Students using 'while' loop ---");
  int j = 0;
  while (j < students.length) {
    print("Student ${j + 1}: ${students[j]}");
    j++;
  }

  print("\n--- Displaying Students using 'do-while' loop ---");
  int k = 0;
  do {
    print("Student ${k + 1}: ${students[k]}");
    k++;
  } while (k < students.length);

  print("\n--- Displaying Students using 'for-in' loop ---");
  for (String student in students) {
    print("Student: $student");
  }

  print("\n--- Displaying Students using 'forEach' loop ---");
  students.forEach((student) {
    print("Student: $student");
  });


  print("\n");
  print("=========================================");
  print("         STUDENT GRADE REPORT            ");
  print("=========================================");


  for (String name in students) {
    int marks = studentMarks[name] ?? 0;
    String grade = "";
    String remarks = "";


    if (marks >= 90 && marks <= 100) {
      grade = "A+";
    } else if (marks >= 80 && marks <= 89) {
      grade = "A";
    } else if (marks >= 70 && marks <= 79) {
      grade = "B";
    } else if (marks >= 60 && marks <= 69) {
      grade = "C";
    } else if (marks >= 40 && marks <= 59) {
      grade = "D";
    } else {
      grade = "Fail";
    }

    switch (grade) {
      case "A+":
        remarks = "Outstanding";
        break;
      case "A":
        remarks = "Excellent";
        break;
      case "B":
        remarks = "Very Good";
        break;
      case "C":
        remarks = "Good";
        break;
      case "D":
        remarks = "Needs Improvement";
        break;
      case "Fail":
        remarks = "Failed";
        break;
      default:
        remarks = "Unknown";
    }

    print("Student : $name");
    print("Marks   : $marks");
    print("Grade   : $grade");
    print("Remarks : $remarks");
    print("-----------------------------------------");
  }
  print("=========================================");
}