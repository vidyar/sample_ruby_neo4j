require 'neo4j'

puts "starting neo4j buildsample written using ruby.."

puts "Creating sample nodes with properties name and age.."

session = Neo4j::Session.open(:server_db, "http://localhost:7474")
Neo4j::Transaction.run do
  node1 = Neo4j::Node.create({name: 'uone', age: 10})
  node2 = Neo4j::Node.create({name: 'utwo', age: 15})
  node3 = Neo4j::Node.create({name: 'uthree', age: 30})
  node4 = Neo4j::Node.create({name: 'ufour', age: 40})

  puts "Assigning relationship between nodes.."


  Neo4j::Relationship.create(:friends, node1, node2)
  Neo4j::Relationship.create(:friends, node2, node3)
  Neo4j::Relationship.create(:friends, node3, node4)
  Neo4j::Relationship.create(:friends, node1, node4)

  puts "Output from the sample program: "
  
  rels = node1.rels(dir: :outgoing, type: :friends)
  puts rels
end
