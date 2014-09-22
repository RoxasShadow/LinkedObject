#--
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                    Version 2, December 2004
#
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#  0. You just DO WHAT THE FUCK YOU WANT TO.
#++

class LinkedObject
  attr_accessor :val

  def initialize(val = nil, listeners = [])
    @val = val
    @listeners = [self] + listeners
  end

  def new_listener(*args)
    new_listeners(1, *args).first
  end

  def new_listeners(n, *args)
    [].tap do |listeners|
      n.times do
        listeners << self.class.new(*args).tap { |l| self.is_listened_by(l) }
      end
    end
  end

  def with_listeners(n, *args)
    [self] + new_listeners(n, *args)
  end

  def is_listened_by(o)
    @listeners << o
  end; alias_method :add_listener, :is_listened_by

  def get_val
    @val
  end

  def set_val(val)
    @val = val
  end; alias_method :set, :set_val

  %i(== === < <= <=> >= >).each do |m|
    define_method(m) do |s|
      @val.send(s)
    end
  end

  def apply(method, *args)
    @val = @val.send(method, *args)
  end

  def method_missing(method, *args, &block)
    if method =~ /with_\d_listeners?/
      n = method.to_s.scan(/with(_\d+_)?listeners?/).first.first[1..-2].to_i
      [self] + new_listeners(n, *args)
    else
      @listeners.each { |l| l.apply(method, *args) }
    end
  end

  def inspect
    get_val
  end
end
