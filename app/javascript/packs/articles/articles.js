$(function () {
  $('#file-upload').on('change', function () {
    const file = $(this).prop('files')[0];

    $('#file-text').text(file.name);
  })
})