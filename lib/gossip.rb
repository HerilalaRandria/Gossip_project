require 'csv'

class Gossip
  attr_reader :author , :content
  @@array_author = []
  @@array_content = []

  def initialize(author, content)
    @content = content
    @author = author

    @@array_author << @author
    @@array_content << @content

    @hash = Hash[@@array_author.zip(@@array_content)]

  end

  def save
    CSV.open("db/gossip.csv" , "wb") do |csv|
      @hash.to_a.each do |content_hash|
        csv << content_hash
      end
    end
  end

  def self.all
    i = 0
    csv = CSV.read('db/gossip.csv')
    csv.each do |element|
      all_potin = [element]
      print all_potin
      i += 1
      if i == 1
        puts ' '
        i = 0
      end
    end
  end

  def destroy
    auth = @author
    csv = CSV.read('db/gossip.csv')
    csv[auth.to_i] = nil
    array_author = []
    result = 0
    (0...csv.length).each do |i|
      unless csv[i].nil?
        array_author[result] = csv[i]
        result += 1
      end
    end
    puts array_author.to_s
  end
end
