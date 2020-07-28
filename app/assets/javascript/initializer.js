/**
 * Function that calls all the individual initialize
 */
function initialize() {
    initilizeSlider();
    initializeScroll();
    initializeAnimation();
  }
  

/**
 * Adds the animation feature to every block
 */
function initializeAnimation() {
    $(".product_block")
      .mouseover(function () { this.classList.add("animate") })
      .mouseout(function () { this.classList.remove("animate") })
  }

  /**
   * This is the script for the slider with 2 handels-->
   */
  function initilizeSlider() {
    var slider = document.getElementById('slider');
    noUiSlider.create(slider, {
      start: [1, 100],
      connect: true,
      step: 1,
      range:
      {
        'min': 1,
        'max': 100
      },
      tooltips: [true, true],
    });
    slider.noUiSlider.on('update', function (values, handler) { filter(selectByPrice, args = values) });
  }
    
  /**
   * Adds options to all selectors from the localStorage
   */
  function initializeSelector() {
    var restaurant = JSON.parse(localStorage.getItem("restaurant"));
  
    //INTIALIZE CATEGORY SELECTOR
    var categoryList = restaurant.category;
    categoryList.forEach(category => $(".category_selector").append($("<option>" + category + "</option>")))
    //INITIALIZE SORTING SELECTOR
    var sortingOptions = restaurant.sorting;
    sortingOptions.forEach(option => $(".order_selector").append($("<option>" + option + "</option>")))
    //INITIALIZE VEGETARIAN SELECTOR
    var vegetarianOptions = restaurant.vegetarian;
    vegetarianOptions.forEach(option => $(".vegetarian_selector").append($("<option>" + option + "</option>")))
  }

  /**
   * Animates the the toolbar when we scroll down
   */
  function initializeScroll() {
    $(document).scroll(function () {
  
      if ($(window).scrollTop() === 0) {
        $("#tool_bar").removeClass("fixed");
      }
      else
        $("#tool_bar").addClass("fixed");
    })
  }