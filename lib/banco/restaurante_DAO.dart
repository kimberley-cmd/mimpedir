import 'package:mimpedir/banco/database_helper.dart';
import 'package:mimpedir/banco/usuario_dao.dart';
import 'package:mimpedir/restaurante.dart';
import 'package:mimpedir/usuario.dart';
import '../tipo.dart';

class RestauranteDAO{
  static Future<List<Restaurante>> listarTodos() async{
    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.query('tb_restaurante',
      where: 'cd_usuario = ?',
      whereArgs: [UsuarioDAO.usuariologado.codigo]
    );

    return resultado.map((mapa){
      return Restaurante(
        codigo: mapa['cd_restaurante'] as int,
        nome:mapa['nm_restaurante'] as String
      );
    }).toList();
  }

static Future<int> cadastrasRestaurante(
    String? nome, String? latitude, String? longitude, int? tipo
    ) async{
    final db = await DatabaseHelper.getDatabase();

    final dadosRestaurante = {
      'nm_restaurante': nome,
      'latitude_restaurante': latitude,
      'longitude_restaurante': longitude,
      'cd_tipo': tipo,
      'cd_usuario': UsuarioDAO.usuariologado.codigo
    };

    try{
      final idRestaurante = await db.insert('tb_restaurante', dadosRestaurante);
      return idRestaurante;
    }catch(e){
      print("Erro ao cadastrar: $e");
      return -1;
    }
  }
}