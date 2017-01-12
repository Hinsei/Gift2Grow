class Company < ApplicationRecord
  has_many :giveaways, :dependent => :destroy

  def self.authenticate(email, password)
     company = Company.find_by(email: email)
      if company && company.authenticate(password)
        return company
      else
        nil
      end
  end
end
