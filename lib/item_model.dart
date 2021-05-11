class item_model {
  String itemname;
  String imagename;
  int itmprice;

  item_model(String imagename, String itemname , int itmprice)
  {
      this.itemname=itemname;
      this.imagename =imagename;
      this.itmprice = itmprice;
  }
  String getImagename()
  {
    return this.imagename;
  }
  String getItemname()
  {
    return this.itemname;
  }
  int getItmprice()
  {
    return this.itmprice;
  }
}