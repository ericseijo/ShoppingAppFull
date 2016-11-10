# Shopping App Full
----

### Rails 5 Shopping App

This is an app I'm creating for my family on my free time when not billing for clients. 

We shop daily and end up with endless texts between all of us with everyone adding to 'their list' of requests. I'm usually the one at the store copying and pasting text request into my 'notes' list. So this app is me literally 'eating my own dog food'.

The initial version of this app is a full stack rails app. I plan on implementing a full API and creating a ReactJS front-end. 

Initial requirements and use cases:

 - User can add a users to their account and share shopping lists
 - When user logs in they can decide which list they want to manage - their own, or a shared list
 - User can add items to their shopping list
 - User can add or edit shopping list items and add a price to them for that store
 - User can select or add stores
 - User can mark an item on a shopping list as 'in basket'
 - Current basket is associated with the current store
 - A shared user can add to an associated user’s basket 
 - A user can add other users to their group
 - A user can share a shopping list with others in their group
 - Users in a group can add items to shopping lists which have been shared with them. 
 - A top level user is notified when someone adds an item to their basket
 - Based on the prices assigned to an item for that list for that store user is given a grocery estimated cost
 - User can update prices for items based on the store which won’t affect previous completed shopping trips’ total
 - More super secret ideas ;) 

### Tech
  - Rails 5.0
  - Rspec
  - FactoryGirl
  - Devise
  - Bootstrap

### Todos

 - Complete all feature and request Spec
 - Add features
