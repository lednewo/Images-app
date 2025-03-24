enum PagesEnum {
  home('Home', 0),
  explore('Explore', 1),
  account('Account', 2),
  ;

  final String name;
  final int indexPage;

  const PagesEnum(
    this.name,
    this.indexPage,
  );
}
