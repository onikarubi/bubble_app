$(function () {
  $(document).on('change', '#file-upload', function () {
    const file = $(this).prop('files')[0];

    $('#file-text').text(file.name);
  })

})