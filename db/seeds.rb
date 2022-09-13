# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Seeding..."

####### USER #############
puts "Seeding USERS "
User.create!(:id => 1,
            :firstname => "root",
            :lastname => "root",
            :email => "root@cs.ulb.ac.be",
            :confirmed_at => "1656086785000",
            :password_digest => "toto")





####### AUTHOR #############
puts "Seeding AUTHORS "
Author.create!(:user_id => 1,
              :about => "famous sysadmin, Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n'a pas fait que survivre cinq siècles, mais s'est aussi adapté à la bureautique informatique, sans que son contenu n'en soit modifié.",
              :contact => "linkedin, email, etc",
              :picture_path => "profile_pictures/zip.jpg")

Author.create!(:user_id => 1,
               :about => "famous sysadmin, Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n'a pas fait que survivre cinq siècles, mais s'est aussi adapté à la bureautique informatique, sans que son contenu n'en soit modifié.",
               :contact => "linkedin, email, etc",
               :picture_path => "profile_pictures/zip.jpg")



####### ROLES #############
puts "Seeding ROLES "
Role.create!(:id => 1,
            :role_name => "ADMIN")
Role.create!(:id => 2,
            :role_name => "MODERATOR")


####### USERS_ROLES #############
puts "Seeding USERS_ROLES "
UsersRole.create!(:user_id => 1,
                  :role_id => 1)


####### REVIEWS #############
puts "Seeding REVIEWS "
Review.create!(:id => 1,
               :user_id => 1,
               :review => "The book comprehensively covers all the fundamental modeling issues, and addresses also the practical aspects on querying and populating the warehouse. The usage of concrete examples, consistently revisited throughout the book, guide the student to understand the practical considerations, and a set of exercises help the instructor with the hands-on design of a course. For what it's worth, I have already used the first edition of the book for my graduate data warehouse course and will certainly switch to the new version in the years to come. [...] I would like, however, to take the opportunity and direct your attention to the really new features of this second edition, which are found in the last unit of the book, concerning advanced areas of data warehousing. This part goes beyond the traditional data warehousing modeling and implementation and is practically completely refreshed compared to the first edition of the book. The chapter on temporal and multiversion warehousing covers the problem of time encoding for evolving facts and the management of versions. The part on spatial warehouses has been significantly updated. There is a brand-new chapter on graph data processing, and its application to graph warehousing and graph OLAP. Last but extremely significant, the crown jewel of the book, a brand-new chapter on the management of Big Data and the usage of Hadoop, Spark and Kylin, as well as the coverage of distributed, in-memory, columnar, and Not-Only-SQL DBMS's in the context of analytical data processing. Recent advents like data processing in the cloud, polystores and data lakes are also covered in the chapter.",
               :note => 10,
               :reviewer_details => "Excerpt of the foreword for the second edition by Professor Panos Vassiliadis Data Intensive Information Ecosystems Group University of Ioannina Greece" )
Review.create!(:id => 2,
               :user_id => 1,
               :review => "I think it is quite simply the most comprehensive textbook about data warehousing on the market. The book is very well suited for one or more DW courses, ranging from the most basic to the most advanced. It has all the features that are necessary to make a good textbook. First, a running case study, based on the Northwind database known from Microsoft's tools, is used to illustrate all aspects using many detailed figures and examples. Second, key terms and concepts are highlighted in the text for better reading and understanding. Third, review questions are provided at the end of each chapter so students can quickly check their understanding. Fourth, the many detailed exercises for each chapter put the presented knowledge into action, yielding deep learning, and taking students through all the steps needed to develop a data warehouses. Finally, the book shows how to implement data warehouses using leading industrial and open source tools, concretely Microsoft's and Pentaho's suites of data warehouse tools, giving students the essential hands-on experience that enables them to put the knowledge into practice.",
               :note => 10,
               :reviewer_details => "Excerpt of the foreword for the first edition by Professor Torben Bach Pedersen Co-director of the Center for Data-Intensive Systems (Daisy) Aalborg Universiteit Denmark")




puts "Seeding done."