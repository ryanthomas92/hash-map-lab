# solution/hash-map.rb

require_relative '../lib/node'
require_relative '../lib/singly_linked_list'

class HashMap
  def initialize(length=16)
    @length = length
    @array = Array.new(length)
    @array.each_index do |i|
      @array[i] = SinglyLinkedList.new
    end
  end

  def inspect
    out = "{"
    @array.each do |list|
      out << "\n#{list.inspect}"
    end
    out << "}"
  end

  # @TODO: update this method so it doesn't allow inserting duplicate keys
  def put(key, value)
    arr_pos = to_hash(key)
    list = @array[arr_pos]
    node = list.find_by_key key
    if node
      raise(ArgumentError, "Key already exists.")
    else
      list.insert_at_start({ key: key, data: value })
    end
  end

  def get_value(key)
    arr_pos = to_hash(key)
    list = @array[arr_pos]
    node = list.find_by_key(key)
    if node
      node.data
    else
      "Key #{key} does not exist"
    end
  end

  def remove key
    arr_pos = to_hash(key)
    list = @array[array_pos]
    list.delete_with_key key
  end


  # TODO: Implement `set` function here!
  # It should change value associated with the `key` passed in, to the `value` passed in.
  def set(key, value)
    arr_pos = to_hash(key)
    list = @array[array_pos]
    node = list.find_by_key(key)
    if node
      node.data = value
    else
      self.put(key, value)
    end
  end

  def keyArr
    key_arr = []
    @array.each do |list|
      key_arr.concat(list.to_a.map { |node| node.key })
    end
  end

  def values
    val_arr = []
    @array.each do |list|
      val_arr.concat(list.to_a.map { |node| node.data })
    end
  end


  private
    def to_hash(key)
      char_sum = key.each_byte.inject { |sum, n| sum + n }
      char_sum % @length
    end
end
