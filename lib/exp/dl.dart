import 'dart:io';

main() async {
  final request = await HttpClient().getUrl(Uri.parse('http://example.com'));
  final response = await request.close();
  response.pipe(File('foo.txt').openWrite());
}
