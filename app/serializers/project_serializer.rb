class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :location, :phase, :sector, :classification, :size, :total, :cost_per_sf


  def cost_per_sf
    (object.total / object.size).round
  end
end
