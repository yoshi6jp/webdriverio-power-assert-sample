var assert = require('power-assert');
var co = require('co');
browser.addCommand("getUrlAndTitle", co.wrap(function* () {
  var urlResult = yield this.url();
  var titleResult = yield this.getTitle();
  return { url: urlResult.value, title: titleResult };
}));
describe('js test case', function() {
  before(function(){
    browser.url('http://webdriver.io');
  })
  it('generator', function* () {
    var title = yield browser.getTitle();
    assert(/WebdriverIO/.test(title) == true);
  });
  it('custom command', function* (){
    var urlAndTitle = yield browser.getUrlAndTitle();
    assert(/WebdriverIO/.test(urlAndTitle.title) == true);
    assert(urlAndTitle.url == 'http://webdriver.io/');
  });
});
