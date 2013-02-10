class Linha < ActiveRecord::Base
  attr_accessible :numero, :proprietario


	before_save { @numero = @numero.gsub(/\D/, '') }

	VALID_NUMERO_REGEX = /\d{7,15}/i
  validates :numero, presence: true, 
  									 format:     { with: VALID_NUMERO_REGEX },
            				 uniqueness: { case_sensitive: false }
  					


end
