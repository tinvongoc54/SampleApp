class User < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    validates :name, presence: true, length: { maximum: 50 }
    validates :email,
        presence: true,
        length: { maximum: 250, minimum: 8 },
        format: { with: VALID_EMAIL_REGEX }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    validate :validate_email_containt_vuong

    before_save :downcase_email

    private

    def downcase_email
        self.email = email.downcase
    end

    def validate_email_containt_vuong
        return if email.blank?

        if email.include?("vuong")
            errors.add(:email, "Khong co chu vuong")
        end
    end
end