# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_17_164652) do
  create_table "administradors", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_administradors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_administradors_on_reset_password_token", unique: true
  end

  create_table "clientes", force: :cascade do |t|
    t.string "cpf"
    t.string "nome"
    t.string "email"
    t.string "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quartos", force: :cascade do |t|
    t.integer "numero"
    t.string "tipo"
    t.boolean "disponibilidade"
    t.decimal "preco_diaria"
    t.text "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservas", force: :cascade do |t|
    t.integer "cliente_id", null: false
    t.integer "quarto_id", null: false
    t.datetime "data_de_entrada"
    t.datetime "data_de_saida"
    t.decimal "custo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_reservas_on_cliente_id"
    t.index ["quarto_id"], name: "index_reservas_on_quarto_id"
  end

  add_foreign_key "reservas", "clientes"
  add_foreign_key "reservas", "quartos"
end
