class Student {
  String rollNo;
  String name;

  Student({
    this.rollNo,
    this.name,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
    rollNo: json["rollNo"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "rollNo": rollNo,
    "name": name,
  };

 }
