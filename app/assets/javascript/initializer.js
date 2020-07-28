/**
 * Function that calls all the individual initialize
 */
function initialize() {
  initializeScroll();
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
