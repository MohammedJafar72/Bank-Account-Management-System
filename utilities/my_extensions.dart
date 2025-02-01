
/// [isValidAccountNumber] Check that account number provided is a valid unsigned integer between range of 9 to 18 without any spaces, special characters, or letters
extension CheckIsValidAccountNumber on String {
  (bool, int) isValidAccountNumber() {
    String strAccountNumber = this.trim();
    return (int.tryParse(strAccountNumber) != null && 
    (strAccountNumber.length > 8 && strAccountNumber.length < 19) && !strAccountNumber.contains('-'), 
    int.tryParse(strAccountNumber) ?? 0);
  }
  
  /// [isValidName] Check that name provided is a valid string, without any special characters, or numbers
  (bool, String) isValidName() {
    String strName = this.trim();
    bool notContainsSpecialChar = RegExp(r'^[a-zA-Z\s]+$').hasMatch(strName);
    return (notContainsSpecialChar, strName);
  }
}