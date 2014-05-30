# [browser.js](https://github.com/phpdude/browser.js/) v0.1.0

browser.js makes it easy to write conditional CSS based on device operating system and web browser.

### Examples

browser.js inserts css classes into `<html>` element.

### Mac OS & Firefox

<img src="http://phpdude.github.io/browser.js/screenshots/mac%20os%20firefox.png" />

### iPad Emulator & Safari

<img src="http://phpdude.github.io/browser.js/screenshots/ipad.png" />

### Mac OS & Google Chrome

<img src="http://phpdude.github.io/browser.js/screenshots/mac%20os%20chrome.png" />

## Usage

Just include the script. The script then updates the `<html>` section with the appropriate classes based on os & browser names detected by [platform.js](https://github.com/bestiejs/platform.js).

``` html
<script src="lib/browser.min.js"></script>
```

### Embeded class names

browser.js add classes to `<html>` element by masks

```
ua-#{ua}
os-#{os}
#{os}-#{ua}
ua-#{ua}#{version} (Major version number)
```

Example for Mac OS & firefox

```
ua-firefox
os-mac
mac-firefox
ua-firefox29
```

### Support no-js/nojs `<html>` classes.

browser.js will remove no-js or nojs classes from `<html>` element.

### Utilities

#### browser.noConflict()

Run browser.js in noConflict mode, returning the browser variable to its previous owner.
Returns a reference to the browser object.

#### browser.js JavaScript methods

You can get browser detected classes by javascript api.

``` html
<script>
console.log(browser.classes());
</script>
```

browser.js doesn't remove any extra classes added in `<html>` section.

### Usage

In your CSS you can use added browser.js classes for making elegant hacks for selected browsers. For example you can make hacks for all IE and IE6.

``` css
.ua-ie .adv {
    margin-top: 15px;
}

.ua-ie6 .adv {
    margin-top: 17px;
}
```

### Contributor

Alexandr Shurigin (aka [phpdude](https://github.com/phpdude/))

### Thanks to

##### [platform.js](https://github.com/bestiejs/platform.js)

platform.js used for browsers & OS detection capabilities.