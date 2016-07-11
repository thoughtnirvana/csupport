import { moduleForModel, test } from 'ember-qunit';

moduleForModel('ticket', 'Unit | Model | ticket', {
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

test('it has an attribute: description', function(assert){
  var model = this.subject();
  var hasDesc = Object.keys(model.toJSON()).indexOf('description') > -1;
  assert.ok(hasDesc);
});

test('it has an attribute: user_id', function(assert){
  var model = this.subject();
  var hasUserId = Object.keys(model.toJSON()).indexOf('user_id') > -1;
  assert.ok(hasUserId);
});

test('it has an attribute: status', function(assert){
  var model = this.subject();
  var hasStatus = Object.keys(model.toJSON()).indexOf('status') > -1;
  assert.ok(hasStatus);
});