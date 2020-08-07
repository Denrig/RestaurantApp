$('body').on('load',funcion(){initialize()})

/**
 * Function that calls all the individual initialize
 */
function initialize() {
  initializeScroll();
  initilizeSlider("slider");
}

/**
 * Animates the the toolbar when we scroll down
 */
function initializeScroll() {
  $(document).scroll(function () {
    if ($(window).scrollTop() === 0) {
      $("#tool-bar").removeClass("fixed");
    } else $("#tool-bar").addClass("fixed");
  });
}

/**
 * This is the script for the slider with 2 handels-->
 */
function initilizeSlider(sliderName) {
  var slider = $("#" + sliderName)[0];
  if (slider)
    noUiSlider.create(slider, {
      start: [1, 100],
      connect: true,
      step: 1,
      range: {
        min: 1,
        max: 100,
      },
      tooltips: [true, true],
    });
}
