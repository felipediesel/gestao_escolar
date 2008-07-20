class Student < ActiveRecord::Base
  has_and_belongs_to_many :classrooms, :order => 'start'
  has_many :presences
  
  OPTIONS_FOR_STATE = ['Acre', 'Alagoas', 'Amapá', 'Amazonas', 'Bahia', 'Ceará',
    'Distrito Federal', 'Espírito Santo', 'Goiás', 'Maranhão', 'Mato Grosso',
    'Mato Grosso do Sul', 'Minas Gerais', 'Pará', 'Paraíba', 'Paraná', 'Pernambuco',
    'Piauí', 'Rio de Janeiro', 'Rio Grande do Norte', 'Rio Grande do Sul', 'Rondônia',
    'Roraima', 'Santa Catarina', 'São Paulo', 'Sergipe', 'Tocantins']
    
  validates_presence_of :firstname, :lastname, :birth
  validates_inclusion_of :state, :in => OPTIONS_FOR_STATE

  def name
  	"#{firstname} #{lastname}"
  end
end
