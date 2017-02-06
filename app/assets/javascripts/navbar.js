// Initialize affix and add an offset to add affix class on scroll
$(document).on("scroll", function() {
  if ($(document).scrollTop() > 10) {
    $("nav").addClass("navbar-fixed-top");
  } else {
    $("nav").removeClass("navbar-fixed-top");
  }
});
