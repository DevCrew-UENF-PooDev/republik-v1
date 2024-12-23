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

ActiveRecord::Schema[7.2].define(version: 2024_12_01_210908) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

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

  create_table "membros", force: :cascade do |t|
    t.integer "usuario_id", null: false
    t.integer "comunidade_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comunidade_id"], name: "index_membros_on_comunidade_id"
    t.index ["usuario_id"], name: "index_membros_on_usuario_id"
  end

  create_table "notificacaos", force: :cascade do |t|
    t.integer "usuario_id", null: false
    t.string "acao"
    t.integer "alvo_id"
    t.string "alvo_type"
    t.boolean "lida", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_notificacaos_on_usuario_id"
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
    t.datetime "ultima_vez_visto_em"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comentarios", "postagens"
  add_foreign_key "comentarios", "usuarios"
  add_foreign_key "comunidades", "usuarios", column: "administrador_id"
  add_foreign_key "membros", "comunidades"
  add_foreign_key "membros", "usuarios"
  add_foreign_key "notificacaos", "usuarios"
  add_foreign_key "postagens", "comunidades"
  add_foreign_key "postagens", "usuarios"
  add_foreign_key "reacaos", "postagens"
  add_foreign_key "reacaos", "usuarios"
end
