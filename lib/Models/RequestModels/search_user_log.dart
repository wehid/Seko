class SearchUserLog {
  int userId;
  int seen;
  int page;
  int rowsPerPage;

  SearchUserLog({
    this.userId,

    // seen = 1 => seened. seen = 0 => not seen. seen = null => all
    this.seen,
    this.page=1,
    this.rowsPerPage,
  });

  SearchUserLog.fromJson(Map<String, dynamic> json) {
    userId = json['UserID'];
    seen = json['Seen'];
    page = json['Page'];
    rowsPerPage = json['RowsPerPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserID'] = this.userId;
    data['Seen'] = this.seen;
    data['Page'] = this.page;
    data['RowsPerPage'] = this.rowsPerPage;
    return data;
  }
}
