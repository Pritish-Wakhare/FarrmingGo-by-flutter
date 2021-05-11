class cart_model {
  String itemname;
  String imagename;
  int itmprice;
  int quantity;
  int total;
  int finalsum;


  cart_model(String imagename, String itemname , int itmprice,int quantity,int total)
  {
    this.itemname=itemname;
    this.imagename =imagename;
    this.itmprice = itmprice;
    this.quantity = quantity;
    this.total = total;

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
  int getQuantity()
  {
    return this.quantity;
  }
  int getTotal()
  {
    return this.total;
  }
  void setFinalsum(int finalsum)
  {
    this.finalsum = finalsum;
  }
}