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

ActiveRecord::Schema[7.2].define(version: 2024_11_06_021340) do
  create_table "comentarios", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "conteudo"
    t.date "data_comentario"
    t.integer "usuario_id", null: false
    t.integer "postagem_id", null: false
    t.index ["postagem_id"], name: "index_comentarios_on_postagem_id"
    t.index ["usuario_id"], name: "index_comentarios_on_usuario_id"
  end

  create_table "comunidades", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nome"
    t.string "descricao"
    t.date "data_criacao"
    t.integer "administrador_id"
    t.index ["administrador_id"], name: "index_comunidades_on_administrador_id"
  end

  create_table "postagens", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "titulo"
    t.string "conteudo"
    t.datetime "data_publicacao"
    t.integer "usuario_id", null: false
    t.integer "comunidade_id"
    t.index ["comunidade_id"], name: "index_postagens_on_comunidade_id"
    t.index ["usuario_id"], name: "index_postagens_on_usuario_id"
  end

  create_table "reacaos", force: :cascade do |t|
    t.string "tipo"
    t.integer "usuario_id", null: false
    t.integer "postagem_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["postagem_id"], name: "index_reacaos_on_postagem_id"
    t.index ["usuario_id"], name: "index_reacaos_on_usuario_id"
  end

  create_table "seguindos", force: :cascade do |t|
    t.integer "usuario_id"
    t.integer "seguidor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "nome"
    t.string "curso"
    t.string "instituicao"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  add_foreign_key "comentarios", "postagens"
  add_foreign_key "comentarios", "usuarios"
  add_foreign_key "comunidades", "usuarios", column: "administrador_id"
  add_foreign_key "postagens", "comunidades"
  add_foreign_key "postagens", "usuarios"
  add_foreign_key "reacaos", "postagens"
  add_foreign_key "reacaos", "usuarios"
end
