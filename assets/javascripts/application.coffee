---
---

parallaxBackground = ->
  $('section').each ->
    $bgobj = $(this)
    $window = $(window)
    if ($window.width() > 640 || $window.height() > 438)
      yPos = -(($window.scrollTop() - $bgobj.offset().top) / 10)
    else
      yPos = 0

    coords = "50% #{yPos}px"
    $bgobj.css({ backgroundPosition: coords })

animateOnScroll = ->
  $('.scroll').each ->
    $this = $(this)
    elementPos = $this.offset().top
    topOfWindow = $(window).scrollTop()
    if elementPos < topOfWindow+400
      $this.removeClass('scroll').addClass("animated #{$this.data('animate')}")

$(document).on 'ready', ->
  $(window).on 'scroll', ->
    parallaxBackground()
    animateOnScroll()
