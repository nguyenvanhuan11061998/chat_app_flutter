


abstract class AuthRepository {

  Future login(String email, String password);

  Future createAccount(String email, String password);

  Future createUserModel(String keyUserId, String name, String email);

  Future changePassword(String newPassword);

}