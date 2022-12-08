class Answer {
  String? _studentId;
  String? _quizId;
  List<int>? _answers;
  double? _score;
  double? _prizeEarned;
  String? _sId;
  String? _createdAt;
  String? _updatedAt;

  Answer({
    String? studentId,
    String? quizId,
    List<int>? answers,
    double? score,
    double? prizeEarned,
    String? sId,
    String? createdAt,
    String? updatedAt,
  }) {
    if (studentId != null) {
      this._studentId = studentId;
    }
    if (quizId != null) {
      this._quizId = quizId;
    }
    if (answers != null) {
      this._answers = answers;
    }
    if (score != null) {
      this._score = score;
    }
    if (prizeEarned != null) {
      this._prizeEarned = prizeEarned;
    }
    if (sId != null) {
      this._sId = sId;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
  }

  String? get studentId => _studentId;
  set studentId(String? studentId) => _studentId = studentId;
  String? get quizId => _quizId;
  set quizId(String? quizId) => _quizId = quizId;
  List<int>? get answers => _answers;
  set answers(List<int>? answers) => _answers = answers;
  double? get score => _score;
  set score(double? score) => _score = score;
  double? get prizeEarned => _prizeEarned;
  set prizeEarned(double? prizeEarned) => _prizeEarned = prizeEarned;
  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  Answer.fromJson(Map<String, dynamic> json) {
    _studentId = json['studentId'];
    _quizId = json['quizId'];
    _answers = json['answers'].cast<int>();
    _score = json['score'];
    _prizeEarned = json['prizeEarned'];
    _sId = json['_id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['studentId'] = this._studentId;
    data['quizId'] = this._quizId;
    data['answers'] = this._answers;
    data['score'] = this._score;
    data['prizeEarned'] = this._prizeEarned;
    data['_id'] = this._sId;
    data['createdAt'] = this._createdAt;
    data['updatedAt'] = this._updatedAt;
    return data;
  }
}
