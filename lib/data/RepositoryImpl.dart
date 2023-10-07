import '../domain/Repository.dart';

class RepositoryImpl extends Repository {}
// will register the new user with his phone number
// in db i will create the id of the user and save his number
// id will never change when number can
// when send a number to the db, should return a code and
// remember it in the db
// than user sends a code and a number is got again, so
//i should check codes and if they match, save user to db
