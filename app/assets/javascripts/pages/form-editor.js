(function () {
  $.turbo.execute(".forms-editor-page", function() {
    $(".textarea").wysihtml5()
    $("#summernote-editor").summernote({
      height: 300
    })
  })
})()
