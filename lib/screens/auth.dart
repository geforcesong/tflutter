abstract class BathAuth {
  bool loginWithEmailAndPassword(String email, String password);
}

class Auth implements BathAuth{
  @override
  bool loginWithEmailAndPassword(String email, String password) {
    if(email == 'gg@outlook.com' && password == '123'){
      return true;
    }
    return false;
  }
}