class MatchCardFuncs {
  static String getTypeFullName(String type) {
    switch (type) {
      case 'P':
        return 'Practice';
      case 'Q':
        return 'Qualification';
      case 'QF':
        return 'Quarterfinal';
      case 'SF':
        return 'Semifinal';
      case 'F':
        return 'Final';
      default:
        return 'Unknown';
    }
  }
}