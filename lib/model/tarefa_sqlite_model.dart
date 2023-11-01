class TarefaSQLiteModel {
  int _id = 0;
  String _descricao = "";
  bool _concluido = false;

  TarefaSQLiteModel(this._descricao, this._concluido);

  int get id => _id;

  String get descricao => _descricao;
}
