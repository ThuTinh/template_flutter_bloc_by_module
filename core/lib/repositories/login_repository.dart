part of core.repository;

abstract class LoginRepository {
  Future<Token> login(UserLogin userLogin);
  Future<bool> hasToken();
}

class LoginRepositoryImpl extends LoginRepository {
  LoginService loginService = new LoginService();
  @override
  Future<Token> login(UserLogin userLogin) {
    return loginService.login(userLogin);
  }

  @override
  Future<bool> hasToken() async {
    return true;
  }
}
