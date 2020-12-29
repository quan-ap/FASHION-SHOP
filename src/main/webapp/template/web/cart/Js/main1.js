$(window).on("load", () =>{
  $(".wrap-loading").delay(1400).fadeOut("slow/800/fast");
});

$(function () {


  $(window).scroll(() => {
    let positionHlml = $("html,body").scrollTop();
    if (positionHlml > 175) {
      $(".back-to-top").addClass("show-btn-back-to-top");
      // $(".header-cart__block-top").addClass("sticky-top");
    } else {
      $(".back-to-top").removeClass("show-btn-back-to-top");
      // $(".header-cart__block-top").removeClass("sticky-top");
    }
  });

  $(".back-to-top").click(() => {
    $("html,body").animate(
      {
        scrollTop: 0,
      },
      1400,
      "easeOutExpo"
    ); //easeInOutCubic
  });
});
