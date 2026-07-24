
void main() {
  String studentName = "John Doe";
  int rollNumber = 101;
  String course = "BCA";
  int semester = 3;
  int marksSubject1 = 85;
  int marksSubject2 = 78;
  int marksSubject3 = 91;

  marksSubject1 += 5; // 85 + 5 = 90


  int totalMarks = marksSubject1 + marksSubject2 + marksSubject3;
  double averageMarks = totalMarks / 3;

  double percentage = (totalMarks / 300) * 100;

  bool isPassed = percentage >= 40;
  String resultStatus = isPassed ? "Pass" : "Fail";

  print("==========================================");
  print("         STUDENT RESULT REPORT            ");
  print("==========================================");
  print("Student Name : $studentName");
  print("Roll Number  : $rollNumber");
  print("Course       : $course");
  print("Semester     : $semester");
  print("");
  print("Subject 1    : $marksSubject1");
  print("Subject 2    : $marksSubject2");
  print("Subject 3    : $marksSubject3");
  print("Total Marks  : $totalMarks");
  print("Average      : ${averageMarks.toStringAsFixed(2)}");
  print("Percentage   : ${percentage.toStringAsFixed(2)}%");
  print("Result       : $resultStatus");
  print("==========================================");
}