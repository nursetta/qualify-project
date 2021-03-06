# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160723192938) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "borrowers", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone_number"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "income"
    t.integer  "base_monthly_income"
    t.integer  "bonus_monthly_income"
    t.integer  "commision_monthly_income"
    t.integer  "net_rental_income"
    t.string   "expenses"
    t.integer  "rent"
    t.integer  "mortgage_payment_monthly"
    t.integer  "credit_card_payments"
    t.integer  "auto_loan_payments"
    t.integer  "installment_loan_payments"
    t.string   "new_mortgage_information"
    t.integer  "home_price"
    t.integer  "loan_amount"
    t.integer  "interest_rate"
    t.integer  "monthly_pi"
    t.integer  "monthly_ti"
    t.integer  "monthly_hoa"
    t.integer  "total_monthly_payment"
    t.integer  "credit_score"
    t.string   "type_of_employment"
    t.integer  "length_of_employment"
    t.integer  "term"
  end

end
