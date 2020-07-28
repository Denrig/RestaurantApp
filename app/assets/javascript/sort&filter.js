
/**
 * Filters the products and display only the ones that fill the requirements
 *
 * @param {function} selectingFunction The function used to determine what products we shoud display
 * @param {*} args -Optional! some values are used for selecting what producs we should use  
 */
function filter(selectingFunction, args = []) {
  for (i = 0; i < $('.product_block').length; i++) {
    var productJson = {
      name: $(".product_block .product_name")[i].innerHTML,
      price: $(".product_block .product_price")[i].innerHTML,
      category: $(".product_block .product_category")[i].innerHTML,
      imageURL: $(".product_block .product_image")[i].getAttribute("src")
    }

    if (!selectingFunction(productJson, args))
      $('.product_block')[i].classList.add("hidden")
    else
      $('.product_block')[i].classList.remove("hidden")
  }
}

/**
 * Returns true if the product's price is inside the range given
 * 
 * @param {JSON} product -The product we apply selection to 
 * @param {*} args - Array of 2 values that represents the range of price
 */
function selectByPrice(product, args) {

  var productPrice = product.price.split(" ")[0]
  if (parseFloat(args[0]) <= productPrice && parseFloat(args[1]) >= productPrice)
    return true;
  else
    return false;
}

/**
 * Returns true if the product is from a specific category
 * 
 * @param {JSON} product -The product we apply selection to 
 */
function selectByCategory(product) {
  //CHECK THAT THE CATEGORY IS VALID
  if ($("#categorySelector").val() !== "Category") {
    if ($("#categorySelector").val() == product.category)
      return true;
    else
      return false;
  }
  else
    return true;
}


/**
 * Sorts the productBloks by a specific criterya
 */
function sortBlocks() {
  sortFunction = NaN
  switch ($(".orderSelector").val()) {
    case "Sorting":
      break;
    case "By Price":
      sortFunction = compareByPrice;
      break;
    case "By Name":
      sortFunction = compareByName
      break;
  }

  if (sortFunction !== NaN) {
    var blocks = $(".productBlock");
    blocks.sort(sortFunction);

    //REPLACE IN PAGE
    blocks.appendTo($(".productsList"))
  }
}

/**
 * Function used for comparing 2 elements by Price
 * @param {HTML} obj1 -html object used for comparing 
 * @param {HMTL} obj2 -html object used for comparing 
 */
function compareByPrice(obj1, obj2) {

  var price1 = $(obj1).find(".productPrice").html();
  var price2 = $(obj2).find(".productPrice").html()
  if (price1 < price2)
    return -1;
  else if (price1 > price2)
    return 1;
  else
    return 0;
}

/**
 * Function used for comparing 2 elements by Name
 * @param {HTML} obj1 -html object used for comparing 
 * @param {HMTL} obj2 -html object used for comparing 
 */
function compareByName(obj1, obj2) {
  var name1 = $(obj1).find(".productName").html();
  var name2 = $(obj2).find(".productName").html()
  if (name1 < name2)
    return -1;
  else if (name1 > name2)
    return 1;
  else
    return 0;
}
