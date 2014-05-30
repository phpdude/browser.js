# Save the previous value of browser variable
previousBrowser = window.browser

# Get platform instance
platform = window.platform

# Add browser as global object
window.browser = {}

# The <html> element
_doc_element = window.document.documentElement

# Main functions
# --------------

browser.classes = ->
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
    "ua-#{ua}#{parseInt(platform.version)}"
  ]
browser.noConflict = ->
  window.browser = previousBrowser
  @

# Private utilities
# -----------------

# Check if docElement already has a given class.
_hasClass = (class_name) ->
  regex = new RegExp class_name, 'i'
  _doc_element.className.match regex

# Normalize and set class name attribute for html tag
_setClass = (class_names...) ->
  for class_name in class_names
    _doc_element.className = ((class_name || "").replace /\s+/, " ").trim()

# Add one or more CSS classes to the <html> element.
_addClass = (class_names...) ->
  for class_name in class_names
    if not _hasClass class_name
      _setClass _doc_element.className + " " + class_name

# Remove single CSS class from the <html> element.
_removeClass = (class_names...) ->
  for class_name in class_names
    if _hasClass class_name
      _setClass _doc_element.className.replace class_name, ""


# Initialization
# --------------

# Removing default nojs classes
_removeClass 'no-js', 'nojs'

# Adding current browser classes
_addClass cls for cls in browser.classes()

window.browser = browser