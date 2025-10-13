import 'database_helper.dart';
import '../usuario.dart';

class UsuarioDAO{

  static Usuario usuariologado = Usuario();

  static Future<bool> autenticar (String login, String senha) async{
    final db = await DatabaseHelper.getDatabase();

    final resultado = await db.query(
      'tb_usuario',
      where: 'nm_login = ? and ds_senha = ?',
        whereArgs: [login, senha]
    );

    usuariologado.codigo = resultado.first['cd_usuario'] as int;
    usuariologado.nome = resultado.first['nm_usuario'] as String;
    usuariologado.login = resultado.first['nm_login'] as String;
    usuariologado.senha = resultado.first['ds_senha'] as String;

    return resultado.isNotEmpty;
  }

}