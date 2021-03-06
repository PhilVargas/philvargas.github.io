---
---

parallaxBackground = ->
  $('section').each ->
    $bgobj = $(this)
    $window = $(window)
    if ($window.width() > 1024)
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
    if elementPos < topOfWindow + 0.75 * $(window).height()
      $this.removeClass('scroll').addClass("animated #{$this.data('animate')}")

$(document).on 'ready', ->
  $window = $(window)
  if $window.width() > 1024
    animateOnScroll()
    parallaxBackground()
    $(window).on 'scroll', ->
      parallaxBackground()
      animateOnScroll()
