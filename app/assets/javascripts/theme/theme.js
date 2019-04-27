(function($) {
  // Toggle the side navigation
  console.log('aasd')
  $("#sidebarToggle").on('click', function(e) {
    e.preventDefault()
    $("body").toggleClass("sidebar-toggled")
    $(".sidebar").toggleClass("toggled")
  })
})(jQuery)
