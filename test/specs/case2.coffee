assert = require 'power-assert'
co = require 'co'
browser.addCommand "getUrlAndTitleCS", co.wrap ->
  urlResult = yield this.url()
  titleResult = yield this.getTitle()
  url: urlResult.value, title: titleResult

describe 'cs test case', ->
  before ->
    browser.url 'http://webdriver.io'

  it 'generator', ->
    title = yield browser.getTitle()
    assert /WebdriverIO/.test(title) == true

  it 'custom command', ->
    urlAndTitle = yield browser.getUrlAndTitleCS()
    assert /WebdriverIO/.test(urlAndTitle.title) == true
    assert urlAndTitle.url == 'http://webdriver.io/'
