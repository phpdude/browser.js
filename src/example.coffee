classes = browser.classes()

document.getElementById('extra_classes').innerHTML = classes.join(" ")
document.getElementById('all_classes').innerHTML = window.document.documentElement.className