class User < ApplicationRecord
  validates :first_name, presence: { message: "Enter valid First name" }
  validates :last_name, presence: { message: "Enter valid Last name" }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Enter valid mail address" }
  validates :mobile, presence: true, format: { with: /\A\+?\d{10}\z/, message: "must be a valid phone number with 10 digits" }
  validates :college, presence: { message: "College name can't be empty" }
  validates :dob, presence: { message: "Date of birth can't be blank" }

  include Visible

  validate :dob_must_be_valid_date
  validates :gender, presence: { message: "Please enter gender (Male/female)" }
  validate :check_gender

  has_many :subjects, dependent: :destroy

  def dob_must_be_valid_date
    if dob.present?
      begin
        parsed_dob = Date.parse(dob.to_s)
        unless parsed_dob.is_a?(Date)
          errors.add(:dob, "must be a valid date")
        end
      rescue ArgumentError
        errors.add(:dob, "must be a valid date")
      end
    end
  end

  def check_gender
    if gender.present?
      gender_downcase = gender.downcase
      unless gender_downcase == 'male' || gender_downcase == 'female'
        errors.add(:gender, "Please enter valid gender (male or female)")
      end
    else
      errors.add(:gender, "Please enter gender (Male/female)")
    end
  end

end
