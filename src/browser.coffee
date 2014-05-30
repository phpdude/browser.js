define ['vendor/platform'], (platform)->
  _doc_element = window.document.documentElement

  # Check if docElement already has a given class.
  _hasClass = (class_name) ->
    regex = new RegExp class_name, 'i'
    _doc_element.className.match regex

  # Normalize and set class name attribute for html tag
  _setClass = (class_name) ->
    _doc_element.className = ((class_name || "").replace /\s+/, " ").trim()

  # Add one or more CSS classes to the <html> element.
  _addClass = (class_name) ->
    if not _hasClass class_name
      _setClass _doc_element.className + " " + class_name

  # Remove single CSS class from the <html> element.
  _removeClass = (class_name) ->
    if _hasClass class_name
      _setClass _doc_element.className.replace class_name, ""

  # Removing default classes
  _removeClass 'no-js'
  _removeClass 'nojs'

  class Browser
  Browser.classes = ->
    ua = platform.name.toLowerCase()

    # Renaming some OS names
    osmap = {
      'os x': 'mac'
    }

    os = platform.os.family.toLowerCase()
    os = osmap[os] || os.split(' ')[0]

    [
      "ua-#{ua}",
      "os-#{os}",
      "#{os}-#{ua}",
      "ua-#{platform.name.toLowerCase()}#{parseInt(platform.version)}"
    ]

  for c in Browser.classes()
    _addClass c

  return Browser