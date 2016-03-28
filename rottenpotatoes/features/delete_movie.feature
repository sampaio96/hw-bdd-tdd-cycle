Feature: delete a given movie
  
  As an admin user
  I want to delete an existing movie

Background: movies have been added to database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |

Scenario: delete a existing movie
  When I go to the details page for "Alien"
  And I press "delete_button"
  Then I should be on the RottenPotatoes home page
  And I should see "Movie 'Alien' deleted."
  And I should not see "More about Alien deleted."