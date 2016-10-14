# starter-code/hash-map.rb

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
    out_arr = ["{"]
    @array.each do |list|
      out_arr << list.inspect
    end
    out_arr << ["}"]
    out_arr.join("\n")
  end

  def to_hash(key)
    char_sum = 0
    key.each_char do |c|
      char_sum += c.ord
    end
    char_sum % @length
  end

  # @TODO: update this method so it doesn't allow inserting duplicate keys
  def put(key, value)
    arr_pos = self.to_hash(key)
    list = @array[arr_pos]
    list.insert_at_start({ key: key, value: value })
  end

  def get(key)
    arr_pos = self.to_hash(key)
    list = @array[arr_pos]
    # we should consider how to move this part into linked list implementation
    current_node = list.head
    until current_node.nil? do
      return current_node.data[:value] if current_node.data[:key] == key
      current_node = current_node.next
    end
    "Key #{key} does not exist"
  end

  #
  #   remove: function(key) {
  #     var arr_pos = this.toHash(key);
  #     return this.h_array[arr_pos].delete(key);
  #   },
end

h = HashMap.new

p h.to_hash("b")
h.put("b", 15)
h.put("b", 14)
p h
p h.get("bf")




#
#   // TODO: Implement `set` function here!
#   // It should change value associated with the `key` passed in, to the `value` passed in.
#
#   keySet: function() {
#     return this.h_array
#       .map(function (el) {
#         return el.list('k');
#       })
#       .filter(function (el2) {
#         return el2 != undefined;
#       })
#       .reduce(function (pre, cur) {
#         return pre.concat(cur);
#       }, []);
#   },
#
#   values: function() {
#     return this.h_array
#       .map(function(el) {
#         return el.list('v');
#       })
#       .filter(function (el2) {
#         return el2 != undefined
#       })
#       .reduce(function (pre, cur) {
#         return pre.concat(cur);
#       }, []);
#   }
# }
#
#
# // export for driver
# module.exports = HashMap;
