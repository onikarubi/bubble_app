$(function () {
  const scrollBottom = () => {
    let bottom = $(document).height() - $(window).height()
    $('html, body').animate({ scrollTop: bottom }, 500);
  }

  $(document).on("click", ".reply", function () {
    scrollBottom();
    $('.comment-form__text').trigger('focus');
  });
})