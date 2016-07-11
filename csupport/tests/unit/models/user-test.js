import { moduleForModel, test } from 'ember-qunit';

moduleForModel('user', 'Unit | Model | user', {
  // Specify the other units that are required for this test.
  needs: []
});

test('it exists', function(assert) {
  let model = this.subject();
  // let store = this.store();
  assert.ok(!!model);
});

test('it has an attribute: name', function(assert){
  var model = this.subject();
  var hasName = Object.keys(model.toJSON()).indexOf('name') > -1;
  assert.ok(hasName);
});
test('it has an attribute: email', function(assert){
  var model = this.subject();
  var hasEmail = Object.keys(model.toJSON()).indexOf('email') > -1;
  assert.ok(hasEmail);
});
test('it has an attribute: password', function(assert){
  var model = this.subject();
  var hasPass = Object.keys(model.toJSON()).indexOf('password') > -1;
  assert.ok(hasPass);
});
test('it has an attribute: rolemask', function(assert){
  var model = this.subject();
  var hasRoleMask = Object.keys(model.toJSON()).indexOf('rolemask') > -1;
  assert.ok(hasRoleMask);
});
test('it has an attribute: role', function(assert){
  var model = this.subject();
  var hasRole = Object.keys(model.toJSON()).indexOf('role') > -1;
  assert.ok(hasRole);
});