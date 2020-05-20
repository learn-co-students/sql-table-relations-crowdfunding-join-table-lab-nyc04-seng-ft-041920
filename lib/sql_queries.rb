# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_title
  "SELECT projects.title, SUM(pledges.amount) 
    FROM projects
    JOIN pledges
    ON projects.id = pledges.project_id
   GROUP BY projects.title;"

=begin
Selects each project title and sums up the entirety of the pledge amount located at project ID.
  Takes the title from <Table :: projects>, and the amount from <Table :: pledges>
  Joins the values of .project_id to .id from <Table :: pledges, projects> respectively
Groups the entire selection by alphabetical order of projects.title
=end
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
  "SELECT users.name, users.age, SUM(pledges.amount)
    FROM users
    JOIN pledges
    ON users.id = pledges.user_id 
   GROUP BY users.name;"

=begin
Selects each users name, users age, and pledge amount located at user ID.
  Takes the age and name's from <Table :: users> and the amount from <Table :: pledges>
  Joins the values of .user_id to .id from <Table ::pledges, users> respectively.
Groups the selection by alphabetical order of users.name
=end
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
  "SELECT projects.title, (SUM(pledges.amount) - projects.funding_goal) AS total_over
    FROM projects
    JOIN pledges
    ON projects.id = pledges.project_id
   GROUP BY projects.title
   HAVING total_over >= 0;" 

=begin
Selects each projects title, total amount of money over the spending goal set to variable <INTEGER :: total_over>
[Represented by subtracting the sum of the total pledges by the projects.funding_goal]
  Takes the title and funding_goal from <Table :: projects> and .amount from <Table :: pledges>
  Joins the values of .projects_id to .id from <Table :: pledges, projects> respectively
Groups the selection by alphabetical order of project.title
It only displays values that have a <INTEGER :: total_over> >= 0
=end
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_summed_amount
  "SELECT users.name, SUM(pledges.amount)
    FROM users
    JOIN pledges
    ON users.id = pledges.user_id
    GROUP BY users.name
    ORDER BY SUM(pledges.amount)
    ;"

=begin
=end
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
  "SELECT projects.category, pledges.amount
    FROM projects
    JOIN pledges
    ON projects.id = pledges.project_id
   WHERE projects.category = 'music'
  ;"

=begin
=end

end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
  "SELECT projects.category, SUM(pledges.amount)
     FROM projects
     JOIN pledges
     ON projects.id = pledges.project_id
    WHERE projects.category = 'books'
  ;"

=begin
=end

end
