class Quiz {
  String? _id;
  String? _title;
  String? _description;
  String? _expiryDate;
  int? _totalPrize;
  List<Question>? _questions;
  String? _password;
  String? _teacherId;
  String? _createdAt;
  String? _updatedAt;

  Quiz({
    String? id,
    String? title,
    String? description,
    String? expiryDate,
    int? totalPrize,
    List<Question>? questions,
    String? password,
    String? teacherId,
    String? createdAt,
    String? updatedAt,
  }) {
    if (id != null) {
      this._id = id;
    }
    if (title != null) {
      this._title = title;
    }
    if (description != null) {
      this._description = description;
    }
    if (expiryDate != null) {
      this._expiryDate = expiryDate;
    }
    if (totalPrize != null) {
      this._totalPrize = totalPrize;
    }
    if (questions != null) {
      this._questions = questions;
    }
    if (password != null) {
      this._password = password;
    }
    if (teacherId != null) {
      this._teacherId = teacherId;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get expiryDate => _expiryDate;
  set expiryDate(String? expiryDate) => _expiryDate = expiryDate;
  int? get totalPrize => _totalPrize;
  set totalPrize(int? totalPrize) => _totalPrize = totalPrize;
  List<Question>? get questions => _questions;
  set questions(List<Question>? questions) => _questions = questions;
  String? get password => _password;
  set password(String? password) => _password = password;
  String? get teacherId => _teacherId;
  set teacherId(String? teacherId) => _teacherId = teacherId;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  Quiz.fromJson(Map<String, dynamic> json) {
    _id = json['_id'];
    _title = json['title'];
    _description = json['description'];
    _expiryDate = json['expiryDate'];
    _totalPrize = json['totalPrize'];
    if (json['questions'] != null) {
      _questions = <Question>[];
      json['questions'].forEach((v) {
        _questions!.add(new Question.fromJson(v));
      });
    }
    _password = json['password'];
    _teacherId = json['teacherId'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._id;
    data['title'] = this._title;
    data['description'] = this._description;
    data['expiryDate'] = this._expiryDate;
    data['totalPrize'] = this._totalPrize;
    if (this._questions != null) {
      data['questions'] = this._questions!.map((v) => v.toJson()).toList();
    }
    data['password'] = this._password;
    data['teacherId'] = this._teacherId;
    data['createdAt'] = this._createdAt;
    data['updatedAt'] = this._updatedAt;
    return data;
  }
}

class Question {
  String? _statement;
  List<String>? _alternatives;
  String? _base64;

  Questions({
    String? statement,
    List<String>? alternatives,
    String? base64,
  }) {
    if (statement != null) {
      this._statement = statement;
    }
    if (alternatives != null) {
      this._alternatives = alternatives;
    }
    if (base64 != null) {
      this._base64 = base64;
    }
  }

  String? get statement => _statement;
  set statement(String? statement) => _statement = statement;
  List<String>? get alternatives => _alternatives;
  set alternatives(List<String>? alternatives) => _alternatives = alternatives;
  String? get base64 => _base64;
  set base64(String? base64) => _base64 = base64;

  Question.fromJson(Map<String, dynamic> json) {
    _statement = json['statement'];
    _alternatives = json['alternatives'].cast<String>();
    _base64 = json['base64'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statement'] = this._statement;
    data['alternatives'] = this._alternatives;
    data['base64'] = this._base64;
    return data;
  }
}
