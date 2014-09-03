module ApplicationHelper

  def cities_for_select
    City.all.map{|c| [c.name_ru, c.id]}
  end
end
