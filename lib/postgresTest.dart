import 'package:postgres/postgres.dart';

void postgresTest() async {
  final conn = await Connection.open(
    Endpoint(
      host: 'up2114856.myvm.port.ac.uk',
      database: 'up2114856',
      username: 'up2114856',
      password: 'Setap6C!!',
    ),
  );
  await Connection.open;
  print("connected to postgres");
  conn.close();
}
