extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(r'^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$')
        .hasMatch(this);
  }
}
