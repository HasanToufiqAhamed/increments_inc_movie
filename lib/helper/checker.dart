bool checkValidPhoneNumber(String p) {
  if (p.length != 11)
    return false;
  else if (!p.startsWith('017') &&
      !p.startsWith('013') &&
      !p.startsWith('019') &&
      !p.startsWith('014') &&
      !p.startsWith('016') &&
      !p.startsWith('018') &&
      !p.startsWith('015'))
    return false;
  else
    return true;
}

bool checkValidEmail(String text) {
  return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(text);
}