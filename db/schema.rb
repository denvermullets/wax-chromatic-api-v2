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

ActiveRecord::Schema.define(version: 2021_01_24_011122) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "album_genres", force: :cascade do |t|
    t.bigint "genre_id"
    t.bigint "album_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["album_id"], name: "index_album_genres_on_album_id"
    t.index ["genre_id"], name: "index_album_genres_on_genre_id"
  end

  create_table "album_songs", force: :cascade do |t|
    t.bigint "song_id"
    t.bigint "album_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["album_id"], name: "index_album_songs_on_album_id"
    t.index ["song_id"], name: "index_album_songs_on_song_id"
  end

  create_table "albums", force: :cascade do |t|
    t.string "title"
    t.string "released"
    t.integer "size"
    t.string "color"
    t.integer "amount_pressed"
    t.text "notes"
    t.string "d_album_id"
    t.string "cat_no"
    t.string "thumb"
    t.bigint "release_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["release_id"], name: "index_albums_on_release_id"
  end

  create_table "artist_albums", force: :cascade do |t|
    t.bigint "artist_id"
    t.bigint "album_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["album_id"], name: "index_artist_albums_on_album_id"
    t.index ["artist_id"], name: "index_artist_albums_on_artist_id"
  end

  create_table "artist_releases", force: :cascade do |t|
    t.bigint "artist_id"
    t.bigint "release_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_artist_releases_on_artist_id"
    t.index ["release_id"], name: "index_artist_releases_on_release_id"
  end

  create_table "artist_songs", force: :cascade do |t|
    t.bigint "artist_id"
    t.bigint "song_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_artist_songs_on_artist_id"
    t.index ["song_id"], name: "index_artist_songs_on_song_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.string "website"
    t.string "discogs_artist"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "collection_albums", force: :cascade do |t|
    t.bigint "collection_id"
    t.bigint "album_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["album_id"], name: "index_collection_albums_on_album_id"
    t.index ["collection_id"], name: "index_collection_albums_on_collection_id"
  end

  create_table "collections", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "expired_at", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "label_albums", force: :cascade do |t|
    t.bigint "album_id"
    t.bigint "label_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["album_id"], name: "index_label_albums_on_album_id"
    t.index ["label_id"], name: "index_label_albums_on_label_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.text "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "member_artists", force: :cascade do |t|
    t.bigint "member_id"
    t.bigint "artist_id"
    t.boolean "active_member"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_member_artists_on_artist_id"
    t.index ["member_id"], name: "index_member_artists_on_member_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.string "discogs_member"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "releases", force: :cascade do |t|
    t.string "discogs_release"
    t.string "discogs_artist"
    t.string "title"
    t.string "artist"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "discogs_user"
    t.string "oauth_token"
    t.string "oauth_token_secret"
    t.string "password_digest"
    t.string "email"
    t.string "wax_username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wantlist_albums", force: :cascade do |t|
    t.bigint "wantlist_id"
    t.bigint "album_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["album_id"], name: "index_wantlist_albums_on_album_id"
    t.index ["wantlist_id"], name: "index_wantlist_albums_on_wantlist_id"
  end

  create_table "wantlists", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_wantlists_on_user_id"
  end

end
