import 'dart:math';

String generatePassword(int length, {bool useUpperCase = true, bool useNumbers = true, bool useSymbols = true}) {
  String lowercaseLetters = 'abcdefghijklmnopqrstuvwxyz';
  String uppercaseLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  String numbers = '0123456789';
  String symbols = '!@#\$%^&*()-_=+';

  // Create character set based on user preferences
  String charset = lowercaseLetters;
  if (useUpperCase) charset += uppercaseLetters;
  if (useNumbers) charset += numbers;
  if (useSymbols) charset += symbols;

  // Generate password
  Random random = Random();
  String password = '';
  for (int i = 0; i < length; i++) {
    int randomIndex = random.nextInt(charset.length);
    password += charset[randomIndex];
  }

  return password;
}

void main() {
  String password = generatePassword(10);
  print('Generated Password: $password');
}
