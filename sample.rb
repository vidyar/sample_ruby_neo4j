require 'neo4j'

puts "starting neo4j buildsample written using ruby.."

puts "Creating sample nodes with properties name and age.."
Neo4j::Transaction.run do
  node1 = Neo4j::Node.new(:name => 'uone', :age => 10)
  node2 = Neo4j::Node.new(:name => 'utwo', :age => 20)
  node3 = Neo4j::Node.new(:name => 'uthree', :age => 30)
  node4 = Neo4j::Node.new(:name => 'ufour', :age => 40)

  puts "Assigning relationship between nodes.."

  node1.both(:friends) << node2
  node2.both(:friends) << node3
  node3.both(:friends) << node4

  puts "Output from the sample program: "

  puts node1.outgoing(:friends).depth(3).map{|node| node[:name]}.join(" => ")
end
