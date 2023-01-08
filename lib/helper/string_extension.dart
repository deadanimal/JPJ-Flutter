extension StringExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp('\n'), '\n ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
