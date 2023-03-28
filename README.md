# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
[ ] done

User Story 1, Parent Index 

For each parent table
As a visitor
When I visit '/parents'
Then I see the name of each parent record in the system
[ ] done

User Story 2, Parent Show 

As a visitor
When I visit '/parents/:id'
Then I see the parent with that id including the parent's attributes
(data from each column that is on the parent table)
[ ] done

User Story 3, Child Index 

As a visitor
When I visit '/child_table_name'
Then I see each Child in the system including the Child's attributes
(data from each column that is on the child table)
[ ] done

User Story 4, Child Show 

As a visitor
When I visit '/child_table_name/:id'
Then I see the child with that id including the child's attributes
(data from each column that is on the child table)
[ ] done

User Story 5, Parent Children Index 

As a visitor
When I visit '/parents/:parent_id/child_table_name'
Then I see each Child that is associated with that Parent with each Child's attributes
(data from each column that is on the child table)
ActiveRecord
[ ] done

User Story 6, Parent Index sorted by Most Recently Created 

As a visitor
When I visit the parent index,
I see that records are ordered by most recently created first
And next to each of the records I see when it was created
[ ] done

User Story 7, Parent Child Count

As a visitor
When I visit a parent's show page
I see a count of the number of children associated with this parent
Usability
[ ] done

User Story 8, Child Index Link

As a visitor
When I visit any page on the site
Then I see a link at the top of the page that takes me to the Child Index
[ ] done

User Story 9, Parent Index Link

As a visitor
When I visit any page on the site
Then I see a link at the top of the page that takes me to the Parent Index
[ ] done

User Story 10, Parent Child Index Link

As a visitor
When I visit a parent show page ('/parents/:id')
Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')


<%= form_with url: '/festivals/new', method: :post, local: true do |form| %>
  <br>
  <%= form.label :name %>
  <%= form.text_field :name%>
  <br>
  <%= form.label :city %>
  <%= form.text_field :city %>
  <br>
  <%= form.label :kid_friendly %>
  <%= form.radio_button :kid_friendly, "true" %>
  <%= form.label :kid_friendly_true, "True" %>
  <%= form.radio_button :kid_friendly, "false" %>
  <%= form.label :kid_friendly_false, "False" %>
  <%= form.label :ticket_price %>
  <%= form.text_field :ticket_price %>
  <%= form.label :dates %>
  <%= form.text_field :dates %>
  <%= form.label :rv_hookup %>
  <%= form.radio_button :rv_hookup, "true" %>
  <%= form.label :rv_hookup_true, "True" %>
  <%= form.radio_button :rv_hookup, "true" %>
  <%= form.label :rv_hookup_false, "False" %>
  <br>
  <%= form.submit "Add Festival" %>
<% end %>

New
<form action="/festivals" method="post">
  <input type="hidden" name="authenticity_token" value="<%= form_authenticity_token%>">
  <p>Enter a new festival</p>
  <label for="name">Festival Name:</label><br>
  <input type='text' name='festival[name]'/><br>
  <label for="name">City/State:</label><br>
  <input type='text' name='festival[city]'/><br>
  <p>Kid Friendly</p>
  <input type='radio' id="kid_friendly_true"/>
  <label for="kid_friendly_true">True</label><br>
  <input type='radio' id="kid_friendly_false"/>
  <label for="kid_friendly_false">False</label><br><br>
  <label for="ticket_price">Ticket Price</label><br>
  <input type="number" id="ticket_price"/><br><br>
  <label for="dates">Dates</label><br>
  <input type="text" id="dates"/>
  <p>RV Hookup</p>
  <input type="radio" id="rv_hookup_true"/>
  <label for="rv_hookup_true">True</label><br>
  <input type="radio" id="rv_hookup_false"/>
  <label for="rv_hookup_false">False</label><br><br>
  <input type="submit" value="Add New Festival"/>

</form>

Edit
<form action="/festivals/<%= @festival.id %>" method="patch">
  <input type="hidden" name="authenticity_token" value="<%= form_authenticity_token%>">
  <input type="hidden" name="_method" value="PATCH">
  <p>Edit <%= @festival.id %></p>
  <label for="name">Festival Name:</label><br>
  <input type='text' name='festival[name]' value="<%= @festival.name %>"/><br>
  <label for="name">City/State:</label><br>
  <input type='text' name='festival[city]' value="<%= @festival.city %>"/><br>
  <p>Kid Friendly</p>
  <input type='radio' id="kid_friendly" value="<%= @festival.kid_friendly%>"/>
  <label for="kid_friendly">True</label><br>
  <input type='radio' id="kid_friendly" value="<%= @festival.kid_friendly%>"/>
  <label for="kid_friendly">False</label><br><br>
  <label for="ticket_price">Ticket Price</label><br>
  <input type="number" id="ticket_price" value="<%= @festival.ticket_price %>"><br><br>
  <label for="dates">Dates</label><br>
  <input type="text" id="dates" value="<%= @festival.dates %>">
  <p>RV Hookup</p>
  <input type="radio" id="rv_hookup" value="<%= @festival.rv_hookup %>"/>
  <label for="rv_hookup">True</label><br>
  <input type="radio" id="rv_hookup" value="<%= @festival.rv_hookup %>"/>
  <label for="rv_hookup">False</label><br><br>
  <input type="submit" value="Edit Festival">

</form>