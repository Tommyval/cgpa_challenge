class Entry {
  String? title;
  String? grade;
  String? credit;
  int? unit;

  Entry({this.title, this.grade, this.credit, this.unit});
  Map<String, int> gradePoint = {
    'A': 5,
    'B': 4,
    'C': 3,
    'D': 2,
    'F': 0,
  };
  int get gpa => gradePoint[grade] as int;
}
