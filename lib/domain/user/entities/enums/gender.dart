enum Gender {
  male,
  female,
}

extension ParseToString on Gender {
  String toShortString() {
    return toString().split('.').last;
  }
}

extension MapFromStringType on Gender {
  static Gender fromStringType(String str) {
    if (str == 'male') {
      return Gender.male;
    } else if (str == 'female') {
      return Gender.female;
    } else {
      return Gender.male;
    }
  }
}
