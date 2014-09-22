#! /usr/bin/env ruby
require 'linkedobject'

describe LinkedObject do
  it 'is fucking holy' do
    a, b = LinkedObject.new.with_1_listener(-1)

    expect(a).to be_a(LinkedObject)
    expect(b).to be_a(LinkedObject)

    expect { a.set 1 }.to change { a.val }.from(nil).to(1)
    expect { b.set 2 }.to change { b.val }.from(-1).to(2)

    expect { a + 1 }.to change { a.val }.from(1).to(2)

    a - 1 # TODO "...and change..."
    expect { a + 1 }.to change { b.val }.from(2).to(3)

    expect { a.set 'lo' }.to_not change { b.val }

    b.is_listened_by(a)
    expect { b * 2 }.to change { b.val }.to(6)
    expect { b * 2 }.to change { a.val }.to('lolololo') # TODO "...and change..."
  end
end
