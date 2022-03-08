


abstract class AuthRepository {

  Future login(String email, String password);

  Future createAccount(String email, String password);

}