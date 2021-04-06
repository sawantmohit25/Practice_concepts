import 'package:sembast/sembast.dart';
import 'package:sembast_app/sembast/databasesetup.dart';
import 'package:sembast_app/sembast/studentmodel.dart';

/// Data Access Object file created to perform CRUD operations on the sembast database created locally.
class StudentDao{
  static const String folderName = "Students";

  final _studentFolder = intMapStoreFactory.store(folderName);

  Future<Database> get  _db  async => await AppDatabase.instance.database;

  Future insertStudent(Student student) async{
    await  _studentFolder.add(await _db, student.toJson() );
  }

  Future updateStudent(Student student) async{
    final finder = Finder(filter:Filter.equals('rollNo',student.rollNo));
    await _studentFolder.update(await _db, student.toJson(),finder: finder);
  }


  Future delete(Student student) async{
    final finder = Finder(filter:Filter.equals('rollNo',student.rollNo));//    final finder = Finder(filter: Filter.byKey(student.rollNo));not using autogenetated key hence using .equals for comparing with student property
    await _studentFolder.delete(await _db, finder: finder);
  }

  Future<List<Student>> getAllStudents()async{
    final recordSnapshot = await _studentFolder.find(await _db);
    return recordSnapshot.map((snapshot){
      final student = Student.fromJson(snapshot.value);
      return student;
    }).toList();
  }


}
