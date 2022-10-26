class LoginController {
  Future login(String email, String password) async {
    bool data = false;
    if(email == "email@dev.com" && password == "dev123") {
      data = true;
    }
    return data;
  }
}