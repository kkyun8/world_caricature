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

ActiveRecord::Schema.define(version: 2020_05_31_150534) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "data_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "type_name", null: false
    t.boolean "delflg", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keywords", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "data_type_id", null: false
    t.string "value", null: false
    t.boolean "delflg", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "title", null: false
    t.string "contents", null: false
    t.boolean "delflg", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "sample_image_id", null: false
    t.string "order_number", null: false
    t.integer "order_status", default: 1
    t.boolean "delflg", default: false, null: false
    t.string "flame_size", default: "M"
    t.boolean "premium_wrapping", default: false
    t.integer "price", null: false
    t.string "name_kanji", null: false
    t.string "name_furigana", null: false
    t.string "email"
    t.string "line_id"
    t.string "communication_type", default: "email", null: false
    t.string "cell_phone_number"
    t.string "home_phone_number"
    t.string "postal_code", null: false
    t.string "address1", null: false
    t.string "address2", null: false
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "order_number", null: false
    t.integer "order_id", null: false
    t.integer "sample_image_id", null: false
    t.integer "price", null: false
    t.string "currency"
    t.string "source_type"
    t.string "card_brand"
    t.string "last_4"
    t.datetime "square_created_at"
    t.string "square_id"
    t.string "square_order_id"
    t.string "receipt_number"
    t.string "receipt_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sample_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "order_type", null: false
    t.integer "price", null: false
    t.integer "number_of_people", default: 1
    t.string "information", null: false
    t.string "image_url", null: false
    t.boolean "delflg", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "password_digest", default: "", null: false
    t.integer "artist_id"
    t.boolean "adminflg", default: false
    t.boolean "delflg", default: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
