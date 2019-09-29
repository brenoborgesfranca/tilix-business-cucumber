module.exports = function() {
  this.After(function() {
    this.driver.get('javascript:localStorage.clear();')
    this.driver.get('javascript:localStorage.clear();')
    return this.driver.quit();
  });
};
