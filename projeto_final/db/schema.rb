# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "atendente", primary_key: "cpf", id: :string, limit: 45, force: :cascade do |t|
    t.string "nome", limit: 45, null: false
    t.integer "unidade_id", null: false
    t.integer "unidade_hospital_id", null: false
  end

  create_table "bairro", id: :serial, force: :cascade do |t|
    t.string "nome", limit: 45, null: false
    t.integer "cidade_id", null: false
  end

  create_table "cidade", id: :serial, force: :cascade do |t|
    t.string "nome", limit: 45, null: false
    t.integer "uf_id", null: false
  end

  create_table "endereco", id: :serial, force: :cascade do |t|
    t.string "cep", limit: 20, null: false
    t.string "rua", limit: 45, null: false
    t.integer "numero", null: false
    t.string "complemento", limit: 45
  end

  create_table "entrada", id: :serial, force: :cascade do |t|
    t.boolean "foi_atendido", null: false
    t.datetime "horario_chegada", null: false
    t.string "usuario_cpf", limit: 45, null: false
    t.string "medico_crm", limit: 45, null: false
    t.integer "estado_saude_id", null: false
  end

  create_table "entrada_has_sintoma", primary_key: ["entrada_id", "sintoma_id"], force: :cascade do |t|
    t.integer "entrada_id", null: false
    t.integer "sintoma_id", null: false
  end

  create_table "especializacao", id: :serial, force: :cascade do |t|
    t.string "nome", limit: 45, null: false
  end

  create_table "estado_saude", id: :serial, force: :cascade do |t|
    t.string "nome", limit: 45, null: false
    t.integer "prioridade", null: false
  end

  create_table "hospital", id: :serial, force: :cascade do |t|
    t.string "sigla", limit: 10, null: false
    t.string "nome", limit: 35, null: false
  end

  create_table "medico", primary_key: "crm", id: :string, limit: 45, force: :cascade do |t|
    t.string "nome", limit: 45, null: false
    t.string "sala", limit: 45, null: false
    t.integer "unidade_id", null: false
    t.integer "unidade_hospital_id", null: false
  end

  create_table "medico_has_especializacao", primary_key: ["medico_crm", "especializacao_id"], force: :cascade do |t|
    t.string "medico_crm", limit: 45, null: false
    t.integer "especializacao_id", null: false
  end

  create_table "sintoma", id: :serial, force: :cascade do |t|
    t.string "nome", limit: 45, null: false
  end

  create_table "telefone", primary_key: ["id", "usuario_cpf"], force: :cascade do |t|
    t.serial "id", null: false
    t.string "usuario_cpf", limit: 45, null: false
    t.string "numero", limit: 45, null: false
  end

  create_table "uf", id: :serial, force: :cascade do |t|
    t.string "nome", limit: 2, null: false
    t.integer "endereco_id", null: false
  end

  create_table "unidade", primary_key: ["id", "hospital_id"], force: :cascade do |t|
    t.serial "id", null: false
    t.integer "hospital_id", null: false
    t.string "nome", limit: 45, null: false
    t.integer "endereco_id", null: false
  end

  create_table "usuario", primary_key: "cpf", id: :string, limit: 45, force: :cascade do |t|
    t.string "nome", limit: 45, null: false
    t.string "email", limit: 45, null: false
    t.date "data_nascimento", null: false
  end

  add_foreign_key "atendente", "hospital", column: "unidade_hospital_id", name: "atendente_unidade_hospital_id_fkey"
  add_foreign_key "atendente", "hospital", column: "unidade_id", name: "atendente_unidade_id_fkey"
  add_foreign_key "bairro", "cidade", name: "bairro_cidade_id_fkey"
  add_foreign_key "cidade", "uf", name: "cidade_uf_id_fkey"
  add_foreign_key "entrada", "estado_saude", name: "entrada_estado_saude_id_fkey"
  add_foreign_key "entrada", "medico", column: "medico_crm", primary_key: "crm", name: "entrada_medico_crm_fkey"
  add_foreign_key "entrada", "usuario", column: "usuario_cpf", primary_key: "cpf", name: "entrada_usuario_cpf_fkey"
  add_foreign_key "entrada_has_sintoma", "entrada", name: "entrada_has_sintoma_entrada_id_fkey"
  add_foreign_key "entrada_has_sintoma", "sintoma", name: "entrada_has_sintoma_sintoma_id_fkey"
  add_foreign_key "medico", "unidade", name: "medico_unidade_id_fkey"
  add_foreign_key "medico_has_especializacao", "especializacao", name: "medico_has_especializacao_especializacao_id_fkey"
  add_foreign_key "medico_has_especializacao", "medico", column: "medico_crm", primary_key: "crm", name: "medico_has_especializacao_medico_crm_fkey"
  add_foreign_key "telefone", "usuario", column: "usuario_cpf", primary_key: "cpf", name: "telefone_usuario_cpf_fkey"
  add_foreign_key "uf", "endereco", name: "uf_endereco_id_fkey"
  add_foreign_key "unidade", "endereco", name: "unidade_endereco_id_fkey"
  add_foreign_key "unidade", "hospital", name: "unidade_hospital_id_fkey"
end
