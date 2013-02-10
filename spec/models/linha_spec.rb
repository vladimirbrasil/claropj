# == Schema Information
#
# Table name: linhas
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#  admin           :boolean          default(FALSE)
#

require 'spec_helper'

describe Linha do

  before do 
    @linha = Linha.new(numero: "5192880744")
  end

  subject { @linha }

  it { should respond_to(:numero) }
  
  # it { should respond_to(:proprietario) }
	# it { should respond_to(:password_digest) }
  # it { should respond_to(:password) }
  # it { should respond_to(:password_confirmation) }
  # it { should respond_to(:remember_token) }
  # it { should respond_to(:admin) }  
  # it { should respond_to(:authenticate) }
  # it { should respond_to(:microposts) }
  # it { should respond_to(:feed) }
  # it { should respond_to(:relationships) }
  # it { should respond_to(:followed_linhas) }  
  # it { should respond_to(:reverse_relationships) }
  # it { should respond_to(:followers) }
  # it { should respond_to(:following?) }
  # it { should respond_to(:follow!) }
  # it { should respond_to(:unfollow!) }

  it { should be_valid }
  # it { should_not be_admin }  

  # describe "with admin attribute set to 'true'" do
  #   before do
  #     @linha.save!
  #     @linha.toggle!(:admin)
  #   end

  #   it { should be_admin }
  # end

  describe "when numero is not present" do
  	before { @linha.numero = " " }
  	it { should_not be_valid }
  end

  # describe "when email is not present" do
  # 	before { @linha.email = " " }
  # 	it { should_not be_valid }
  # end

  # describe "when name is too long" do
  #   before { @linha.name = "a" * 51 }
  #   it { should_not be_valid }
  # end

  describe "when numero format is invalid" do
    it "should be invalid" do
      numeros = %w[51-9288-0744 51 51xxx888]
      numeros.each do |invalid_numero|
        @linha.numero = invalid_numero
        @linha.should_not be_valid
      end      
    end
  end

  # describe "when email format is valid" do
  #   it "should be valid" do
  #     addresses = %w[linha@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
  #     addresses.each do |valid_address|
  #       @linha.email = valid_address
  #       @linha.should be_valid
  #     end      
  #   end
  # end



  # describe "numero misturado com nao digitos" do
  #   let(:mixed_numero) { "51 9288-x0744" }

  #   it "should be saved as only numbers" do
  #     @linha.numero = mixed_numero
  #     @linha.save
  #     @linha.reload.numero.should == "5192880744"
  #   end
  # end  



  # describe "when email address is already taken" do
  #   before do
  #     linha_with_same_email = @linha.dup
  #     linha_with_same_email.email = @linha.email.upcase
  #     linha_with_same_email.save
  #   end

  #   it { should_not be_valid }
  # end  

  # describe "when password is not present" do
  #   before { @linha.password = @linha.password_confirmation = " " }
  #   it { should_not be_valid }
  # end  

  # describe "when password doesn't match confirmation" do
  #   before { @linha.password_confirmation = "mismatch" }
  #   it { should_not be_valid }
  # end  

  # describe "when password confirmation is nil" do
  #   before { @linha.password_confirmation = nil }
  #   it { should_not be_valid }
  # end  

  # describe "with a password that's too short" do
  #   before { @linha.password = @linha.password_confirmation = "a" * 5 }
  #   it { should be_invalid }
  # end  
  
  # describe "return value of authenticate method" do
  #   before { @linha.save }
  #   let(:found_linha) { Linha.find_by_email(@linha.email) }

  #   describe "with valid password" do
  #     it { should == found_linha.authenticate(@linha.password) }
  #   end

  #   describe "with invalid password" do
  #     let(:linha_for_invalid_password) { found_linha.authenticate("invalid") }

  #     it { should_not == linha_for_invalid_password }
  #     specify { linha_for_invalid_password.should be_false }
  #   end
  # end
    
  # describe "remember token" do
  #   before { @linha.save }
  #   its(:remember_token) { should_not be_blank }
  # end  

  # describe "micropost associations" do

  #   before { @linha.save }
  #   let!(:older_micropost) do 
  #     FactoryGirl.create(:micropost, linha: @linha, created_at: 1.day.ago)
  #   end
  #   let!(:newer_micropost) do
  #     FactoryGirl.create(:micropost, linha: @linha, created_at: 1.hour.ago)
  #   end

  #   it "should have the right microposts in the right order" do
  #     @linha.microposts.should == [newer_micropost, older_micropost]
  #   end

  #   it "should destroy associated microposts" do
  #     microposts = @linha.microposts
  #     @linha.destroy
  #     microposts.each do |micropost|
  #       Micropost.find_by_id(micropost.id).should be_nil
  #     end
  #   end 

  #   describe "status" do
  #     let(:unfollowed_post) do
  #       FactoryGirl.create(:micropost, linha: FactoryGirl.create(:linha))
  #     end
  #     let(:followed_linha) { FactoryGirl.create(:linha) }

  #     before do
  #       @linha.follow!(followed_linha)
  #       3.times { followed_linha.microposts.create!(content: "Lorem ipsum") }
  #     end

  #     its(:feed) { should include(newer_micropost) }
  #     its(:feed) { should include(older_micropost) }
  #     its(:feed) { should_not include(unfollowed_post) }
  #     its(:feed) do
  #       followed_linha.microposts.each do |micropost|
  #         should include(micropost)
  #       end
  #     end      
  #   end       
  # end  

  # describe "relationship associations" do
  #   let(:other_linha) { FactoryGirl.create(:linha) }    
  #   before do
  #     @linha.save
  #     @linha.follow!(other_linha)
  #   end

  #   it "should have associated relationships" do
  #     relationships = @linha.relationships
  #     relationships.each do |relationship|
  #       Relationship.find_by_id(relationship.id).should_not be_nil
  #     end
  #   end

  #   it "should destroy associated relationships" do
  #     relationships = @linha.relationships
  #     @linha.destroy
  #     relationships.each do |relationship|
  #       Relationship.find_by_id(relationship.id).should be_nil
  #     end
  #   end 
  # end

  # describe "following" do
  #   let(:other_linha) { FactoryGirl.create(:linha) }    
  #   before do
  #     @linha.save
  #     @linha.follow!(other_linha)
  #   end

  #   it { should be_following(other_linha) }
  #   its(:followed_linhas) { should include(other_linha) }

  #   describe "followed linha" do
  #     subject { other_linha }
  #     its(:followers) { should include(@linha) }
  #   end

  #   describe "and unfollowing" do
  #     before { @linha.unfollow!(other_linha) }

  #     it { should_not be_following(other_linha) }
  #     its(:followed_linhas) { should_not include(other_linha) }
  #   end    
  # end  
end
