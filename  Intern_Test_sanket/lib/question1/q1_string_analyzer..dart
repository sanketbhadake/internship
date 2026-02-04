import 'package:intern_test_sanket/question1/common.dart';

class MenuLogic {
  static void countVowels(String str) {
    RegExp vowelsReg = RegExp(r'[aeiou]');
    RegExp consonantReg = RegExp(r'[qwrtypsdfghjklzxcvbnm]');
    int vowel = 0, consonants = 0;
    str = str.trim();
    for (int i = 0; i < str.length; i++) {
      if (vowelsReg.hasMatch(str[i].toLowerCase())) {
        vowel++;
      } else if (consonantReg.hasMatch(str[i].toLowerCase())) {
        consonants++;
      }
    }
    Common.printer(" Count of Vowels : $vowel");
    Common.printer(" Count of Consonants : $consonants");
  }

  static String reverseString(String str) {
    String reverse = str.split('').reversed.join();
    return reverse;
  }

  static String convertUppercase(String original) {
    List<String> str = original.split(' ');

    List<String> newStr = [];

    for (String s in str) {
      String word = s[0].toUpperCase() + s.substring(1).toLowerCase();
      newStr.add(word);
    }
    return newStr.join(' ');
  }
}
