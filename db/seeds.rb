# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

####### USER #############
User.create(:id => 1,
            :firstname => "root",
            :lastname => "root",
            :email => "*",
            :confirmed_at => "1656086785000",
            :password_digest => "toto")


####### AUTHOR #############
Author.create(:user_id => 1,
              :about => "famous sysadmin, Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n'a pas fait que survivre cinq siècles, mais s'est aussi adapté à la bureautique informatique, sans que son contenu n'en soit modifié.",
              :contact => "linkedin, email, etc",
              :picture_path => "profile_pictures/zip.jpg")


####### ROLES #############
Role.create(:id => 1,
            :role_name => "ADMIN")
Role.create(:id => 2,
            :role_name => "MODERATOR")


####### USERS_ROLES #############
Users_role.create(:user_id => 1,
                  :role_id => 1)

####### CHAPTERS #############
Chapters.create(:number => 1,
                :name => "Introduction",
                :slides_path => "slides/chap1.pdf",
                :figpdf_path => "figpdf/chap1.pdf",
                :figEpdf_path => "figEpdf/chap1.pdf",
                :answers_path => "answers/chap1.pdf",
                :samples_path => "samples/chap1.pdf")

