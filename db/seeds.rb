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
            :password_digest => "3DArflWedbvw7LZjQau1b1XBLh0LrHfEgdx5Tp1hAfKl6SfjjW")

User.create!(:id => 2,
             :firstname => "Esteban",
             :lastname => "Zimányi",
             :email => "esteban.zimanyi@ulb.be",
             :confirmed_at => "1656086785000",
             :password_digest => "3DArflWedbvw7LZjQau1b1XBLh0LrHfEgdx5Tp1hAfKl6SfjjW")

User.create!(:id => 3,
             :firstname => "Alejandro",
             :lastname => "Vaisman",
             :email => "avaisman@ulb.ac.be",
             :confirmed_at => "1656086785000",
             :password_digest => "3DArflWedbvw7LZjQau1b1XBLh0LrHfEgdx5Tp1hAfKl6SfjjW")



####### AUTHOR #############
puts "Seeding AUTHORS "
Author.create!(:user_id => 2,
              :about => "Esteban Zimányi is a full professor and the director of the Department of Computer & Decision Engineering (CoDE) at ULB. He started his studies at the Universidad Autónoma de Centro América, Costa Rica. He received a B.Sc. (1988) and a doctorate (1992) in computer science from the Faculty of Sciences at the ULB. During 1997, he was a visiting researcher at the Database Laboratory of the Ecole Polytechnique Fédérale de Lausanne, Switzerland. He co-authored and co-edited 16 books, 18 book chapters, 19 articles in international journals, and 82 papers in international conferences. He is coordinator of the BDMA and IT4BI-DC Erasmus Mundus programmes. He is Editor-in-Chief of the Journal on Data Semantics published by Springer. His current research interests include data warehouses, spatio-temporal databases, geographic information systems, and semantic web.",
              :contact => "linkedin, email, etc",
              :picture_path => "profile_pictures/esteban_zimanyi.jpg")

Author.create!(:user_id => 3,
               :about => "I was born in Buenos Aires, Argentina. I received a BA degree in Civil Engineering from the University of Buenos Aires (UBA), and a BA in Computer Science from the same university. I worked as a civil engineer in environmental projects from 1984 to 1994. In 2001 I got my PhD in Computer Science from the University of Buenos Aires. My PhD thesis studied updates and time management in OLAP. I have been teaching at the Computer Science Department at UBA, from 1987. I have been an invited professor at the Universidad Politécnica de Madrid in 1997. In 1998 I joined the Systems Division at the Universidad de Belgrano, Buenos Aires (with a DBA position), where in 2001 I was appointed vice-dean of the School of Engineering and Information Technology. In 2003 I joined the University of Toronto as a postdoctoral fellow, and lecturing the Data Management Systems course. After that, I returned to the University of Buenos Aires, lecturing the courses on Fundamentals of Data Warehousing and Database Systems, and as Vice-Head of the Department of Computer Science. During 2006 I was visiting researcher at the Computer Science Department of the University of Chile. During 2008-2009 I was visiting researcher at the University of Hasselt, working for the GeoPKDD project. I Chaired the Masters Program in Data Mining at the University of Buenos Aires, Facultad de Ciencias Exactas y Naturales from March 2005 to March 2010. In 2010 I was appointed Associate Professor at the Universidad de la República, Uruguay, at the Institute of Computing.",
               :contact => "linkedin, email, etc",
               :picture_path => "profile_pictures/alejandro.png")



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