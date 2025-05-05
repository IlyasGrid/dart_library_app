Future<String> fetchData() async {
  return await Future.delayed(Duration(seconds: 2), () => "Data received");
}

void main(List<String> arguments) async {
  print("Loading...");
  String result = await fetchData();
  print(result);
}