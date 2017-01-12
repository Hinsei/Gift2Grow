class Company < ApplicationRecord
    has_many :giveaways, :dependent => :destroy
    has_secure_password
    enum role: {company: 0, superadmin: 1}
    before_save {self.email = email.downcase}
    before_create self.set_role

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, :presence => {:message =>"Email cannot be blank"}
    validates :email, :uniqueness=> {:message =>"Email already exist"}
    validates :email, format: {with: VALID_EMAIL_REGEX, message: "Please input a valid email"}
    validates :name, :presence => {:message =>"name cannot be blank"}
    validates :name, :uniqueness => {:message =>"name already exist"}

    def self.authenticate(email, password)
       company = Company.find_by(email: email)
        if company && company.authenticate(password)
          return company
        else
          nil
        end
    end

    def set_role
      self.role = 0
    end

end
