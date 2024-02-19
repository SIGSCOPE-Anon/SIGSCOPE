import javascript

class ObjectWithNonceProperty extends ObjectExpr {
  int position;

  ObjectWithNonceProperty() {
    exists(Property p |
      this.getProperty(position) = p and
      p.getName() = "nonce"
    )
  }

  int getPosition() {
    result = position+1
  }
}

from ObjectWithNonceProperty obj
select obj, "Nonce position: " + obj.getPosition()
