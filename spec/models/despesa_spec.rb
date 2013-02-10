require 'spec_helper'

describe Despesa do

  before do 
    @despesa = Despesa.new(numero: "5192880744", 
                           tipo: "", 
                           data: "", 
                           hora: "", 
                           origem: "",
                           numero_destino: "",
                           duracao: "",
                           tarifa: "",
                           valor: "",
                           valor_cobrado: "",
                           nome: "",
                           cc: "",
                           matricula: "",
                           descricao: "",
                           tipo_imposto: ""
                           )
  end

  subject { @despesa }

  it { should respond_to(:numero) }
  it { should respond_to(:tipo) }
	it { should respond_to(:data) }
  it { should respond_to(:hora) }
  it { should respond_to(:origem) }
  it { should respond_to(:numero_destino) }
  it { should respond_to(:duracao) }  
  it { should respond_to(:tarifa) }
  it { should respond_to(:valor) }
  it { should respond_to(:valor_cobrado) }
  it { should respond_to(:nome) }
  it { should respond_to(:cc) }  
  it { should respond_to(:matricula) }
  it { should respond_to(:descricao) }
  it { should respond_to(:tipo_imposto) }

  it { should be_valid }
  # it { should_not be_admin }  

  # describe "with admin attribute set to 'true'" do
  #   before do
  #     @despesa.save!
  #     @despesa.toggle!(:admin)
  #   end

  #   it { should be_admin }
  # end

  # describe "when numero is not present" do
  # 	before { @despesa.numero = " " }
  # 	it { should_not be_valid }
  # end

  # describe "when email is not present" do
  # 	before { @despesa.email = " " }
  # 	it { should_not be_valid }
  # end

  # describe "when name is too long" do
  #   before { @despesa.name = "a" * 51 }
  #   it { should_not be_valid }
  # end

  # describe "when numero format is invalid" do
  #   it "should be invalid" do
  #     numeros = %w[51-9288-0744 51 51xxx888]
  #     numeros.each do |invalid_numero|
  #       @despesa.numero = invalid_numero
  #       @despesa.should_not be_valid
  #     end      
  #   end
  # end

  # describe "when email format is valid" do
  #   it "should be valid" do
  #     addresses = %w[despesa@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
  #     addresses.each do |valid_address|
  #       @despesa.email = valid_address
  #       @despesa.should be_valid
  #     end      
  #   end
  # end



  # describe "numero misturado com nao digitos" do
  #   let(:mixed_numero) { "51 9288-x0744" }

  #   it "should be saved as only numbers" do
  #     @despesa.numero = mixed_numero
  #     @despesa.save
  #     @despesa.reload.numero.should == "5192880744"
  #   end
  # end  



  # describe "when email address is already taken" do
  #   before do
  #     despesa_with_same_email = @despesa.dup
  #     despesa_with_same_email.email = @despesa.email.upcase
  #     despesa_with_same_email.save
  #   end

  #   it { should_not be_valid }
  # end  

  # describe "when password is not present" do
  #   before { @despesa.password = @despesa.password_confirmation = " " }
  #   it { should_not be_valid }
  # end  

  # describe "when password doesn't match confirmation" do
  #   before { @despesa.password_confirmation = "mismatch" }
  #   it { should_not be_valid }
  # end  

  # describe "when password confirmation is nil" do
  #   before { @despesa.password_confirmation = nil }
  #   it { should_not be_valid }
  # end  

  # describe "with a password that's too short" do
  #   before { @despesa.password = @despesa.password_confirmation = "a" * 5 }
  #   it { should be_invalid }
  # end  
  
  # describe "return value of authenticate method" do
  #   before { @despesa.save }
  #   let(:found_despesa) { Despesa.find_by_email(@despesa.email) }

  #   describe "with valid password" do
  #     it { should == found_despesa.authenticate(@despesa.password) }
  #   end

  #   describe "with invalid password" do
  #     let(:despesa_for_invalid_password) { found_despesa.authenticate("invalid") }

  #     it { should_not == despesa_for_invalid_password }
  #     specify { despesa_for_invalid_password.should be_false }
  #   end
  # end
    
  # describe "remember token" do
  #   before { @despesa.save }
  #   its(:remember_token) { should_not be_blank }
  # end  

  # describe "micropost associations" do

  #   before { @despesa.save }
  #   let!(:older_micropost) do 
  #     FactoryGirl.create(:micropost, despesa: @despesa, created_at: 1.day.ago)
  #   end
  #   let!(:newer_micropost) do
  #     FactoryGirl.create(:micropost, despesa: @despesa, created_at: 1.hour.ago)
  #   end

  #   it "should have the right microposts in the right order" do
  #     @despesa.microposts.should == [newer_micropost, older_micropost]
  #   end

  #   it "should destroy associated microposts" do
  #     microposts = @despesa.microposts
  #     @despesa.destroy
  #     microposts.each do |micropost|
  #       Micropost.find_by_id(micropost.id).should be_nil
  #     end
  #   end 

  #   describe "status" do
  #     let(:unfollowed_post) do
  #       FactoryGirl.create(:micropost, despesa: FactoryGirl.create(:despesa))
  #     end
  #     let(:followed_despesa) { FactoryGirl.create(:despesa) }

  #     before do
  #       @despesa.follow!(followed_despesa)
  #       3.times { followed_despesa.microposts.create!(content: "Lorem ipsum") }
  #     end

  #     its(:feed) { should include(newer_micropost) }
  #     its(:feed) { should include(older_micropost) }
  #     its(:feed) { should_not include(unfollowed_post) }
  #     its(:feed) do
  #       followed_despesa.microposts.each do |micropost|
  #         should include(micropost)
  #       end
  #     end      
  #   end       
  # end  

  # describe "relationship associations" do
  #   let(:other_despesa) { FactoryGirl.create(:despesa) }    
  #   before do
  #     @despesa.save
  #     @despesa.follow!(other_despesa)
  #   end

  #   it "should have associated relationships" do
  #     relationships = @despesa.relationships
  #     relationships.each do |relationship|
  #       Relationship.find_by_id(relationship.id).should_not be_nil
  #     end
  #   end

  #   it "should destroy associated relationships" do
  #     relationships = @despesa.relationships
  #     @despesa.destroy
  #     relationships.each do |relationship|
  #       Relationship.find_by_id(relationship.id).should be_nil
  #     end
  #   end 
  # end

  # describe "following" do
  #   let(:other_despesa) { FactoryGirl.create(:despesa) }    
  #   before do
  #     @despesa.save
  #     @despesa.follow!(other_despesa)
  #   end

  #   it { should be_following(other_despesa) }
  #   its(:followed_despesas) { should include(other_despesa) }

  #   describe "followed despesa" do
  #     subject { other_despesa }
  #     its(:followers) { should include(@despesa) }
  #   end

  #   describe "and unfollowing" do
  #     before { @despesa.unfollow!(other_despesa) }

  #     it { should_not be_following(other_despesa) }
  #     its(:followed_despesas) { should_not include(other_despesa) }
  #   end    
  # end  
end
