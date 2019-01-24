require "gossip"
require "view"

class Controller
  def initialize
      @view = View.new
  end

  def create_gossip
    params = @view.create_gossip.to_a
    gossip = Gossip.new((params[0][0]).to_s, (params[0][1]).to_s) #pour le moment, le contenu du gossip est en dur dans le code. L'utilisateur ne peut pas le changer.
    gossip.save
  end

  def index_gossip
    Gossip.new('a' , 'b') #initialisation a pour l'auteur et b pour le contenu
    Gossip.all
  end

  def destroy
    params = @view.destroy
    gossip = Gossip.new(params.to_s, 'b')
    gossip.destroy
  end
end
