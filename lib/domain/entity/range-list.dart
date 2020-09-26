class RangeList {
  int current;
  int maximal;

  RangeList({
    int current,
    int maximal
  }) :
      current = current ?? 0,
      maximal = maximal ?? 10;
}