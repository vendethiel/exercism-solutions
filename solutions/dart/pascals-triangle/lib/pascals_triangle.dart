class PascalsTriangle {
  rows(int n) {
    if (n < 1) {
      return <List<int>>[];
    } else {
      var r = this.rows(n - 1);
      var last = r.isEmpty ? [] : r[r.length - 1];
      return [...r,
        [1,
          for (var i = 1; i <= last.length; ++i)
           (i == last.length ? 0 : last[i]) + last[i - 1]
      ]];
    }
  }
}
