# Bookmark Manager

#todo
Show a list of bookmarks ✅
Add new bookmarks
Delete bookmarks
Update bookmarks
Comment on bookmarks
Tag bookmarks into categories
Filter bookmarks by tag
Users manage their bookmarks

## User Stories

```
As a time-pressed user
So that I can quickly go to web sites I regularly visit
I would like to see a list of bookmarks
```
As a time-pressed user
So that I can save a website
I would like to add the site's address and title to bookmark manager
````
As a user
So I can store bookmark data for later retrieval
I want to add a bookmark to Bookmark Manager
````

To view bookmarks, navigate to `localhost:3000/bookmarks`

## Domain Model

![Bookmark Manager domain model](./public/images/bookmark_manager_1.png)

| Component   | Responsibility                                | Refactor                                |
|------------ |---------------------------------------------  |---------------------------------------- |
| Model       | Encapsulate logic with relevant data          | Encapsulate bookmark data in a class    |
| View        | Display the result to a user                  | Show the bookmark data in a list        |
| Controller  | Get data from the model and put in the view   | Render bookmark data into to the view   |

#set up
setting up a database


To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

admin=# CREATE DATABASE "bookmark_manager_test";
admin=# CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));

#####
TRUNCATE TABLE

Removes all rows from a table without logging the individual row deletions. TRUNCATE TABLE is similar to the DELETE statement with no WHERE clause; however, TRUNCATE TABLE is faster and uses fewer system and transaction log resources.

DROP TABLE

Removes one or more table definitions and all data, indexes, triggers, constraints, and permission specifications for those tables.
