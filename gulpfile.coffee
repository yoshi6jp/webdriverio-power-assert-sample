gulp = require 'gulp'
selenium = require 'selenium-standalone'
webdriver = require 'gulp-webdriver'

gulp.task 'selenium-install', (done)->
  selenium.install
    drivers:
      ie:
        arch: "ia32"
    , (err)->
      done err

gulp.task 'selenium', ['selenium-install'], (done)->
  selenium.start (err, child)->
    selenium.child = child
    done err

gulp.task 'webdriver', ['selenium'], ->
  gulp.src 'wdio.conf.js'
    .pipe webdriver()

gulp.task 'default', ['webdriver'], ->
  selenium.child?.kill()
