# lib/node.rb

class Node
  def initialize(options) # hash with key and data
    if !options[:key].nil?
      @key = options[:key]
    else
      raise ArgumentError, 'Node key cannot be nil'
    end
    if !options[:data].nil?
      @data = options[:data]
    else
      raise ArgumentError, 'Node data cannot be nil'
    end
    @next = nil
  end

  attr_reader :data, :next, :key

  def data=(new_data)
    if !new_data.nil?
      @data = new_data
    else
      raise ArgumentError, 'Node data cannot be nil'
    end
  end

  def next=(new_next)
    if new_next.is_a? Node
      @next = new_next
    elsif new_next.nil?
      @next = new_next
    else
      raise ArgumentError, 'Node next must be a Node or nil'
    end
  end

  def key=(new_key)
    if !new_key.nil?
      @key = new_key
    else
      raise ArgumentError, 'Node key cannot be nil'
    end
  end

end
