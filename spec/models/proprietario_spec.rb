# == Schema Information
#
# Table name: proprietarios
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

describe Proprietario do

  before do 
    @proprietario = Proprietario.new(nome: "Vladimir", email: "vladimir.bra@gmail.com")
  end

  subject { @proprietario }

  it { should respond_to(:nome) }
  it { should respond_to(:email) }

	# it { should respond_to(:password_digest) }
  # it { should respond_to(:password) }
  # it { should respond_to(:password_confirmation) }
  # it { should respond_to(:remember_token) }
  # it { should respond_to(:admin) }  
  # it { should respond_to(:authenticate) }
  # it { should respond_to(:microposts) }
  # it { should respond_to(:feed) }
  # it { should respond_to(:relationships) }
  # it { should respond_to(:followed_proprietarios) }  
  # it { should respond_to(:reverse_relationships) }
  # it { should respond_to(:followers) }
  # it { should respond_to(:following?) }
  # it { should respond_to(:follow!) }
  # it { should respond_to(:unfollow!) }

  it { should be_valid }
  # it { should_not be_admin }  

  # describe "with admin attribute set to 'true'" do
  #   before do
  #     @proprietario.save!
  #     @proprietario.toggle!(:admin)
  #   end

  #   it { should be_admin }
  # end

  describe "when nome is not present" do
  	before { @proprietario.nome = " " }
  	it { should_not be_valid }
  end

  # describe "when email is not present" do
  # 	before { @proprietario.email = " " }
  # 	it { should_not be_valid }
  # end

  # describe "when name is too long" do
  #   before { @proprietario.name = "a" * 51 }
  #   it { should_not be_valid }
  # end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[proprietario@foo,com proprietario_at_foo.org example.proprietario@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @proprietario.email = invalid_address
        @proprietario.should_not be_valid
      end      
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[proprietario@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @proprietario.email = valid_address
        @proprietario.should be_valid
      end      
    end
  end

  describe "email address with mixed case" do
    let(:mixed_case_email) { "Foo@ExAMPle.CoM" }

    it "should be saved as all lower-case" do
      @proprietario.email = mixed_case_email
      @proprietario.save
      @proprietario.reload.email.should == mixed_case_email.downcase
    end
  end  

  describe "when email address is already taken" do
    before do
      proprietario_with_same_email = @proprietario.dup
      proprietario_with_same_email.email = @proprietario.email.upcase
      proprietario_with_same_email.save
    end

    it { should_not be_valid }
  end   

  # describe "when password is not present" do
  #   before { @proprietario.password = @proprietario.password_confirmation = " " }
  #   it { should_not be_valid }
  # end  

  # describe "when password doesn't match confirmation" do
  #   before { @proprietario.password_confirmation = "mismatch" }
  #   it { should_not be_valid }
  # end  

  # describe "when password confirmation is nil" do
  #   before { @proprietario.password_confirmation = nil }
  #   it { should_not be_valid }
  # end  

  # describe "with a password that's too short" do
  #   before { @proprietario.password = @proprietario.password_confirmation = "a" * 5 }
  #   it { should be_invalid }
  # end  
  
  # describe "return value of authenticate method" do
  #   before { @proprietario.save }
  #   let(:found_proprietario) { Proprietario.find_by_email(@proprietario.email) }

  #   describe "with valid password" do
  #     it { should == found_proprietario.authenticate(@proprietario.password) }
  #   end

  #   describe "with invalid password" do
  #     let(:proprietario_for_invalid_password) { found_proprietario.authenticate("invalid") }

  #     it { should_not == proprietario_for_invalid_password }
  #     specify { proprietario_for_invalid_password.should be_false }
  #   end
  # end
    
  # describe "remember token" do
  #   before { @proprietario.save }
  #   its(:remember_token) { should_not be_blank }
  # end  

  # describe "micropost associations" do

  #   before { @proprietario.save }
  #   let!(:older_micropost) do 
  #     FactoryGirl.create(:micropost, proprietario: @proprietario, created_at: 1.day.ago)
  #   end
  #   let!(:newer_micropost) do
  #     FactoryGirl.create(:micropost, proprietario: @proprietario, created_at: 1.hour.ago)
  #   end

  #   it "should have the right microposts in the right order" do
  #     @proprietario.microposts.should == [newer_micropost, older_micropost]
  #   end

  #   it "should destroy associated microposts" do
  #     microposts = @proprietario.microposts
  #     @proprietario.destroy
  #     microposts.each do |micropost|
  #       Micropost.find_by_id(micropost.id).should be_nil
  #     end
  #   end 

  #   describe "status" do
  #     let(:unfollowed_post) do
  #       FactoryGirl.create(:micropost, proprietario: FactoryGirl.create(:proprietario))
  #     end
  #     let(:followed_proprietario) { FactoryGirl.create(:proprietario) }

  #     before do
  #       @proprietario.follow!(followed_proprietario)
  #       3.times { followed_proprietario.microposts.create!(content: "Lorem ipsum") }
  #     end

  #     its(:feed) { should include(newer_micropost) }
  #     its(:feed) { should include(older_micropost) }
  #     its(:feed) { should_not include(unfollowed_post) }
  #     its(:feed) do
  #       followed_proprietario.microposts.each do |micropost|
  #         should include(micropost)
  #       end
  #     end      
  #   end       
  # end  

  # describe "relationship associations" do
  #   let(:other_proprietario) { FactoryGirl.create(:proprietario) }    
  #   before do
  #     @proprietario.save
  #     @proprietario.follow!(other_proprietario)
  #   end

  #   it "should have associated relationships" do
  #     relationships = @proprietario.relationships
  #     relationships.each do |relationship|
  #       Relationship.find_by_id(relationship.id).should_not be_nil
  #     end
  #   end

  #   it "should destroy associated relationships" do
  #     relationships = @proprietario.relationships
  #     @proprietario.destroy
  #     relationships.each do |relationship|
  #       Relationship.find_by_id(relationship.id).should be_nil
  #     end
  #   end 
  # end

  # describe "following" do
  #   let(:other_proprietario) { FactoryGirl.create(:proprietario) }    
  #   before do
  #     @proprietario.save
  #     @proprietario.follow!(other_proprietario)
  #   end

  #   it { should be_following(other_proprietario) }
  #   its(:followed_proprietarios) { should include(other_proprietario) }

  #   describe "followed proprietario" do
  #     subject { other_proprietario }
  #     its(:followers) { should include(@proprietario) }
  #   end

  #   describe "and unfollowing" do
  #     before { @proprietario.unfollow!(other_proprietario) }

  #     it { should_not be_following(other_proprietario) }
  #     its(:followed_proprietarios) { should_not include(other_proprietario) }
  #   end    
  # end  
end
